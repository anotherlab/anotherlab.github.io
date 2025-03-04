---
title:  Refresh of this blog
author: anotherlab
categories: 
  - Jekyll Blog Ubuntu
tags:
  - Samsung M.2
---
![Not good](/assets/images/pc_on_fire.jpg)

The blog has been updated. Not just posts, all of the stuff that generates it. This wasn't planned...

About two weeks ago, the boot drive of my PC failed. The drive was a Samsung 980 Pro 2TB. I had two of them, one for the OS, the other for data. Went to my PC on a normal Sunday morning only to see the BIOS configuration screen. After a few failed reboots, I came to the conclusion that something was seriously not good with by boot drive.

![Rut ro](/assets/images/uefi-bios-11.gif)
*<small>Not my motherboard, but close enough</small>*

What I didn't know was that this drive was shipped with a [notorious firmware bug](https://www.tomshardware.com/news/samsung-980-pro-ssd-failures-firmware-update). Eventually it would permanently lock itself into readonly mode.

Most of my data is backed up on regular basis. I have a [QNAP server](https://www.qnap.com/en-as/product/ts-464) with about 7 TB of RAID storage. Stuff that is important to me is backed up there. I have a healthy degree of paranoia about disk backups. I assume that it will all fail. I backup up documents to external USB drives and store them at my daughter's house. I count on those drives failing after a few years and will rotate them out.

I figure we'll have USB around for a while longer. I use to burn documents to CD and the DVD. I don't have any drives with spinning parts in this computer. USB is enough.

I was a bit sloppy with backing up some of the stuff, so I had some code on the boot drive that I didn't want to lose. I was able to make a Windows 11 boot USB stick and with that stick, I could open a CMD shell and read the data from the boot drive.  I copied to data drive and to an external drive.

I made a few attempts to reinstall Windows, but that drive was locked into readonly mode. I ordered a new drive from a local BestBuy and picked it up.  All they had were Samsung 990 Pro drives in the 2 TB size. So that's what I bought. I like the M.2 NVMe drives. They are fast and they just install on the motherboard. No power or data cables. When I assembled this [PC](https://pcpartpicker.com/list/BwHP6r) 3 years ago, I did it without any SATA drives.

Now it was time to get to work. I have a [MSI Z690 Edge Wifi DD4 motherboard](https://www.msi.com/Motherboard/MPG-Z690-EDGE-WIFI-DDR4). It's nice, I like it. It has four M.2 slots. One of them is directly controlled by the CPU, the other 3 are controlled by the Z690 chipset. The one controlled by the CPU is where I have the boot drive. It's located between the CPU and the first PCIe slot. All of the M.2 slots have heatsinks on them. Which have to be unscrewed to get at the slots

I used a Fractal Desigm Torrent case for this PC. It's fan cooled and very quiet. I have a massive Noctua CPU cooler. It partially covers the M.2 slot and I had to angle a screw driver in to get the heatsink off and swap the old drive with the new one. I had also had to remove the GPU to get at the M.2 slot. It's always fiddly to swap stuff on the motherboard, but it wasn't too bad.

I booted from the Win11 stick and tried to install Windows. Here is where I shot myself in the foot. Windows numbers the drives, starting from 0. The boot drive was 0, the data was 1. For some reason, the data drive was now 0 and the new one was 1. I just assumed that because I was using the same slot for the new drive, the numbering would stay the same.I ended up deleting the partition on the good drive so the Win11 installer could start fresh.

It rebooted and kept coming back to the installer on the USB stick. After a few attempts, I pulled the data drive out and with just one drive, Windows setup was able to install Windows. After Windows came up and updated itself, I powered down and installed the data drive. It came up and of course my data was gone. It was backed up, but I had some images and code that were only the data drive. I ended up buying [an app](https://www.anyrecover.com/) that claimed to be able to recover data from a deleted partition.

AnyRecover lived up to it's claim. It wasn't quick, but I recoved what I needed to a folder on the new boot drive. I then formatted the data drive and moved the data back. That's when a friend told me that these 980 Pro drives had a firmware version that would eventually lock the drive into readonly. I bought the data drive a month after building the PC, the odds were high that it had the same firmware. Samssung has a handy [Magician](https://semiconductor.samsung.com/consumer-storage/magician/) app. It can show the firmware and other settings and it can update the firmware.

So I downloaded and installed the Magician app and then installed the broken drive to see what the Magician would say. It showed that the new 990 Pro had the current firmware, but both 980 Pro's were on the bad firmware. It was able to update the firmware for the data drive, but failed on the old boot drive. It did allow me to access the serial number of the drive.

![Samsung Magician](/assets/images/samsung-magician.png)
*<small>Screenshot of the Samsung Magician</small>*

I went to the Samsung Support site and filed a warranty claim. They took the serial number and immediately gave me a RMA number and a label to print. I sent the failed 980 Pro in. A few days later, I received a new 990 Pro drive back. Now I had three M.2 drives of 2 TB capacity each, which more than I needed. I didn't realize until I wrote this blog post that the QNAP box has two M.2 slots. I thought my PC was the only thing I had that could use the drive.

So I added it as a new drive and formatted as a [Windows Dev Drive](https://learn.microsoft.com/en-us/windows/dev-drive/). Dev Drives use the [ReFS](https://learn.microsoft.com/en-us/windows-server/storage/refs/refs-overview) file system instead of NTFS and they are treated as a "trusted drive" by the OS. The usual antivirus and other security policies are not applied to Dev Drives. So that's where all of my source code lives now. It's supposed to be faster, but it's hard to to tell.

Now that the PC was running again and my data was safe, I could start the long process of installing and configuring the apps that I use. That will be another blog post. There was a lot to install and I'm almost there. Some configuration was required to the the blog stuff working again and this post is more or less a validation check for that.
