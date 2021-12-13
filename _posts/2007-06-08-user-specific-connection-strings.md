---
id: 238
title: User specific connection strings
date: 2007-06-08T19:31:00-05:00
layout: post
guid: http://www.rajapet.com/?p=238
permalink: /2007/06/08/user-specific-connection-strings/
---
[Steve Harmon](http://stevenharman.net/blog/archive/2007/06/07/tip-put-connection-strings-in-their-own-configuration-file.aspx) has a good tip on how to use ASP.NET 2.0&#8217;s configSource to store connection strings in a file outside of the web.config.  You keep the user specific file out of source control and you eliminate conflicts when people use their own connection string settings.  He&#8217;s not the [only one](http://codeclimber.net.nz/archive/2007/04/23/Managing-application-configurations-in-development-teams.aspx) to come up with that idea.