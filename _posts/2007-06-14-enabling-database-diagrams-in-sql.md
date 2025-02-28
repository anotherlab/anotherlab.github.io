---
title: Enabling Database Diagrams in SQL Server 2005
date: 2007-06-14T18:23:00-05:00
---
I was working on a spec for a new feature in our flagship [application](http://www.versatrans.com/products/versatrans_rp.cfm "VersaTrans RP"), when I wanted to included some simple database diagrams.  I was adding some new schema and I wanted to reference them in the spec.  I figured I would just do the schema changes in a spare database and make a database diagram.

I opened up MS SQL Server Management Studio (SSMS)) and connected to the database on a box running SQL Server 2000.  I selected the database and then selected &#8220;Database Diagram&#8221;.  SSMS got huffy about how the database diagrams in 2000 were nothing like the feature in 2005 and it wouldn&#8217;t touch it.  Gee thanks,  Microsoft.  The SQL Server team should have borrowed [Raymond Chen](http://www.microsoft.com/technet/technetmag/issues/2006/10/WindowsConfidential/) for a while.  That wouldn&#8217;t have happened on his watch.

I connected to a SQL Server 2005 box and made my schema changes in a scrap database.  I selected database diagram and got a lovely error dialog with the following message:

> Database diagram support objects cannot be installed because this database does not have a valid owner.  To continue, first use the Files page of the Database Properties dialog box or the ALTER AUTHORIZATION statement to set the database owner to a valid login, then add the database diagram support objects.

So I took the error message literally and took a peek at the owner.  I was the owner, and I have admin rights on that box. [Insert [annoyed grunt](http://en.wikipedia.org/wiki/D'oh!) here].  So I tried making sa to the owner, same error.  That obviously wasn&#8217;t the problem.

After a wee bit of [googling](http://news.bbc.co.uk/2/hi/uk_news/3006486.stm), I came across the [root cause](http://www.sql-server-performance.com/forum/topic.asp?TOPIC_ID=10946) of the error.  It was not an ownership issue, it was a database version issue.  We support both SQL Server 2000 and 2005, all of our databases are version 2000 compatible.  You can&#8217;t have 2005 database diagrams in a 2000 database, even it it&#8217;s attached to a 2005 server. 

There are a couple of ways to change the database, I opted for the T-SQL method:

EXEC

sp_dbcmptlevel &#8216;MyDataBase&#8217;, &#8217;90&#8217;; 

The sp_dbcmptlevel is documented [here](http://msdn2.microsoft.com/en-us/library/ms178653(SQL.90).aspx).  The value &#8220;90&#8221; corresponds to the version number of SQL Server 2005. I ran that command and I was able to add database diagram support to the database.  You can also make the change via SSMS with the following steps:

  1. Write click on database.
  2. Click on Properties.
  3. Click on Options.
  4. Change the _Compatibility level_ to desired compatibility.
  5. Click OK.

After doing all of that, I really disliked the look of the tables in the database diagram.  It looked like the tabled editor from Access &#8217;97.  So I ended up doing what I should have done in the first place, created a database diagram in Visio and copied that into my spec document.</p> 

<div>
  Tech Tags: <a href="http://technorati.com/tag/sp_dbcmptlevel" rel="tag">sp_dbcmptlevel</a> &#8211; <a href="http://technorati.com/tag/Database%20Diagram" rel="tag">Database Diagram</a> &#8211; <a href="http://technorati.com/tag/%20Visio" rel="tag">Visio</a> &#8211; <a href="http://technorati.com/tag/%20SQL%20Server" rel="tag">SQL Server</a>
</div>
