---
title: Notes on installing FinalBuilder 7
date: 2010-08-06T20:50:00-05:00
---
VSoft Technologies just released a new version of their build automation tool, [FinalBuilder](http://www.finalbuilder.com/home.aspx).  Version 7 gets a new look to their IDE and you can finally have multiple projects open at the same time.  Among other things, they added support for [Hg](http://mercurial.selenic.com/) and [Git](http://git-scm.com/), plus full support for Visual Studio 2010.  It also [supports](http://www.finalbuilder.com/articles.aspx?ID=38) Team Foundation Build 2010.

[<img loading="lazy" title="FB7_IDE_1" height="170" alt="FB7_IDE_1" src="https://i2.wp.com/lh5.ggpht.com/_natoSxTaPFU/TFx1kkdOBmI/AAAAAAAAAds/OnVHMufQ0w0/FB7_IDE_1_thumb2.png?resize=244%2C170" width="244" border="0"  />](https://i1.wp.com/lh3.ggpht.com/_natoSxTaPFU/TFx1kDpq1iI/AAAAAAAAAdo/IBVA4EJUSG8/s1600-h/FB7_IDE_14.png) 

Along with FinalBuilder, you get a single user license for FinalBuilder Server.  FinalBuilder Server provides a nice web frontend so that you can remotely start a build process from a web browser.  We use this a lot. This tool does a lot and it will save you time.

After installing FinalBuilder, I loaded in an existing build project that had been created with FinalBuilder 6.  It complained about not being able to find the user variables.   User variables are variables defined with FinalBuilder and are global to all projects. We use them to define some settings shared by all our projects.  Within FinalBuilder IDE, you can cut and paste variables from one project to another.  It only works with the same version of the IDE.  I could cut and paste variables a project loaded in one instance of FinalBuilder 6 to another project loaded in a separate instance of FinalBuilder 6.  I could not copy variables from FinalBuilder 6 to FinalBuilder 7.  

Which is really odd, the properties of the variables in FinalBuilder 7 are a superset of what is available in FinalBuilder 6.  Fortunately, this is easy to fix.  The FinalBuilder 6 user variables are stored in a file named FBUserVariables.ini, located in Documents and %USREPROFILE\Application Data\FinalBuilder6.  FinalBuilder 7 follows the same pattern so all I needed to was to copy that file to the %USREPROFILE\Application Data\FinalBuilder7 folder.  Once I did that, the variables were all defined.

User variables are specific to the Windows user account running FinalBuilder.  When we set up our build machine, we created a user account specific to that machine.  All of the compilers and component sets are installed as that user.  FinalBuilder Server is set to run the projects as that user.  This makes life much simpler.  We completely avoid the issue of stuff getting installed under one user and not being available to another user.

I did have to replace a deprecated action with it’s replacement.  [Actions](http://help.finalbuilder.com/Index.htm?actionsreference.htm) are what FinalBuilder uses to implement a single task.  Copy a file, compile a project, get from source control, each would be considered a distinct action.  A build project is a series of actions, with some flow control.

The “Text Replace” action has been replaced with the “Text Find / Replace” action.  Not a big deal, but it threw me when I tried running the script.  I had run the “Batch Project Upgrade…” option from the IDE, but that only copies a previous version project as new version.  It does not replace deprecated actions.  I can understand not changing the actions, but it would be helpful if deprecated actions could be identified.  It was a quick change to make, took about 30 seconds.

I found another odd glitch with FinalBuilder 7.  A really useful feature of FinalBuilder is that it can update the AssemblyInfo.cs files for every project in a .NET C# solution.  This makes it very easy to set the version number and other attributes for every assembly.  I built a multiple project solution with FinalBuilder 7 and only some of the projects had their AssemblyInfo.cs file updated.  After some peeking and poking, I saw that it was only updating the AssemblyInfo.cs files located in the project’s Properties folder.  If the file was in the project root folder, then it didn’t get updated.  I reported this as a bug on the FinalBuilder forums and moved the offending files to the Properties folder.  Built the project again and everything was updated.  [Double rainbows](http://www.motherofconfusion.com/2010/07/double-rainbow-guy-mariposa-youtube-celeb-goes-mainstream/) all around for everyone. [**Update**: After reporting this bug, [they fixed it](http://www.finalbuilder.com/forum.aspx?aft=10059) a few hours later.]

I had one more glitch, this time with FinalBuilder Server.  I added a project to the server and it threw an “type initializer exception” error.  This is a known issue with FinalBuilder 7.  FinalBuilder Server uses [PowerShell](http://www.microsoft.com/windowsserver2003/technologies/management/powershell/default.mspx) for some of it’s tasks.  If PowerShell is not installed, you will get the “type initializer exception” error.  The solution was easy, just install PowerShell.  Windows Update wanted to push it down anyways.  I did suggest to VSoft that they add a prerequisite check for PowerShell in the FinalBuilder installers.  This is easy to do and well is [documented](http://blogs.msdn.com/b/powershell/archive/2009/06/25/detection-logic-poweshell-installation.aspx).  

  * To check if any version of PowerShell is installed, check for the following value in the registry: 
      * Key Location: HKEY\_LOCAL\_MACHINE\SOFTWARE\Microsoft\PowerShell\1 
      * Value Name: Install 
      * Value Type: REG_DWORD 
      * Value Data: 0x00000001 (1)
  * To check whether version 1.0 or 2.0 of PowerShell is installed, check for the following value in the registry: 
      * Key Location: HKEY\_LOCAL\_MACHINE\SOFTWARE\Microsoft\PowerShell\1\PowerShellEngine 
      * Value Name: PowerShellVersion 
      * Value Type: REG_SZ 
      * Value Data: <1.0 | 2.0> 

Version 2 of PowerShell is backwards compatible with version 1, as long as you have either version, FinalBuilder Server will be happy.  Even with these glitches, I really like using FinalBuilder.  If you are looking for an automated build tool with a decent IDE and debugging, you should consider FinalBuilder.
