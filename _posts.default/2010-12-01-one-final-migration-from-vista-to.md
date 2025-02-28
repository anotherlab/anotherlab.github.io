---
id: 45
title: One final migration from Vista to Windows 7
date: 2010-12-01T06:02:00-05:00
layout: post
guid: http://www.rajapet.com/?p=45
permalink: /2010/12/01/one-final-migration-from-vista-to/
---
Over Thanksgiving weekend, I upgraded our last Vista PC to Windows 7. We have a family PC, that we all share.  It’s nothing too fancy, a three year old Dell [Inspiron 530](http://support.dell.com/support/edocs/systems/inspd530/en/OM/HTML/appendix.htm#wp1052310).  It came with Windows Vista Home Edition preinstalled.  A Core 2 4300, running at 1.8 Ghz and 2GB of RAM.  

We use it mainly for web browsing, word processing, and email.  The kids use it for games, mainly web based games.  My oldest likes to play “The Sims 3” on it.  Something in how “The Sims 3” was installed just killed the performance of the machine, even when the games wasn’t running.  There was an app that checks for updates for “The Sims 3” and that just took forever to run.

Over the Thanksgiving break, I decided to clean up the machine and bring back the performance.  I wanted to repave the machine with Windows 7.  I had a spare Windows 7 Ultimate disk (overkill, but I had it available) and I was not afraid to use it.  It wasn’t that Vista was horrible, but Windows 7 is better.

I decided to install on a new hard drive and keep the existing hard drive around, just in case something went seriously wrong.  I have [Windows Home Server](http://www.microsoft.com/windows/products/winfamily/windowshomeserver/default.mspx), in the shape of an [HP MediaSmart EX495](http://www.shopping.hp.com/product/computer/categories/home_servers/1/accessories/FL705AA%2523ABA), so I could restore the machine back to yesterday’s backup.  While I could have done that, it’s still easier having access to the old drive in case I needed to get something off of it.

The first step was to inventory the installed hardware and software on the machine.  The hardware was pretty easy, it’s basically a stock Dell box.  I had added a [Microsoft webcam](http://www.everythingusb.com/microsoft-lifecam-vx-7000-14105.html) and a Logitech mouse, but the rest was stock Dell.

The software was a little trickier.  We have four users on this machine.  Myself, my wife Anne, and my daughters: Kathryn and Laura.  The ladies all had local email accounts set up with [Thunderbird](http://www.mozillamessaging.com/en-US/thunderbird/), I needed to migrate that over.  They all have iPod Nanos and I needed to get their iTunes data across.  Plus all of their documents. 

I couldn’t find the serial number for “The Sims 3”, so I copied it from the registry.  With 32 bit editions of Windows, the serial number is the default value stored in the following key:

HKEY\_LOCAL\_MACHINE\SOFTWARE\Electronic Arts\Sims\The Sims 3\ergc

For 64 bit Windows, look in:

HKEY\_LOCAL\_MACHINE\SOFTWARE\Wow6432Node\Electronic Arts\Sims\The Sims 3\ergc

After storing the serial number, I then went into iTunes and deauthorized the computer.  We use a single AppleID account for all of our iTunes purchases and we have it on a few PC’s.  Apple only allows 5 PC’s to be used with any account.  When you reformat or decommision a PC, you want to make sure that it’s no longer authorized to your Apple account.  If you forget this step, you can deauthorize all of your PC’s.  You would the have to authorize each PC again and Apple only lets you do this once a year.

By installing the OS on a new drive and keeping the old OS on a mounted drive, it would make it easier to bring over files and folders.  I had a spare 250 GB Maxtor drive that used to be part of a RAID 5 array in my home development machine.  I had three identical drives in the array and I replaced them with “normal” drives after I got the MediaSmart server.  Being able to do bare metal restores from the server trumped the protection that I was getting from RAID 5.

So I installed the drive and Vista saw the drive and I did a quick format of the drive.  I then rebooted the Dell and switched the boot order of the drives so that it would see the Maxtor drive first.  I then booted from the Windows 7 disk.

Now Microsoft has come a long way with OS installs.  Windows 7 installs fairly quickly and without bothering you too much.  But for some reason, it wouldn’t see the Maxtor drive.  It came up fine in the BIOS and Vista had no problem with it.  It was just invisible to Windows 7.  I spent a few hours playing with cables and boot order and BIOS tinkering to no avail.

It was now Saturday, the day after Black Friday.  Probably the best weekend of the year to buy electronic stuff.  The local BestBuy had [Western Digital Caviar Black](http://www.wdc.com/en/products/internal/desktop/) 1 TB drives on sale for the ridiculous price of $59.99.  For $60 I could get a faster drive with four times the capacity of the drive that came with the machine.  I went down and bought two of them.  I would use one in the Family PC and the other would go in my development machine or into the MediaSmart server.  

I installed that drive in and Windows 7 saw it without any problems.  The installer did it’s thing and 20 minutes later, I was running the 64bit edition of Windows 7.  It had installed drivers for all of the onboard hardware and even the web cam..  Being a freshly paved Windows install, Windows Update needed to be run.  Installing the updates took longer than installing the OS, but that’s normal.  I did pick a new name for the PC.  I wanted to make sure that this machine appeared as a new machine to the rest of the network.  Life is much easier that way.

Now that OS was up and running, it was time to bring over the software.  First up, create the users.  You need to login as each user at least once to get the the folders all set up.

The first app was email.  We use Thunderbird as the desktop client.  My wife uses a verizon.net account on this machine and the girls use our personal domain GMail accounts.  With the girls, I just had to fire up Thunderbird and add their email accounts.  Their GMail accounts are set to use [IMAP](http://en.wikipedia.org/wiki/Internet_Message_Access_Protocol) with all of their mail stored in the Google Cloud.  Their existing email and settings came over automagically.  With Anne’s email, the messages were stored locally.  So I configured Anne’s email settings and then closed down Thunderbird.  I then copied the contents of her Thunderbird profile folder from the old hard drive to the appropriate location on the new drive.  The profile folder will have a random name and will be located in the “%APPDATA%\Thunderbird\profiles” folder.

Next up was iTunes. To keep things easy to manage, we try to keep all of our music files in a “C:\mp3” folder.  So I copied that folder from the old drive to the new drive.  Apple also likes to place files in the “%HOMEPATH%\My Music\iTunes” folder.  I installed iTunes and then copied that folder for each account.  I then started up iTunes and authorized the PC.

I then copied over the documents for each user, plus some shared folders.  I then installed “The Sims 3” and the serial number worked.  The installer made an updater app start with Windows,but I ran [MSConfig](http://netsquirrel.com/msconfig/index.html) and fixed that.  To keep the saved games, I had copied over a few folders from ”%HOMEPATH%\Documents\Electronic Arts\The Sims 3” and all was good.

Next, I installed the usual suspects. Microsoft Office, then [Microsoft Security Essentials](http://www.microsoft.com/security_essentials/), then the Windows Home Server client.  The WHS client allows quick access to the server, plus enables the nightly backups.  I switched to Microsoft Security Essentials last year and I have been very pleased with it.  I can’t imagine dealing with the bloated offerings from Symantec or Mcafee these days.  MSE does the job and doesn’t bog down the machine like the big boys too.

That being said, I consider the PC’s antivirus solution to just be a part of the protection. Even with daily updates, a [0-day attack](http://en.wikipedia.org/wiki/Zero-day_attack) could still get your machine.  With the Windows Home Server, I can easily do a bare metal restore of the OS.

After getting everything back up and running, I added another 2 GB of RAM to the system.  It was cheap and with fast user switching, the more memory the better.  I still need to install a few utilities here and there, but for the most part the machine is back in service.  It’s much snappier.  Between removing 3 years of accumulated crap and Windows 7 being faster than Vista, it’s like having a new machine.