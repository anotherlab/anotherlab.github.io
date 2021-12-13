---
id: 194
title: Playing with Firefox 3 Beta 4
date: 2008-03-30T18:15:00-05:00
layout: post
guid: http://www.rajapet.com/?p=194
permalink: /2008/03/30/playing-with-firefox-3-beta-4/
---
I&#8217;ve pretty much standardized on Firefox as my default browser (but not the default Windows browser).  I had been an Opera bigot for years, but the tipping point was when Google released their browser sync addin that made it easy to keep my bookmarks and other settigns in sync between work and home.

I&#8217;ve been hearing good things about the latest beta (beta 4) of Firefox 3, so I have decided to give it a shot.  I found a good article for running [Firefox 3 in tandem with Firefox 2](http://www.teamhackaday.com/forum/viewtopic.php?t=2843 "Team Hack-a-Day  - Run Firefox 2 and Firefox 3 Beta side-by-side") on the [Hack-A-Day](http://www.teamhackaday.com/ "The Official Site of the Unofficial Hack-a-Day Folding@Home Team") site, so it seemed safe to run them together.  My first impression is that it&#8217;s fast, much faster than Firefox 2 and probably faster than Opera.  Faster is good, [I look for things to make me go](http://en.wikipedia.org/wiki/Samaritan_Snare) and this is one of them.

Our [Google Overlords](http://www.kottke.org/06/09/pixelated-google-overlords "I, for one, welcome our pixelated Google overlords") have not updated the Google Browser Sync addin to work with Firefox 3.  There have been quite a few requests for Firefox 3 support, I&#8217;m surprised that company known for keeping products in beta for years isn&#8217;t supporting the Firefox 3 beta.

I decided to take a look to see if anyone else had a browse sync that supported Firefox 3.  As it turns out, [Foxmarks](http://www.foxmarks.com/ "The Bookmark Synchronizer") has a beta that supports the Firefox 3 beta.  I installed into my Firefox 2 and Firefox 3 installations and synced my Firefox 2 bookmarks up to the Foxmarks server.  I then tried to sync up from Firefox 3 and it repeatedly crashed.

I assumed that it was a fault of the Foxmarks plugin, so I took a look around their site.  On their [wiki](http://wiki.foxmarks.com/wiki/Firefox3Beta "Firefox3Beta - Foxmarks Wiki"), I read the following:

> On initial sync (or regular sync of large change sets), Firefox sometimes crashes. (We believe this is a Firefox bug; if you experience this, please make sure you allow Firefox to submit a crash report to Mozilla.) [This is an open bug in Firefox being investigated by Mozilla.] 

It indicates that it&#8217;s a Firefox bug and I have a work around.  Since Firefox 3 is puking on large change sets, the solution is to reduce the size of the change set.  I synced up Firefox 2 and then exported the bookmarks to a file.  I then imported that file into Firefox 3 and it was able to sync up changes after that.

Another addin that I like is [GMail Manager](https://addons.mozilla.org/en-US/firefox/addon/1320 "Allows you to manage multiple Gmail accounts and receive new mail notifications. Displays your account details including unread messages, saved drafts, spam messages, labels with new mail, space used, and new mail..."), and it too doesn&#8217;t support Firefox 3.