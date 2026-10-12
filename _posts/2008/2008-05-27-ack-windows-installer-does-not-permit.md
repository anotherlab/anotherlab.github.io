---
title: Ack! The Windows Installer does not permit installation from a Remote Desktop Connection
date: 2008-05-27T18:45:00-05:00
---
I&#8217;m testing a installer that I had migrated from Wise For Windows to [InstallAware](http://www.installaware.com/). I testing the installer from inside a virtual machine. I used do it with VMware Workstation, but now I&#8217;m using virtual machines hosted on our [ESX](http://info.vmware.com/content/GLP_ESX_LP1) server. That&#8217;s usually much faster and doesn&#8217;t my bog down my development machine. 

I connected to a virtual Server 2003 session using [Terminals](http://www.codeplex.com/Terminals). If you spend anymore of time using Remote Desktop, then you&#8217;ll want Terminals. It lets you have multiple sessions open in a single instance of the client by displaying each session in a tab. In addition to RDP, it supports VNC, Telnet/SSH, and a few other protocols. And it&#8217;s an open source project, you can&#8217;t beat the price tag.

With a RDP connection, you have the ability to automagically have the remote connection access your local resources (drives, printers, serial ports, etc). I was using the local access to disks to allow the remote connection to access my hard drive. I figured that would be a quick way to compile the installer on my local machine and run it remotely through the RDP connection.

Or so I thought. As a prerequisite for this app, I need to install the [ASP.NET 2.0 AJAX Extensions](http://www.microsoft.com/downloads/details.aspx?FamilyID=ca9d90fa-e8c9-42e3-aa19-08e2c027f5d6&displaylang=en). That comes as a Windows Installer .msi files. When I ran that .msi, I got the following error message:

[<img src="https://i0.wp.com/2.bp.blogspot.com/_natoSxTaPFU/SDxYaWpSIQI/AAAAAAAAAE4/EEAxORsgzoY/s400/WindowsInstallerError.png?w=680" alt="" border="0"  />](https://i1.wp.com/2.bp.blogspot.com/_natoSxTaPFU/SDxYaWpSIQI/AAAAAAAAAE4/EEAxORsgzoY/s1600-h/WindowsInstallerError.png)

[  
](http://www.blogger.com/%24WindowsInstallerError.png) 

In other words: [FAIL](http://www.jonco48.com/blog/fail_20at_20failing.jpg). To add insult to injury, that&#8217;s not even a standard Windows error dialog. With most Windows error dialog boxes, you can press Ctrl-C and the contents of the dialog box will be copied to the clipboard. You&#8217;ll get all of the information from the dialog, something like this (from a different installer):</p> 

<pre>---------------------------<br />Microsoft .NET Framework 2.0 SP1 Setup<br />---------------------------<br />The Windows Installer package:

<p>
  
</p>

<br />

<p>
  c:\c6b28b8b6e56383fbc455e9977dd00\vs_setup.msi
</p>

<br />

<p>
  could not be opened.
</p>

<br />

<p>
  
</p>

<br />

<p>
  Choose Retry to try again. Choose Cancel for exit setup.<br />---------------------------<br />Retry   Cancel<br />---------------------------<br />
</p></pre>





That&#8217;s very handy for reporting errors or for researching with the text from the dialog. I hate it when I see a bug logged in our internal bug tracking system that has embedded a screen shot of an error message. They screen shot the whole page (hello? Alt-Prtscn anyone), save the image, then attach it as a file attachment. Instead, they have press CTRL-C and then CTRL-V and be done with it. Rant over, back to original rant.



For some reason, the AJAX installer team chose not to follow that convention. So I went to Google and manually typed in the text of the error message ([Oh, the huge manatee!](http://www.flickr.com/photos/ulrichp/1362599/)) and start viewing the results. Sure enough, it&#8217;s in the MS Knowledge base as [927063](http://support.microsoft.com/kb/927063 "Error message when you try to install a MSI package on a Windows Server 2003-based computer by using RDP connection: "Windows Installer does not permit installation from a Remote Desktop Connection""). Windows Installer does not allow installs in Server 2003 from a RDP connection shared drive. When you allow access to your local C: drive to the remote session, it sees it as [\\TSClient\c](file://%5C%5Ctsclient%5Cc/) and flat out disallows installs from anything in the [\\TSClient](file://%5C%5Ctsclient/) namespace. This was determined to be a security risk and the tssclient blocking was added Windows Installer 2.0 at the time of the Windows Server 2003 release.



This KB article lists two resolutions, use the standard UNC notation to reference that drive or map a drive letter to that location. To that list, I&#8217;ll a third option. Copy the file from the [\\tsclient](file://%5C%5Ctsclient/) share to the remote desktop and run it from there. For one off tasks, that&#8217;s usually faster than accessing a UNC named object.



Side note: While writing this post, I read on the Terminals home page on CodePlex that Microsoft will be removing the ability to connect to the console session through the RDP protocol in version 6.1. Being able to connect to the console is a little known feature of the RDP client, mstsc.exe. I use it when people leave their RDP sessions hanging on a 2003 Server box that only has the admin remote connections enabled. I can connect over the console session and blow away the left over sessions. I can [query and kill the remote sessions via the command line](http://anotherlab.rajapet.net/2008/04/how-to-identify-who-has-terminal.html "How to identify who has a terminal session and how to kill it"), but sometimes you just need one session open. If you want to see this feature left in the RDP stack, place your vote [here](https://connect.microsoft.com/WindowsServerFeedback/feedback/ViewFeedback.aspx?FeedbackID=341289 "Feedback: RDC : ConnectToServerConsole vs ConnectToAdministerServer").
