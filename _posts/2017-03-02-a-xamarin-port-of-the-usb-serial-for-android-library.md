---
id: 2654
title: A Xamarin port of the usb-serial-for-android library
date: 2017-03-02T10:06:10-05:00
author: Chris Miller
layout: post
guid: http://rajapet.com/?p=2654
permalink: /2017/03/02/a-xamarin-port-of-the-usb-serial-for-android-library/
collect_box_size:
  - collect-square
categories:
  - Uncategorized
---
Back in January, I ported the excellent usb-serial-for-android library from the Java source code to Xamarin C#.  We have an Android application that needs to use an external RFID reader.  The reader is an [Elatec TWN4 RFID reader](https://www.elatec-rfid.com/en/products/multi-technology-rfid-reader/housed/hf-lf-nfc-multi-technology/) and it can work as virtual comm port over USB. To use that reader, I needed a general purpose serial over USB library.  I ended taking a very good one from the open source Java community and porting it over to C#. That ported library is up on [Github under the name UsbSerialForAndroid](https://github.com/anotherlab/UsbSerialForAndroid).

Out of the box, Android doesn&#8217;t come with a lot of support for serial port devices.  It&#8217;s probably not a common use case.  Starting in Android 3.1, support was added for [USB Host mode](https://developer.android.com/guide/topics/connectivity/usb/host.html) to allow access to USB devices from Android apps.  There was enough of a need for serial devices that Mike Waverly wrote a very good library in Java named [usb-serial-for-android](https://github.com/mik3y/usb-serial-for-android).  It supports many of the common USB serial chipsets.  So I wanted to use that.

With Xamarin Android, you have basically two ways of consuming Java libraries.  You can use them directly by creating a C# to Java wrapper and bundling the .jar file with your project.  While that can work, and work very well, it can also be a bit clunky and you can hit some issues mapping the Java method calls to C#.  Another group had gone down that path.  They implemented a wrapper for the .jar file and added some helper classes.  It looked like their [project](https://bitbucket.org/lusovu/xamarinusbserial) was abandonware and was not using a current version of Mike&#8217;s code.  You would also have the limitation of not being to debug into that code library.

If you have the source code, you can port the code from Java to C#.  I decided to go down that route.  It took a couple of days, but I was able to port all of the Java code to C#.  It went over more or less as is.  Some changes needed to made because reflection is handled differently in C# than in Java.  There were also a bug in Xamarin&#8217;s API access code that mangled the array handling in some Java code.

In Java, [ByteBuffer.wrap(someBuffer)](https://docs.oracle.com/javase/7/docs/api/java/nio/ByteBuffer.html#wrap(byte[])) allows for two-way updating of a Java array with a stream buffer,  A bug in Xamarin&#8217;s API mapping tool emits code that allocates a new buffer when you call Wrap.  Changes made to the ByteBuffer are not reflected in the original byte array.  This is logged in Xamarin&#8217;s Bugzilla database [here](https://bugzilla.xamarin.com/show_bug.cgi?id=20772) and [here](https://bugzilla.xamarin.com/show_bug.cgi?id=31260).

In the CdcAcmSerialPort.Read() method, defined here in [C#](https://github.com/anotherlab/UsbSerialForAndroid/blob/master/UsbSerialForAndroid/driver/CdcAcmSerialDriver.cs) and here in [Java](https://github.com/anotherlab/UsbSerialForAndroid/blob/master/UsbSerialForAndroid/driver/CdcAcmSerialDriver.cs), I needed to add a line to copy the new array back over the original array.

In the original Java (edited) code, we had this  
<code language="csharp">final ByteBuffer buf = ByteBuffer.wrap(dest);&lt;br />
if (!request.queue(buf, dest.length)) {&lt;br />
throw new IOException("Error queueing request.");&lt;br />
}&lt;/p>
&lt;p>final int nread = buf.position();&lt;br />
if (nread &gt; 0) {&lt;br />
return nread;&lt;br />
}&lt;br />
</code>  
In the C# code, I added a call to [BlockCopy](https://msdn.microsoft.com/en-us/library/system.buffer.blockcopy(v=vs.110).aspx) to overwrite the original byte array with the updated contents  
<code language="csharp" hightlight="9">ByteBuffer buf = ByteBuffer.Wrap(dest);&lt;br />
if (!request.Queue(buf, dest.Length))&lt;br />
{&lt;br />
throw new IOException("Error queueing request.");&lt;br />
}&lt;/p>
&lt;p>int nread = buf.Position();&lt;br />
if (nread &gt; 0)&lt;br />
System.Buffer.BlockCopy(buf.ToByteArray(), 0, dest, 0, dest.Length);&lt;br />
return nread;&lt;br />
}&lt;br />
</code>  
I also replaced some integer constants with enumerated types where it made sense to do so. I also took the C# helpers from the [LusoVU repository](https://bitbucket.org/lusovu/xamarinusbserial).

As much as I could do so, I followed the code structure&#8217;s of the Java library.  When changes are made to that library, I can view those changes and make the equivalent changes in the C# code.  The end result was that I ended up with all C# code and it works great.

The TWN4 has become my favorite RFID reader.  It&#8217;s very good at reading different card types and you can write custom firmware for it in C.  I used it in another project where it had to work with a custom protocol to with the host device.

<div style="width: 160px" class="wp-caption alignnone">
  <a href="https://www.elatec-rfid.com/en/products/multi-technology-rfid-reader/housed/hf-lf-nfc-multi-technology/"><img loading="lazy" class="size-medium" src="https://i1.wp.com/photos.smugmug.com/photos/i-kWhkjqX/0/Th/i-kWhkjqX-Th.png?resize=150%2C101&#038;ssl=1" width="150" height="101" data-recalc-dims="1" /></a>
  
  <p class="wp-caption-text">
    TWN4 reader
  </p>
</div>