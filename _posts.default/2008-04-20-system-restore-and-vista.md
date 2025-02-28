---
id: 181
title: System Restore and Vista
date: 2008-04-20T01:28:00-05:00
layout: post
guid: http://www.rajapet.com/?p=181
permalink: /2008/04/20/system-restore-and-vista/
---
After reading the comments posted to my blog entries for USB issues caused by [KB938371](http://support.microsoft.com/kb/938371 "A Vista Update known to be unfriendly to USB mice"), I can&#8217;t over emphasis how valuable it is to have [System Restore](http://en.wikipedia.org/wiki/System_Restore "Wikipedia: System Restore is a component of Microsoft's Windows Me, Windows XP and Windows Vista operating systems that allows for the rolling back of system files, registry keys, installed programs, etc., to a previous state in the event of a failure.") enabled.  While trying to find a work around for the mouse problems that I reported [here](http://anotherlab.rajapet.net/2008/04/microsoft-admits-that-kb-938371-kills.html "Microsoft admits that KB 938371 kills USB Devices"), [here](http://anotherlab.rajapet.net/2008/04/work-around-for-kb938371-disabling-hid.html "Work around for KB938371 disabling HID-compliant input devices"), [here](http://anotherlab.rajapet.net/2008/04/kb-938371-woes-continue.html "KB 938371 woes continue"), and starting at [here](http://anotherlab.rajapet.net/2008/04/vista-update-kb938371-disabled-my-mouse.html "Vista update KB938371 disabled my mouse"); I noted that a few of the people who had posted responses or had sent private email did not have System Restore available.

I was surprised by that as System Restore is enabled in all SKU&#8217;s of Vista by default and it&#8217;s greatly improved over the System Restore feature in XP.  If you are not familiar with System Restore, I&#8217;m going to borrow the following from the Wikipedia entry

it&#8217;s a feature that periodically takes a snaphot of the current state of the operating system, typically referred to as a _restore point_.  Windows uses Shadow Copy (aka Volume Snapshot Service or Previous version) to create a file that contains system files, registry settings, drivers, installed programs and stores the data in a single compressed file.  User settings and files are typically not covered.

This restore point will be generated under the following conditions:

  * when a piece of software is installed 
  * when Windows Update installs new updates to Windows 
  * when the user installs a driver that is not digitally signed by Windows Hardware Quality Labs 
  * every 24 hours of computer use , or every 24 hours of calendar time, whichever happens first 
  * when the operating system starts after being off for more than 24 hours 
  * when the user requests it.

When Windows Update pushed KB983371 down to my machine, System Restore created a restore point of the current state of the OS just prior to the installation.  This allowed me to easily roll back the installation of the update.  Since 938371 does not allow itself to be uninstalled, roll back the system via System Update was the only documented way of removing 938371, short of reinstalling Vista.

If for some reason you have disabled System Restore, you really should consider turning it back on.  I have seen a few sites mention how to turn it off (but for the most part they do warn you of the consequences), but you really want to leave it on.  I have had to use System Restore a couple of times and it really got me out of jam.  If you need to re-enable System Restore, the following steps should work for you:

  1. Click on the Start button.
  2. Right click on &#8220;Computer&#8221; ,and then select Properties. (Also reachable as the &#8220;System&#8221; applet on the Control Panel.
  3. On the left hand side of the Control panel->System dialog, click Advanced Settings.  If the User Access Control dialog rears it&#8217;s ugly head and propmtps you to permit the action, click on Continue (or OK) to allow you to continue.
  4. Click on the System Protection tab.
  5. In the group box labeled &#8220;Automatic Restore Points&#8221;, check the checkboxes listed for your hard drives.  Some PC&#8217;s come with special partitions used for vendor specific diagnostic and restore functionality (Dell PC&#8217;s typically have a special partition labeled &#8220;RECOVERY&#8221;, leave those partitions unchecked.
  6. Press OK to save the changes.

There&#8217;s rarely a free lunch in this business, and there is a cost to using System Restore.  This cost is pretty simple, it will use up to 15% of the space on the drive, with 300MB as a minimum.  You also need to have a drive larger than 1GB to use System Restore.  With the huge drives now available to today, the benefit clearly out weighs the cost.