---
id: 851
title: 'Comcast did WHAT in Houston?  You are now a public hotspot.'
date: 2014-06-11T12:09:24-05:00
layout: post
guid: http://www.rajapet.com/?p=851
permalink: /2014/06/11/comcast-did-what-in-houston-you-are-now-a-public-hotspot/
---
<div style="background-color: #fff; display: inline-block; font-family: 'Helvetica Neue',Arial,sans-serif; color: #a7a7a7; font-size: 11px; width: 100%; max-width: 594px;">
  <div class="mceItemVisualAid mceItemLayer" style="overflow: hidden; position: relative; height: 0; padding: 66.498316% 0 49px 0; width: 100%;">
  </div>
  
  <div style="padding: 0; margin: 0 0 0 10px; text-align: left;">
    <a style="color: #a7a7a7; text-decoration: none; font-weight: normal !important; border: none;" href="http://www.gettyimages.com/detail/481207079" target="_blank">#481207079</a> / <a style="color: #a7a7a7; text-decoration: none; font-weight: normal !important; border: none;" href="http://www.gettyimages.com" target="_blank">gettyimages.com</a>
  </div>
</div>

Yesterday, Comcast flicked the switch that turns the home routers for 50,000 of their Houston subscribers into public Wi-Fi hotspots. It&#8217;s been covered in a few newspaper articles, I came across it on [this SeatlePI article](http://blog.seattlepi.com/techblog/2014/06/09/comcast-is-turning-your-xfinity-router-into-a-public-wi-fi-hotspot "Comcast is turning your Xfinity router into a public Wi-Fi hotspot") and [this followup](http://blog.seattlepi.com/techblog/2014/06/10/comcast-switches-on-50000-residential-wi-fi-hotspots-in-houston/) by [Dwight Silverman](https://twitter.com/dsilverman).  Dwight writes for the Houston Chronicle, but I saw the syndicated copy on the SeattePI site.

If you live in Houston and have a XFinity Router, then you may already be a public Wi-Fi hotspot.  The router serves up the public Wi-Fi access on a separate wireless network from your home network.  But it&#8217;s using your bandwidth and the possibly the same IP address.

If you do a search of Wi-Fi networks and you see one or more named [&#8220;xfinitywifi&#8221;](http://customer.comcast.com/help-and-support/internet/about-xfinity-wifi-internet/), then your or your neighbor is now a public hotspot.  This is an opt-out policy.  Unless you request not to be a public hotspot, Comcast is going to enable it on your router.  Comcast had sent out letters to their customers, but how many of them read those letters?

The idea sounds good on the surface.  If you are a Comcast customer, you will have Wi-Fi access whenever you are close to another Comcast customer.  You would be able to connect your tablet or laptop in more places.

One problem with this is that you are sharing the bandwidth available to that home subscriber.  Comcast is making more bandwidth available to the home, but they can&#8217;t create more Wi-Fi bandwidth.  You can only carry so much network traffic over Wi-Fi.  If you live in busy neighborhood or close to a shopping area, other Comcast customers connected to your router could use enough bandwidth to make it difficult for you to connect to your own router.  Comcast can alleviate that with Quality Of Service (QOS) rules in the router, but that wouldn&#8217;t eliminate the problem.

Then you have the security issues.  Unless Comcast has modified the routers to get two outside IP addresses, anyone who connects to the public hotspot from your router will provide the same IP address to the rest of the world that you provide  This is the external IP address that shows up when you are connected to a website, not the internal IP address that your device thinks it has.    That means if someone was using BitTorrent to download and share copyrighted material like music or movies, it would be your IP address that would be tracked.

When Comcast gets the subpoena from the [MPAA](http://www.mpaa.org/privacy-policy/) asking for the identity of the person using your IP address because that IP was sharing copies of &#8220;Frozen&#8221;, will Comcast be able to determine that the offending activity was done over the public hotspot as opposed to your internal network?  If they have the same IP address, then you are going to be facing the legal battle to prove your innocence.

If the public Wi-fi can be traced separated from your use of the same router, then Comcast has just made it easy for people to run Bittorrent sharing sites or perform other nefarious activity anonymously.  Just connect a Hotspot named &#8220;xfinitywifi&#8221;.  It can from your router or your neighbor&#8217;s.  It doesn&#8217;t matter, it&#8217;s not traceable back to you.  Comcast can block ports used by Bittorrent clients, but it will be hard for them to block everything.

You can opt out after the fact.  SeattlePI&#8217;s Dwight Silverman posted the following instructions [here](http://blog.seattlepi.com/techblog/2014/06/09/comcast-is-turning-your-xfinity-router-into-a-public-wi-fi-hotspot).

  * Log into your Comcast account page at [customer.comcast.com](http://customer.comcast.com/).
  * <span style="line-height: 1.5;"> Click on Users & Preferences.  </span>
  * <span style="line-height: 1.5;">Look for a heading on the page for “Service Address.” Below your address, click the link that reads “Manage Xfinity WiFi.”  </span>
  * <span style="line-height: 1.5;">Click the button for “Disable Xfinity Wifi Home Hotspot.”  </span>
  * <span style="line-height: 1.5;">Click Save.</span>

With the Comcast/Time Warner Cable merger currently in FCC review, this could affect more than Comcast customers,  If you are a Time Warner Cable customer, it&#8217;s possible that after the merger that public Wi-Fi program could be rolled out to TWC customers.  This is just one of those ideas that sounds good on people, but make me uneasy when they are actually implemented.