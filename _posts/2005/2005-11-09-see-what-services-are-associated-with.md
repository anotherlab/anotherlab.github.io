---
title: See What Services Are Associated with a Process?
date: 2005-11-09T17:24:00-05:00
---
There&#8217;s a [cool tip](http://www.tech-recipes.com/windows_tips1054.html "See What Services Are Associated with a Process?") on the [tech-recipes](http://www.tech-recipes.com/) site to show how to see what services are being run under each instance of svchost.exe. From a command line run the following:

tasklist /svc /fi &#8220;imagename eq svchost.exe&#8221; 

That will list each instance of svchost.exe with all of the services being run by that instance.
