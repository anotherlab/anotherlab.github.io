---
title: Nvidia nForce network driver problem under Vista
date: 2008-02-09T23:00:00-05:00
---
On my home machine, I rarely reboot it. If a software update requires a reboot, then I do it. otherwise it stays running for weeks at a time. Vista (32-bit) has been stable enough for me, where I don&#8217;t have to start the system or suffer system crashes.

But when I reboot, about 10% of the time (just a wildly inaccurate guess), the machine comes up without any network connectivity. In the past, I have associated it with Windows Update installing a wonky driver for the network card and I System Restore the machine back to normal. It happened today and the list of the [usual suspects](http://en.wikiquote.org/wiki/Casablanca#Captain_Louis_Renault) did not include any hardware updates. Time to dig deeper.

This machine has a NVidia nForce motherboard ([Asus M2N-SLI Deluxe](http://www.asus.com/products.aspx?l1=3&l2=101&l3=301 "Asus product page for the M2N-SLI Deluxe")) and it has built-in dual Gigabit LAN controllers. I had an Ethernet cable hooked up to the first port and had disabled the 2nd one through Vista&#8217;s &#8220;Network Connections&#8221; utility. My dead Windows Home Server box was next to my PC, so I unplugged it&#8217;s Ethernet cable and plugged it into the second port on my machine. I enabled the network adapter and after a few seconds, it was live and had grabbed a IP address from router.

That was interesting. Since the working adapter used the same driver as the non-working one, that pretty much ruled out Windows Update nuking one of the drivers. I peeked at the driver settings for both adapter, they were both set to the defaults. I also checked the device status of the adapter, Windows reported that &#8220;This device is working properly.&#8221; That was a pretty good indicator that the problem was not a fried controller on the motherboard.

The next thing to check was the ethernet cable. I swapped cables and there was no change. I decided to do the Nintendo fix. That&#8217;s when you pull out the cartridge, blow on the connectors and ram it back in again. In this case, I disabled the adapter, waited 30 seconds, and re-enabled it. As Emeril says, [Bam!](http://en.wikipedia.org/wiki/Emeril#Style_and_cuisine) The adapter started working. Time to start googleing and see if anyone else is having this problem.

And the number one hit for &#8220;[nforce network adapter fails](http://www.google.com/search?hl=en&q=nforce+network+adapter+fails)&#8221; in Google was a [long thread in the Nvidia message forums](http://forums.nvidia.com/index.php?showtopic=30251 "Vista - nForce network driver issue?"). A sizeable number of people were having the same problem and they were all running Vista. It may be a timing issue during boot-up. Two workarounds were suggested. [One was to change the duplex setting](http://forums.nvidia.com/index.php?showtopic=30251&view=findpost&p=226719) from &#8220;Full Autonegotiation&#8221; to &#8220;100 Mbps Full Duplex&#8221;. The other was to change the [priority order of the network adapter priority](http://forums.nvidia.com/index.php?showtopic=30251&st=20#). I didn&#8217;t want to mess with the driver settings, so I opted for changing the priority order. I&#8217;m not confident that it will fix the issue, but it wont hurt anything. Right now this is more of an annoyance than anything else, but I would like to resolve it permanently.

<div>
  Tech Tags: <a href="http://technorati.com/tag/nvidia" rel="tag">nvidia</a> <a href="http://technorati.com/tag/nforce" rel="tag">nforce</a> <a href="http://technorati.com/tag/vista" rel="tag">vista</a> <a href="http://technorati.com/tag/network" rel="tag">network</a> <a href="http://technorati.com/tag/driver" rel="tag">driver</a>
</div>
