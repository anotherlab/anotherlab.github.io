---
title: 'I&#8217;m not impressed with Diamond Multimedia support'
date: 2007-03-21T16:51:00-05:00
---
I have a older PC that I just installed Vista. I want to make sure that our apps place well under that OS and I don&#8217;t want Vista as my primary OS just yet. Usually I do that kind of testing under VMWare, but you don&#8217;t get the full experience of the OS when it&#8217;s virtualized.

This PC is older, a Dell Optiplex GX400 and has a NVIDIA TNT2 video card. It&#8217;s a perfectly OK card, but Microsoft and NVidia are not doing a Vista driver for that card. So Vista is running it with the Standard VGA Graphics Adapter driver. The SVGA driver is better than I thought it would be, but it&#8217;s slow and is running at 60 hz. I&#8217;m not terribly concerned over the speed, but the flickering is driving me nuts.

I got the OK to get a new card, and that&#8217;s when the fun began. To get Vista&#8217;s Aero Glass theme, you need a decent video card that has DX9 support. The GX400 has an AGP 4X port and a bank of PCI slots. No one is making AGP 4X cards anymore, it&#8217;s AGP 8X or PCI-Express these days. I looked up the specs on a [BFG](http://www.bfgtech.com/) [card](http://www.bfgtech.com/7600GS_512.html "BFG GeForce® 7600 GS OC graphics card") that claimed to be AGP 8X/4X, so I fired off an emaill to them to see if their card would work with my ancient PC.

While I was waiting for a reply, I saw an article on [The Inquirer](http://www.theinquirer.net/) about [companies releasing Vista ready PCI cards](http://www.theinquirer.net/default.aspx?article=35750 "Get Vista's Aero Glass eye candy on AGP and PCIe-less PCs"). Diamond had released a PCI card based in ATI&#8217;s Radeon 1300 chipset and it sounded like it would do the job. After a few days of no response from BFG, we ordered the Diamond card. Immediately placing the order, a reply came from BFG that said their card would work.

The Diamond card came in today and I tried installing it. I removed the Nvidia card from the AGP slot and put the Diamond card in a PCI slot. There are 5 PCI slots, all of them were available. The machine wouldn&#8217;t recognize the card. I tried a number of things (telling the BIOS not to expect an AGP card, moving the Diamond card to another slot, putting both cards in. With both cards in, the machine would not recognize either card.

Either it&#8217;s something flaky with the Diamond card, or more likely, it&#8217;s Dell building a PC that only works with AGP cards. Past experience with Dell has led me to the conclusion that the card slots on a Dell motherboard are purely decorative. I decided to call Diamond technical sipport to rule out their card.

Almost immediately, I was connected to technical support person. I forgot his name, let&#8217;s refer to him as &#8220;Stan&#8221;. Stan was not very helpful. It was clear that he was reading from some sort of script and deviations from that script were verboten. I explained that the PC would not make it past [POST](http://en.wikipedia.org/wiki/Power-on_self-test "Power-on self-test (POST) is the common term for a computer's pre-boot sequence.") when the Diamond card was installed. He asked what OS was installed. I said &#8220;Vista, but that&#8217;s not important right now&#8221;. He asked what driver was installed. I told him that Vista did not support the current card and was using the SVGA driver that comes with Vista. 

He asked me to uninstall the SVGA driver. I asked why and he said that having the wrong driver was a common cause of video card problems. I declined to do so for the following reasons:

  * The problem occurs at boot time, video drivers are not loaded until the OS loads. My machine was nowhere near that point. 
  * It&#8217;s the standard VGA driver that comes with Vista. It&#8217;s the driver that gets loaded when you uninstall a vendor video driver. 
  * I doubt that Vista would let you uninstall it in the first place. 
  * The Diamond card had to work with SVGA driver or you would be unable to install Diamond&#8217;s driver.

Since I declined to uninstall the driver, Stan&#8217;s demeanor and he basically said there was nothing more he would do. I thanked him for his time and hung up.

This card is being sent back and I doubt that I would ever buy another Diamond Multimedia product. The BFG card is on order, hopefully that will be a better experience.

<div>
  Tech Tags: <a href="http://technorati.com/tag/BGF" rel="tag">BGF</a> <a href="http://technorati.com/tag/NVidia" rel="tag">NVidia</a> <a href="http://technorati.com/tag/DiamondMM" rel="tag">DiamondMM</a> <a href="http://technorati.com/tag/AGP" rel="tag">AGP</a> <a href="http://technorati.com/tag/PCI" rel="tag">PCI</a> <a href="http://technorati.com/tag/Vista" rel="tag">Vista</a> <a href="http://technorati.com/tag/Aero+Glass" rel="tag">Aero+Glass</a> <a href="http://technorati.com/tag/Poor+Support" rel="tag">Poor+Support</a>
</div>
