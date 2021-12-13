---
id: 211
title: 'What&#8217;s the deal with this .rbf file?'
date: 2008-01-08T21:29:00-05:00
layout: post
guid: http://www.rajapet.com/?p=211
permalink: /2008/01/08/what-deal-with-this-rbf-file/
---
I was updating the installer to one of our applications and every time I ran it, it wanted to reboot at the end of the install.  This installer was installing a web application with some utility apps, nothing that should have forced a reboot.  I was running the installer inside a [VMWare](http://www.vmware.com/products/ws/) virtual machine of Windows 2003.

I&#8217;ve been using [InstallAware](http://www.installaware.com/) for the last 3 months to author our installations.  It was being signaled by Windows Installer that it needed to do a reboot to complete the installation.  The question was why?  After a bit of digging in the help file, I found that I could use the &#8220;/l=filename&#8221; command line parameter to have the installer write to a log file.

I ran the installer one more time and copied the log file down to my dev machine to take a look at it.  It had roughly 9400 lines of Windows Installer chattering.  I started scrolling from the end of the file until I came to the line:</p> 

<pre>Info 1903. Scheduling reboot operation: Deleting file C:\Config.Msi\3e1b7.rbf. Must reboot to complete operation.</pre>





What the frack is an RBF file?  After some googling, I [learned that a file with the .rbf extension](http://filext.com/file-extension/RBF) is a backup of an existing file.  I scrolled up some more and found a bunch of message like this:



<pre>Info 1603. The file C:\WINDOWS\system32\msvcr71.dll is being held in use by the following process: Name: VMwareService, Id: 1804, Window Title: '(not determined yet)'.  Close that application and retry.</pre>





The &#8220;Close that application and retry&#8221; tag means that installer would normally prompt the user to close the application that had the file in use.  If the process does not have a window title associated with it, then that prompt would be suppressed.  In my case, the processes were services and did not have window titles.  I found that documented in a few places, this [post](http://blogs.msdn.com/windows_installer_team/archive/2005/09/19/470980.aspx "Insights into the underlying Windows Installer reboot behavior.") on the [Windows Installer Team Blog](http://blogs.msdn.com/windows_installer_team/default.aspx) being the most useful of them.



A few of the VMWare processes were also using msvcr71.dll and the file was in use.  OK, fine, but it was the same file.  Same bat-version, same bat-time.  Windows Installer should have had enough brains to determine that new file was the same file as current file and just skipped that step.  I don&#8217;t think I ever had that problem with Wise for Windows (WFW had enough problems, but that&#8217;s another story).  My guess is that it&#8217;s an InstallAware issue, but I&#8217;m in the process of confirming that.



I did have a work around.  With the Install File MsiCode command, the dialog box for the command&#8217;s properties has a check box labeled &#8220;Never Overwrite &#8211; do not install if another copy exists&#8221;.  For msvcr71.dll, our code works pretty much each version that we have seen so far.  Setting that check box eliminated that reboot after every install.



<div>
  Technorati Tags: <a href="http://technorati.com/tags/rbf" rel="tag">rbf</a>,<a href="http://technorati.com/tags/InstallAware" rel="tag">InstallAware</a>,<a href="http://technorati.com/tags/Windows+Installer" rel="tag">Windows+Installer</a>,<a href="http://technorati.com/tags/reboot" rel="tag">reboot</a>,<a href="http://technorati.com/tags/msvcr71.dll" rel="tag">msvcr71.dll</a>
</div>