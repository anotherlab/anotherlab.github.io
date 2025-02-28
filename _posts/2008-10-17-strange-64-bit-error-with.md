---
title: Strange 64-bit error with LayoutKind.Explicit
date: 2008-10-17T20:34:00-05:00
---
I have a C# service that collects data from another company that we do business with.  They send the data in a binary format from one of their C++ applications.  To read their data with .NET, I needed to <a href="http://en.wikipedia.org/wiki/Marshalling_(computer_science)" target="_blank">marshal</a> their data to a set of structs defined in C#.  I created a structure that looked something like this.  

<pre>[StructLayout(LayoutKind.Explicit, Size = 48)]<br /><span>public</span> <span>struct</span> SampleHeader<br />    {<br />        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 8)]<br />        [FieldOffset(0)]<br /><span>public</span> <span>byte</span>[] RecordType;<br /><br />        [MarshalAs(UnmanagedType.U4)]<br />        [FieldOffset(8)]<br /><span>public</span> <span>uint</span> Version;<br /><br />        [MarshalAs(UnmanagedType.ByValArray, SizeConst = 8)]<br />        [FieldOffset(12)]<br /><span>public</span> <span>byte</span>[] SystemCode;<br /><br />        [MarshalAs(UnmanagedType.U4)]<br />        [FieldOffset(20)]<br /><span>public</span> <span>uint</span> LocalID;<br /><br />        [MarshalAs(UnmanagedType.U4)]<br />        [FieldOffset(24)]<br /><span>public</span> <span>uint</span> HostID;<br />    }</pre>



The actual struct had more fields, but this is enough to show the the problem. During development and testing, the code worked fine. Until we tried it on a 64-bit edition of Windows Server 2003. That&#8217;s when it broke. As soon as I instantiated an instance of this struct, the service would throw an error. Something like this: 

<pre>System.TypeLoadException: <br />Could not load type 'SampleNameSpace.SampleHeader' <br />from assembly ''Sample, Version=1.2.3.4, Culture=neutral, PublicKeyToken=null' <br />because it contains an object field at offset 12 that is incorrectly aligned or overlapped by a non-object field.</pre>

To get it to fail, all I needed to do was to create a SampleHeader like this:

<pre>SampleHeader sh = <span>new</span> SampleHeader();</pre>



That didn&#8217;t make any sense.  I couldn’t see any reason why it would work in 32-bit land, but not in 64-bit.  Since it was complaining about the “SystemCode” field, I commented out the other fields and played with the field offsets.  If I changed the offset from 12 to 16, I could create a SampleHeader object without any runtime errors.  Mind you, I could actually use it in my code, those offsets had to match the data my service was receiving.

So I went to plan “B”, getting rid of the explicitly laid out struct.  I created a new one without the StructLayout, MarshalAs, and FieldOffset attributes.  It looked like this:

<pre><span>public</span> <span>struct</span> SampleHeader<br />    {<br /><span>public</span> <span>byte</span>[] RecordType;<br /><span>public</span> <span>uint</span> Version;<br /><span>public</span> <span>byte</span>[] SystemCode;<br /><span>public</span> <span>uint</span> LocalID;<br /><span>public</span> <span>uint</span> HostID;<br />    }</pre>



Pretty much the same thing, except .NET defined the field alignments.  Instead of using marshalling to copy the data, I just used the BitConverter class.  I had already put the received data into a byte[] array, that made it easy to use BitConverter.  For this struct, I only needed the LocalID and HostID fields, so the following code was all that I needed:

<pre>MyHeader.LocalID = BitConverter.ToUInt32(RawData, 20);<br />    MyHeader.HostID = BitConverter.ToUInt32(RawData, 24);</pre>



This replaced the marshalling code that looked like this:

<pre>GCHandle handle = GCHandle.Alloc(RawData, GCHandleType.Pinned);<br />    SampleHeader MyHeader = (NewStuff)Marshal.PtrToStructure(handle.AddrOfPinnedObject(), <span>typeof</span>(SampleHeader));<br />    handle.Free();</pre>



I still don’t understand why Windows 64-bit  requires fields in a struct to be aligned on 4 byte boundaries, but the replacement code works and is easier to follow.
