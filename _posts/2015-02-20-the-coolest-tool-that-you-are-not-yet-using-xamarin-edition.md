---
id: 1136
title: The coolest tool that you are not yet using (Xamarin edition)
date: 2015-02-20T10:05:05-05:00
layout: post
guid: http://www.rajapet.com/?p=1136
permalink: /2015/02/20/the-coolest-tool-that-you-are-not-yet-using-xamarin-edition/
---
Have you played with Xamarin Sketches yet?  Sketches was announced at Evolve back in October and is available in Xamarin Studio on OS X.  It gives you a real time coding environment and lets you interactively try code out without having to go through a code/compile/deploy cycle.

I was asked by a co-worker on how to display a glyph in a button on iOS to indicate that a popup list was available.  I wanted to display an upside down caret, a triangle if you will, as part of the caption to a button.   Basically, I wanted the text to look more or less like this

Happy ▼

And thanks to Unicode, we have that symbol available to us.  Before telling my colleague to just slap a character to the end of the button caption, I wanted to test for myself that it would display correctly on an iPhone.

Normally, I would just create a new singleview iPhone project and slap a label on it.  I would then fire up the simulator and see how it looked.   That way works, but today I decided to take a shortcut and try [Xamarin Sketches](http://developer.xamarin.com/guides/cross-platform/sketches/).

Xamarin Sketches lets you type in code and it compiles and runs it as you type.  It provides an isolated sandbox to try out some code and basically fool around before you put that code into a project.

It&#8217;s similar to Xcode Playground, except being Xamarin, it does cross-platform.  You can interactively test code for iOS and Android,   You can&#8217;t do everything in Sketch, you can&#8217;t create classes or use anonymous types.

For what I needed to try, Sketches would work just fine.  I created a new Sketch and set the platform to iOS and the toolkit to UIKit.  It can do Xamarin.Forms, but in this case I wanted to test for Xamarin.iOS code.

I created a string variable with some text and included the unicode escape sequence &#8220;\u25BE&#8221;.  That is code for something called [&#8220;BLACK DOWN-POINTING TRIANGLE&#8221;](http://www.fileformat.info/info/unicode/char/25bc/index.htm).  I then created a UILabel and set the text to my string variable.  That was enough to generate the proof of concept that I needed:

<div style="width: 410px" class="wp-caption alignnone">
  <a href="https://i1.wp.com/www.rajapet.net/Other/2015-Blog/i-86f6jG4/0/XL/Sketches-XL.png"><img loading="lazy" class="" src="https://i1.wp.com/www.rajapet.net/Other/2015-Blog/i-86f6jG4/0/S/Sketches-S.png?resize=400%2C202" alt="" width="400" height="202" data-recalc-dims="1" /></a>
  
  <p class="wp-caption-text">
    Xamarin Sketches (click the picture to embiggen it)
  </p>
</div>

This code was extremely simple, but it was all I needed to verify that the unicode sequence would work correctly.  I was able to do that and help out a co-worker without getting out of the cod that I was working on.

You can do more complicated things in Sketches.  During the [Evolve Keynote](https://evolve.xamarin.com/#keynote-xamarin-profiler), Miguel de Icaza wrote a simple little iOS game in Sketches:

<blockquote class="twitter-tweet" lang="en">
  <p>
    &#8220;Not everyone gets a chance to slap a salmon&#8221; &#8211; <a href="https://twitter.com/migueldeicaza">@migueldeicaza</a> showing an iOS game written in Sketches <a href="https://twitter.com/hashtag/Evolve2014?src=hash">#Evolve2014</a> <a href="http://t.co/6YuHbm2PEE">pic.twitter.com/6YuHbm2PEE</a>
  </p>
  
  <p>
    — Chris Miller (@anotherlab) <a href="https://twitter.com/anotherlab/status/519856063668314112">October 8, 2014</a>
  </p>
</blockquote>

And then did a simple Xamarin.Forms apps: 

<blockquote class="twitter-tweet" lang="en">
  <p>
    Showing how to write a Xamarin.Forms interactively with Sketeches <a href="https://twitter.com/hashtag/Evolve2014?src=hash">#Evolve2014</a> <a href="http://t.co/hd391sQkhT">pic.twitter.com/hd391sQkhT</a> — Chris Miller (@anotherlab) <a href="https://twitter.com/anotherlab/status/519856779258503168">October 8, 2014</a>
  </p>
</blockquote>



This only works with Xamarin Studio on OS X, it&#8217;s not available in Xamrin Studio for Windows or with the Visual Studio Plugin.  That&#8217;s not really a roadblock for me, if you are doing any iOS work, you pretty much have to have access to a Mac.  If you are doing iOS work with Xamarin, you are missing out on a handy tool if you are not using Sketches.