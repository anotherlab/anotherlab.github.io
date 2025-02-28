---
title: Fast way to resize a virtual disk with VMware ESX Server
date: 2008-11-20T21:22:00-05:00
---
We’re starting some [SharePoint](http://en.wikipedia.org/wiki/Sharepoint) development and I needed to create a [development environment](http://weblogs.asp.net/erobillard/archive/2007/02/23/build-a-sharepoint-development-machine.aspx) on Windows Server 2003.  So I created a new virtual machine (VM) of Server 2003 on our [VMware ESX](http://en.wikipedia.org/wiki/VMware_ESX) box and gave it a 1GB of RAM and 8GB of disk space.  I installed the OS and configured it for [Windows SharePoint Services](http://en.wikipedia.org/wiki/Windows_SharePoint_Services) (WSS) and then installed Visual Studio 2008.  That left us with about 1.5GB of disk space.  Oops, time to resize the drive.

The beauty of working with virtual machines is that it’s relatively easy to increase or decrease the memory and disk storage.  In this case, I wanted to add another 4GB to the virtual disk.  I powered down the virtual machine and went into the “Virtual Machine Properties” from the [VMware Infrastructure Client](http://www.vmware.com/products/vi/) (VIC).  I selected the hard drive and it provided a entry field for the new size.  I increased the size to 12GB, adding an additional 4GB.

That takes us part way there.  I increased the size if the virtual disk from 8GB to 12GB, but it still has an 8GB partition, the OS wont see the additional space.  I saw all some [tips](http://vmware-land.com/Resizing_Virtual_Disks.html) on that [Series of Tubes](http://seriesoftubes.net/archives/2-Its-Not-A-Truck...Its-A-Series-Of-Tubes.html) that recommended downloading Linux boot disks and boot the the VM from the Linux CD images as an .ISO file.

[Meh](http://news.yahoo.com/s/ap/20081117/ap_on_re_eu/eu_britain_new_word), that’s too much work.  I took a simpler path.  I powered down another Server 2003 VM that was already running on the ESX box and added new VM’s virtual disk as a second virtual drive.  I booted up the second VM and opened up a command shell.  From the command shell, I ran the [diskpart](http://technet.microsoft.com/en-us/library/cc766465.aspx) utility to extend the partition.  I did the following commands through diskpart:</p> 

<pre>diskpart

<p>
  
</p>

<br />

<p>
  Microsoft DiskPart version 5.1.3565
</p>

<p>
            <br />Copyright (C) 1999-2003 Microsoft Corporation.
</p>

<p>
  On computer: XXXXX
</p>

<br /><br />

<p>
  DISKPART> list volume
</p>

<p>
   
</p>

<p>
    Volume ###  Ltr  Label        Fs     Type        Size     Status     Info
</p>

<p>
    ----------  ---  -----------  -----  ----------  -------  ---------  --------
</p>

<p>
    Volume 0     E                       DVD-ROM         0 B<br />  Volume 1     C                NTFS   Partition     12 GB  Healthy    Boot<br />  Volume 2     D                NTFS   Partition    8 GB  Healthy
</p>

<p>
  <br /> 
</p>

<p>
   
</p>

<p>
  DISKPART> select volume 2 <br />  <br />Volume 2 is the selected volume.<br />  <br />DISKPART> extend
</p>

<p>
   
</p>

<p>
  DISKPART> exit
</p>

<p>
         <br />Leaving DiskPart...
</p></pre>

I basically typed that in from memory, some of the numbers may be off, but it shows how to extend the size of the partition.  After exiting out of diskpart, I then shut down the second VM.  Next, I removed the virtual drive that belongs to the new VM.  Remember to select remove only and not remove and delete.  At this point I was able to power both VM’s back up.  The second VM will be slightly confused about the missing drive, but it was back to normal.  The new VM took some time to check out the resized partition after I logged back in.  With my VM, it declared it to be new hardware and wanted to reboot.  After it rebooted, it was happy and recognized that it had a 12GB partition.
