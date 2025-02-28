---
id: 86
title: Offload TCP processing to the network controllers under Vista, Server 2008, and Windows 7
date: 2009-08-22T20:28:00-05:00
layout: post
guid: http://www.rajapet.com/?p=86
permalink: /2009/08/22/offload-tcp-processing-to-network/
---
After upgrading my home PC to Windows 7, I was decided to see if my motherboard/CPU combination support hardware virtualization.  You need hardware virtualization support if you want to [run Windows XP Mode or Windows Virtual PC](http://www.microsoft.com/windows/virtual-pc/support/configure-bios.aspx).  I have an XMD Athlon X2 with an [Asus M2N-SLI Deluxe](http://usa.asus.com/products.aspx?l1=3&l2=101&l3=301&model=1160&modelmenu=1) and I’m not sure if that combination supports hardware virtualization.  I’m pretty sure the CPU does, but I don’t yet yet know about the motherboard.

I decided to check the  Asus support forum to see that motherboard supports hardware virtualization and while reading through the forum, I found an [a post about tweaking the network settings for a boost in performance](http://vip.asus.com/forum/view.aspx?id=20090121064406846&board_id=1&model=M2N-SLI+Deluxe&page=1&SLanguage=en-us "Get a faster Vista PC when using onboard LAN ports...").  The [TCP/IP](http://en.wikipedia.org/wiki/Internet_Protocol_Suite "The Internet Protocol Suite (commonly known as TCP/IP) is the set of communications protocols used for the Internet and other similar networks") stack in Vista has the ability to offload some of the network processing to the network controller, if the network controller has that capability.  Out of the box, Vista disables that feature to prevent problems with controllers that don’t support that feature.

From what was posted in the Asus forum, this motherboard does support that feature.  This motherboard is based on the [NVIDIA nForce 570 chipset](http://www.nvidia.com/page/nforce5_amd.html), which included dual Gigabit LAN controllers.  If you are doing CPU intensive tasks, you can gain some performance benefit by offloading the TCP processing to the network controllers.

Vista refers to this setting as the “[Chimney Offload State](http://windowshelp.microsoft.com/Windows/en-US/Help/c6d1a24d-00e5-4ab8-bd2f-78c929203e331033.mspx)”.  It’s easy to check and set this value.  if you have a newish motherboard with a Gigabit speed network controller, this should work for you.

To change this setting, do the following:

  1. Open an [elevated command prompt](http://blogs.msdn.com/tims/archive/2006/11/02/windows-vista-secret-10-open-an-elevated-command-prompt-in-six-keystrokes.aspx "Tim Sneath's tip for opening an elevated command prompt").  Either right-click cmd.exe and select “Run as Administrator” or press the Start button, type “cmd” and then hold the left shift and left control keys while pressing the enter key. 
  2. Check the current status of the Chimney Offload state by running the following command:  
    **netsh int tcp show global**  
    The possible values for that state are: disabled, enabled, default 
  3. Run the following command to enable Chimney Offload state  
    **netsh int tcp set global chimney=enable** 

Before making the changes, check your current broadband speed.  I like the one at [speedtest.net](http://speedtest.net/), but the others are fine.  Then after making the change, check it again.  If the performance takes a hit, set the state back to it’s original value.  Not only did it work for me, I did get a slight, but measurable, download speed increase.

Before enabling Chimney Offload:

[<img loading="lazy" title="546138390[1]" border="0" alt="546138390[1]" src="https://i0.wp.com/lh3.ggpht.com/_natoSxTaPFU/SpBU8iasCaI/AAAAAAAAAWY/NKdKCg64Jok/546138390%5B1%5D_thumb%5B5%5D.png?resize=244%2C112" width="244" height="112"   />](https://i1.wp.com/lh5.ggpht.com/_natoSxTaPFU/SpBU8XJHwCI/AAAAAAAAAWU/d9TriG5Ngeg/s1600-h/546138390%5B1%5D%5B7%5D.png) 

After:

[<img loading="lazy" title="546142573[1]" border="0" alt="546142573[1]" src="https://i0.wp.com/lh3.ggpht.com/_natoSxTaPFU/SpBU9inEKCI/AAAAAAAAAWg/qTFQnCRmrRA/546142573%5B1%5D_thumb.png?resize=244%2C112" width="244" height="112"   />](https://i2.wp.com/lh3.ggpht.com/_natoSxTaPFU/SpBU9D06rnI/AAAAAAAAAWc/BICHITcO1xs/s1600-h/546142573%5B1%5D%5B2%5D.png) 

These tests were run a few times before and after the modification.  I picked the average score each time.  That helps even out any existing network traffic that would affect the results.  Going from 17.42 MB/s to 18.70 wasn’t a huge increase, about 7%; but I’ll take it.  There are other settings that you can tweak.  Some are mentioned in the forum posting, and they are also documented in an article in [speedguide.net](http://www.speedguide.net/read_articles.php?id=2574 "Tweaking Vista TCP/IP settings for broadband internet connections") as well.  You don’t often get a free lunch, this is a good one to take.  This setting works for Vista, Server 2008, and Windows 7.  I still don’t know if I can get hardware virtualization, but this was an interesting diversion.

[edited on 8/24/09]  
As it turns out, my CPU and motherboard do support hardware virtualization, it just [took a little work](http://anotherlab.rajapet.net/2009/08/why-it-can-be-good-to-build-pc-instead.html "Why it can be good to build a PC instead of buying a prebuilt one").