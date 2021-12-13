---
id: 1329
title: 'When a UX hack has unexpected consequences or &#8220;Why did my iOS app name get truncated when I used TestFlight?&#8221;'
date: 2015-10-05T09:44:45-05:00
layout: post
guid: http://www.rajapet.com/?p=1329
permalink: /2015/10/05/when-a-ux-hack-has-unexpected-consequences-or-why-did-my-ios-app-name-get-truncated-when-i-used-testflight/
---
While testing a iOS app with [TestFlight](https://developer.apple.com/testflight/), we noticed that the app name was being truncated.  The name was just under the length where iOS truncates it and adds the ellipses.  When we compiled the app and deployed it a device, the name displayed normally.  When we put a test build up for QA through TestFlight, the name was truncated.

<div style="width: 610px" class="wp-caption alignnone">
  <img loading="lazy" class="" src="https://i2.wp.com/www.rajapet.net/Other/2015-Blog/i-nQTV7CS/0/L/orangedot-L.png?resize=600%2C175" alt="" width="600" height="175" data-recalc-dims="1" />
  
  <p class="wp-caption-text">
    Without the dot, the full name would have been shown
  </p>
</div>

One of our developers contacted Apple Support and they came through with a quick answer.  When you install an app through TestFlight, Apple pre-pends an orange dot to the app name.  This is to distinguish the app from one that had been downloaded from the iTunes App Store.  This takes up space and reduces the amount of space available for the app name.  It&#8217;s artifact of using TestFlight, when the app is installed from the App Store, the text will not be truncated.  This is nothing new, it&#8217;s been this way since Apple launched TestFlight with iOS 8.

So this was a UX hack.  Apple wanted to be able designate that the app had been installed from TestFlight (which is good), but did it in a way that would have unexpected consequences (which is bad).  I&#8217;m kind of surprised that this was implemented that way.  Apple controls the entire chain, from device, to OS, to the development tools.  They could have found another way to indicate that app came from TestFlight.

Like draw an underline in orange underneath the app name.  Place a new style of badge over the icon, in a different corner.  Draw an orange box around the icon.  Or, hold on to your seats, allow for a longer length for the app name when the orange dot is added.

Monkeying around with the app name seems a like a quick and dirty hack.  Now we have to let our QA people know that the app name isn&#8217;t broken, it&#8217;s just a side affect of using TestFlight.  Making sure that the app name is displayed correctly is one of the things that our QA people check for.  TestFlight just made that a little harder.