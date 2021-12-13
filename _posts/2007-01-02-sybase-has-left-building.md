---
id: 273
title: Sybase has left the building
date: 2007-01-02T16:00:00-05:00
layout: post
guid: http://www.rajapet.com/?p=273
permalink: /2007/01/02/sybase-has-left-building/
---
We dropped support for Sybase&#8217;s Adaptive Server Anywhere, effective 12/31/06.  It wasn&#8217;t an easy decision, but it was the right choice for us.

About seven years ago, our main application used file based database storage, through the [BDE](http://en.wikipedia.org/wiki/Borland_Database_Engine "Wikipedia article on the Borland Database Engine").  As we were designing what would be the present day version of application, we evaluated many different client/server solutions.

  * It had to be designed for SQL.   Sounds like a given, but at the time file-based databases usually had SQL bolted on.

  * It had to require zero maintenance.  Many of our clients do not have an IT department that can run a database that requires hand holding or was difficult to install.

  * It had to be affordable.  We didn&#8217;t want to have to charge for a database runtime for entry level pricing.

  * It had to have name recognition.  That makes a big difference when making sales presentations.

  * It had to support views, procedures, and the other good stuff that comes with a modern SQL database.

  * Had to run on Netware.  Many of clients were running Novell Netware as their network server and they wanted the data to stay on the server.

The president of the company wanted us to use Microsoft SQL Server.  It fit the list except for the last item.  Novell Netware.

That was hard one.  We needed a database that would be on the Netware server.  That meant it had to run on the Netware box.  The number of client server databases that run on Netware is a short list.  Back in 2000, the list included Oracle, Advantage, Pervasive, Interbase, Sybase SQL Anywhere.

We had ruled out Oracle because of cost and support concerns.  Advantage was a client server engine wrapped around a file based storage system and didn&#8217;t have the name recognition.  Pervasive was the current incarnation of Btrieve and I had bad experiences with Btrieve in the past.  It didn&#8217;t have the name recognition that we wanted and pricing was a concern.

Interbase met everything, but the name recognition.  At the time we were considering it, it was in the process of going open source and we had concerns over the long term viability.  Plus there was the name recognition.

That left Sybase&#8217;s Adaptive Server Anywhere.  It had everything, but the name recognition.  It did have a feature that none of the others had.  It supported the [T-SQL](http://en.wikipedia.org/wiki/T-sql "Transact SQL") dialect of SQL that Microsoft SQL Server uses.  That allowed us to write code that would be compatible with both SQL Server and Adaptive Server Anywhere.  There were a few places where the SQL was different, but that was less than 1% of the time.

Sounds great, so we did end support at the end of 2006?  There were a few reasons that added up to a big reason.

Performance was a sore point.  All things considered equal, SQL Server was faster than Adaptive Server Anywhere.  The more complicated the SQL, the bigger the disparity in the performance.  We ended up migrating most of our clients that were on Adaptive Server Anywhere to SQL Server or the MSDE.

The Sybase native OLE DB provider (ASAPROV) had bugs that never got fixed.  Our Win32 applications use ADO and OLE DB to connect to the databases.  The native Adaptive Server Anywhere OLE DB provider would throw strange errors when working with client side record sets.  I submitted multiple bug reports to Sybase and they addressed some but not all of them.   Instead using their provider, we used the Microsoft&#8217;s generic OLE DB to ODBC provider (MSDASQL) to connect to Sybase over ODBC.  That worked, but it added an extra layer to the mix.  Another concern was that [Microsoft has deprecated](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnmdac/html/data_mdacroadmap.asp "Microsoft Data Access Technologies Road Map") MSDASQL and stated that it will not be available in 64-bit operating systems.  At some point a custimer was going to get a 64-bit edition of Windows and wouldn&#8217;t be able to connect to the database.

The additional testing time became a concern.  Sybase releases frequent updates, and we found many bugs that were reported on our application were caused by bugs introduced in the latest and greatest patch from Sybase.

After talking to some of of clients, we made the decision over a year ago to end Sybase support.  We down to a handful of clients still using Sybase and we expect to be migrating their data within the next few months.  It has gone very smoothly.

<div>
  Tech Tags: <a href="http://technorati.com/tag/ADO" rel="tag">ADO</a> <a href="http://technorati.com/tag/ASAPROV" rel="tag">ASAPROV</a> <a href="http://technorati.com/tag/Adaptive+Server+Anywhere" rel="tag">Adaptive+Server+Anywhere</a> <a href="http://technorati.com/tag/Deprecated+Providers" rel="tag">Deprecated+Providers</a> <a href="http://technorati.com/tag/MSDASQL" rel="tag">MSDASQL</a> <a href="http://technorati.com/tag/Netware" rel="tag">Netware</a> <a href="http://technorati.com/tag/OLE+DB" rel="tag">OLE+DB</a> <a href="http://technorati.com/tag/SQL" rel="tag">SQL</a>
</div>