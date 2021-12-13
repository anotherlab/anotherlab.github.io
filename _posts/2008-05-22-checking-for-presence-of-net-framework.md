---
id: 169
title: Checking for the presence of .Net Framework 2.0 SP1
date: 2008-05-22T20:31:00-05:00
layout: post
guid: http://www.rajapet.com/?p=169
permalink: /2008/05/22/checking-for-presence-of-net-framework/
---
[Installware](http://www.installaware.com/) has a lot of built in support for checking for the presence of the various flavors of the .NET Framework.  In it&#8217;s current incarnation, 7.5, it doesn&#8217;t have anything for checking for the presence of Service Pack 1 of the .NET Framework 1.0.  It turned out to be pretty easy to add that check to my installer script.

A couple of years back Heath Stewart did [a blog post](http://blogs.msdn.com/heaths/archive/2006/04/07/571241.aspx "Heath Stewart's Blog : Detecting Patches in .NET 2.0 and Visual Studio 2005") about how to check for the presence of a .NET Service Pack.  You just look for the the value of &#8220;SP&#8221; in the registry key for the version of the .NET runtime that you want to check.  For .NET 2.0, that key would be labeled:

HKEY\_LOCAL\_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP\v2.0.50727

If you want to check against a language, you just check for the language id.  For example, English is ID 1033.  The key to check for the English version of the .NET 2.0 runtime would be.

HKEY\_LOCAL\_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP\v2.0.50727\1033

The SP is DWORD, so you will get back an integer result.  If the .NET runtime has been installed, it will have the SP value.   For the RTM release, it will be 0.

With InstallAware, I use the following syntax to check for .NET 2.0 SP1 and terminate the install if SP1 (or later) has not been installed.

<pre>Read Registry Key HKLM\SOFTWARE\Microsoft\NET Framework Setup\NDP\v2.0.50727\SP into CHECKSYSTEM<br />if Variable CHECKSYSTEM not Greater Than 0<br />  MessageBox: $TITLE$ Setup Error, This product requires that the Microsoft .Net Framework 2.0 Service Pack 1 has been installed.$NEWLINE$$NEWLINE$Setup cannot continue.<br />Terminate Installation<br />end<br /></pre>



For some reason, InstallAware does not have an &#8220;Less Than&#8221; operator, you have to do &#8220;not Greater Than&#8221;.  InstallAware is a [leaky abstraction](http://www.joelonsoftware.com/articles/LeakyAbstractions.html "The Law of Leaky Abstractions - Joel on Software") of the Windows Installer experience, I just shrug at those little oddities.



[Updated on 5/27/08]  
I had a typo in the line that starts with &#8220;if Variable CHECKSYSTEM&#8221; where it should have been comparing against the value of 0, not 1.  My bad.