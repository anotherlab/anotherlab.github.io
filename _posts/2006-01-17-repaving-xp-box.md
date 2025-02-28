---
title: Repaving an XP box
date: 2006-01-17T19:52:00-05:00
---
I&#8217;m getting ready to help [repave](http://www.pcworld.com/resource/article/0,aid,119814,pg,1,RSS,RSS,00.asp) a family member&#8217;s PC (Windows XP). Too many [questionable things](http://en.wikiquote.org/wiki/Blade_Runner) have been installed and some nasty thing is blocking https pages and pages that lead to diagnostic tools. When something is actively blocking [Sysinternals](http://www.sysinternals.com/), then you know you have something malevolent on board. The usual suspects haven&#8217;t been able to clean it, so it&#8217;s time to [sanction](http://www.geocities.com/mattreigns/General/EigerSanction.htm) the spyware/hijackers/cruft with extreme prejudice. 

As part of the OS installation, I&#8217;m going to push to have the user accounts created with limited user access (LUA). That should help keep the nasties from getting a toehold again. There’s a good article on why you should do this on [Aaron Margosis’s](http://blogs.msdn.com/aaron_margosis/default.aspx) blog with a tool named [MakeMeAdmin](http://blogs.msdn.com/aaron_margosis/archive/2005/03/11/394244.aspx). This will let the users run as LUA, but with the ability to launch a command shell with admin rights. For more information on why you should run with LUA, check out the rest of Aaron’s posts, starting at the [top](http://blogs.msdn.com/aaron_margosis/archive/2005/04/18/TableOfContents.aspx). 

The Microsoft Solutions for Security and Compliance group (MSSC) has just released a white paper about the principles behind LUA, it’s a good starting place. You can download it from &#8220;<a href="http://www.microsoft.com/downloads/details.aspx?familyid=" displaylang="'en">Applying the Principle of Least Privilege to User Accounts on Windows XP</a>&#8221; or view it online right [here](http://www.microsoft.com/technet/prodtechnol/winxppro/maintain/luawinxp.mspx).

Scott Hanselman has a [checklist for the après repaving](http://www.hanselman.com/blog/pavingmymachineforafresh2006.aspx) before the machine is really usable. It&#8217;s geared for a dev type of box, but the concept can be applied to civilian uses. For dev boxes, Scott also has the [Ultimate Developer and Power User Tools List](http://www.hanselman.com/blog/scotthanselmans2005ultimatedeveloperandpoweruserstoollist.aspx), which is pretty cool.

Another good checklist is at [AngryPets.com](http://blog.angrypets.com/2006/01/ultimate_prefla.html), I like the idea of having base images to restore to. That would save a lot of time. CNet Australia has a [checklist](http://www.cnet.com.au/desktops/pcs/0,39029439,40057323,00.htm) for the top ten things to do before connecting to the Internet. Oddly enough, I couldn&#8217;t find that article on their US site.

If the repaving goes relatively painless, I may do the same for my home PC. It&#8217;s slowly filling up with more cruft. On the other hand, it&#8217;s running just fine so I probably wont repave until something seriously [breaks](http://en.wikipedia.org/wiki/blue_screen_of_death). 

Technorati Tags: <a href="http://technorati.com/tag/XP" rel="tag">XP</a> <a href="http://technorati.com/tag/LUA" rel="tag">LUA</a> <a href="http://technorati.com/tag/Repaving" rel="tag">Repaving</a>

[edited on 1/19/06 and 2/7/06]
