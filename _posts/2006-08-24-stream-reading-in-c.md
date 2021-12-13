---
id: 290
title: 'Stream reading in C#'
date: 2006-08-24T21:05:00-05:00
layout: post
guid: http://www.rajapet.com/?p=290
permalink: /2006/08/24/stream-reading-in-c/
---
I was banging my head against the wall with an odd stream reading problem.  I was making a web service call as straight http, no SOAP, when I hit a snag reading the response back.  I was making the request with a HttpWebRequest object and getting the HttpWebResponse response back by calling the HttpWebResponse GetResponse() method.  From the response object, I was using GetResponseStream() to get at the content.  The data coming back was of variable size.  You would get a fixed size header block, plus a number of fixed sized data entries.  The header block had a field to say how many data blocks there would be.

Naively, I thought I could just use a BinaryReader on the data stream and read x number of bytes in for the header block.  The I would parse that header to the get number of data blocks and then call Read() for that number of data blocks.  Let&#8217;s say that the header block was 64 bytes in size and the data blocks were 32 bytes.  I had logic like the following:</p> 

HttpWebRequest req = (HttpWebRequest)WebRequest.Create(uri);  
HttpWebResponse resp = (HttpWebResponse)req.GetResponse(); 

Stream stream = resp.GetResponseStream();  
BinaryReader br = new BinaryReader(stream); 

byte[] buff = new byte[Marshal.SizeOf(typeof(MyHeader))]; 

c = br.Read(buff, 0, 64);

GCHandle handle = GCHandle.Alloc(buff, GCHandleType.Pinned);  
MyHeader header = (MyHeader)Marshal.PtrToStructure(handle.AddrOfPinnedObject(), typeof(MyHeader));  
handle.Free();

LogEntry MyLogEntry;

for (int i=0; i < MyHeader.EntryCount; i++)  
{  
  buff = new byte[Marshal.SizeOf(typeof(LogEntry))];  
  c = br.Read(buff, 0, 32);  
  if (c == 32)  
  {  
    handle = GCHandle.Alloc(buff, GCHandleType.Pinned);  
    LogEntry = (LogEntry)Marshal.PtrToStructure(handle.AddrOfPinnedObject(), typeof(LogEntry));  
    handle.Free();  
  }

}

The problem was that c was sometimes less than 32.  My bytes were disappearing.  I did some quick sanity check code like this:

c = br.Read(buff, 0, 8192);  
TotalBytes = c;</p> 

while (c > 0)  
{  
  w.Write(buff, 0, c);  
  c = br.Read(buff, 0, 8192);  
  TotalBytes += c;  
} 

When I ran that, TotalBytes had the expected number.  What was I missing?  A little bit of googling found this [bit of extremely helpful information](http://www.yoda.arachsys.com/csharp/readbinary.html) from a guy named Jon.  I was reading while data was still coming into the stream.  The Read method is going to return before all of the data has been written to the source stream,  I had to read the stream into a holding array, by reading it as chunks, until there were no more bytes.  Then I could read the data from the array.  This was so obvious, I can&#8217;t believe I missed it.  The ReadFully() method that Jon supplied worked quite well.

In case you were wondering about the GCHandle stuff, that was needed to marshall C style structures into C# structures.  Getting that bit of code to work right is another story&#8230;.

 

<div>
  Tech Tags: <a href="http://technorati.com/tag/C#" rel="tag">C#</a> <a href="http://technorati.com/tag/Binary+Data" rel="tag">Binary Data</a> <a href="http://technorati.com/tag/Stream" rel="tag">Stream</a> <a href="http://technorati.com/tag/HttpWebResponse" rel="tag">HttpWebResponse</a> <a href="http://technorati.com/tag/GetResponseStream" rel="tag">GetResponseStream</a>
</div>