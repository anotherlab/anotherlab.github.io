---
title: Fun with COM and console Delphi applications
date: 2007-04-30T20:50:00-05:00
---
I try to make my setup projects upgradeable in place through Windows Installer.  This means that if a previous application has already been installed, the installer will do a silent uninstall before installing the new version.  The fun part is saving the current user settings across the uninstall/install divide.  Depending on the application being installed, the settings could be in the registry, a web.config files, or some other location.

What I end up doing is making a copy of the settings before the old app is removed, then restoring the settings after the new app has been installed.

Windows Installer is pretty good about firing off the save settings and restore settings actions at the appropriate time.  It&#8217;s not so good at handling the actual save and restore bits.  I wrote a couple of Delphi console applications to handle that work.  With a just a few command line options, they know which application to save the settings from and how to restore them.  My installers write the app&#8217;s installed location to the registry to make things like this easier.

One of the applications is an ASP.NET application.  The new version uses the .NET 2.0 Framework version, it&#8217;s replacing a .Net 1.1 version.  The web config files have changed substantially, I can&#8217;t copy the web.config from the 1.1 version and use it with the .NET 2.0 version.  Since I only need to save a couple of settings, I&#8217;m just having my Delphi console app ({$APPTYPE CONSOLE}), read those settings from the old web.config and update the new web.config.   I&#8217;m creating a couple of instances of IXMLDocument and reading from one and writing to the other.

To keep the size of the console app down, it doesn&#8217;t use forms.  Since IXMLDocument uses the MSXML parser, it requires that the COM runtime be initialized.  That&#8217;s all and good, I just call CoInitialize(nil) and match it with CoUnitialize.  When I started testing the new code, the call to CoUnitialize would crash the app, but only outside the debugger.  Those are the fun ones to debug.

Calling our trusty friend Google, I was able to quickly find a [useful link](http://www.techvanguards.com/stepbystep/comdelphi/insideclient.asp "Inside the COM Client").  I needed to call Application.Initialize as the first statement in the project files.  That&#8217;s standard for most applications, but not usually used for console apps.  I added that line (plus the references to forms) and the error went away.  Very nice.  It added 300k to the size of the executable. Not so nice.  I looked at the source code to Application.Initialize and it consisted of just the following line:</p> 

<pre>if InitProc &lt;> nil then TProcedure(InitProc);</pre>





So I made that the first line of code and removed the reference to forms.pas.  Everything worked, and the file size didn&#8217;t take the 300k hit for code it really didn&#8217;t need.  There&#8217;s a lot to be said for having the source code to your runtime libraries.



<div>
  Tech Tags: <a href="http://technorati.com/tag/Delphi" rel="tag">Delphi</a> <a href="http://technorati.com/tag/COM" rel="tag">COM</a> <a href="http://technorati.com/tag/CoInitialize" rel="tag">CoInitialize</a> <a href="http://technorati.com/tag/InitProc" rel="tag">InitProc</a> <a href="http://technorati.com/tag/Windows+Installer" rel="tag">Windows+Installer</a> <a href="http://technorati.com/tag/Upgrade+In+Place" rel="tag">Upgrade+In+Place</a> <a href="http://technorati.com/tag/.NET" rel="tag">.NET</a>
</div>
