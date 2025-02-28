---
id: 367
date: 2005-11-16T20:18:00-05:00
layout: post
guid: http://www.rajapet.com/?p=367
permalink: /2005/11/16/that-pesky-sql-server-express/
---
That pesky SQL Server Express. I&#8217;m going to have to support it, it&#8217;s time to start collecting tips from the veterans&#8230;. 

> 
> 
> _These problems left me stranded for days, then today, on another machine, I hit a different set of problems I kept getting the following &#8220;Failed to generate user instance of SQL Server due to a failure in starting the process for the user instance. The connection will be closed.&#8221; and if I set &#8220;User Instance&#8221; to false the following &#8220;An attempt to attach an auto-named database for file C:\[app_path]\ASPNetDB.mdf failed. A database with the same name exists, or specified file cannot be opened, or it is located on UNC share.&#8221;_ 
> 
> _.._
> 
> _If you don&#8217;t want to follow the_ [_link_](http://forums.microsoft.com/msdn/showpost.aspx?postid=98346&siteid=1)_, the short answer is that SQLExpress creates a directory per user in &#8220;c:\Documents and Settings\[user]\Local Settings\Application Data\Microsoft\Microsoft SQL Server Data\SQLEXPRESS&#8221; that it uses to store information. Deleting this directory has fixed both of my problems.  
>_ [[from Enjoy Every Sandwich]](http://sqljunkies.com/WebLog/ktegels/archive/2005/11/15/17401.aspx "A fix for that annonying per-user instance problem with SQLExpress")