---
id: 121
title: Why www.nbc.com wont load with IE7 on Vista (and how to get around it)
date: 2008-08-11T16:59:00-05:00
layout: post
guid: http://www.rajapet.com/?p=121
permalink: /2008/08/11/why-wwwnbccom-wont-load-with-ie7-on/
---
My kids wanted to watch the Olympic swimming events going on in Beijing.  Since NBC is streaming all the venues, I figures I would just fire up the web browser and wander over to [www.nbc.com](http://www.nbc.com/).   We have a “family” pc that everyone can use and it runs Vista Home Premimum (32-bit), with Service Pack 1 installed.  Since I knew that NBC was going to be using the Microsoft stack with Silverlight to stream the video, I figured I would have the least amount of headaches with Internet Explorer 7.  Wrong!

When I entered in [http://www.nbc.com](http://www.nbc.com/) into IE, I got the following error: “Internet Explorer cannot display the webpage”.  I figured I mistyped the URL, that wasn’t it.  Out of the relatively small combinations that the letters N, B, and C can be arranged, I did have the right URL.  Could it be that NBC.com was done?  Nope, I tried “ping –n 1 www.nbc.com” and received the following</p> 

<pre>Pinging a1669.g.akamai.net [128.242.186.219] with 32 bytes of data:                               <br />                                                                                                  <br />Reply from 128.242.186.219: bytes=32 time=44ms TTL=55                                             <br />                                                                                                  <br />Ping statistics for 128.242.186.219:                                                              <br />    Packets: Sent = 1, Received = 1, Lost = 0 (0% loss),                                          <br />Approximate round trip times in milli-seconds:                                                    <br />    Minimum = 44ms, Maximum = 44ms, Average = 44ms                                                 <br /></pre></p> 

That tells us that their site is live and responding to requests.  Just for giggles, I launched FireFox 3 and entered in the URL.  Sure enough, that worked just fine.  What was the problem with nbc.com and IE7?  I did a search with Google (and Yahoo for a change of pace) and saw that a number of people were reporting the same problem.  No one knew the cause and the only resolution was “just use Firefox”.  Normally, that would be an acceptable answer for me.  Today, I’m feeling a bit cranky and I want to know what the problem is between nbc.com and IE7.  The odds are it’s something trivial on the nbc,com side.  We haven’t had any problems with IE7 on Vista before.

I did notice that a lot of people reporting the problem had Tablet PC’s. I don’t have a Tablet PC, it’s just an plain ol’ Dell desktop.  But I did install a <a href="http://www.wacom.com/bambootablet/bamboofun.cfm" target="_blank">Wacom Bamboo tablet</a> and installing it’s drivers did activate some user input functionality in Vista that wasn’t there before.  Why would this affect the browser?  As it turns out, when Vista thinks it’s now a Tablet PC the <a href="http://en.wikipedia.org/wiki/User_agent" target="_blank">user agent</a> string sent by IE changes.

Here’s the typical user-agent string sent by IE7 for various operating systems.

For Windows XP SP2: **Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1) </p> 

</strong>For Windows 2003 Server: **Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2) </p> 

</strong>For Windows Vista: **Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)**

Note, these are the base strings, different applications can change or add to these values.  On my machine, the user agent has some information:

Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; .NET CLR 3.5.21022; **Tablet PC 2.0**; Creative ZENcast v2.01.01)

That says that I’m running IE7 on Vista, with .NET 2, 3, and 3.5 installed.  Media Center extension are installed, it thinks it’s a Tablet PC, and I have Creative’s Zencast (a podcast download app).

Notice the text in bold, “Table PC 2.0”.  When that text is submitted to [www.nbc.com](http://www.nbc.com/) as part of the user agent, the website is doing some sort of re-direct that is failing.  So we have what appears to the cause of the problem, now how do we fix it.  I tried faking out the user agent string with a download from Microsoft called the <a title="User Agent String Utility version 2" href="http://www.microsoft.com/downloads/details.aspx?familyid=9517db9c-3c0d-47fe-bd04-fad82a9aac9f&#038;displaylang=en" target="_blank">User Agent String Utility</a>, version 2.  Don’t event bother with that one.  It opens up a new browser window that has been tweaked to report itself as IE 6.0 but that’s the only part of the user agent string that gets modified.  It still uses “Table PC 2.0”, so the problem still remains. 

In theory, you can edit the list of items that get tacked on the user agent string by hacking at the registry.  With IE7, the list of fields added to the user agent string are defined as REG_SZ values in **HKEY\_LOCAL\_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\User Agent\Post Platform**.  I tried removing “Tablet PC 2.0” from the list, but the OS kept putting it back in.  Plus, we really shouldn’t have to modify our systems, the problem is due to [www.nbc.com](http://www.nbc.com/) not <a href="http://en.wikipedia.org/wiki/User_agent#User_agent_sniffing" target="_blank">sniffing</a> the user agent string correctly.

I did a little searching on the Internet and I found a working solution <a href="http://forum.tabletpcreview.com/showthread.php?p=117967" target="_blank">here</a>.  Instead of using [www.nbc.com](http://www.nbc.com/) as the starting URL, use [www.nbci.com](http://www.nbci.com/).  That site bypasses the user agent check and it allowed me to the live feeds of the Olympic events.  A very simple solution, but a typical home user would never figure it out on his own and just blame Vista for it.