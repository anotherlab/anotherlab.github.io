---
id: 363
title: 'Why you wont find C# example code for writing Shell Extension handlers'
date: 2005-11-21T14:59:00-05:00
layout: post
guid: http://www.rajapet.com/?p=363
permalink: /2005/11/21/why-you-wont-find-c-example-code-for/
---
Jesse Kaplan posted [the following](http://forums.microsoft.com/MSDN/ShowPost.aspx?PostID=125283&SiteID=1) (thanks to [Junfeng Zhang](http://blogs.msdn.com/junfeng/default.aspx "Junfeng Zhang's .Net Framework Notes"))

> _Writing in-process \shell extensions in managed code is actually a very dangerous thing to do because it has the effect of injecting your managed code (and the .NET Framework) into every application on the machine that has a file open dialog.</p> 
> 
> The problems occur because only one version of the .NET Framework can be loaded in a process at any given time (other shared components such as java and msxml have the same property and thus the same restriction).
> 
> If you write your shell extension using the 2.0 .NET Framework and an application built with the 1.1 .NET Framework uses a file open dialog, your shell extension will fail because it can not run on an earlier version. Things can get even worse if your shell-extension manages to get loaded in a process before another applications managed code does: your extension may force an existing application onto a different runtime version than the one it was expecting and cause it to fail.
> 
> Because of these problems we strongly recomend against using any single-instance-per-process runtime or library (such as the .NET Framework, java, or msxml) in an in-process shell extension.</i> </blockquote>