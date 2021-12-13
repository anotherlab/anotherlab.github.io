---
id: 3066
title: When your Apple device refuses to be trusted
date: 2019-08-26T12:34:12-05:00
author: Chris Miller
layout: post
guid: http://rajapet.com/?p=3066
permalink: /2019/08/26/when-your-apple-device-refuses-to-be-trusted/
categories:
  - Annoyances
  - Apple
tags:
  - 2fa
  - icloud
---
Back in July, I received a new Macbook Pro.&nbsp; A lovely little device, but I had this one problem.&nbsp; It wasn&#8217;t showing up as a trusted device under my iCloud account.&nbsp; 

When you log into a site or a service that requires Apple&#8217;s 2 factor authentication, you can use a Trusted Device to generate a 6 digit authentication code.&nbsp; Most people use their iPhone, but I don&#8217;t have an iPhone.&nbsp; Plenty of other Apple devices, just not the phone.&nbsp; And 2 factor authentication works on my iPad, my old Macbook, and my Mac Mini.&nbsp; Just not on the new Macbook.&nbsp; 

<div class="wp-block-image">
  <figure class="aligncenter size-large"><img src="https://i1.wp.com/photos.smugmug.com/photos/i-7gHJWnr/0/482a2ae0/M/i-7gHJWnr-M.png?w=680&#038;ssl=1" alt="" data-recalc-dims="1" /><figcaption><em>The 2 Factor Auth prompt</em></figcaption></figure>
</div>

When I&#8217;m travelling, the only Apple device that I carry is the Macbook.&nbsp; When I log into a service that needs the Apple auth, I want to be able to use my Macbook to provide that code.&nbsp; That&#8217;s a pretty [reasonable request](https://www.bing.com/th?id=OIP._p6PM7gxiGQ3iHWPeyN4cAHaGu&pid=Api&rs=1).

<div class="wp-block-image">
  <figure class="aligncenter size-large"><img src="https://i1.wp.com/photos.smugmug.com/photos/i-k9qS2BL/0/5e65b6c0/S/i-k9qS2BL-S.png?w=680&#038;ssl=1" alt="" data-recalc-dims="1" /><figcaption><em>This is what you should get</em></figcaption></figure>
</div>

This has been frustrating me for a good month or so.&nbsp; There is no switch or setting to enable.&nbsp; Once you enable your iCloud account on an Apple device made in the last few years, that device is now a trusted device. That&#8217;s all you are supposed to have to do.

Except&nbsp;for my new Macbook.&nbsp; It would not display the dialog that would prompt for the authentication code.&nbsp; I tried Apple Support via email, but that proved to be fruitless.&nbsp; I don&#8217;t think that they fully understood the problem.&nbsp; I tried again today with Apple Support via phone.&nbsp; It took the better part of an hour, but we finally resolved the problem.

Basically everything was setup correctly and should have worked.&nbsp; But it didn&#8217;t.&nbsp; With anything computer related, sometimes the best solution is to nuke the problem from a Low Earth Orbit.<figure class="wp-block-embed-youtube aligncenter wp-block-embed is-type-rich is-provider-embed-handler wp-embed-aspect-16-9 wp-has-aspect-ratio">

<div class="wp-block-embed__wrapper">
  <div class="jetpack-video-wrapper">
    <span class="embed-youtube" style="text-align:center; display: block;"></span>
  </div>
</div><figcaption>

_It&#8217;s the only way to be sure_</figcaption></figure> 



So we removed the iCloud account, rebooted, and added it back again.&nbsp; That resolved the problem.&nbsp; The Apple Support rep thinks that the iCloud auth token on the Macbook was corrupt. I have no idea how or why that happened, but that would explain what caused the problem.