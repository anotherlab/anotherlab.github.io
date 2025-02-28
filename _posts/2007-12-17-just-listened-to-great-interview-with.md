---
title: Just listened to a great interview with Dan Appleman over on Hanselminutes
date: 2007-12-17T06:33:00-05:00
---
That spring, I treated my self to an MP3 player, a [Creative Zen Vision:M](http://www.creative.com/products/mp3/zenvisionm/).  Why I picked a ZVM is food for another post, but it&#8217;s opened up a new world to me.  The world of [podcasts](http://en.wikipedia.org/wiki/Podcasts "Obligatory wikipedia reference").  My podcast listening typically falls into two categories:  programming related and NPR [shows](http://www.npr.org/rss/podcast/podcast_directory.php "NPR podcast directory").

One of the programming podcasts that I listen to on a regular basis is [Scott Hanselman&#8217;s](http://www.hanselman.com/blog/ "Scott Hanselman's ComputerZen.com - Programming Life and the Zen of Computers") [Hanselminutes](http://www.hanselman.com/blog/CategoryView.aspx?category=Podcast).  His stuff is very good.  He gets to interview a lot of cool people in our world.  I just listened to his [11/29th interview](http://www.hanselman.com/blog/HanselminutesPodcast90DanAppleman.aspx "Software Architecture with Dan Appleman") with [Dan Appleman](http://www.danappleman.com/ "Dan Appleman: Kibitzing and Commentary").  They talked about software architecture, but they concentrated on the human side of architecture.  

Dan talked about what should go in a software specification.  He mentioned something that I occasionally do and that is that the spec should clearly list what it doesn&#8217;t do.  A good spec will cover what it will perform, but you usually don&#8217;t see specs that clearly list what will not be performed.

That makes so much sense.  It&#8217;s important to list the scope of the spec, but it&#8217;s just as important to list the limits of the spec.  We all make assumptions, that&#8217;s just human nature.  I&#8217;ve been in situations where code was delivered and people asked for feature &#8220;B&#8221;.  &#8220;B&#8221; was never specified, but since the code included feature &#8220;A&#8221;, they had just assumed that &#8220;B&#8221; came along with &#8220;A&#8221;.  Then you have to go back to add &#8220;B&#8221; and hope it wasn&#8217;t too expensive to add after the fact.

When you list what the spec wont do, it forces the client to think a little more about what they want.  If you want something additional, it&#8217;s lot easier (and cheaper) to add that feature before the code has been written than after.
