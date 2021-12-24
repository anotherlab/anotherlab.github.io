---
id: 50
title: 'Resolving &quot;Navigation to the webpage was canceled&quot; with Compiled HTML Help files (.chm)'
date: 2010-08-30T17:24:00-05:00
layout: post
guid: http://www.rajapet.com/?p=50
permalink: /2010/08/30/resolving-to-webpage-was-canceled-with/
---
I&#8217;m working with a [SDK](http://en.wikipedia.org/wiki/Software_development_kit) from a vendor that we have partnered with.  They provide the SDK as a download that I grabbed over FTP with Internet Explorer.  The SDK has a .NET assembly to use, some sample code, and documentation in a [.chm help file](http://en.wikipedia.org/wiki/Microsoft_Compiled_HTML_Help "Microsoft Compiled HTML Help").  It&#8217;s all neatly bundled in a .zip files, nothing too esoteric.

Since Windows directly supports .zip files, I used Windows Explorer (Windows 7) to copy the files from the .zip file to new folder.  I then launched the help to examine some new functions the vendor had added for me.  The help file loaded up, but I couldn’t access anything.  It looked like this:

[<img loading="lazy" alt="BlockedChm" border="0" height="248" src="https://i0.wp.com/lh6.ggpht.com/_natoSxTaPFU/THvpYtnYuYI/AAAAAAAAAeg/bKnuq0z8uSc/BlockedChm_thumb%5B2%5D.png?resize=404%2C248" title="BlockedChm" width="404"   />](https://i1.wp.com/lh5.ggpht.com/_natoSxTaPFU/THvpYYZIJhI/AAAAAAAAAec/DMj3y0e8jd0/s1600-h/BlockedChm%5B4%5D.png) 

At first I thought the file was corrupt, but then I realized what was going on.  With Windows Explorer, I selected the .chm file and right-clicked on it and selected “Properties”. 

[<img loading="lazy" alt="BlockedProperties" border="0" height="519" src="https://i1.wp.com/lh5.ggpht.com/_natoSxTaPFU/THvpZUJsW3I/AAAAAAAAAeo/A-_WtLyXFGU/BlockedProperties_thumb%5B5%5D.png?resize=381%2C519" title="BlockedProperties" width="381"   />](https://i1.wp.com/lh5.ggpht.com/_natoSxTaPFU/THvpZJexxtI/AAAAAAAAAek/Nj8ilgufLmg/s1600-h/BlockedProperties%5B7%5D.png) 

If you look at the section that is highlighted in green, you’ll see the text ”This file came from another computer and might be blocked to help protect this computer.”.  With Windows XP SP2 and later operating systems, the file’s zone information is being stored with the file as stream.  A stream is a separate resource stored with the file, just not exactly in the file.  Separate resource streams is a feature of the NTFS file system.  Since the .zip file had been downloaded with Internet Explorer, the .chm file was treated as if it had been downloaded directly.  

This is actually a good thing.  By default Internet Explorer will not let you run content from your local disk without your expressed acceptance.  Since the Internet Explorer rendering engine is used to render the pages of the .chm file, it’s going to block pages that came from the Internet Zone. 

You have a couple of ways of fixing this.  One way would to disable the blocking of local content.  I don’t think that’s a safe way to operate so I’m not going to describe how to do that.  In the file Properties dialog, there is an “Unblock” button.  Click that button and you can remove the Zone block.

Another way would be to use a command line tool and remove the Zone Identifier resource stream.  SInce NTFS file streams pretty much invisible to the casual eye, you can grab a free tool to trip that data out for you.  Mark Russinovich’s [Sysinternals](http://technet.microsoft.com/en-us/sysinternals/default.aspx) collection of utilities includes a nice little gen called [streams](http://technet.microsoft.com/en-us/sysinternals/bb897440.aspx).  It’s a handy little utility.  It will list what streams are associated with a file or folder and you delete them.  Recursively and with wild cards too.  One of the thinks I like about Systinternal command line tools is that you can run them without a parameter to get a brief description of what it does and how to use it:

<pre>Streams v1.56 - Enumerate alternate NTFS data streams<br />Copyright (C) 1999-2007 Mark Russinovich<br />Sysinternals - www.sysinternals.com<br /><br />usage: \utils\SysInternals\streams.exe [-s] [-d] &lt;file directory="" or=""><br />-s     Recurse subdirectories<br />-d     Delete streams&lt;/file></pre>

When I ran streams on my .chm file, I saw the following:

<pre>streams.exe SomeSdk.chm<br /><br />Streams v1.56 - Enumerate alternate NTFS data streams<br />Copyright (C) 1999-2007 Mark Russinovich<br />Sysinternals - www.sysinternals.com<br /><br />C:\dev\SomeSdk.chm:<br />:Zone.Identifier:$DATA       26</pre>

You can also get a listing of the resource streams if you use the “/R” parameter with the DIR command. To see the contents of the stream, you can open it with notepad with syntax like this:

<pre>notepad MySdk.chm:Zone.Identifier</pre>

That would display something like this:

<pre>[ZoneTransfer]<br />ZoneId=3</pre>

Any value of [3 or higher](http://blogs.msdn.com/b/powershell/archive/2007/03/07/how-does-the-remotesigned-execution-policy-work.aspx) would be considered a remote file.  So I ran it one more time, just with the –d parameter and got this:

<pre>streams.exe -d SomeSdk.chm<br /><br />Streams v1.56 - Enumerate alternate NTFS data streams<br />Copyright (C) 1999-2007 Mark Russinovich<br />Sysinternals - www.sysinternals.com<br /><br />C:\dev\SomeSdk.chm:<br />Deleted :Zone.Identifier:$DATA</pre>

Once I did that, my help file was unblocked and ready to be used.