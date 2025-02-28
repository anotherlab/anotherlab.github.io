---
id: 203
title: 'Just when I thought my SmugMug plugin was finished&#8230;'
date: 2008-02-26T05:31:00-05:00
layout: post
guid: http://www.rajapet.com/?p=203
permalink: /2008/02/26/just-when-i-thought-my-smugmug-plugin/
---
After tackling the Wix learning curve, I have an installer for my SmugMug plugin does usual things: check for .NET 2.0, install the files, add the registry key to register the plugin, and support upgrading in place.  One step closer to releasing this plugin for Windows Live Writer.

Meanwhile, over at SmugMug, a [security issue](http://blogs.smugmug.com/don/2008/01/28/your-private-photos-are-still-private/ "SmugBlog: Don MacAskill - Your private photos are still private.") of sorts popped up.  Don MacAskill, the CEO of SmugMug, blogged about it with great detail and openness and I&#8217;m not going into it here.  At any rate, in response to what was perceived to be a security, SmugMug is implementing some changes to their API.  The changes were fairly trivial to implement so it made sense to augment my plugin&#8217;s code to be compliant with the updated API.

With their recent changes, I saw that my plugin was no longer displaying images for one of my test galleries, where it had worked before.  I spent a hour or so trying to track it down in my code, when the clue light finally flickered above my head.  I logged into my SmugMug account and examined the properties of that gallery.  

Sure enough, for that gallery, the &#8220;allow external links&#8221; option was set to &#8220;No&#8221;.  This meant that even though my plugin would return valid URL&#8217;s for the images in that gallery, SmugMug would send back a blank page for those URL&#8217;s.  I augmented my call to get the gallery list to check the properties for each gallery and filter out the ones that did not allow external linking.

I thought that there would be performance hit for making a web service call for each gallery.  It wasn&#8217;t really noticeable at all.  That&#8217;s what I love about SmugMug, their API performance is damn fast.

At any rate, I was hoping to finally push this plugin out the door by now, but I&#8217;m going to take a few more days and beat on the code.