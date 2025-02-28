---
title: Taking the Acer W3 from Preview to RTM
date: 2013-10-07T20:28:00-05:00
categories:
  - Uncategorized
---
It was time to install Windows 8.1 on my [Acer Iconia W3-810](http://www.microsoftstore.com/store/msusa/en_US/pdp/Acer-Iconia-W3-810-1416-Tablet-64-GB/productID.282303500). I received the tablet at the [Build conference](http://www.buildwindows.com/). The W3 came with the 32-bit edition of Windows 8 and Microsoft provided a USB drive with preview copies of Windows 8.1 for it and the Surface Pro. I had installed the preview version of Windows 8.1. With the availability of Windows 8.1 RTM on MSDN, I decided to repave the Acer with a fresh 8.1 install

> One of the nice touches with the Build giveways was that Microsoft included a 16GB USB3 flash drive. You don&#8217;t get any faster performance from the USB3 drive on the Acer, but the Surface Pro has a USB3 port.

The first thing I did was download the ISO image. I needed the 32 bit version, the [Atom Z2760](http://ark.intel.com/products/70105/Intel-Atom-Processor-Z2760-1MB-Cache-1_80-GHz) processor on the Acer is a 32-bit CPU. Next step was to get the latest drivers for the Acer. Headed over to the [Drivers and Manuals](http://us.acer.com/ac/en/US/content/drivers) page on the Acer site and searched for &#8220;W3-810&#8221;. This brought up all of the files available for the W3.

There is a [BIOS update](http://global-download.acer.com/GDFiles/BIOS/BIOS/BIOS_Acer_1.02_A_A.zip?acerid=635102613815891211&Step1=TABLET&Step2=ICONIA%20W&Step3=W3-810&OS=ALL&LC=en&BC=ACER&SC=PA_6) and a [Driver Package](http://us.acer.com/ac/en/US/content/drivers) download. I grabbed them both. I downloaded the BIOS update to the desktop on the Acer and ran it. It rebooted and installed itself with out any issue. I didn&#8217;t see any release notes with the BIOS update, but the tablet was fine after  installing it. The BIOS upgrade may have been moot, when I installed the Drive Package later on, it did a BIOS update with a newer version.

I chose to repave the W3 and do a clean install. Windows 8.1 does not come with the touch screen drivers for W3. That&#8217;s why I downloaded them ahead of time. If you do this, get a USB hub and a spare USB mouse and keyboard, this will make life much easier for the upgrade.

There is a hidden folder on the c: partition named c:\oem, make a backup copy of it just in case something goes wrong. That has a bunch of Acer specific files and it should have a copy of the Office 2013 installer.

One more file I needed to get was the [Windows 7 USB/DVD Download Tool](http://wudt.codeplex.com/). Ignore the &#8220;Windows 7&#8221; part of the title, it works just fine with Windows 8. This tool makes it easy to make a bootable USB drive from an ISO file.

When you download/install/run this tool, it will prompt you for the ISO file and then ask if you want do a USB hard drive or a USB DVD. Pick the hard drive option and let it reformat the drive. It will then make the drive bootable and extract the ISO image to the drive. I used this to make the /Build drive a bootable Win 8.1 boot disk. It turned out that I didn&#8217;t need to make the drive bootable, but it&#8217;s good to know to do it.

With the drive now a bootable bucket of 32 bit Windows 8.1 joy, I then copied the contents of the driver package ZIP that I had downloaded from the Acer site to the thumbdrive. I had what I needed to upgrade the Acer. I went into the Acer BIOS and changed the boot order so that it would boot from an external drive first. To get into the BIOS screen, reboot the Acer and press the F2 key on the USB keyboard. You can get into the BIOS by holding the up volume button while pressing the power button. But since you&#8217;ll need the USB keyboard, you might as well start off with it attached.

There is probably more than one way to do this, and I hope an easier one. To get the Acer to install from the USB, I had to boot into recovery mode. Press and hold the power button and the Windows button as it boots up. That should boot up into the Windows 8.1 Troubleshooter. It will ask you for your language. On the next screen, select the &#8220;Troubleshoot&#8221; option. On the Troubleshoot screen, select &#8220;Advance Options&#8221;. I then selected &#8220;Command line prompt&#8221;

This opened up a cmd.exe shell. From here, I switched to the D: drive and ran setup.exe. This started the Windows 8.1 install. From that point on, it was just like installing the OS as a new install on any other machine. When it prompts you for a destination partition, choose the largest one, it should be about 48Gb in size on this model. 

After a long while, the Acer booted up into Windows 8.l, RTM. The touch drivers will need to be installed. I went to the Windows Desktop and use Explorer to access the thumbdrive. This is where it is handy to have a keyboard and mouse connected. Then I opened the folder with the Acer drivers and ran the setup.exe. If you do this, you will see a a banner for the Intel Atom Processor drivers. Click through it and go have a sparkling beverage, it&#8221;s going to take a while. After it&#8217;s was done, it will prompted to restart the tablet, on the reboot it flashed the BIOS.

After rebooting, I had touch, but I visual glitches in about half of the Windows Store apps. The text had the same color background as the foreground, making the apps unusable. Fortunately desktop mode was fine. I was able to run Windows Update and that seems to have sorted it all out.

I do need to re-install the Home & Student Edition of Office 2013 that came with the tablet. Installing 8.1 in this way will remove all the installed apps. I wanted to start with a clean slate, so I knew this going in. The installer is supposed to be in the hidden c:\oem folder, but I couldn&#8217;t find it on mine. I still have the registration key, I&#8217;ll either find another source for the installer or just install Office Pro.

Now that everything is in place, my last step was to remove the remaining bits of the previous version of Windows. The installer had renamed the c:\windows to c:\windows.old , and that was still there. Microsoft has a [page](http://windows.microsoft.com/en-us/windows-8/how-remove-windows-old-folder) that explains how to this.

>   1. Open Disk Cleanup by swiping in from the right edge of the screen, tapping **Search** (or if you&#8217;re using a mouse, pointing to the upper-right corner of the screen, moving the mouse pointer down, and then clicking **Search**), entering **Disk Cleanup** in the search box, tapping or clicking **Settings**, and then tapping or clicking **Free up disk space by deleting unnecessary files**.
>   2. If you&#8217;re prompted to choose a drive, select the drive that you just installed Windows on, and then click **OK**.
>   3. In the **Disk Cleanup** dialog box, on the **Disk Cleanup** tab, click **Clean up system files**.
>   4. If you&#8217;re again prompted to choose a drive, select the drive you just installed Windows on, and then click **OK**.
>   5. Select the **Previous Windows installation(s)** check box, and any other check boxes for the files you want to delete, and then click **OK**.
>   6. In the message that appears, click **Delete files**.

And that&#8217;s how I did a clean install install of Windows 8.1. If you have Windows 8, you shouldn&#8217;t need to go through of this. The update to 8.1 will be in the Windows Store and will be a free download.
