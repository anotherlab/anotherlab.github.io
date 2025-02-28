---
title: Every 30 seconds, the cursor would turning into the spinning donut of death
date: 2012-07-17T01:32:00-05:00
---
I was working from home today when I kept seeing something strange.  About every 30 seconds, the cursor would go from normal to busy.  It would last for a second or two and then go back to normal.  30 seconds later, the cycle would repeat.  I didn’t matter if I was doing anything or not, nothing interfered with the cycle.

This drove me nuts.  First thought was a virus or some other nasty.  Did a full [Microsoft Security Essentials](http://windows.microsoft.com/en-US/windows/products/security-essentials) scan and a full scan with [Malwarebytes Anti-Malware](http://www.malwarebytes.org/).  Both were clean. 

<p align="center">
  I even took Roy’s advice to no effect.
</p>

Nothing showed under Windows Task Manager, so I pulled out the big gun.  The Sysinternals [Process Explorer](http://technet.microsoft.com/en-us/sysinternals/bb896653.aspx "Process Explorer").  Process Explorer will show you a whole lot more than Task Manager.   In addition to the currently active processes, you can see the stuff that each process will load.  I left the process window open for a few minutes on the second monitor.  I immediately saw a pattern.  An app named ScanToPCActivationApp was loading another app named HPNetworkCommunicator over and over again.  HPNetworkCommunicator would load, the donut would spin, then the process would exit.

I recently bought a [HP Officejet 6700](http://www.amazon.com/gp/product/B006M1MSKG/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B006M1MSKG&linkCode=as2&tag=christmillers-20), a printer with a mind boggling amount of tech for a sub $170 price.  It’s wired and wifi network ready out of the box and that’s how I have it hooked up.  On a wired connection.  When I first powered up the printer, it connected to my wifi network and grabbed the IP address 192.168.2.34.  After switching over to the wired connection, it kept that IP address. I didn’t have any quarrel with that choice so I installed the printer drivers and the PC’s all connected to it at 192.168.2.34.

This printer has the ability to let you scan at the printer and send it to a PC.  It’s a neat trick, but requires an app running in the background.  That would be the ScanToPCActivationApp app.  Something was causing it to constantly check to see if that printer was available.  So it was time to check our connection.

One of the 8 billion features of this printer is it’s very own web server.  It lets you manage the printer, allow printing from other devices (iOS, Android, etc), check the ink levels, and probably order pizza.  It also provides a quick and simple way to verify that the network connection is valid.

I opened up a browser and typed in the 192.168.2.34 IP address.  It timed out.  That’s not good.  I went over the printer and checked the network settings.  It reported back that it was on 192.168.2.34.  So it looks like a conflict of some sort with that IP address.   I checked around and could not find any devices on that IP address.  Which means the offending device is probably turned off at the moment.  I’m going to have to keep an eye out for the device with that IP address, it will be back.

So I decided to change the IP address of the printer and have the router make that a static assignment.  Since I already have a laser printer using 192.168.2.99, I gave the HP the next one down, 192.168.2.98.  First I changed it on the printer, then I changed it on my router. The [Netgear WNDR3700 Router](http://www.amazon.com/gp/product/B002HWRJY4/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B002HWRJY4&linkCode=as2&tag=christmillers-20) that I use lets you assign a static IP address via the MAC address.  Getting the MAC from the printer is easy, it will display it on it’s touch screen or give you the option to print out the network settings.

The last step was to tell each PC that the printer was on a new IP address.  HP has a simple utility called “Change IP Address”, which I ran on my PC’s.  On this machine, I had to type in the new IP address, on the others it discovered the printer again.  All in all, about 5 minutes to make the change.  After making those changes, a quick peek at Process Explorer showed that ScanToPCActivationApp had loaded HPNetworkCommunicator just once and everything was back to normal.

If you take your printer offline or remove it from your network, you will want to disable the ScanToPCActivationApp app from running.  Otherwise it will be constantly checking for a connection to the printer and firing up the HPNetworkCommunicator process over and over again.  To deactivate ScanToPCActivationApp, do the following:

  1. Open the HP printer app.  There are multiple ways of doing this.  You can double click on the printer icon in the “Devices and Printers” dialog if you have Windows 7.  From the “All Programs” menu, select “HP”, then the folder for your printer, then the icon for the printer.
  2. Under “Scanner Actions”, click “Manage Scan to Computer”.
  3. When the “Scan to Computer” dialog opens, click the “Disable” button and the clear the checkbox “Automatically start Scan to Computer when I log on to Windows”.

Those steps may vary slightly, based on your OS and HP printer model, but the actions should be roughly the same.
