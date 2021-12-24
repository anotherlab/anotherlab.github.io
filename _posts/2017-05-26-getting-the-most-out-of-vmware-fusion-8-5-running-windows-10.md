---
id: 2739
title: Getting the most out of VMware Fusion 8.5 running Windows 10
date: 2017-05-26T15:41:54-05:00
author: Chris Miller
layout: post
guid: http://rajapet.com/?p=2739
permalink: /2017/05/26/getting-the-most-out-of-vmware-fusion-8-5-running-windows-10/
collect_box_size:
  - collect-square
categories:
  - Apple
  - Performance
  - Virtualization
tags:
  - Fusion
  - macOS
  - Win10
---
<img loading="lazy" class="alignnone size-medium" src="https://i0.wp.com/photos.smugmug.com/photos/i-KBXFdfp/0/ffff0d86/M/i-KBXFdfp-M.png?resize=600%2C409&#038;ssl=1" width="600" height="409"  />

I&#8217;ve been trying to get the most performance out of my Window 10 virtual machines running on my MacBook Pro through [VMware Fusion](http://www.vmware.com/products/fusion.html). I have a Windows 10 virtual machine that I use for software demos and testing beta versions of Windows. It&#8217;s been running much slower than you would expect on a <del>2</del> 3 year old [MacBook Pro](https://support.apple.com/kb/sp704?locale=en_US) with a quad core i7.  I&#8217;ve collected the following tips (the sources are listed at the end) and they have improved the performance.

### From the MacOS Side

Exclude the virtual disks from Time Machine backups.

You&#8217;ll want to avoid trying to back up the virtual machines by Time Machine.  If Time Machine is trying to back up the virtual machine while it is being used, it will probably fail to perform the backup and it will definitely throttle the disk I/O.

  * Run the Settings App
  * Open &#8220;Time Machine&#8221;
  * Click the &#8220;Options&#8221; button
  * Under the &#8220;Exclude these items from backups&#8221;, click the &#8220;+&#8221; button.
  * Select the Virtual Machines folder.  By default, this will be located in your documents folder.  Once you have selected the folder, press the &#8220;Exclude&#8221; button.
  * Press the &#8220;Save&#8221; button

If you are running an anti-virus application on your Mac, make sure that it is excluding the Virtual Machines folder

### From the Virtual Machine Side

With your virtual machine stopped, you can make some system changes to achieve better performance.  Within Fusion and with the virtual machine open (but not running), open the Settings dialog.  You&#8217;ll want to make the following changes:

  * Open &#8220;Display&#8221; and clear the &#8220;Accelerate 3D Graphics&#8221; checkbox.
  * Open &#8220;Processors & Memory&#8221; 
      * Set the number of processor cores to a value of n-1 or less, where n is the number of actual cores on your Mac.  My Macbook Pro has a quad core i7, so I run with 2 cores assigned to the virtual machine.
      * Give the virtual machine as much ram as you can, but without starving the host OS.  My Mac has 16 GB, so I split it 50/50.  If you have less memory, remember to leave at least 2 GB to the MacOS OS.
      * Open Advanced Options and select &#8220;Enable hypervisor applications in this virtual machine&#8221;
  * Open &#8220;Hard Disk (SCSI)&#8221; 
      * Open &#8220;Advanced options&#8221;
      * Set bus type to SCSI
      * Set &#8220;Pro-allocate disk space&#8221; to enabled.

There are some settings that are not directly exposed through the settings dialog.  You&#8217;ll need to modify the .xmx file directly.  There are a couple of ways of getting at the .vmx file, the clearest technique is documented on the vmguru.com page: [&#8220;Modifying the .vmx file step-by-step&#8221;](https://www.vmguru.com/2017/02/how-to-correctly-modify-the-vmx-file-in-vmware-fusion-8-x/).

  * Change **ethernet0.virtualDev = “e1000e”** to **ethernet0.virtualDev = “vmxnet3”**  
    This will change the default network adaptive to an enhanced driver
  * Add the line **scsi0:0.virtualSSD = 1**  
    This will optimize disk I/O for SSD drives.  Only use this if your MacBook has a SSD drive
  * **mainMem.backing = &#8220;swap&#8221;**  
    May speed up memory swap files
  * **MemTrimRate = &#8220;0&#8221;**  
    Disable memory trimming, less overhead for the Fusion memory manager
  * **sched.mem.pshare.enable = &#8220;FALSE&#8221;**  
    Turns off memory sharing between virtual machines
  * **prefvmx.useRecommendedLockedMemSize = &#8220;TRUE&#8221;**  
    Speed up I/O at the cost of increased memory usage in the host OS
  * **MemAllowAutoScaleDown = &#8220;FALSE&#8221;**  
    Prevents Fusion from attempting to start the virtual machine with less memory than specified.  This can trigger Windows activation.
  * **logging = &#8220;FALSE&#8221;**  
    Disabling the logging should speed things up a bit

If you don&#8217;t need snapshots, remove them.  When you use a snapshot, disk I/O is parsed through each snapshot.  That will show things down.

&nbsp;

### Resources for these suggestions

  1. [VMware Performance Enhancing Tweaks (Over-the-Counter Solutions)](http://artykul8.com/2012/06/vmware-performance-enhancing/)
  2. [Making Windows 10 inside VMWare Fusion 8.x a bit quicker on OSX 10.11 El Capitan](https://fastchicken.co.nz/2016/05/31/making-windows-10-inside-vmware-fusion-8-x-a-bit-quicker-on-osx-10-11-el-capitan/)
  3. [How to Fix Slow Windows VMs on VMware Fusion 8.x  
](https://www.vmguru.com/2017/02/how-to-fix-slow-windows-vms-on-vmware-fusion-8-x/) 
  4. [Excluding the Virtual Machines folder from being backed up by Time Machine (1014046)](https://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=1014046)
  5. [Troubleshooting Fusion virtual machine performance for disk issues (1022625)](https://kb.vmware.com/selfservice/search.do?cmd=displayKC&docType=kc&docTypeID=DT_KB_1_1&externalId=1022625)