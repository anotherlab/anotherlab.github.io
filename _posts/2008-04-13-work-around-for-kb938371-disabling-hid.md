---
title: Work around for KB938371 disabling HID-compliant input devices
date: 2008-04-13T20:23:00-05:00
---
After a few days of non-working mice, someone found a work around for KB938371. As I noted [here](http://anotherlab.rajapet.net/2008/04/vista-update-kb938371-disabled-my-mouse.html "Vista update KB938371 disabled my mouse") and [here](http://anotherlab.rajapet.net/2008/04/kb-938371-woes-continue.html "KB 938371 woes continue"), [Vista Update 938371](http://support.microsoft.com/kb/938371) disabled two the three mice I have I on my main home machine. Here&#8217;s the work around that actually worked for me:

  * <span><span>Just go to device manager -> HID-devices -> Unknown Device and search for drivers. </span></span>
  * <span><span>When prompted for how to search for driver software, select &#8220;Browse my computer for driver software&#8221;</span></span> 
  * <span><span>Enter &#8220;C:\windows\winsxs&#8221; for the driver location and press the &#8220;Next&#8221; button.</span></span> 
  * <span><span>If you get a </span></span><span><span>popup saying &#8220;this is an unsigned driver&#8230;&#8221;, just allow Windows to install the driver.</span></span>

<span><span>At this point, Windows should select the appropriate driver and your mouse will start working again.  When I tried this, only had one of the non-working mice plugged in.  When I followed those steps, the mouse started working.  I plugged the other mouse in and Windows enabled it without any prompting.</span></span>

<span><span>I went in to Device Manage and both mice were listed as &#8220;HID-compliant mouse&#8221; under &#8220;Mice and other pointing devices&#8221;.  Just to be safe, I selected one the mice, right-clicked into &#8220;Properties, selected the &#8220;Driver&#8221; tab on the dialog that opened up.  I clicked the &#8220;Driver Details&#8221; button and the mouse was using mouclass.sys and mouhid.sys drivers, located in c:\windows\system32\drivers, which is what they were supposed to be using.</span></span>

<span><span>This tip was originally posted <a title="Eggheadcafe.com:  Vista32, new driver? &#038; USB Mouse/Keyboard not working - SergeyEgoro" href="http://www.eggheadcafe.com/software/aspnet/31997463/vista32-new-driver--us.aspx">here</a> and I came across it <a title="MSDN Forums: Re: Vista bites... again" href="http://forums.microsoft.com/forums/showpost.aspx?postid=3165124&#038;siteid=1&#038;sb=0&#038;d=1&#038;at=7&#038;ft=11&#038;tf=0&#038;pageid=1">here</a>.  I&#8217;m happy that I have my mouse functionality back, but how did this get past Microsoft&#8217;s testing?  I saw too many people reporting this, it&#8217;s not an isolated case.  I have a mouse that comes with my Wacom table that wasn&#8217;t affected by this snafu, but what about the people who just had regular USB mice?  They were/are pretty much screwed by an update that can&#8217;t be uninstalled with running System Restore.  </span></span>

<span><span>I still want to know what happened and why 938371 toasted my HID-compliant hardware.  Was there something broken already with my Vista installation and 938371 was just a symptom of the problem, or did 938371 actually break something?</span></span>

<span><span>I&#8217;m not allowing MS to automatically update my PC anymore.  That requires a certain level of trust that MS is going to push down updates that will be beneficial.  They just blew that trust.  I&#8217;ll take the updates, but I&#8217;m going to decide if and when they get installed.</span></span>

<span><span>I was asked offline why I have three mice.  It&#8217;s pretty simple (almost makes sense).  My day to day mouse is a <a title="MX™700 Cordless Optical Mouse" href="http://www.logitech.com/index.cfm/428/909">Logitech MX™700</a>.  It&#8217;s a cordless mouse that uses rechargeable batteries.  It&#8217;s been the best mouse that I have ever used and I continue to use it under Vista even though Logitech never ported the MX700 drivers to Vista.  It has a little dock that charges the batteries.  I almost always forget to put the mouse back in it&#8217;s dock and a every few days, the batteries give out.  When that happens, I place it back in it&#8217;s dock and use a Dell USB optical mouse while the MX700 is charging.   The third mouse is a digitizer mouse that comes with my <a href="http://www.wacom.com/bambootablet/bamboofun.cfm">Wacom Bamboo Fun tablet</a>.  That mouse works, but only on it&#8217;s little pad.  It was OK enough to use while tracking down this problem, but I wouldn&#8217;t want it to be my everyday mouse.</span></span>

**Update: 2/22/2010**  
I repaved this machine with Windows 7 about 6 months ago and replaced the MX700 with a Logitech mouse that is supported under Windows 7.  For anyone that is still having this problem, consider Windows 7.  It’s much nicer than Vista.
