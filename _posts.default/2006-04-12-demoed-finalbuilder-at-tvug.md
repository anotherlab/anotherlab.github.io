---
id: 316
title: Demoed FinalBuilder at TVUG
date: 2006-04-12T04:36:00-05:00
layout: post
guid: http://www.rajapet.com/?p=316
permalink: /2006/04/12/demoed-finalbuilder-at-tvug/
---
Last month I demoed [FinalBuilder](http://www.finalbuilder.com/finalbuilder.aspx) at [TVUG](http://www.tvug.net/site/1/default.aspx). That was an interesting experience. I have managed to spend my entire career without having to do a public presentation. I was supposed to do one at the &#8217;98 BorCon on QuickReport, but I got bumped by another presenter who wanted that glory. He did his presentation using a version of QuickReport that was not ready for prime time and he told me later (before he found out that I was the person that he bumped) that it was a very unpleasant experience.

But, as [Earl](http://www.nbc.com/My_Name_Is_Earl/) says, &#8220;That&#8217;s [Karma](http://en.wikipedia.org/wiki/Karma)&#8220;. I strayed enough from the topic. I&#8217;ve been using FinalBuilder for a couple of months now and I love it. FinalBuilder is an automated build and process management tool that is easy to use and extremely powerful. I use to build our applications and to deploy them to our QA environments. What I used to do with limited batch files, I now have a full IDE for design and powerful error handling. Plus reports and email notifications.

Shawn Gwin of TVUG asked me to do a presentation on FinalBuilder. I created a basic FinalBuilder project that would run from a non-networked laptop. It did the following:

  * Retrieved the latest source from [Visual Source Safe](http://ufies.org/archives/000482.html) for the sample project. In real life, I use [Vault](http://www.sourcegear.com/vault/), but for the purposes of this demo, VSS was [safe enough](http://www.google.com/search?hl=en&q=VSS+%2Bcorrupt) to use.
  * Read version number and other resource information from a file. I store the version number parts in a .ini file and include in source control. This makes it easy to control the version number in a multiple user environment.
  * Built that project with [Delphi](http://www.borland.com/us/products/delphi/index.html). TVUG is a .NET group, but for this demo, the actual compiler used really didn&#8217;t matter.
  * Create an installer for the application using [Wise for Windows](http://www.wise.com/wfwi.asp).
  * Sent an email to myself that the build was successful.
  * Created text and HTML versions of the build log.

This project had full error handling and enough smarts to only compile when the files had changed. All of this is easy to do with FinalBuilder, no scripts were written.

Since this was a user group presentation, I was bound by law to use a PowerPoint presentation. You can make the argument that Powerpoint is used [way](http://www.norvig.com/Gettysburg/sld001.htm) [too](http://www.presentations.com/presentations/delivery/article_display.jsp?vnu_content_id=1000482464) [much](http://www.stanford.edu/~holeton/edmedia/tsld001.htm), but since this was my first presentation ever, I needed all the support I could get. I ended up creating a basic PowerPoint deck to provide a frame of reference for the presentation. I&#8217;m not big on PowerPoint special effects, so I used no graphics and both colors (black and not black). As it ended up, I never used my presentation.

I emailed the FinalBuilder people and told them I was doing a presentation and asked if they had any tips. They promptly sent back a few suggestions and a nicely PowerPoint deck to use. I started off with their presentation and then went straight into my demo project and walked through each line for the group.

The group. This was not a well attended presentation. I believe that there may have been nearly 10 people total. Of that 10, maybe 5 people had any real interest or understanding of what they could use FinalBuilder for. That was kind of a letdown. I don&#8217;t know if that was just a bad month or if the people that usually come had no interest in a build tool.

<div>
  Tech Tags: <a href="http://technorati.com/tag/FinalBuilder" rel="tag">FinalBuilder</a> <a href="http://technorati.com/tag/TVUG" rel="tag">TVUG</a> <a href="http://technorati.com/tag/Vault" rel="tag">Vault</a> <a href="http://technorati.com/tag/VSS" rel="tag">VSS</a> <a href="http://technorati.com/tag/Delphi" rel="tag">Delphi</a> <a href="http://technorati.com/tag/WFW" rel="tag">WFW</a>
</div>