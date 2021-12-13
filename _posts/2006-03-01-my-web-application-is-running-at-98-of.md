---
id: 318
title: 'My web application is running at 98% of the CPU'
date: 2006-03-01T21:10:00-05:00
layout: post
guid: http://www.rajapet.com/?p=318
permalink: /2006/03/01/my-web-application-is-running-at-98-of/
---
We are in the middle of testing a new web application and we have 7 instances of it running on 2003 Server box. Each instance has a web page virtual directory and a web service virtual directory. Some of the web services are on another box, but more of the bits are on this server. I was doing some related file cleanup on this box and it felt a little sluggish. A quick peek at Task Manager showed both processors (dual Xenon) were pegged at 96% to 99% of the CPU, in the w3wp.exe process. This is the process that manages the application pool in IIS6. I had all of the sites running in the same default app pool and it was imposible to tell which site was causing the spike, or if it was caused by just having a single app pool.

With one app pool, it&#8217;s imposible to tell which site or sites is eating up the CPU cycles. I went in created application pools for each web site and web service folder and then assigned each site/service to it&#8217;s application pool. This gets me a few things. First of this is how it&#8217;s supposed to be set up in the first place. Each site will will get it&#8217;s own process and I can use the [iisapp.vbs](http://www.wwwcoder.com/main/parentid/170/site/3730/68/default.aspx "Which w3wp.exe process belongs to which App Pool in IIS6") script to list each app pool with it&#8217;s process id and the associate site assigned to that pool. That should fix the problem or at the very least narrow down the list of [the usual suspects](http://www.usualsuspects-themovie.com/ "Who is Keyser Soze? He is supposed to be Turkish. Some say his father was German. Nobody believed he was real. Nobody ever saw him or knew anybody that ever worked directly for him, but to hear Kobayashi tell it, anybody could have worked for Soze.").

Technorati Tags: <a href="http://technorati.com/tag/iis" rel="tag">iis</a> <a href="http://technorati.com/tag/w3wp.exe" rel="tag">w3wp.exe</a> <a href="http://technorati.com/tag/iisapp.vbs" rel="tag">iisapp.vbs</a> <a href="http://technorati.com/tag/application+pool" rel="tag">application pool</a>