---
title: What do you mean my router has a UPnP security hole?
date: 2008-01-19T02:41:00-05:00
---
It&#8217;s been [recently made public](http://www.channelregister.co.uk/2008/01/15/home_router_insecurity/ "Most home routers 'vulnerable to remote take-over'") that just about every consumer router is a security hole wide open and it&#8217;s called [UPnP](http://en.wikipedia.org/wiki/Upnp).  That stands for Universal Plug and Play and it&#8217;s a set pf protocols that allow netwrok devices to configure themselves on a network without requiring much, if any, human intervention.

The problem is that UPnP does not require any authentication and it is possible to create an Adobe Flash applet that will do nasty things to your router.  Like change the router&#8217;s DNS settings so that when you visit your bank&#8217;s website, you get sent to a phishing site that will take your login and password.  Or port forward to an external server, allowing your router to be used to attack other sites.  Or expose computers behind the router&#8217;s firewall.

Since so many web sites use Flash to display ads, you would never see it coming.  Once you visited that page, the code would and your router is no longer solely under your comtrol.

Since many routers enable UPnP out of the box, you&#8217;ll want to disable UPnP on the router.  It&#8217;s usually an easy task, but you may need your router&#8217;s manual to figure how to change your settings.

If you are using Windows Home Server, when you first configured it, it prompted you to allow it to turn on UPnP.  If you did that, go in and turn it off.  Right now.
