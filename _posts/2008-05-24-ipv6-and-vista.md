---
title: IPv6 and Vista
date: 2008-05-24T20:58:00-05:00
---
The other day, I read a post that Carl Franklin had made on his blog about [a new Vista laptop that he had to buy on short notice](http://www.intellectualhedonism.com/2008/05/23/GoodVistaLaptopExperience.aspx "Intellectual Hedonism - Good Vista Laptop Experience").  The gist of his post that Vista ran pretty well, but he did tweak some of the settings.

One of the settings that Carl had tweaked was to disable [IPv6](http://en.wikipedia.org/wiki/Ipv6 "Internet Protocol version 6 (IPv6) is a network layer for packet-switched internetworks. It is designated as the successor of IPv4, the current version of the Internet Protocol, for general use on the Internet.") on all of the network adapters.  For some reason that jumped out at me.  I posted [a comment](http://www.intellectualhedonism.com/CommentView.aspx?guid=e6e4f79f-bb1c-4f59-bc4b-c731f14ff5e2#commentstart) on his blog asking why he did it.  I&#8217;m all for disabling services that are not being used, but I like to know what the reason is behind it.  

I did a quick scan through Google, and initially found many hits for how to disable IPv6 with very little explanation on why you should do it.  Carl responded to my comment that he had heard anecdotal evidence that IPv6 can cause conflicts under Vista.

For me, the decision to disable IPv6 on my Vista boxes boils down to two questions:  Do I need IPv6 functionality?  If I don&#8217;t need IPv6, does having IPv6 enabled cause any problems under Vista?  Time to go back to Google and due some more searching. 

One bit of trivia:  While I was searching for why you would want to disable IPv6 on Vista, I came across a few [articles](http://blogs.zdnet.com/Ou/?p=254) about how Google owns a [large block of IPv6 space](http://ws.arin.net/whois/?queryinput=%21%20NET6-2001-4860-1) that works out to be 7.9 x 10<sup>28</sup> IP addresses. That&#8217;s a large number, no matter how you slice it.   Why does our [Google Overlord](http://diziara.livejournal.com/536546.html "Just a random link to someone using the phrase "I, for one, welcome our new google overlord."") need that many addresses? 

I&#8217;ve seen the badge below displayed on a few sites.  

<div>
  <div align="center">
  </div>
</div>

Pretty scary looking, huh?  There is a real concern with the number of [IPv4](http://en.wikipedia.org/wiki/IPv4 "IPv4 is the dominant network layer protocol on the Internet and apart from IPv6 it is the only standard internetwork-layer protocol used on the Internet.") addresses being used up.  At the current rate of assignment, we just have a [few years left](http://penrose.uk6x.com/) before the all of the addresses have been assigned.  That&#8217;s why [they](http://en.wikipedia.org/wiki/Internet_Engineering_Task_Force "The Internet Engineering Task Force (IETF) develops and promotes Internet standards, cooperating closely with the W3C and ISO/IEC standard bodies and dealing in particular with standards of the TCP/IP and Internet protocol suite.") came up with IPv6, to provide for a virtually unlimited number of IP addresses.  Even with Google hogging billion and billions of IPv6 addresses, we&#8217;ll still more than enough to serve this planets needs for the for seeable future.  Right now, the continued use of [NAT](http://en.wikipedia.org/wiki/Network_address_translation "Network Address Translation (NAT, also known as network masquerading, native address translation or IP masquerading) is a technique of transceiving network traffic through a router that involves re-writing the source and/or destination IP addresses and usually also the TCP/UDP port numbers of IP packets as they pass through.") allows more users to share the same IP address.  

We are seeing all of the IPv4 addresses being assigned, but that doesn&#8217;t mean that they are all being used.  If you look at the [global IPv4 allocation list](http://www.iana.org/assignments/ipv4-address-space "IPv4 Global Unicast Address Assignments"), you&#8217;ll see that large chunks of the IPv4 space is in the hands of a small number of companies.  For example, Apple owns all the 017.xxx.xxx.xxx addresses.  That&#8217;s over 16 million distinct, global IP addresses.  What are they doing with all those addresses?  And some people still [question the need for IPv6](http://jhw.vox.com/library/post/the-future-without-ipv6.html) in the first place.  

But I digress, I think we&#8217;ll be safe with just IPv4 addresses for the next few years.  At this point, there are no IPv6 only addresses that I want to visit.  They [exist](http://www.sixxs.net/misc/coolstuff/ "Cool IPv6 stuff"), I just don&#8217;t need to visit them.  So the answer to my first question is: No, I don&#8217;t need IPv6. 

So what about leaving IPv6 enabled in Vista?  What does that cost me?  I read about [some](http://www.networkworld.com/news/2007/060707-microsoft-vista-ipv6-incompatible.html "Vista not playing well with IPv6 - Network World") reports early in the Vista release with IPv6 issues.  Some of that could be attributed to &#8220;version 1.0&#8221; network drivers.  I did read [some](http://forums.iis.net/t/1146328.aspx) [reports](http://forums.asp.net/t/1210889.aspx?PageIndex=2) of [http://localhost not working](http://www.accidentaltechnologist.com/asp-net/aspnet-development-server-problems-under-vista/) with IPv6 enabled.  

On an IPv6 enabled box, localhost will evaluate to ::1, not the 127.0.0.1 that we call home.  That is what defined for localhost in %SystemRoot%\system32\drivers\etc\hosts as the IPv6 adddress for localhost.  This apparently causes a problem when testing locally hosted websites.  If you remove (or better yet, just comment out the ::1 entry from the hosts file, that was reported to allow web development to continue using localhost and IPv6 installed. 

Klaus Graefensteiner has [a pretty good explanation of why this is happening](http://www.tellingmachine.com/post/2008/04/How-does-IPv6-impact-web-debugging-with-VS200(58).aspx "How does IPv6 impact web debugging with VS200(58)?").  As noted elsewhere, he recommends editing the hosts file as the work around. I haven&#8217;t done any web development on my Vista box, I can&#8217;t verify that this is still an issue.  I&#8217;m actually planning on doing some web development work from my home machine in the near future, issues with localhost will pop up pretty much immediately.  

As far as I can tell, the answer to my second question is &#8220;maybe&#8221;.  If the only issue is the localhost issue, then I&#8217;ll address it through editing the hosts file as opposed to disabling IPv6 altogether. 

I did see the value of one point that Carl made.  If the service is not being used, then disable it.  It&#8217;s not enough of an issue for me, but resources are limited, then you want to pick off the low hanging fruits from the list of running services.  If you do actually want to disable IPv6 in Vista, it&#8217;s pretty easy to disable or enable IPv6 support (from numerous sources, this one from [TechSupportForum.Com](http://www.techsupportforum.com/networking-forum/networking-support/196189-verizon-fios-networking.html#post1173835)) 

  1. Go to Start and type in &#8220;ncpa.cpl&#8221; (without the quotes) and press Enter 
  2. Right click on each network connection and select &#8220;Properties&#8221; 
  3. Remove the checkmark from the box next to &#8220;Internet Protocol Version 6 (TCP/IPv6) 
  4. Click OK to exit the dialog

Lather, rinse, and repeat for each network connection. IPv6 will still remains active for routing and tunneling.

To complete disable IPv^ in the system, you&#8217;ll need to add a registry.  Go to registry and create DWORD parameter &#8220;DisabledComponents&#8221; in HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters and set it to a value of 0xff and restart the system.

Just remember one thing, if you disable IPv6, you will not be able to use [Windows Meeting Space](http://en.wikipedia.org/wiki/Windows_Meeting_Space "Windows Meeting Space (codenamed Windows Collaboration) is the name of a peer-to-peer collaboration program in Windows Vista which lets 2-10 users on a local network start sessions with other users for collaboration.") or any application that relies on the Windows Peer-to-Peer Networking platform or the [Teredo](http://en.wikipedia.org/wiki/Teredo_tunneling "Teredo is a tunneling protocol designed to grant IPv6 connectivity to nodes that are located behind IPv6-unaware NAT devices. It defines a way of encapsulating IPv6 packets within IPv4 UDP datagrams that can be routed through NAT devices and on the IPv4 internet.") transition technology.

Bonus Firefox tip:  You can disable Firefox&#8217;s usage of IPv6 with out disabling IPv6 for the rest of the system.

In Firefox, type about:config and then in the filter box type dns. You&#8217;ll see an entry named &#8220;network.dns.disableIPv6&#8221;.  Double-click that line so that it reads True, which will effectively disabled IPv6 for Firefox.  You&#8217;ll need to restart Firefox for this change to take effect.
