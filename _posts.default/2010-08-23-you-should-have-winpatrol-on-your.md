---
id: 54
title: You should have WinPatrol on your system
date: 2010-08-23T18:10:00-05:00
layout: post
guid: http://www.rajapet.com/?p=54
permalink: /2010/08/23/you-should-have-winpatrol-on-your/
---
You really should have [WinPatrol](http://www.winpatrol.com/) installed on your system.  It’s a service type of application that monitors changes to your system.  For example, if an app tries to register a web browser toolbar, WinPatrol will warn you and give you a chance to block it.  There’s a free version and a paid version.  The free version is very good, but you’ll want the paid version.  It’s [very affordable](http://winpatrol.stores.yahoo.net/winplusmemre.html) and will keep your machine from being bogged down with [crapware](http://www.urbandictionary.com/define.php?term=crapware) and suspicious processes.  WinPatrol is written and supported by [Bill Pytlovany](http://billpstudios.blogspot.com/), a well known Windows security professional.

I just installed the [MyHeritage](http://www.myheritage.com/) [Family Tree Builder](http://www.myheritage.com/family-tree-builder) desktop application on my main development box.  I’ve been using FTB for a few years on our shared family PC.  It’s a nice genealogy application that I have used to to publish my mother’s family tree online.  The technology is very cool and I will get back to describing it in more depth.

When I installed the FTB app, the installer asked if I wanted to change the default search provider to one provided by MyHeritage and to install a MyHeritage toolbar into Internet Explorer.  I declined both options.  I have IE set to use [Bing](http://www.bing.com/) as the default search provider and I didn’t want to change it.  I also did not want to install any toolbars into IE.

I avoid IE toolbars like they are [the plague](http://www.facebook.com/note.php?note_id=292056523469).  They eat up screen real estate, slow down the browsing experience, are the [root cause of 70% of the browser crashes](http://arstechnica.com/microsoft/news/2010/04/add-ons-responsible-for-70-percent-of-ie8-crashesadd-ons-responsible-for-70-percent-of-ie8-crashes.ars "ars technica: Add-ons responsible for 70 percent of IE8 crashes"), and cause cancer in lab rats.  So I declined that option and installed FTB.  And the installer ignored my choices and tried to change the search provider and install their toolbar anyways. I don’t know if that was sloppy coding and testing on their part or it was intentional.  Either way, that wasn’t what I wanted.

How did I know this?  Because WinPatrol was doing it’s job and warned me about each change.  I saw a dialog that looked remarkably like this:

[<img loading="lazy" alt="WinPatrol1" border="0" height="305" src="https://i0.wp.com/lh4.ggpht.com/_natoSxTaPFU/THK4lpbDBJI/AAAAAAAAAeQ/GNHFAU_3scY/WinPatrol1_thumb%5B1%5D.png?resize=644%2C305" title="WinPatrol1" width="644"   />](https://i0.wp.com/lh4.ggpht.com/_natoSxTaPFU/THK4lYVkJNI/AAAAAAAAAeM/J0NPo-PAmQA/s1600-h/WinPatrol1%5B3%5D.png)

Scotty (the mascot and public face of WinPatrol) caught the attempt of the installer to register a new toolbar.  The “New Program Alert” dialog will display enough information about the pending change to your system that you can usually make a quick and informed decision on whether or not to block it.  If you see something you don’t recognize, clicking the “PLUS <u>I</u>nfo…” dialog will take you to a WinPatrol web page that will display more information about the object being installed.

Without WinPatrol, I would not have caught either change until the next time I started Internet Explorer.  With the MyHeritage stuff, it wasn’t malicious code, but it was code that I didn’t want to run.  And thanks to WinPatrol, it wasn’t going to run. I was able to prevent changes being made to IE, and that’s worth the price of admission.

Monitoring changes to IE is not the only thing in WinPatrol’s arsenal.  It gives you an easy way to see what apps are set to start when the computer boots up and the means to block them.  If you computer seems to be running slower and slower each day, the odds are you picked up some process that run in the background.  Most of them are pretty harmless, but when you start adding them up, they will show down your PC.  WinPatrol has an online database and can identify most of them and tell you if you should keep them running or block them.