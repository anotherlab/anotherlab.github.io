---
title: File sharing with Vista Home without passwords
date: 2007-07-24T03:52:00-05:00
---
After having several PC implosions, we now have two new Vista boxes at home. Both have Vista Home Premium installed. I&#8217;m used to the relative stability of XP Pro, but I figured I would give Vista a shot. For the most part it has gone very well, but I made sure that each machine was going to be able to run Vista.

My machine is a [custom built box](http://anotherlab.rajapet.net/2007/05/time-to-get-new-pc.html) from [MWave](http://www.mwave.com/mwave/index.hmx?), my wife&#8217;s is a Dell box. She has Intel, I have AMD, but they are both dual core machines with 2GB of RAM and decent video cards.

My wife and my kids have user accounts with out passwords. The machine has the usual security apps installed and is behind a router firewall. Their accounts are set as Standard User. I have a password protected admin account on each box. My wife has a Standard User account on each box.

We share a printer from my machine. I could print from my wife&#8217;s PC, but she couldn&#8217;t. She kept getting a login pass prompt and finally an error message about being able to validate credentials. It took a little while to figure out, but finally I remembered that out of the box, Vista wont let non-password protected accounts from remotely authenticating. That means that you need a password on your account to access network resources on another Vista box.

A fair amount of [Googling](http://en.wikipedia.org/wiki/Google_%28verb%29) kicked up a few [suggestions](http://forums.techguy.org/windows-vista/542469-folder-sharing-issues.html) to run gpedit.msc ([Group Policy](http://en.wikipedia.org/wiki/Group_Policy) Editor). Most of the suggestions were of this type:

> Run gpedit.msc  
> Go to Computer Configuration / Windows Settings / Security Settings / Local Policies / Security Options  
> Double click on Accounts: Limit local account use of blank passwords to console login only  
> Disable this option

One little problem. You only get gpedit.msc with XP Pro or Vista Business (or Ultimate). Thanks for playing the Home version of Windows, you don&#8217;t get that useful little utility.

Fortunately for this setting all gpedit.msc is doing is writing to the registry. All you have to do is to edit the following key:

HKEY\_LOCAL\_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa

and edit the value of LimitBlankPasswordUse from 1 to 0. After you do that, you can now share printers and folders across Vista (and XP) with accounts that do not have passwords.



<span>Updated on 8/15/2008</span>  
If you install Service Pack 1 (SP1) after making this change, you&#8217;ll need to do it again as SP1 restores this setting back to the default.



<div>
  Tech Tags: <a href="http://technorati.com/tag/Vista+Home%20Password%20Sharing%20Printing%20gpedit.msc%20LimitBlankPasswordUse" rel="tag">Vista+Home Password Sharing Printing gpedit.msc LimitBlankPasswordUse</a>
</div>
