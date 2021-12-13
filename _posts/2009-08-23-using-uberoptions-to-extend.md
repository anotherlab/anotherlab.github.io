---
id: 85
title: Using uberOptions to extend the functionality of Logitech devices
date: 2009-08-23T04:29:00-05:00
layout: post
guid: http://www.rajapet.com/?p=85
permalink: /2009/08/23/using-uberoptions-to-extend/
---
A few weeks ago, I picked up some Logitech mice that were on sale as “dented box” items on the Logitech site.  They were new mice, but their boxes had some minor damage and they were half off.  I grabbed a [VX Revolution](http://www.logitech.com/index.cfm/mice_pointers/mice/devices/165&cl=us,en) and a [MX Revolution](http://www.logitech.com/index.cfm/mice_pointers/mice/devices/130&cl=us,en).  The VX was for the family computer that the kids use, and the MX was for my home development machine.  The VX is a notebook model and it’s smaller size fits the kids hands quite nicely.

The MX Revolution was to replace my [MX 700](http://www.logitech.com/index.cfm/428/909&cl=us,en) mouse that I’ve had a few years. The 700 was one of the best mice I have ever used, but I had some issues with it.  First off, Logitech did not provide Vista drivers for it. While it worked just fine with Vista, it was only as a standard mouse and the extra buttons could not be used.  The other problem was that the rechargeable batteries had worn out to the point there they would only last for a few minutes.  I could easily find replacement batteries, but I missed the extra functionality of the 700.  Plus I wanted a mouse where the mouse wheel with the “tilt” support for left/right scrolling.

From time to time, Logitech runs “dented box” sales on various products.  If you have right coupon code, you can get a new product with a full warranty.  If you use the site [techbargains.com](http://www.techbargains.com/), type “dented logitech” into the search box on the main page, you’ll get a list of the current dented box specials on the Logitech site, plus coupon codes for additional savings.

Both the VX and MX Revolution mice have a little button located just south of the scroll wheel.  By default, it’s mapped to a search function.  Select a word, press the button, and a new browser instance is launched with the selected word passed the search engine.  For some people that may be a cool feature, but I found it just maddening.  With the Logitech SetPoint software that comes with each mouse, you can reassign the mouse button functionality to other behavior.  On the VX, I was able to set the search button to be a middle click button.  I like being able to middle click a link on a web site and get that link opened in a new tab, leaving the existing web page right it I was reading it.

You would think that you could do the same thing with the MX Revolution as you could with the VX Revolution. Oddly enough, while you could assign the middle click function to many of the buttons on the MX, it was not an option for the search button.  I don’t know if that was by design or by error, but it was irritating.  Since the SetPoint configuration software is bundled with all of the current Logitech input devices, the button definitions are not hard coded into the application, but must be read from some set of configuration files.  If I could find where they are located, I should be able to copy the missing MX definitions from the VX settings.

I went on to Logitech’s support forums in search of tips for locating and editing the SetPoint files.  After doing some searching, I found references to something called uberOptions. Rich Owens put together a package called uberOptions, a new set of SetPoint configuration files that greatly expand the options that you can assign to the buttons.  He has modified the files for a large list of keyboards, mice, and trackballs.  The current list of devices plus the installer for uberOptions can be found at <http://uberoptions.net/>.  It installed and worked just fine with WIndows 7 64 bit.  After I installed it, his default setting for mouse had mapped the search button to the middle click function.  Well played Rich, well played indeed.

[Edited on 8/31/2009]  
If Rich Owens’ main site is down, he has a mirror [site](http://rlowens.googlepages.com/ "rlowens - uberOptions mirror").

[Edited on 9/8/2009]  
Richard Owens sent in an updated link to his site, <http://uberoptions.net/>, this replaces <http://www.mstarmetro.net/users/rlowens/>.