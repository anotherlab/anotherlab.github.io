---
title: 'PRB: Access Denied Error When You Make Code Modifications with Index Services Running'
date: 2005-04-11T19:06:00-05:00
---
[PRB: Access Denied Error When You Make Code Modifications with Index Services Running](http://support.microsoft.com/default.aspx?scid=kb;en-us;329065)

I was getting an annoying error while writing an ASP.NET app. I would make a change to the code and then run the app. Most of the time, it would run. About 5% of time, I would get an &#8220;Access is denied&#8221; error message about one of the assemblies in the app. Googling on that message didn&#8217;t help, but when I searched on some other text from the error page, &#8220;Policy not being applied to reference at this time&#8221;, that eventually took me to the right Microsoft KB article.

Basicly, the Microsoft Indexing Service was trying to index the temporary files that ASP.NET creates. Excluding that directory from the Indexing service appears to eliminate the problem. Of course the real question is: Why was Indexing Service bothering to index a directory that by definition only contains temporary files?
