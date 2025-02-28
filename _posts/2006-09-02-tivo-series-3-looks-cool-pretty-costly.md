---
title: 'TiVo Series 3: Looks cool, pretty costly'
date: 2006-09-02T03:41:00-05:00
---
I&#8217;ve been <strike>drooling over</strike> reading the various [articles](http://www.pvrwire.com/2006/08/31/tivo-series-3-unboxed/) [and](http://www.engadget.com/2006/08/28/tivo-series-3-coming-september-17th-for-799/) [blog](http://www.zatznotfunny.com/2006-01/tivos-series-3-lives/) postings over the soon to be released [TiVo Series 3](http://www.tivo.com/series3hdDvr.asp).

[<img alt="" src="https://i0.wp.com/photos1.blogger.com/blogger/7711/622/320/tivohdfront.jpg?w=680" border="0"  />](https://i0.wp.com/photos1.blogger.com/blogger/7711/622/1600/tivohdfront.jpg) 

It has the stuff I want: Ethernet support built in, dual tuners, cablecard, High Def, big honking hard drive (plus [external SATA](http://en.wikipedia.org/wiki/Serial_ATA#External_SATA) port).  The rumored list price is $795.  That&#8217;s a lot of shekels.  I have two Series 2 units and $800 is too much for my pocket.  Maybe next year if the prices drop&#8230;

I read a [rumor](http://www.zatznotfunny.com/2006-08/tivo-finally-getting-wpa-support/) that they are finally addiing WPA support for their 802.11g adapter.  I don&#8217;t know how accurate that rumour is, TiVo has been [planning](http://customersupport.tivo.com/knowbase/root/public/tv140304.htm?) on supporting WPA for nearly two years.

It&#8217;s stunning that they have gone so long without it WPA.  When I first bought my TiVos, I had them on the home network using a wireless connection.  I did it a little differently than most people.  TiVo supports a limited range of USB connected wireless network adapters.  TiVo supports [WEP](http://en.wikipedia.org/wiki/Wired_Equivalent_Privacy), but not [WPA](http://en.wikipedia.org/wiki/Wi-Fi_Protected_Access).

WEP is fairly trivial to crack, while WPA is pretty secure.  Our neighborhood is pretty noisy on the 2.4ghz spectrum, everybody and their mother has a wireless router/access point.  I had set up the wireless part of my home network to be 802.11g with WPA security.  TiVo&#8217;s wireless solution was not going to work.

There is more than one way to proivde wireless ethernet.  I picked up a couple of [SMC](http://www.smc.com/) [2870W wireless bridges](http://www.tomsnetworking.com/2003/12/20/smc_smc2870w/).  A wireless bridge converts an Ethernet to 802.11 (a/b/g/n) signal.  It works transparently to the Ethernet equipped device.  That device thinks it&#8217;s on a wired network and there are no drivers to install.  The 2870W supports WPA right out of the box.  The radio on the 2870W is lot more powerful than the run of the mill USB wireless adapters, it&#8217;s like having mini access points on each machine.

With the TiVo, I use a cheap Linksys USB to Ethernet adapter and connect that adapter to the bridge.  The TiVo thinlks it&#8217;s on a wireless network and everyone is happy.  There is an additional performance benefit by offloading the 802.11g processing from the TiVo to the 2870W.  The bottleneck becomes the 11 mb/s speed of the USB connection.  The TiVO CPU is not the fastest in the world.  Its roughly equivalent to Pentium 100, no need to have it tackle 802.11 processing if it doesn&#8217;t have to.  That&#8217;s probably the reason it didn&#8217;t support WPA, just not enough horse power under the hood.

The Linksys/SMC combination worked very well, I never had any problems.  I had more problems using a Linksys 802.11g adapter on Windows XP box on the same network and in the same room as one of the TiVos.

I ended up running CAT5e cable through the house when I swtched to FiOS and now the TiVos are wired to the network. If you can do that, life is much easier.  With each TiVo directly on the network, I can transfer shows between the TiVos in real time.  I&#8217;m still hobbled by the Series 2 USB speed (or lack thereof), the Series built in Ethernet adapter would be cool to have.

<div>
  Tech Tags: <a href="http://technorati.com/tag/TiVo" rel="tag">TiVo</a> <a href="http://technorati.com/tag/Series+3" rel="tag">Series 3</a> <a href="http://technorati.com/tag/SMC2870W" rel="tag">SMC2870W</a> <a href="http://technorati.com/tag/WPA" rel="tag">WPA</a> <a href="http://technorati.com/tag/WEB" rel="tag">WEB</a> <a href="http://technorati.com/tag/802.11g" rel="tag">802.11g</a>
</div>
