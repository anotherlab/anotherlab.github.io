---
id: 512
title: Sharing the Hintpath with multiple programmers
date: 2005-03-15T16:45:00-05:00
layout: post
guid: http://www.rajapet.com/?p=512
permalink: /2005/03/15/sharing-hintpath-with-multiple/
---
At work we are going from being a Delphi-centric shop, to a Delphi and .NET shop. To say that has been a bit of a learning curve going from Delphi to C#. Just learning the IDE is a substantial task. One problem we had was with shared code assemblies having different paths on each programmer&#8217;s machine. In the .csproj file, the assembly&#8217;s hintpath was set to an absolute and that wasn&#8217;t going to work.

I tried creating an environment variable and editing the hintpath to use that, a nice feature of Delphi 7. But, that didn&#8217;t work and I couldn&#8217;t find any obvious way of handling this in the IDE.

Google to the rescue! After a quick search, I found a blog posting [VS.NET and hintpath problems&#8230;](http://weblogs.asp.net/soever/archive/2005/01/19/355922.aspx) on Serge van den Oever&#8217;s blog. This little trick did the job.

> <span>A fix to this is setting a registry entry to the folders with shared assemblies, if the assembly can&#8217;t be found, this path is checked. Add a key with any name to<br /><strong>HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\VisualStudio\7.1\AssemblyFolders</strong>, and set its (Default) value of type REG_SZ to the path with your assemblies.</span>