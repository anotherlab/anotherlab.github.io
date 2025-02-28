---
title: Showing installed app versions with BgInfo
date: 2008-05-14T14:54:00-05:00
---
I love it when you can use one cool tool to enhance another cool tool.  Duncan Epping [posted an English translation](http://www.yellow-bricks.com/2008/04/29/show-vmware-tools-version-with-bginfo/ "Show VMware Tools version with BGInfo") of a Arne Fokkema [post](http://ictfreak.wordpress.com/2008/04/28/vmware-show-vmware-tools-version-with-bginfo/) about how to use BgInfo to display the version number of VMware Tools that has been installed inside a VMWare virtual machine.

If you have never used [BgInfo](http://technet.microsoft.com/en-us/sysinternals/bb897557.aspx "BgInfo home page"), it&#8217;s a great little utility written by Bryce Cogswell of [Sysinternals](http://technet.microsoft.com/en-us/sysinternals/default.aspx) fame.  BgInfo will write a desktop bitmap that will contain useful information about the machine: machine name, ip address, version stuff, free space, etc.  You can set BgInfo to run when you login by placing a shortcut to it in the user&#8217;s or shared startup folder.

When you work with multiple servers, real or virtual, their desktops all tend to look alike.  BgInfo makes it easy to see at glance which machine you are currently connected to.

What Arne wrote about was that in addition to displaying predefined variable, BgInfo can display version information from any file that has version information.  You point BgInfo to the location of the VMWareServer executable and select version formation and you are done.  The screen shot from Arne&#8217;s blog shows how simple it is:

[<img src="http://ictfreak.files.wordpress.com/2008/04/show-vmware-tools-version-with-bginfo.png?w=680"  />](http://ictfreak.wordpress.com/2008/04/28/vmware-show-vmware-tools-version-with-bginfo/) 

BgInfo is very handy for displaying static information.  Since the desktop background is only being rendered when you login in, you wouldn&#8217;t want to use it to display a dynamic variable, like CPU load.  I can see where you would use this to display other version type of information.  If you are testing against multiple service pack versions of SQL Server, you could display that information.   While I&#8217;ve been talking about using this for a VMware virtual image, this is handy for Virtual PC images or any server that you would remote in to.
