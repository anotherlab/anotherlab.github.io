---
id: 2961
title: Microsoft Edge to adopt the Chromium project
date: 2018-12-06T15:33:50-05:00
author: Chris Miller
layout: post
guid: http://rajapet.com/?p=2961
permalink: /2018/12/06/microsoft-edge-to-adopt-the-chromium-project/
categories:
  - Events
  - Javascript
tags:
  - Chakra
  - Chrome
  - Chromium
  - Edge
  - V8
---
<img loading="lazy" class="aligncenter size-medium" src="https://i0.wp.com/photos.smugmug.com/photos/i-VdCPZTk/0/e0b15d46/M/i-VdCPZTk-M.jpg?resize=600%2C292&#038;ssl=1" width="600" height="292"  />

After a week of rumors, Microsoft has just [publicly announced](https://blogs.windows.com/windowsexperience/2018/12/06/microsoft-edge-making-the-web-better-through-more-open-source-collaboration/) that they will be adopting the [Chromium project](https://www.chromium.org/Home) for their Edge Browser.  They actually announced three things today:

  1. The Microsoft Edge browser will adopt the Chromium project
  2. Edge will no longer be released just for Windows 10, with updates limited to the latest version of Windows 10.  Edge will be available for Windows 7, Windows 8, and probably MacOS.
  3. Microsoft is joining the Chromium project and will be an active contributor.

What does that mean?

<img loading="lazy" class="aligncenter size-medium" src="https://i1.wp.com/i.imgflip.com/2ocl0y.jpg?resize=552%2C414&#038;ssl=1" width="552" height="414"  />  
This is A Good Thing

Chromium is an open source project that Google started.  It is the basis for the Google Chrome browser. For better or worse, Chrome is considered to be the standard that web developers use for measuring compatibility.  There are things that Edge handles better than Chrome.  Touch gestures and battery life are better on Edge.  Microsoft has done a lot of work on accessibility and assisted reading devices.

This does not mean that Edge and Chrome will be the same thing.  Microsoft will add their secret sauce to the new Edge browser.  Nothing has been announced yet, but I would guess that it have better ties to Office 365 and Azure services.  Also Edge will be the default browser that comes with Windows.  When you get a new Windows PC, installing Chrome will no longer have to be the first thing that you do.

With the releases on older versions of Windows and Mac, developers will have larger audiences that can run Edge.  Enterprise customers with long term support for Windows 7 or Windows 8 will have a browser that will be continued to be supported for their machines.  Mac users will have the same experience on Mac and PC.

Microsoft will be joining and contributing to the Chromium project on Github.  Over the last few years, Microsoft has been one of the [largest](https://www.infoworld.com/article/3253948/open-source-tools/who-really-contributes-to-open-source.html) [supporters](https://www.techrepublic.com/article/who-contributes-most-to-open-source-the-answers-will-definitely-surprise-you/) of Open Source and has been an active contributor for many projects.  If you use Edge, you will have a closer match to web standards.  If you use Chrome, then you&#8217;ll get the benefits that Microsoft will add to the code base.  A rising tide lifts all boats.

What does this mean to developers who were targeting Edge?

Edge currently uses a rendering engine called EdgeHTML.  It was designed to be faster and more compliant with W3C web standards over Internet Explorer.  It&#8217;s part of the Windows 10 OS and updates are issued as OS updates.  It was pretty compliant with W3C standards, but [Chrome was more compliant](https://html5test.com/compare/browser/edge-18/chrome-68.html).  Quality Assurance testers would have to run different tests to make sure that web apps ran the same way on Edge has it does on Chrome.  With both apps using the same parsing and rendering engine, web pages should look and run the same way with both browsers.

With the move to Chromium, the Javascript engine will change from [Chakra](https://github.com/Microsoft/ChakraCore) to [V8](https://chromium.googlesource.com/v8/v8.git).  Both are very good parsers and compilers, most web pages should have roughly the same performance with either engine.  There are runtime versions of each for [Node.js](https://medium.com/the-node-js-collection/modernizing-node-js-with-idiomatic-javascript-f18d984dcf93).  One question will be will Microsoft continue to support and advance Chakra or will they focus that effort on improving V8.

So when?

All Microsoft is saying is &#8220;early 2019&#8221; for the preview builds.  While Microsoft has not given out a release date, I would be on sometime in mid 2019.  This isn&#8217;t their first trip to this rodeo.  The Edge browser on Android is based on Chromium now, so they have some experience with the code base.  If you would like to get early access the next Edge, you can register for the [Microsoft Edge Insider program](https://www.microsoftedgeinsider.com/en-us/).