---
title: Windows Live Writer change from beta to 1.0 that affects plugin development
date: 2008-01-04T04:38:00-05:00
---
I&#8217;ve been working on a [SmugMug](http://www.smugmug.com/) [plugin](http://msdn2.microsoft.com/en-us/library/aa738863.aspx "MSDN: Windows Live Writer Content Source Plugins") for [Windows Live Writer](http://get.live.com/writer/overview "Windows Live Writer is a desktop application that makes it easy to publish rich content to your blog.") on and off for the last few months.  The code is nearly complete, some other things came up and I had to put that code a way for a while.  Now I&#8217;m back on the code and I&#8217;m almost done.  While I was off doing other things, two things changed in my development environment.

The first change was the release of VS 2008.  I moved the code from VS 2005 to VS 2008 without any issues.  The other change that Live Writer left beta and there were some folder changes.  Your plugin code needs to reference the WindowsLive.Writer.Api.dll assembly.  The beta version lived in &#8220;C:\Program Files\Windows Live Writer\WindowsLive.Writer.Api.dll&#8221; and the release version lives in &#8220;C:\Program Files\Windows Live\Writer\WindowsLive.Writer.Api.dll&#8221;.  It&#8217;s a subtle path change, enough where you wont catch it at first glance.

If you were using the Post-build event command line to deploy your plugin for testing, make sure that you are copying to &#8220;&#8230;Windows Live\Writer\plugins&#8221; and not &#8220;&#8230;Windows Live Writer\plugins&#8221;.

The [SmugMug API](http://wiki.smugmug.com/display/SmugMug/API) rocks.  Having written and consumed various web services in different incarnations, I&#8217;ve very impressed with the layout and functionality exposed by the SmugMug API.</p> 

<div>
  Tech Tags: <a href="http://technorati.com/tag/SmugMug%20API%20Windows+Live+Writer%20plugin" rel="tag">SmugMug API Windows+Live+Writer plugin</a>
</div>
