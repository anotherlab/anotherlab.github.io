---
id: 758
title: Sometimes 42 is the right answer
date: 2014-03-17T14:22:25-05:00
layout: post
guid: http://www.rajapet.com/?p=758
permalink: /2014/03/17/sometimes-42-is-the-right-answer/
---
<img loading="lazy" alt="Prime Meridian" src="https://i1.wp.com/anotherlab.smugmug.com/photos/i-tL8GBSj/0/M/i-tL8GBSj-M.jpg?resize=600%2C401" width="600" height="401" data-recalc-dims="1" />

I was skimming the [Codist blog](http://thecodist.com/article/our_ios_app_crash_rate) when I read the following

> One of my favorite data errors was when the latitude would be randomly in the 1000s even though the longitude was correct. MapKit would toss a fit so since I can&#8217;t know what the right value is, I just use 42 which puts the pin at the wrong location but at least it&#8217;s not crashing.

I just started laughing. Been there, done that, want it on a t-shirt.  When collecting positional data from other sources, sometimes you just get bad data in.  And in this case, 42 is the [Ultimate Answer](http://en.wikipedia.org/wiki/Phrases_from_The_Hitchhiker%27s_Guide_to_the_Galaxy#Answer_to_the_Ultimate_Question_of_Life.2C_the_Universe.2C_and_Everything_.2842.29 "Answer to the Ultimate Question of Life, the Universe, and Everything").

A while back I had written a data collection service that was collecting vehicle positions from onboard GPS device.  Every now and then, the locations became random.  This app was running in the continental US,  any latitude/longitude values outside that range for that area were just ignored.  In my case, any wrong location was unusable data.

_The [Prime Meridian image](http://www.flickr.com/photos/auxesis/3845266113/) comes from [Lindsay Holmwood&#8217;s Flickr feed](http://www.flickr.com/photos/auxesis/)._