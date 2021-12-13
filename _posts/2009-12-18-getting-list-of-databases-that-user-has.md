---
id: 72
title: Getting the list of databases that a user has rights to from SQL Server
date: 2009-12-18T20:53:00-05:00
layout: post
guid: http://www.rajapet.com/?p=72
permalink: /2009/12/18/getting-list-of-databases-that-user-has/
---
We have a few applications that let the user select the database connection details.  It’s for SQL Server 2005/2008 and they can pick the server protocol, server name, and the database.  Once they select a database server, the user selects the database from a pick list selection.  We filter that list to only show the databases that are applicable for that user and application.

The first thing we do is get the list of databases.  We want to only display the databases that user can access and filter out the system databases.  There are a few ways to get the list of databases from SQL Server.  There is a system stored procedure named [sp_helpdb](http://msdn.microsoft.com/en-us/library/ms178568.aspx) or you can go right to the same tables and views that sp_helpdb uses.  The latter matter is more efficient, but you want to make sure that you are using the system views instead of the system tables.  Microsoft has deprecated access to the system tables and has published a list that maps the system tables to the system views on [this MSDN page](http://msdn.microsoft.com/en-us/library/ms187997.aspx "SQL Server 2008 Books Online (November 2009) - Mapping System Tables to System Views (Transact-SQL)").

The system view that we want to uses is [sys.databases](http://msdn.microsoft.com/en-us/library/ms178534.aspx "sys.databases (Transact-SQL)").  This view will give us a list of all (well nearly all and close enough for our purposes) of the mounted databases.  This includes the system databases and databases that the user may not actually have rights to.  We can filter out the system tables by excluding them by name,  We can use the [has_dbacesss()](http://msdn.microsoft.com/en-us/library/ms187718.aspx) function to filter out the tables that we don’t have access to.  The has_dbacess(&#8216;databasename&#8217;) function will return 1 for databases that the current connection has access to, or 0 for no access.  That give us the following T-SQL for getting the list of databases:

<pre name="code">select Name <br />from sys.databases <br />where (has_dbaccess(name) > 0) <br />and name not in ('master', 'tempdb', 'model', 'msdb') <br />order by 1</pre>

If your user account has access to different types of databases and you want to filter the list to provide only the databases that your application supports, then you can go one step further.  Find a table or view in your database that is fairly unique.  If all of the table names are pretty generic, just create with unique name and make a use for it later.

The following SQL statement can be executed from an application to get a filtered list of databases in one call to the server.

<pre name="code">create table #TempTable(dbname nvarchar(128));<br />declare @AppDatabase nvarchar(128);<br />declare cr cursor for select Name from sys.databases where (has_dbaccess(name) > 0) <br /><br />open cr;<br /><br />fetch next from cr into @AppDatabase;<br /><br />WHILE @@FETCH_STATUS = 0 begin;<br />  execute (' insert into #TempTable(dbname) select Table_Catalog from [' + @AppDatabase + '].INFORMATION_SCHEMA.TABLES where TABLE_NAME = ''GeoZoneEdge''');<br />  fetch next from cr into @AppDatabase;<br />end;<br /><br />deallocate cr;<br /><br />select dbname from #TempTable<br /><br />drop table #TempTable</pre>

The use of semicolons makes it easy to send the set of the t-sql commands as one command to the server.  you would replace the string “yourtablenamehere” with the name of the actual table or view you were trying to match.   By sending a set of commands as a single batch, we get the power of a stored procedure with actually having to have a stored procedure.  The blank lines are there for readability, you can run that as a single execute command and get back a result set.

The first few lines create a temp table to store the database names collected from sys.databases.  We use a cursor to iterate through result set from sys.databases so that we can check each database for the existence of a table that we know will be in our application’s database.   For each database name in that result set, we use the [INFORMATION_SCHEMA.TABLES](http://msdn.microsoft.com/en-us/library/ms186224.aspx) view to check for the existence of a specific table in that table.  Since we doing that lookup for each database, we need to construct the SQL statement at runtime, as shown in line 10 in the listing above.  Each select statement the produces a result, logs the database name into the temporary table.  Then we just return the results of the temporary table.

It looks involved, but it executes fast and the calling application only needs to make one call to the SQL Server to collect the data.