---
id: 106
title: Renabling maintenance plans on SQL Server 2005
date: 2009-01-06T15:14:00-05:00
layout: post
guid: http://www.rajapet.com/?p=106
permalink: /2009/01/06/renabling-maintenance-plans-on-sql/
---
We have a couple of SQL Server boxes that we use in our department and of them has some mission critical databases.  Our defect tracking and source control databases are the big ones, but there are a few others.  We back them up and then copy them to a folder on a netwrk share.  From the network share, the files get backup up to tape and are stored offsite.

On the database server, I have a maintenance plan that runs each night and backups the critical databases.  It runs at 2am.  At 5am, I have a scheduled task run on the database server that does the following:

  1. Purges the old backups and compresses copies of the backups. 
  2. Copies the latest backup of each database to a new folder. 
  3. Compresses the backups using [7-Zip](http://www.7-zip.org/). 
  4. Compresses our technical spec documents. 
  5. Backup the MSQL database that has our department’s wiki.  We are a .NET shop, but I really like how the [MediaWiki](http://www.mediawiki.org/wiki/MediaWiki) software works, so we use that. Getting that to work a 64-bit Windows Server is a story best left for another day. 
  6. Copy the compressed backups to the network share. 

So that has been working without any hitches for about 12 months.  We did a spot check of the backups last week and noticed that it stopped working a few weeks ago.  After a bit of poking around with how the scheduled task was scheduled, running it manually, and so forth, I ended up at the database server.

I tried to view the maintenance plan that handles the backups and I was presented with the following error message:

> &#8216;Agent XPs&#8217; component is turned off as part of the security configuration for this server. A system administrator can enable the use of &#8216;Agent XPs&#8217; by using sp_configure. For more information about enabling &#8216;Agent XPs&#8217;, see &#8220;Surface Area Configuration&#8221; in SQL Server Books Online. (ObjectExplorer)

That’s not good.  But easily fixable.  I Google’d the first sentence and found a fix on the first page [Enabling &#8220;Agent XPs&#8221; on SQL 2005](http://www.treeratfishing.com/2008/01/15/enabling-agent-xps-on-sql-2005/) in a post by Jeff Story on the [Tree Rat Fishing](http://www.treeratfishing.com/ "Tree Rat Fishing: Windows Administration and Development. It’s all about the tools and code.") blog.  In short if you run the following T-SQL commands, you’ll get the functionality back:

sp_configure &#8216;show advanced options&#8217;, 1;  
GO  
RECONFIGURE;  
GO  
sp_configure &#8216;Agent XPs&#8217;, 1;  
GO  
RECONFIGURE  
GO 

I still don’t know what disabled Agent XPs, my guess was a Service Pack update for SQL Server or someone messing around with the server.  I’m thinking of setting up a developer dashboard page to display stuff like when were the database backups done, what projects were built for QA.  Not knowing that the backups were not performed was a giant flaw in the backup plan.  We were lucky on this one.