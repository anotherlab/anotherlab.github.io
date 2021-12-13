---
id: 344
title: Disabling the VMWare network adapters
date: 2005-12-14T17:27:00-05:00
layout: post
guid: http://www.rajapet.com/?p=344
permalink: /2005/12/14/disabling-vmware-network-adapters/
---
When you are not running a [VMWare](http://www.vmware.com/products/ws/) session, you may want to disable the VMware virtual network adapters. I have found that they can slow down network operations on the host. Anything doing a [UDP](http://en.wikipedia.org/wiki/User_Datagram_Protocol "User Datagram Protocol") broadcast that is sentg over all adapters will take much longer to run if they broadcast over the VMWare adapters. The [ListAvailableSQLServers](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/sqldmo/dmoref_m_l_9jfo.asp) function call in the SQLDMO library is one example that I came across that slowed down dramaticly with the VMWare adapters running.

You have at least three ways of enabling and disabling the network adapters. You can open up the Device Manager (click the &#8220;Start&#8221; button, select &#8220;Run&#8230;&#8221;, enter devmgmt.msc), select the &#8220;VMware Network Adapter VMnet1&#8221; and &#8220;VMware Network Adapter VMnet8&#8221; adapters and press the disable button in the tool bar. The second option is to right click on &#8220;My Network Places&#8221; in the Start menu and select &#8220;properties&#8221;. You can then right click on the &#8220;VMware Network Adapter VMnet1&#8221; and &#8220;VMware Network Adapter VMnet8&#8221; adapters and enable or disable them. The third method is via the command line, so that you can script it.

Microsoft, [in it&#8217;s infinite wisdom](http://www.hypnosis-kids.com/hypnosis-inner-wisdom.htm), does not provide a command line means of enabling or disabling network adapters out of the box. For that, you&#8217;ll need DevCon.exe, the command line alternative to Device Manager. You can get from Microsoft as [Knowledge Base article Q311272](http://support.microsoft.com/default.aspx?scid=kb;EN-US;Q311272 "The DevCon command-line utility functions as an alternative to Device Manager"). With devcon, you can disable/enable a netwoirk adapter by it&#8217;s hardware id. You can get the id from Device Manager, or by running devcon.exe like this:

<span>devcon hwids =net</span>

That will spit out a great deal of information, the ID&#8217;s that you are looking for are \*VMnetAdapter1 and \*VMnetAdapter8. You can disable them individually or do both with a wildcard

<span>devcon disable *VMnetAdapter1<br />devcon disable *VMnetAdapter8</span>  
or 

<span>devcon disable *VMnetAdapter*</span>

The former probably executes faster, the latter is simpler. I run with the adapters disabled and I only enable them whem I am running a VMWare session.

If you are running Windows 7, you should head to [Windows Driver Kit (WDK) Version 7.1.0 Release N](http://msdn.microsoft.com/en-us/windows/hardware/gg487438.aspx), which includes a version of devcon that will install under Win7 64bit.  If you have an older release of the WDK, you can extract the devcon.exe out manually.  A commenter left a link to a post that included the following instructions:

  1. Download the “Windows Driver Kit (WDK) 7.1.0 from MS, it is an ISO image of several hundreds meg in size.
  2. Using UniversalExtractor (<http://legroom.net/software/uniextract>) extract the ISO to a temporary folder.
  3. Again using UniversalExtractor, extract the install file &#8220;WDK\setuptools_x64fre.msi&#8221; to a temporary dir
  4. In that temporary dir you will find &#8220;WinDDK\7600.16385.win7_wdk.100208-1538\tools\devcon\amd64\devcon.exe&#8221;. It may be in a different folder hierarchy, but it should look like.

Along the way UniversalExtractor will prompt you with some warnings, just click OK. With Windows Vista and Windows 7, it will need elevated administrator rights to run.

<div>
</div>