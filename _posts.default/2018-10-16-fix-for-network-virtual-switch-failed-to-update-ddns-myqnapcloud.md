---
title: Fix for  “[Network & Virtual Switch] Failed to update DDNS “myQNAPcloud”
date: 2018-10-16
categories:
  - Annoyances
tags:
  - QNAP
---
After Windows Home Server was more or less retired by Microsoft, I bought a new NAS server for home. After some deliberation, I bought a [QNAP TS-451+](https://www.qnap.com/en-us/product/ts-451+), a couple of years back. It has been very reliable and is one of those things that [Just Works](https://www.youtube.com/watch?v=JuKX7MvQYcc).

Today I logged into it and it said that it had a firmware update, to version 4.3.5. I haven&#8217;t had any issues at with firmware updates so I let it do it&#8217;s thing and went back to mucking around with the faulty CAT6 connections in my house.

After about a half hour, I started seeing emails coming in from the QNAP box. When something goes it wrong, it does a nice job of sending me email notifications. Every 10 minutes, I was getting the following error message

{% highlight plaintext %}
NAS Name: swan
Severity: Warning
Date/Time: 2018/10/15 23:26:17

App Name: Network & Virtual Switch
Category: Infrastructure
Message: [Network & Virtual Switch] Failed to update DDNS "myQNAPcloud".
{% endhighlight %}

OK, that&#8217;s a new one. I took a cursory look at the settings and apps, but didn&#8217;t see anything amiss. Fortunately, the Internet is now on computers and I pasted that error message into my browser and it found stuff. I found a [message thread](https://forum.qnap.com/viewtopic.php?f=313&t=134697&p=688649#p688308) on the QNAP forum (you are not a real product unless you have a support forum) that mentioned the problem. Misery loves company and when it comes to computers, seeing other people with the same problem means that it&#8217;s probably [Not Your Fault](https://www.youtube.com/watch?v=GtkST5-ZFHw).

<img loading="lazy" class="size-medium aligncenter" src="https://i1.wp.com/photos.smugmug.com/photos/i-hrzcJzX/0/2a225af1/S/i-hrzcJzX-S.png?resize=300%2C300&#038;ssl=1" width="300" height="300"  /> 

Other people had posted that this problem started after installing the 4.3.5 firmware upgrade. I posted a &#8220;me too&#8221; post (not a #metoo post). I then decided to see if there was something obvious that I could fix. Under My Apps, I had a MyQNAPCloud app and it wasn&#8217;t running. What this app provided was a mechanism where the QNAP box would punch a hole through your router and get you a domain name that would route down to your server. With SSL via [Lets Encrypt](https://letsencrypt.org/). All in all, pretty cool.

<p style="padding-left: 30px;">
  <strong>Sidebar:</strong><br /> If you are not familiar with QNAP servers, they are running some variant of Linux and there are apps that you can download and run to extend the functionality. They do a very good job of hiding the nuts and bolts of the OS from you, you manage everything from a web based GUI. It&#8217;s quite impressive. You basically pick a name and you get https://notmyrealname.myqnapcloud.com and that takes you to the management portal of your server. From anywhere.
</p>

When I drilled into the MyQNAPCloud app, it gave me the ever so useful error message of &#8220;MyQNAPCloud cannot start because of incorrect information in its configuration file&#8221;. And there was no way of accessing that configuration file. At least nothing that was immediately obvious. So I deleted the app to see if I could download it again and reset the configuration.

After I deleted the app, I discovered it was no longer in the QNAP App Store. [Rut ro](https://www.youtube.com/watch?v=YmDugcG8KrU), Shaggy. I fired up the Network & Virtual Switch app and selected the DDNS option. When I doubled clicked on DDNS, it launched a myQNAPcloud window.

The [thick plottens](https://dancingwithfools.files.wordpress.com/2013/06/1a20.jpg). What used to be a downloadable app was now part of the OS. I went in and had it verify that the router was configured correctly. It&#8217;s 2018, [UPnP](https://en.wikipedia.org/wiki/Universal_Plug_and_Play) actually works. I forced the SSL Certificate module to update the Let&#8217;s Encrypt certificate. If your site doesn&#8217;t use SSL, get a Let&#8217;s Encrypt cert. It&#8217;s free and it works.

After futzing around with the myNAPCloud settings, I let the QNAP box do it&#8217;s own thing while I sent back to CAT6 things. After 20 minutes, I noticed that the warning messages had stopped. This is a good thing, I had addressed whatever the problem was.

<img loading="lazy" class="size-medium aligncenter" src="https://i1.wp.com/photos.smugmug.com/photos/i-SjbXFc2/0/64b3eb01/M/i-SjbXFc2-M.png?resize=600%2C309&#038;ssl=1" width="600" height="309"  /> 

This was one of the times where poking the beast with a sharp stick actually worked. I like the QNAP boxes. They are easy to work with, [up-gradable](http://www.crucial.com/usa/en/compatible-upgrade-for/QNAP/ts-451), and the UI is actually useful.
