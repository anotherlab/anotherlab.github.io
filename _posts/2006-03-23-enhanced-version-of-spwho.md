---
title: Enhanced version of sp_who
date: 2006-03-23T18:02:00-05:00
---
I often use [sp_who](http://www.transactsql.com/html/sp_who.html) and [sp_who2](http://www.transactsql.com/html/sp_who2.html) to see who is connected to what on our development database server. When we need to restore a database, I need to make sure no one else is connected and sp_who is a quick way to get that information. The annoying part is that it displays every connection to every database, you can&#8217;t filter by database. [Vyas Kondredd](http://vyaskn.tripod.com/index.htm)i wrote a decent version that he named [sp\_who\_3](http://vyaskn.tripod.com/sp_who3.htm). It does pretty much what sp_who does, exception it takes lots of optional parameters that let you filter the data. I tweaked his code a little bit, but it&#8217;s good stuff. 

Technorati Tags: <a href="http://technorati.com/tag/SQL+Server" rel="tag">SQL Server</a> <a href="http://technorati.com/tag/sp_who" rel="tag">sp_who</a> <a href="http://technorati.com/tag/DBA" rel="tag">DBA</a>
