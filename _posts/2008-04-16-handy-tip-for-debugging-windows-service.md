---
title: Handy tip for debugging a Windows Service
date: 2008-04-16T20:21:00-05:00
---
Debugging a Windows Service is always a pain. You can&#8217;t run a service like a regular application, you have to run it from Windows Service Control Manager (SCM) and then have your debugger attach to the process while it&#8217;s running. The problem is that it&#8217;s difficult to debug problems with the service startup as the debugger can&#8217;t attach to the service in time.

I came across a tip on the [.NET Tip of The Day](http://dotnettipoftheday.org/) site, [&#8220;How to debug Windows Service startup&#8221;](http://dotnettipoftheday.org/tips/how-to-debug-windows-service-startup.aspx). Basically, you just add a line that calls [Debugger.Launch()](http://msdn2.microsoft.com/en-us/library/system.diagnostics.debugger.launch.aspx "MSDN: Launches and attaches a debugger to the process.") or [Debugger.Break()](http://msdn2.microsoft.com/en-us/library/system.diagnostics.debugger.break.aspx "MSDN: Signals a breakpoint to an attached debugger.") in your startup code. When your code hits one of those lines, the Visual Studio Just-In-Time Debugger dialog will be invoked and you can select your debugger to handle the error. That will allow you to continue along in the code and debug until the cows come home.

That works better than a service debugging [tip](http://anotherlab.rajapet.net/2005/11/debugging-services.html) I posted a couple of years back, calling the Sleep API in your startup code to allow enough time to attach a debugger to the service. That was a hack, this is much cleaner.

All in all, I still prefer to separate the functional code from the service specific code. I can then run that code from a desktop app, making it much easier to debug. That works about 99.9% of time. Every now and then, I do need to run the actual service code and the Debugger.XXXX() calls will make that task much easier.
