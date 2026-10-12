---
title: Is soap.tcp with WSE a singleton?
date: 2006-01-26T06:24:00-05:00
---
Ok, the title of this post is pure [jargon](http://www.dack.com/web/bullshit.html), but it fits. This WSE 3 thing is still new to me and I&#8217;m still trying to [grok](http://catb.org/~esr/jargon/html/G/grok.html) some of the finer details. The ability to run a .NET web server over TCP without involving IIS has caught me eye. Thanks to [Indy](http://www.indyproject.org/), I&#8217;ve been doing stand alone web services with Delphi for a couple of years, an equivalent functionality in .NET may make some things easier to migrate. Having a stand alone web service allows you to do interesting things with persistent data structures and you no longer have to worry about IIS flushing your service out of memory.

But is a .NET web service thread safe when it&#8217;s not running inside IIS? If 10 clients call the same method at the same time, are threads spawned to handle each request, are they just queued up, or does it just collapse like a house of cards? Googling for clues turned up very little (for once). I did come across a [posting](http://forums.microsoft.com/MSDN/ShowPost.aspx?PostID=160492&SiteID=1) from Mark Fussell, the WSE Program Manager at Microsoft, where he states that it&#8217;s not thread safe but I may be reading that in the wrong context. On a side note, do the web service endpoints in SQL Server 2005 have the same limitation?

When I get some time, I&#8217;ll build a simple WSE 3 based web service and and blast it from multiple targets and see what happens. Between [Ethereal](http://www.ethereal.com/ "a socket programmers best friend") and [log4net](http://logging.apache.org/log4net/), I should get some metrics out of it.
