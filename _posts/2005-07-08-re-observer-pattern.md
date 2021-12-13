---
id: 428
title: 'RE: The Observer Pattern'
date: 2005-07-08T14:08:00-05:00
layout: post
guid: http://www.rajapet.com/?p=428
permalink: /2005/07/08/re-observer-pattern/
---
Dave Burke has a pretty good description of how to use the Observer pattern. I&#8217;ll skip into the gory details, you find that on the link to his [article](http://www.dbvt.com/blog/archive/2005/06/25/2657.aspx). It describles how you coordinate multiple views of the same set of data in the user interface. 

It&#8217;s another way to describe the subscriber/publisher model. Your data publishes events when something changes (the user views a different record, changes the ordeing, etc) and the various UI elements that subscribe to the data will get the events. Once they get that event, they can determine if action is rtequired for their view of the data.

It&#8217;s one of those things that when you see it, you think &#8220;That makes sense, why didn&#8217;t I do it that way.&#8221;