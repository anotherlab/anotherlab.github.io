---
id: 268
date: 2007-01-08T18:39:00-05:00
layout: post
guid: http://www.rajapet.com/?p=268
permalink: /2007/01/08/about-year-ago-i-put-together-pc-to/
---
[<img src="https://i0.wp.com/2.bp.blogspot.com/_natoSxTaPFU/RaKiRwzaw7I/AAAAAAAAAAM/8eZFGHVsGd4/s200/reenactors.jpg?w=680" alt="" border="0" data-recalc-dims="1" />](https://i2.wp.com/2.bp.blogspot.com/_natoSxTaPFU/RaKiRwzaw7I/AAAAAAAAAAM/8eZFGHVsGd4/s1600-h/reenactors.jpg)

About a year ago, I put together a PC to automate all of our QA-Ready and production builds. We don&#8217;t have a huge number of applications to build, but I wanted an automated way to build each application. Before &#8220;Build Box&#8221;, each project had one developer who was reponsible for the build. 



This worked, but it had some serious limitations:



</p> 

  1. It relied on a developer&#8217;s machine to the build, which meant it required access to that developer. If he/she wasn&#8217;t there, the team lead had to make sure that the machine would be accessable.
  2. Nothing was automated, no two products were built the same way. This opens the door wide open for mistakes like not having the current source code. 
  3. Making a build was a major disruption for the developer who earned the build. This limited the number builds that would get buillt a day or week.



We use [FinalBuilder](http://www.finalbuilder.com/ "FinalBuilder home page") to drive the build process. I can not say enough good things about FinalBuilder. It Just Works. With FinalBuilder, we use the following pattern to build each product:



</p> 

  1. Get the latest source code. We use [Vault](http://vaultthemovie.com/ "Coolest trailer for a piece of software"), FinalBuilder knows how to drive Vault.
  2. Build the version information from .ini files stored in source control. With FinalBuilder, this was the easiest way to update the version number for the files. By alloing FinalBuilder to control the version resources, we can use the same mechanism for Win32 builds and for .NET builds
  3. Build the actual project or projects.
  4. Create updated installers. We use both the scripted and Windows Installer installer tools from Wise, FinalBuilder plays well with both. The only party of installer building that I can&#8217;t automate, is the code to deal with upgrades in place. With Windows Installer technology, I need to handle that myself. That only happens once per product release, it&#8217;s liveable.
  5. Deploy the latest bits to the QA server. QA gets two copies of everything. The first copy has the final filename, the second has the build number appended (ie. something_278.exe) to it.
  6. Send out an email to QA and the developers that notifies them that a new build has been released.



Now, any developer can remotely connect to the buildbox and start the build process. Of the course the fun part is getting the buildbox setup in the first place. It&#8217;s like having another developer on the team, it gets everything installed. 



<div>
  Tech Tags: <a href="http://technorati.com/tag/Delphi" rel="tag">Delphi</a> <a href="http://technorati.com/tag/VS+Studio" rel="tag">VS+Studio</a> <a href="http://technorati.com/tag/FinalBuilder" rel="tag">FinalBuilder</a> <a href="http://technorati.com/tag/Build+Box" rel="tag">Build+Box</a> <a href="http://technorati.com/tag/Vault" rel="tag">Vault</a> <a href="http://technorati.com/tag/Wise" rel="tag">Wise</a>
</div>