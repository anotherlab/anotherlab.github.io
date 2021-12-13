---
id: 370
title: Building ASP.NET 2 projects
date: 2005-11-15T16:14:00-05:00
layout: post
guid: http://www.rajapet.com/?p=370
permalink: /2005/11/15/building-aspnet-2-projects/
---
On K. Scott Allen&#8217;s [blog](http://odetocode.com/Blogs/scott/ "Ode to Code"), you can find a really good description of how the build process for ASP.NET projects has changed from 1.0/1.1 to 2.0.

> 
> 
> One of the adjustments to make when moving from ASP.NET 1.1 to 2.0 is how to produce debug and release builds. 
> 
> &#8230;.
> 
> Here is the most important concept to come to terms with in 2.0: Visual Studio 2005 _**knows nothing**_ about compiling a web application. In 1.1 VS built the code-behind and ASP.NET built the web forms. In 2.0 Visual Studio 2005 delegates **_all_** compilation responsibilities to the ASP.NET platform.
> 
> &#8230;.

Jump [here](http://odetocode.com/Blogs/scott/archive/2005/11/15/2464.aspx "Debug and Release Builds in ASP.NET 2.0") for the full article, it neatly describes what has changed and how it works. He doesn&#8217;t go into why it changed, that&#8217;s the part I don&#8217;t get. What&#8217;s the advantage of the new build method? In the end, as long as I can get FinalBuilder to build it, I&#8217;ll be happy.