---
id: 207
title: 'When the clipboard doesn&#8217;t work across Remote Desktop'
date: 2008-01-29T20:10:00-05:00
layout: post
guid: http://www.rajapet.com/?p=207
permalink: /2008/01/29/when-clipboard-doesn-work-across-remote/
---
Every now and then, when I have a remote desktop connection open, the clipboard fails to copy across the sessions.  It&#8217;s usually the remote to local copy that&#8217;s [borked](http://www.urbandictionary.com/define.php?term=borked).  It&#8217;s pretty easy to fix, but I can never remember what I need to do to fix the connection.

Fortunately the Terminal Services Team Blog has [got that covered](http://blogs.msdn.com/ts/comments/1089729.aspx "Why does my shared clipboard not work? (Part 1)").  Just kill and restart the rdpclip process in the remote session.   There was also a [part two](http://blogs.msdn.com/ts/archive/2006/11/20/why-does-my-shared-clipboard-not-work-part-2.aspx "Why does my shared clipboard not work? (Part 2)") to that post that was pretty interesting.

[Edited on 1/30/08]  
There is a command line way of resetting rdpclip, so you can roll up both steps as a batch file

<pre><p>
  taskkill /IM rdpclip.exe
</p>

<p>
  rdpclip.exe
</p></pre>





<div>
  Tech Tags: <a href="http://technorati.com/tag/Terminal+Services" rel="tag">Terminal+Services</a> <a href="http://technorati.com/tag/Remote+Desktop" rel="tag">Remote+Desktop</a> <a href="http://technorati.com/tag/rdp" rel="tag">rdp</a> <a href="http://technorati.com/tag/clipboard" rel="tag">clipboard</a> <a href="http://technorati.com/tag/rdpclip" rel="tag">rdpclip</a>
</div>