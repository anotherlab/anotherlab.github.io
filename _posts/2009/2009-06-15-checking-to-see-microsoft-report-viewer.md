---
title: Checking to see Microsoft Report Viewer 2008 SP1 has been installed
date: 2009-06-15T16:05:00-05:00
---
We are updating the installer for one of our applications and that app now requires the Microsoft Report Viewer 2008 Service Pack 1 to be installed first.  The fun part is determining if it’s installed or not.  Usually, I check the registry keys to see if an application is installed.  If the user has installed the Report Viewer as a separate application, you’ll find it under the key ****

**HKEY\_LOCAL\_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Report Viewer Redistributable 2008 SP1**.  

If you want to read a value from that key, look for VersionMajor.  It should be a DWORD value of 1.

Of course that’s not the only way to get Report Viewer SP1 installed.  If you have Visual Studio 2008 and you have applied SP1, then you’ll have Report Viewer SP1 as part of the Service Pack.  Under that scenario, you wont have the “Microsoft Report Viewer Redistributable 2008 SP1” key.  

What you need to do is to check to see if VS 2008 SP1 is installed.  That key is located at ****

**HKEY\_LOCAL\_MACHINE\SOFTWARE\Microsoft\VisualStudio\9.0\InstalledProducts\KB945140**.  

If you want to read a value for that key, look for string value for “PID”.

[Update on 6/16]

From the [home office](http://www.versatrans.com/) in Latham, NY, a reader sent in the suggested to also check the registry for 64 bit based machines.  On 64-bit editions of Windows, the Report Viewer Redistributable runs in 32-bit more.  It sees a virtualized version of the registry.  The actual registry location is 

**HKEY\_LOCAL\_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Report Viewer Redistributable 2008 SP1**

Note the “Wow6432Node”, that tells that it’s a 32 bit application installed on a 64 bit OS.
