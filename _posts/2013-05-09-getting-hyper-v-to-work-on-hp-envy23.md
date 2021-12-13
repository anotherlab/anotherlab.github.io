---
id: 14
title: Getting Hyper-V to work on a HP Envy23
date: 2013-05-09T16:57:00-05:00
layout: post
guid: http://www.rajapet.com/?p=14
permalink: /2013/05/09/getting-hyper-v-to-work-on-hp-envy23/
---
I finally got Hyper-V working on our HP Envy 23.  For Christmas, I had bought a new PC for our family.  We have a shared PC in a our family room that everyone uses for email, browsing, etc.  At the time I was working on a Windows Phone 8 project and I needed a machine that could handle that development.  My own PC was running Windows 7 and you need Windows 8 or better for Windows Phone development.

Actually, you need better than Windows 8 for effective Windows Phone development.  To run the Windows Phone 8 emulator, you need to have [Hyper-V](http://blogs.msdn.com/b/olivnie/archive/2013/01/18/hyper-v-on-client-windows-8-pro.aspx) installed, which requires Windows 8 Professional and a machine with the virtualization enabled in the chipset.

We wanted an all-in-one PC.  It’s in a shared family space and a AIO will take up less room and generally look nicer.  Dell had some interesting models, but you couldn’t get one with Windows 8 Pro, just Windows 8.

With HP, you could get a machine with Windows 8 Pro.  So I ordered an [Envy 23](http://shopping.hp.com/en_US/home-office/-/products/Desktops/HP-ENVY-TouchSmart/C9D79AV?HP-ENVY-23-d140t-TouchSmart-All-in-One-Desktop-PC) with an i5, 6GB of RAM, and Windows 8 Pro.  It is a nice machine with a good 23” touchscreen.  We went from a huge mess of power cables, USB cables, and assorted wires, down to just a power cable and an Ethernet cable.

<table align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
      <a href="https://i2.wp.com/www.rajapet.net/photos/i-d8qNgKv/0/S/i-d8qNgKv-S.png" imageanchor="1"><img loading="lazy" border="0" height="240" src="https://i2.wp.com/www.rajapet.net/photos/i-d8qNgKv/0/S/i-d8qNgKv-S.png?resize=320%2C240" width="320"  data-recalc-dims="1" /></a>
    </td>
  </tr>
  
  <tr>
    <td>
      HP Envy 23
    </td>
  </tr>
</table>



> As a side note, while this machine has decent WiFi built in.  I prefer that ancient Ethernet technology.  Our house has so many devices using WiFi, anything networkable that&#8217;s not mobile goes on Ethernet.  I had a few rooms wired for CAT-5e years ago and I use [Powerline adapters](http://www.howstuffworks.com/power-network.htm) where the cables don&#8217;t reach.

As typical of a new PC designed for home use, hardware virtualization was not enabled out of the box. I had to go into the BIOS screen and after a bit of searching, I found the virtualization setting under &#8220;Security&#8221;.  I don&#8217;t know why they put it there, but that&#8217;s where it was.  So I turned it on and booted up into Windows.  Since Hyper-V is not typically installed on a new machine, I had to install it.  Pretty easy to do and took less time than trying to find the virtualization setting in the BIOS.

I rebooted the PC and it hung on the loading Windows screen.  Turned off the virtualization setting and it rebooted just fine.  Tried uninstalling and reinstalling Hyper-V, didn&#8217;t fix it.  After trying multiple combinations, it was obvious that virtualization and Hyper-V didn&#8217;t work.  I called HP support and they said that Hyper-V was supported on this hardware and that either I had installed something that conflicted with Hyper-V or I had a hardware fault.

I didn&#8217;t agree with either assessment, but I had to follow along with HP&#8217;s support.  When I bought the machine, I had bought 3 years of priority support.  I usually don&#8217;t bother with extended support, but it was the cheapest way to buy this machine.  They shipped out a new machine and a week later it arrived.  Fired up the new machine and enabled Hyper-V and virtualization.  Same problem.  That both ruled out a machine specific hardware fault and ruled out the installation of another app being the root cause.

At this point, I just wrote off the problem and sent back the new machine.  Other than the Hyper-V problem, the rest of my family was very happy with the Envy 23.  I ended up building a new machine from scratch that happily runs Hyper-V, so I no longer had the pressing need for Hyper-V on the this machine.

But not being able to run Hyper-V on a machine with the CPU and OS that clearly support virtualization bugged me.  Last night, I did a quick search on &#8220;Envy23&#8221; and &#8220;Hyper-V&#8221; and saw a few hits.  I was not the only one with this problem.  The first match was on [&#8220;Enabling Hyper-V and restarting results in a hung system&#8230;&#8221;](http://ocial.technet.microsoft.com/Forums/en-US/w8itprovirt/thread/80d1caf8-0c2e-427d-b246-4161aa176288).  It was posted by another developer with a similar Envy 23 machine and was seeing the same problem.

Someone had responded to that message that he had fixed the same problem on his HP laptop by updating the Bluetooth adapter&#8217;s driver.  He had included [a link to another message thread](http://h30434.www3.hp.com/t5/Desktop-Lockups-Freezes-Hangs/Cannot-boot-if-HP-ENVY-Bios-Virtualization-enabled-for-Win8/m-p/2538189#M22348) in a HP forum with details about the version and where to get the file.

The problem seemed to be with the Ralink Bluetooth 4.0 Adapter.  Various people had version 9.2.10.6 of the driver installed.  When they installed to version 9.2.10.10, the problem went away.  That sounded like an option worth pursuing.

So I decided to roll the [polyhedral dice](http://now%20normally%2C%20i%27m%20not%20a%20fan%20of%20installing%20hardware%20drivers%20unless%20i%20know%20that%20they%20are%20specifically%20for%20the%20machine%20that%20i%20own.%20%20it%27s%20a%20commodity%20part%20and%20most%20likely%20uses%20a%20driver%20for%20a%20family%20of%20related%20parts./) and try installing that driver.  Now normally, I&#8217;m not a fan of installing hardware drivers unless I know that they are specifically for the hardware that I own.  It&#8217;s a commodity part and most likely uses a driver for a family of related parts. Also, I back up my machines to a Windows Home Server box.  The worst thing that happens is that I hose the machine and have to do a bare metal restore.

I downloaded the driver and starting installing it. As part of the install, it uninstalled the previous version and I had an &#8220;uh oh&#8221; moment.  My mouse and keyboard connect over Bluetooth, updating the driver could affect them.  Fortunately, they worked through the process.  After installing the update, I rebooted the PC and everything seemed to work just fine.  The mouse and keyboard still did mouse and keyboardy things, so I knew that Bluetooth was still operational.

I rebooted one more time and enabled virtualization in the BIOS and booted up the machine.  This was [the moment of truth](http://www.youtube.com/watch?v=68N-Oopdtao).  The PC booted up normally and I was able to verify that Hyper-V was installed and functioning normally.

So, that brings us back to why it failed with the original driver installed.  I don&#8217;t know why a Bluetooth driver would hose the operating system when Hyper-V was enabled.  That is so random, it&#8217;s not something that I would have considered as a the root cause.  From reading the messages on the HP forum, it looks like someone had reinstalled the OS and had needed to download the Bluetooth driver.  When they installed the latest version available, they were able to boot with Hyper-V and made the connection that the Ralink driver was the root cause.