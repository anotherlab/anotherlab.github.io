---
id: 327
title: Viewing local XML files with IE without that idiot warning
date: 2006-01-26T05:38:00-05:00
layout: post
guid: http://www.rajapet.com/?p=327
permalink: /2006/01/26/viewing-local-xml-files-with-ie/
---
To take a quick peek at an XML file, Internet Explorer is what I usually use. It knows how to properly format the display and allows you to close and open the nodes. It does have it&#8217;s quirks. When you open up an XML file, IE will probably display the following warning:

> To help protect your security, Internet Explorer has restricted this file from showing active content that could access your computer. Click here for options&#8230;

This appears in the Information Bar when the active content is blocked from running in the Local Computer zone. This was added to XP with SP2 as part of Microsoft&#8217;s security initiative. While this is generally a good thing, I do find it annoying. I spent a lot of time viewing XML recently while working on a C# service to collect GPS data from several vendors. I was tracking down a discrepancy with a live feed and this warning became a distraction. After solving the actual problem with the GPS feed, I moved on to the next item and forgot about the warning message.

Tonight I attended a great WSE 3.0 session at [TVUG](http://www.tvug.net/). The presenter was [Julie Lerman](http://www.thedatafarm.com/blog/) and she did a great job and I learned a few things. But that&#8217;s another blog entry to come. While demonstrating how the XML logging works, she would display the XML output files through IE. She kept getting the warning message in Information bar and asked if anyone knew how to get rid of it. After a little [googling](http://groups.google.com/groups?hl=en&lr=&safe=off&c2coff=1&q=%22internet+explorer+has+restricted+this+file%22+local+xml&safe=off&qt_s=Search), I found out how to disable that message.

Select &#8220;Internet Options&#8221; from the IE &#8220;Tools&#8221; menu. Select the &#8220;Advanced&#8221; tab, and scroll down to Security and check the box &#8220;Allow active content to run in files on My Computer&#8221; and click the &#8220;Apply&#8221; button. And if [Bob&#8217;s your uncle](http://www.bobsyouruncle.com/whosbob.htm "something Jerry Pournelle uses a lot"), you will no longer see that particular warning message. For the curious, MS has a detailed list of the Information Bar messages as KB article [843017](http://support.microsoft.com/kb/843017).