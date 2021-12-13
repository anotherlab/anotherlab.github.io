---
id: 123
title: How to disable the Windows Shutdown Tracker Dialog
date: 2008-08-04T16:14:00-05:00
layout: post
guid: http://www.rajapet.com/?p=123
permalink: /2008/08/04/how-to-disable-windows-shutdown-tracker/
---
Rick Strahl posted a <a href="http://west-wind.com/WebLog/posts/440334.aspx" target="_blank">great tip on how to disable the Windows Shutdown Tracker Dialog</a>. That’s the dialog that Serer 2003 and Server 2008 make you respond to when you reboot or power down the server.  As Rick noted, usually the only time that you need to reboot a Windows Server is when you install an update from Microsoft.  It’s collecting information that you’ll never use.  You can disable that dialog by making a change in the local computer <a href="http://en.wikipedia.org/wiki/Group_Policy" target="_blank">Group Policy</a>.</p> 

To disable the dialog, do the following:

  * Run the Group Policy Object Editor by typing “gpedit.msc” from the “Run…” dialog.
  * Navigate down to Local Computer Policy\Computer Configuration\Administrative Templates\System
  * Double-click on “Display Shutdown Event Tracker” and click on the “Disabled” radio button
  * Click the “Ok” button to close the dialog with the new setting.
  * Close the Group Policy Object Editor.</p> </p> </p> </p> </p> </p> </p> </p> </p> </p> 

This will work for both Server 2008 and Server 2003.