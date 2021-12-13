---
id: 30
title: Ratcheting up the scroll with my Logitech mouse
date: 2012-01-24T04:18:00-05:00
layout: post
guid: http://www.rajapet.com/?p=30
permalink: /2012/01/24/ratcheting-up-scroll-with-my-logitech/
---
With the PC that gets used by the family, we use a wireless Logitech mouse. It’s the [VX Revolution](http://www.logitech.com/en-us/428/165?softwareid=671&osid=14). It’s a few years old, but it has all the functionality that we need. 

[<img loading="lazy" title="vx-revolution" border="0" alt="vx-revolution" align="left" src="https://i2.wp.com/lh5.ggpht.com/-a7RiZ-kFBH4/Tx4xELzmqMI/AAAAAAAAAkk/TKmVz-8Tnuk/vx-revolution_thumb.png?resize=87%2C118" width="87" height="118"  data-recalc-dims="1" />](https://i2.wp.com/lh4.ggpht.com/-auRfGrFKPVM/Tx4xD_QGNRI/AAAAAAAAAkc/u2328dhrPUM/s1600-h/vx-revolution%25255B2%25255D.png)I was using it tonight and the scrolling was, for the lack of a better word, wrong.  The wheel usually scrolled with a nice ratchet.  You moved the wheel, and you would feel a nice soft click as it scroll.

Tonight, it had stopped clicking and the scrolling was too sensitive.  You would scroll down a page and when you lifted your finger off the mouse wheel, it would roll back a tiny bit.  This would cause the page on the screen to jump back a bit.  It was very jarring and annoying.  What did I do to this thing and how do I fix it?

On my home dev box, I have a [Logitech MX Revolution](http://www.logitech.com/en-us/support-downloads/downloads/mice/devices/130).  Kind of like the big brother to the VX.  On the MX, I could switch the wheel between the free spinning mode and the ratchet mode by clicking on the wheel.  That didn’t work on the VX.  I tried playing with the Logitech SetPoint utility that allows you to tweak the mouse settings.  [No dice](http://washedupcelebrities.blogspot.com/2009/08/andrew-dice-clay.html), nothing jumped out.

When in doubt, see if there is an updated mouse driver from Logitech.  I had 6.2 installed, the current version is 6.3.  So I grabbed the general Windows 7 setup exe for SetPoint and installed.  And that’s when the Logitech driver fell down.  Their all in one installer installed the 32 bit driver instead of the 64 bit driver.  Usually that’s not a huge deal, but it looked like they installed the 32 driver AS the 64 bit driver.  It crashed as soon as I loaded it.

OK, back to square one.  I uninstalled the newly broken driver and when back to the Logitech site.  Sure enough, I saw a link for the 64 bit only version.  I grabbed it, installed it, and it ran with out crashing.  It didn’t let me change the scroll wheel behavior, so I was back to square one again.

When in doubt, RTFM.  I took a peek at the user guide for the VX, from the Logitech site.  Guess what gang, on the bottom of the mouse, there’s an oddly shaped switch control.

<table border="0" cellspacing="0" cellpadding="2" width="400">
  <tr>
    <td valign="top" width="400">
      <p align="center">
        <a href="https://i1.wp.com/lh6.ggpht.com/-mLMUvihYVME/Tx4xETCWJQI/AAAAAAAAAks/6OzgjdGm7-s/s1600-h/OddlyShaped%25255B4%25255D.png"><img loading="lazy" title="OddlyShaped" border="0" alt="OddlyShaped" src="https://i1.wp.com/lh5.ggpht.com/-yCOxCH7ZPc8/Tx4xEiykf5I/AAAAAAAAAk0/HhFZkP1iJLI/OddlyShaped_thumb%25255B2%25255D.png?resize=198%2C244" width="198" height="244"  data-recalc-dims="1" /></a>Figure 1 – An oddly shaped control
      </p>
    </td>
  </tr>
</table>

It’s hard to see in this picture, but the smooth circle at the top right of the switch puts the mouse into free wheel mode.  The gear shape at the bottom left, puts the mouse in ratchet.  Somehow the switch had been changed to free rolling mode.  I flicked back to ratchet mode and life was good again.