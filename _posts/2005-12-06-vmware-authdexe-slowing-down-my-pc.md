---
title: VMware-authd.exe slowing down my PC
date: 2005-12-06T22:00:00-05:00
---
I was doing some work on one of my PC&#8217;s and I had the processes list open in Task Manager. Out of the corner of my eye, I noticed that one process, VMware-authd.exe, was going from 0 to 10% of the CPU. I didn&#8217;t know what that process did, I went out on a limb and assumed that it was somehow related to [VMWare](http://www.wmware.com/). VMware is one of my favorite tools, but I wasn&#8217;t running any VMWare sessions. Time to go Googling. Apparently it&#8217;s a service that provides administrator priviledges to to a running VMWare session if the host use isn&#8217;t logged in with administrator access rights

If you are logged in with admin rights, you don&#8217;t need to have this service running. VMware-authd.exe is the name of the executable for the &#8220;VMware Authorization Service&#8221; service. You can go into Services and shut that service down and then set it&#8217;s startup type to &#8220;manual&#8221;. There are no other services that depend on that service to be running. You can also stop the service from the Windows command line with the following:

net stop VMAuthdService

[Edited on 3/5/08]

If you need to restart the service from the command line, use the following:

net start VMAuthdService
