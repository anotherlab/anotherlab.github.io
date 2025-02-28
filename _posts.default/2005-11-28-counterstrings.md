---
id: 360
title: Counterstrings
date: 2005-11-28T14:59:00-05:00
layout: post
guid: http://www.rajapet.com/?p=360
permalink: /2005/11/28/counterstrings/
---
I was reading some of the older postings in James Bach&#8217;s excellent blog, [Training the minds of testers](http://blackbox.cs.fit.edu/blog/james/), when I found a little gem called &#8220;counterstrings&#8221;.

> A counterstring is a graduated string of arbitrary length. No matter where you are in the string, you always know the character position. This comes in handy when you are pasting huge strings into fields and they get truncated at a certain point. You want to know how many characters that is.
> 
> Here is a 35 character counterstring:
> 
> `<b>2*4*6*8*11*14*17*20*23*26*29*32*35*</b>`
> 
> 
> 
> Each asterisk in the string occurs at a position specified by the immediately preceding number. Thus, the asterisk following the 29 is the 29th character in that string. So, you can chop the end of the string anywhere, and you know exactly where it was cut. Without having to count, you know that the string &#8220;2\*4\*6\*8\*11\*14\*17\*2&#8221; has exactly 18 characters in it. This saves some effort when you&#8217;re dealing with a half million characters. I pasted a 4000 character counterstring into the address field of Explorer and it was truncated at &#8220;2045\*20&#8221;, meaning that 2047 characters were pasted.
> 
> I realize this is may not be a very interesting sort of testing, except perhaps for security purposes or when you&#8217;re first getting to know the app. But security is an increasingly important issue in our field, and sometimes when no one tells you the limits and dynamics of text fields, this can come in handy.
> 
> [[James Bach&#8217;s Blog (Testing)]](http://blackbox.cs.fit.edu/blog/james/archives/000170.html "Counterstrings: Self-Describing Test Data")

This is a really cool and simple way to verify the length of an entry field in an application. He also has a small applet, downloadable from that blog entry, that will let you create counterstrings of various patterns. I may code a clone up in Delphi for my own nefarious purposes.