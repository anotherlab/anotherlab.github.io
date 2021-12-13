---
id: 187
title: Know your SQL Server version
date: 2008-04-16T15:28:00-05:00
layout: post
guid: http://www.rajapet.com/?p=187
permalink: /2008/04/16/know-your-sql-server-version/
---
There are times where you need to know what version of SQL Server is installed.  Usually you want to know which version and which service pack has been applied.  There have been a few isolated cases over the years where we saw bugs go away or significant performance boosts by merely installing the latest service pack.  It&#8217;s less of an issue with 2005, but with SQL Server 2000, we wanted to make sure the user installed the latest service packs to block against stuff like the [&#8220;Slammer&#8221; worm](http://en.wikipedia.org/wiki/SQL_slammer_worm "Wikipedia: SQL slammer (computer worm)").

The following bit of [T-SQL](http://en.wikipedia.org/wiki/T-sql "Transact-SQL (T-SQL) is Microsoft's and Sybase's proprietary extension to the SQL language. Microsoft's implementation ships in the Microsoft SQL Server product.") will send back the version information in easy to process pieces

SELECT

SERVERPROPERTY(&#8216;productversion&#8217;) AS ProductVersion, SERVERPROPERTY (&#8216;productlevel&#8217;) AS ProductLevel, SERVERPROPERTY (&#8216;edition&#8217;) AS Edition 

For SQL Server 2005, you could get back something like this:

<pre>ProductVersion  ProductLevel  Edition<br />--------------- ------------- ----------------<br />9.00.2047.00    SP1           Standard Edition<br /></pre>



Which indicates the Standard Edition of SQL Server 2005, with Service Pack 1 installed.  You can also get most of that information with



select

@@version

But you would have to parse out the version from a block of text like this:

<pre>----------------------------------------------------------------------<br />Microsoft SQL Server 2005 - 9.00.2047.00 (Intel X86) <br /> Apr 14 2006 01:12:25 <br /> Copyright (c) 1988-2005 Microsoft Corporation<br /> Standard Edition on Windows NT 5.2 (Build 3790: Service Pack 2)<br /></pre>



Using SERVERPROPERTY ([2000](http://msdn2.microsoft.com/en-us/library/aa259183(SQL.80).aspx "Transact-SQL Reference (SQL Server 2000): Returns property information about the server instance."), [2005](http://msdn2.microsoft.com/en-us/library/ms174396.aspx "Returns property information about the server instance.") or [2008](http://msdn2.microsoft.com/en-us/library/ms174396(SQL.100).aspx)) is much easier than parsing that block of text.  To determine which version is running based just on the version number, Microsoft has a KB article that lists all of the releases under [KB321185](http://support.microsoft.com/kb/321185 "How to identify your SQL Server version and edition").