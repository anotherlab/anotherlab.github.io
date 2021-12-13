---
id: 400
title: Just say no to CLR UDTs
date: 2005-10-20T20:21:00-05:00
layout: post
guid: http://www.rajapet.com/?p=400
permalink: /2005/10/20/just-say-no-to-clr-udts/
---
Alex Papadimoulis is pretty adamant about <a href="http://weblogs.asp.net/alex_papadimoulis/archive/2005/10/20/428014.aspx" title="" when should i use sql-server clr user definied types>not using CLR UDTs in SQL Server 2005</a>.

> 
> 
> No one has asked me that question just yet [**&#8220;When Should I Use SQL-Server CLR User Definied Types (UDT)?&#8221;**], but with the release of SQL Server 2005 just around the corner, I&#8217;m sure a handful of people will. Unlike regular [User Defined Types](http://weblogs.asp.net/alex_papadimoulis/archive/2005/10/07/426930.aspx), CLR UDTs are a new feature of SQL Server 2005 that allows one to create a .NET class and use it as a column datatype. As long as a [few requirements](http://msdn2.microsoft.com/en-us/library/ms131082) are followed, one can create any class with any number of properties and methods and use that class as a CLR UDT. 
> 
> Generally, when a new feature is introduced with a product, it can be a bit of a challenge to know when and how to use that feature. Fortunately, with SQL Server&#8217;s CLR UDTs, knowing when to use them is pretty clear: 
> 
> **Never.** 
> 
> Let me repeat that. Never. You should never use SQL Server CLR User Defined Types. I&#8217;m pretty sure that this answer will just lead to more questions, so allow me to answer a few follow-up questions I&#8217;d anticipate. 
> 
> 

The full article can be read <a href="http://weblogs.asp.net/alex_papadimoulis/archive/2005/10/20/428014.aspx" title="" when should i use sql-server clr user definied types>here</a>. Another reason to take a pass on CLR UDTs is that it ties your database to SQL Server 2005. If you are doing an app that can run on SQL Server 2000, you [just shot yourself in the foot](http://www.m5p.com/~pravn/foot.html).

Another reason to avoid CLR UDTs? Eliminating error messages like  [&#8220;File or assembly name udtname, Version=1.2.0.0, Culture=neutral, PublicKeyToken=389619d4c1235f8a, or one of its dependencies, was not found.&#8221;](http://blogs.msdn.com/angelsb/archive/2004/09/09/227713.aspx)