---
id: 485
title: 'Eric Gunnerson&#8217;s C# Compendium : Visual Studio Debugging Slowness &#8211; Solved'
date: 2005-04-25T17:08:00-05:00
layout: post
guid: http://www.rajapet.com/?p=485
permalink: /2005/04/25/eric-gunnersons-c-compendium-visual/
---
[Eric Gunnerson&#8217;s C# Compendium : Visual Studio Debugging Slowness &#8211; Solved](http://blogs.msdn.com/ericgu/archive/2005/04/22/410901.aspx)  
  
It looks like if you have an invalid directory in the &#8220;debug source files&#8221; list, the VS.NET debugger may get very sleepy. The work around is to make sure that the list does not have any invalid directories.