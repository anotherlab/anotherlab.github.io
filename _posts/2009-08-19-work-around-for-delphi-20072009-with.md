---
title: A work around for Delphi 2007/2009 with Windows 7 64 bit
date: 2009-08-19T20:20:00-05:00
---
I just installed Windows 7, 64 bit edition so that I could code and test against this new operating system.  Visual Studio 2008 installed and ran without any incident, but I hit a snag with Delphi 2007.  Delphi 2007 installed just fine, but it would die when you ended a debugging session.  An assert error would get thrown and after you cleared the dialog, Delphi would be terminated.  
The error was thrown by bordbk105N.dll and had the following text:

> Assertion failure: &#8220;(!&#8221;SetThreadContext failed&#8221;)&#8221;  
> in ..\win32src\thread32.cpp at line 412  
> Continue execution? 

That was followed by a “Yes/No” set of buttons.  It didn’t matter which choice you made, it was pretty much game over for Delphi at this point. After getting this happen 3 times in a row (even with Delphi launched with “Run As Administrator”), I decided to check the Internet and see if this was unique to me and if there was a fix.  
I checked Google and found [a few hits](http://www.google.com/search?q=Assertion+failure%3A+%22%28!%22SetThreadContext+failed%22%29%22&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a).  One of them led me to a blog written by Olaf Monien, a German developer with close ties to the Delphi R & D department.  His post, “[Delphi 2009 / Windows 7 / 64 bit Debugger Crash Workaround](http://www.monien.net/blog/index.php/2009/07/delphi-2009-windows-7-64-bit-debugger-crash-workaround/)”, described the issue in great detail.  Apparently an incorrect call is being made to the [SetThreadContext](http://msdn.microsoft.com/en-us/library/ms680632%28VS.85%29.aspx) API call.  The debugger dll has an [assert](http://en.wikipedia.org/wiki/Assertion_%28computing%29) call based on the return value SetThreadContext().  It’s odd that production code went out with asserts enable, that’s usually used during testing.  Some people traced through the debugger code and found that if a single byte is changed in the dll, you could get by this error.  This byte changes the logic so it ignores the return code from SetThreadContext() and never hits the assert code.  You can read about how they came up with that idea [here](http://social.technet.microsoft.com/Forums/en-US/w7itproappcompat/thread/e56df407-bd0b-4ecc-b8a5-0a35bcd571cc).  
An enterprising programmer named “LordByte” wrote a handy little utility that will patch the debugger dll for both Delphi 2007 and Delphi 2009.  <strike>Olaf is hosting the patch tool on his blog and</strike> This file found a permanent home at Embarcadero and you can download it from [Delphi\_2007\_2009\_WOW64\_Debugger_Fix.zip](http://cc.embarcadero.com/item/27521).  This works but you now have the added risk of actual errors being returned from that call to SetThreadContext() being ignored.  Since the alternative is an unusable Delphi, it’s a risk I’m going to have to take.

[Edited April 22nd, 2013]  
While I no longer use Delphi, I hate to see a broken link.  I updated the download link for the debugger patch to it&#8217;s current home at Embarcadero.
