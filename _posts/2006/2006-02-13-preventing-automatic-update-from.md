---
title: Preventing Automatic Update from rebooting your machine
date: 2006-02-13T17:51:00-05:00
---
> Here&#8217;s how to prevent Automatic Update from rebooting your machine:
> 
> </p> 
> 
>   1. Start -> Run 
>   2. Type: gpedit.msc 
>   3. Expand Local Computer Policy / Computer Configuration / Administrative Templates / Windows Components / Windows Update 
>   4. Double-click &#8220;No auto-restart for scheduled Automatic Updates installations&#8221; 
>   5. Select &#8220;Enabled&#8221;, then OK. Close the Group Policy configuration  
>     program.
> 
> Fine print: 
> 
> </p> 
> 
>   1. You need Administrator priveleges to make this setting.
> 
> 
>   2. Some people complained that [Windows ignored the &#8220;no auto-restart&#8221; setting for the WMF patch](http://www.emailbattles.com/archive/battles/vuln_aacfhddccc_de/). Potentially a [ID 10T](http://en.wikipedia.org/wiki/Id10t) error, though. 
> 
> From [[JonGalloway.ToString()]](http://weblogs.asp.net/jgalloway/archive/2006/02/11/438009.aspx "[tip] Prevent Windows Automatic Updates from rebooting your computer")

In the comments, there was another good tip for Windows Server 2003: Under Administrative Templates / System right-click on &#8220;Display Shutdown Event Tracker&#8221; and select properties. Select Disabled to prevent Windows from asking for a reason why you are shuting down Win2003 Server.
