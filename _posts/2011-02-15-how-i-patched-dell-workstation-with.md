---
id: 39
title: How I patched a Dell workstation with a firmware update from HP
date: 2011-02-15T17:17:00-05:00
layout: post
guid: http://www.rajapet.com/?p=39
permalink: /2011/02/15/how-i-patched-dell-workstation-with/
---
About 18 months ago, I got a Dell [Precision T5500](http://www.dell.com/us/business/p/precision-t5500/pd) workstation.  A decent PC with a Xeon quad core processor which has bee a pretty decent box for doing development with.

About a month ago, it started acting very flakey.  I would be doing my work and the display would go all wonky on me.  I would see crawling vertical lines going down the display.  After a minute or two, the colors would get very dark and the computer would stop responding.

A reboot would restore the machine.  There were no warning signs, nothing in the event logs.  One minute it was running, the next it was locked up.  This would happen about once a day or so.  Not enough to keep me from using the machine, but enough to warrant getting it fixed.

We have Dell Priority support, which we hoped would help resolve this problem.  We bought this machine with Vista and it had the free upgrade to Windows 7.  We had bough a bunch of these machines, another one was having a strange crashing problem as well.  Because I had installed 64 bit Windows 7 on it, Dell said it was not supported.  

That annoyed our IT manager.  He then engaged Dell support to fight the good fight.  He called BS on that one and their response was for him to uninstall the current video driver and install the latest Dell approved driver.  While he was doing that, I stated doing my own research.  They had a Plan B, but that involved swapping drives without machine and wouldn’t have actually resolved anything.  We hoped to avoid Plan B.

This T550 came with an NVIDIA [Quadro NVS 295](http://www.nvidia.com/object/product_quadro_nvs_295_us.html) video card.  It’s a basic workstation card with enough horsepower to drive 2 displays.  I had kept the driver updates current with whatever Windows Update suggested for it.

We downloaded the files from Dell, and ripped out the current driver.  The Dell drivers refused to install, claiming that there were no supported devices installed.  The IT guy had downloaded the recommended driver, which supports a motley crew of NVidia cards.  He found a NVS 295 specific driver on the Dell site and started downloading that.  Peachy.  While he was fighting with my machine, I had found some clues in the NVIDIA forums.

I was not alone.  Other Dell owners had reported similar problems with that video card.  This [post](http://forums.nvidia.com/index.php?showtopic=179731) has a screen shot that was similar to what I was seeing.  Another [post](http://forums.nvidia.com/index.php?showtopic=168383) described applying a NVS 295 firmware update from HP’s web site.  This was posted by several Dell users as working.  Since it&#8217;s on the Internet, it must be true.  The IT guy didn&#8217;t want to flash the Dell with the HP supplied file, but I convinced him by using the following three arguments.

  1. It&#8217;s a video card BIOS firmware, not for the motherboard. 
  2. If we brick it, Dell has to replace it as it will no longer be a software problem. 
  3. You can&#8217;t beat the entertainment value of flashing Dell supplied hardware with HP supplied updates and having it work.

So I downloaded the firmware from a HP page labeled as [“NVIDIA Quadro NVS 295 Video BIOS (ROM) and Flash Utilities”](http://h20000.www2.hp.com/bizsupport/TechSupport/SoftwareDescription.jsp?lang=en&cc=ca&prodTypeId=12454&prodSeriesId=3718645&swItem=wk-77944-1),  and the latest driver from NVIDIA.  The Dell NVS 295 driver download completed first and we ran that.  It would not install because it couldn&#8217;t find the video card.  We then ran the HP flash updater, which immediately recognized the missing NVS card and happily flashed the BIOS.  After rebooting, we ran the NVidia supplied drivers and they installed without incident.

It’s now been a couple of weeks and my T550 has been running non-stop without any failures.  While I don’t understand why HP is only known place in the Googleverse that has a NVIDIA firmware update, I’m just glad that someone released it.

**Updated: 2/6/2012  
** I recently had a comment on this post that I did not publish.  That person posted anonymously and put his email address in the post.  I don’t think he wanted his email address published (and you’ll see why), but I will include rest of the post:

> _I have the same problem, and I am unable to track down that flash utility! HP apparently doesn&#8217;t support it anymore. Would you by any chance have it still and possibly throw it up and media fire or some other site for me to download?_ 

The link I had listed no longer goes to the correct page.  HP updated the article and broke the link.  That’s how the Internet works folks, nothing is truly static.  That’s why we have search pages.  That HP link takes you to a page that has a search box.  If you type in “”Quadro NVS 295” in the search box and press the submit button, it comes back with [a list of pages](http://h20000.www2.hp.com/bizsupport/site/search/r4_0/jsp/search.jsp?lang=en&cc=ca&prodTypeId=12454&prodSeriesId=3718645&tx=quadro%20nvs%20295 "The following is a list of documents that match "quadro nvs 295"").  At this time, the top page on the list is the [current page for the firmware download](http://h20000.www2.hp.com/bizsupport/TechSupport/SoftwareDescription.jsp?lang=en&cc=US&swItem=wk-87053-1&mode=4&idx=0&prodTypeId=12454&prodSeriesId=3718645 "NVIDIA Quadro NVS 295 Video BIOS (ROM) and Flash Utilities").  Since HP can and will change the link, I’m not going to make any effort to keep my page in synch with HP.

Since HP holds the copyright to that download and is still supporting, I don’t think it’s 100% kosher to put that file up on a file sharing site.  If HP abandoned it, then I can see a reason for making the file available.  But there’s no need when you can easily download it from HP.  It took less than 5 seconds to find the updated page.

One final point. About 7 months after writing that post, the problem came back.  In all likelihood, a Windows update has a conflict with the card and/or the drivers.  Since the machine was still under warranty, I had Dell send out a replacement card.  It failed right after booting up with the same problem. I was done with that card.  I ripped the card out and replaced it with a higher end card.