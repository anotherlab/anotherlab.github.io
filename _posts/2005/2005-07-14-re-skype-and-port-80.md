---
title: 'RE: Skype and Port 80'
date: 2005-07-14T13:32:00-05:00
---
Here&#8217;s a good tip to remember if you are using Skype and doing web developement&#8230;

> I was having trouble with my IIS on my local machine &#8212; namely, it wouldn&#8217;t start.  That&#8217;s not good, because I do a lot of ASP.NET development, etc.  Well, the reason it wouldn&#8217;t a start was “EventID 15: Cannot bind” something or other.   A poke around the Internet told me to check to see if there was another application bound to good old port 80.  A tool called [ActivePorts](http://www.protect-me.com/freeware.html) told me that good ol&#8217; Skype was blocking out Port 80, and not allowing IIS to start.  Interesting.  So I went to the Skype options, and then to the Connection tab, and found the interesting “Use Port 80 as an alternative for incoming connections”.  Bingo &#8212; disabled that “feature”, and IIS was back up and running. <img loading="lazy" src="http://www.lemanix.com/nick/aggbug/2757.aspx" width="1" height="1" />

_[Via [Nick&#8217;s Delphi Blog](http://www.lemanix.com/nick/archive/2005/07/13/2757.aspx)]_
