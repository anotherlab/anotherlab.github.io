---
id: 498
title: Build numbers
date: 2005-04-15T12:56:00-05:00
layout: post
guid: http://www.rajapet.com/?p=498
permalink: /2005/04/15/build-numbers/
---
I can never figure out the naming scheme for version numbers. Is it Major, Minor, Build, Release? Or is it Major, Minor, Release, Build? Borland calls the last field &#8220;Build&#8221;, Microsoft calls the last field &#8220;Release&#8221; (except for the times where it [doesn&#8217;t](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpref/html/frlrfsystemdiagnosticsfileversioninfoclassfileprivateparttopic.asp)).

Internally, we always refer to final part of the version number as the build number.

We do development with Borland&#8217;s Delphi (5 and 7) and Microsoft&#8217;s Visual Studio .Net and while both can increment build numbers, we prefer to do it manually. In our home grown bug tracking app, we track the build number for when that bug was resolved. Borland&#8217;s method of bug incrementing is simple. When that feature is enabled, the build number is incremented when you rebuild the project. We prefer to do it manually as part of the build process. One programmer is in charge of the build for any given app, and it&#8217;s his responsibility to set the build number.

VS.NET can set the build number, but it&#8217;s a little [odd](http://homepages.primex.co.uk/~lesleyah/webdoc10.htm). They don&#8217;t bump the build number when you rebuild, only when you close and reopen the project. [Huh?](http://www.huhcorp.com/) Their build numbering scheme is also time based. You can VS set just the revision (4th field) or Build, Revision (3rd and 4th field). Build will be equal to the number of days since January 1, 2000 local time and Revision to be equal to the number of seconds since midnight local time, divided by 2.

This means that the final part of the version number is not always increase in value when Microsoft is allowed to set it. So we set it manually before handing over the latest and greatest to QA.