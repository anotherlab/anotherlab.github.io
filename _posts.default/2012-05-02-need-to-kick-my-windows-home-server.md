---
id: 26
title: Need to kick my Windows Home Server every now and then
date: 2012-05-02T03:31:00-05:00
layout: post
guid: http://www.rajapet.com/?p=26
permalink: /2012/05/02/need-to-kick-my-windows-home-server/
---
For some reason, my [HP MediaSmart Server EX495](http://h10025.www1.hp.com/ewfrf/wc/product?product=3969718&lc=en&cc=us&dlc=en&jumpid=reg_r1002_usen) seems to be locking up.  It&#8217;s very infrequent, but when it happens, I can no longer access it and I have to boot it with [severe prejudice](http://en.wikipedia.org/wiki/Terminate_with_extreme_prejudice).  Something is crashing, but I have not been able to determine what is the culprit.  
.  
I need to spend some quality time with my [WHS](http://en.wikipedia.org/wiki/Windows_Home_Server) box to figure out what the problem is.  In the mean time, I&#8217;ll use the [Roy Trenneman method](http://www.youtube.com/watch?v=PtXtIivRRKQ), except via software control.  I want to get the box to reboot itself, once a week.

Ultimately, WHS is a child of NT.  I don&#8217;t need anything fancy to schedule a restart.  The tried and true &#8220;AT&#8221; command will do the job.  This [AT](http://support.microsoft.com/kb/313565), not that [AT](http://en.wikipedia.org/wiki/Hayes_command_set).  What I need to do is pretty basic, I want to reboot the server  every monday morning at 6:00am.  To do this, I followed the following steps

  1. Open a Remote Desktop connection to the WHS, using the administrator account.
  2. Launch a command prompt (Start -> command).
  3. After the command prompt opens up, type the following text: 
    <pre>at 06:00 /every:Monday "shutdown /r /t 0"</pre>

  4. Logout

<div>
  We have created a scheduled task that will execute the shutdown command.  The &#8220;/r&#8221; parameter is what forces the restart.  The &#8220;/t 0&#8221; means no wait before restarting.  That should bandaid my server until I have some time to track down the root cause of the problem.  It will give me more time to ponder the question that every WHS user thinks about: &#8220;Why can&#8217;t Microsoft market Windows Home Server?&#8221;
</div>