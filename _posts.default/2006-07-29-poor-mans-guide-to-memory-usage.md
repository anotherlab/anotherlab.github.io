---
id: 295
title: 'Poor man&#8217;s guide to memory usage tracking'
date: 2006-07-29T03:32:00-05:00
layout: post
guid: http://www.rajapet.com/?p=295
permalink: /2006/07/29/poor-mans-guide-to-memory-usage/
---
I have a service and I need to make sure that it doesn&#8217;t have a memory leak after running for a sustained length of time.  I&#8217;m doing all the good stuff in code to manage the garbage collection and I have the right tools to check for leaks in my code.  But I still want to monitor an instance of the service during regular usage.  I don&#8217;t need anything too finely grained, I just want to see if the memory usage is trending upwards.  There&#8217;s a good chance that I might have to deploy this out in the field, so I want something simple.  I could have used the Performance console, but I wanted something very simple to explain.  You can probably do this with a [CScript](http://www.microsoft.com/resources/documentation/windows/xp/all/proddocs/en-us/cscript_overview.mspx?mfr=true) batch file and [WMI](http://www.microsoft.com/whdc/system/pnppwr/wmi/default.mspx), but I wanted something fast to load and fast to exit.

What I want is to log the memory usage to a text file, with each entry timestamped.  I was able to do this with almost all off the shelf parts.  I did have to write the timestamper, but that was a trivial task.  Since the home viewers will not have my service, pick a service or app of your own and play along.  I&#8217;ll describe what I did using FireFox as a substitute for the actual service.

In the excellent [PsTools suite](http://www.sysinternals.com/Utilities/PsTools.html) over at [SysInternals](http://www.sysinternals.com/) site, there is a utility named [PsList](http://www.sysinternals.com/Utilities/PsList.html).  It&#8217;s a combination of the [pmon and pstat](http://www.microsoft.com/downloads/details.aspx?FamilyID=49AE8576-9BB9-4126-9761-BA8011FABF38&displaylang=en) tools that works like a command line version of the &#8220;Processes&#8221; tab of Task Manager.  By default it lists information for all running processes, but you can filter it by service name or process ID.  I wrote a batch file to call PsList with the service name and the &#8220;-m&#8221; command line switch to print the memory usage.  PsList prints some banner information with the details.  Something like this:

<pre>PsList 1.26 - Process Information Lister<br />Copyright (C) 1999-2004 Mark Russinovich<br />Sysinternals - www.sysinternals.com<br /><br />Process memory detail for <a href="http://en.wikipedia.org/wiki/Kremvax">Kremvax</a>:<br /><br />Name                Pid      VM      WS    Priv Priv Pk   Faults   NonP Page<br />firefox            3936  108952   41380   32748   36452   140201      8   54<br /></pre>

All fine and good, but not pretty enough for a log file.  What I need was just the last line.  So I piped the output from PsList through the good &#8216;ol [FIND](http://www.microsoft.com/resources/documentation/windows/xp/all/proddocs/en-us/find.mspx?mfr=true) command with &#8220;firefox&#8221; as the filter text.  With that, I can redirect the output to a file (with append).  I ended up creating a batch file named memlog.cmd that had the following commands:

<pre>pslist -m firefox | find "firefox" >>c:\logs\memuse.txt</pre>

That gave me the last line in a file.  But I still needed the time stamp. I thought about going through some script file sleight of hand with ECHO and DATE, but this is the Windows Server 2003 CMD.EXE.  It doesn&#8217;t have that skill set.  I could do with some 3rd party shells, but the goal is something I can deploy on a remote site without anyone having to pay for a tool or go through the hassle of installing something like [Power Shell](http://www.codeproject.com/useritems/Introduction_to_Monad.asp).

Time to fire up [Delphi](http://www.borland.com/us/products/delphi/index.html) and create a little command line app that would take text coming in as standard input and send it back out as standart output, but with a timestamp prepended to the text.  The source code has less text in it than the previous sentence.  If you have Delphi, the following code will give you that mini-tool.  I used Delphi 7, any of the Win32 versions should do.

<pre><br /><b>program</b> dtEcho;<br /><br />{$APPTYPE CONSOLE}<br /><br /><b>uses</b><br />  SysUtils;<br /><br /><b>var</b><br />  s: <b>string</b>;<br /><b>begin</b><br />  ReadLn(s);<br />  WriteLn('[' + FormatDateTime('yyyy-mm-dd hh:mm', Now) + '] ' + s);<br /><b>end</b>.<br /></pre>

There&#8217;s no banner or error checking.  I didn&#8217;t need any of that and I wanted to keep it light.  By adding dtEcho to my batch file like this:

<pre>pslist -m firefox | find "firefox" | dtecho >>c:\logs\memuse.txt</pre>

I now get output like this:

<pre>[2006-07-28 23:14] firefox            3936  536904   61324   51244   57384   445377     90  249<br />[2006-07-28 23:15] firefox            3936  538176   60844   50764   57384   449193     91  249<br />[2006-07-28 23:16] firefox            3936  538212   60620   50528   57384   455935     91  249<br /></pre>

The output only goes down to the minute, I&#8217;m tracking the memory usage every 10 minutes, I didn&#8217;t need to make the timestamp that granular. If I needed it, I just need to make a slight change the dtEcho source code and it will print the seconds.

To run that batch file, I just used the scheduled tasks control panel applet and set it to run off of my account. For remote deployment, that would probably be the hardest step.

<div>
  Tech Tags: <a href="http://technorati.com/tag/Delphi" rel="tag">Delphi</a> <a href="http://technorati.com/tag/pslist" rel="tag">pslist</a> <a href="http://technorati.com/tag/sysinternals" rel="tag">sysinternals</a> <a href="http://technorati.com/tag/memory+usage" rel="tag">memory usage</a> <a href="http://technorati.com/tag/cmd" rel="tag">cmd</a> <a href="http://technorati.com/tag/memory+leak" rel="tag">memory leak</a> <a href="http://technorati.com/tag/service" rel="tag">service</a> <a href="http://technorati.com/tag/win32" rel="tag">win32</a>
</div>