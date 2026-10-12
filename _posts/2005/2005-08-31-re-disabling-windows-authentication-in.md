---
title: 'RE: Disabling Windows Authentication in Visual Studio 2005&#8217;s built-in ASP.NET server'
date: 2005-08-31T17:15:00-05:00
---
File this one away&#8230;

> Here&#8217;s a handy trick I learned today after attempting to test my ASP.NET site in Opera and found it wouldn&#8217;t work.
> 
> 
> 
> Opera does not ship with support for Windows Authentication (NTLM). By default, Visual Studio 2005&#8217;s ASP.NET Development Server demands that you authenticate with Windows Authentication. To disable this requirement, do the following:
> 
> 
> 
> </p> 
> 
>   1. In **Solution Explorer**, right-click on your Web Application&#8217;s project node and select **Property Pages** 
>   2. Under the **Start Options** node, uncheck **NTLM Authentication** and click **OK**
> 
> 
> 
> And that&#8217;s it! This also has the effect of removing that annoying authentication dialog in Firefox.
> 
><img loading="lazy" src="http://davidkean.net/aggbug/1167.aspx" width="1" height="1" /> 

_[Via [Managed from down under](http://davidkean.net/archive/2005/08/31/1167.aspx)]_
