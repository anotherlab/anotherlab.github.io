---
id: 131
title: Handling collation sequences with temporary tables and table variables with SQL Server
date: 2008-07-10T19:42:00-05:00
layout: post
guid: http://www.rajapet.com/?p=131
permalink: /2008/07/10/handling-collation-sequences-with/
---
When building complex stored procedures that span multiple tables, you will probably need to store some intermediate results in a local buffer and process them before returning the final output.  SQL Server lets you do this through temporary table and table variables.   

Usually table variables offer faster performance (less locking and logging are required), but they have [more](http://databases.aspfaq.com/database/should-i-use-a-temp-table-or-a-table-variable.html) [restrictions](http://support.microsoft.com/default.aspx/kb/305977) [than](http://blogs.msdn.com/sqlprogrammability/archive/2007/01/18/11-0-temporary-tables-table-variables-and-recompiles.aspx) temporary tables.  Common to both types is where they are located.  When you create a table variable or temporary table, it gets created in the [tempdb](http://msdn.microsoft.com/en-us/library/ms190768.aspx) database, not in the current database.  This can affect the [collation sequences](http://msdn.microsoft.com/en-us/library/aa174903(SQL.80).aspx) applied to character fields  If the SQL Server was installed using one collation and your database uses a different collation, joins from tables in your database with temporary tables will fail if you join on character fields.  The tempdb database will use the server default collation sequence. That collation may not be the same collation used by your database if your created your database on a different server that used a difference collation.  The server collation is used for all of the system databases (including tempdb) and for any newly created user databases.  Databases that are attached or restored from a backup keep the collation that they were created with.

Gregory Larsen [posted some sample SQL code](http://www.sqlservercentral.com/articles/Administering/collate_part1/875/ "Beware of Mixing Collations - Part 1") on sqlservercentral.com that will demonstrate the error.  If you run the following SQL:</p> 

<pre>create table #a (char_set1 varchar(50) collate Latin1_General_CI_AS) <br />create table #b(char_set2 varchar(50) collate Latin1_General_BIN) <br />insert into #a values ('collate') <br />insert into #b values ('collate') <br />select * from #a join #b on char_set1 = char_set2</pre></p> 

You will an error message like the following:

Msg 468, Level 16, State 9, Line 5 

Cannot resolve the collation conflict between &#8220;Latin1\_General\_BIN&#8221; and &#8220;Latin1\_General\_CI_AS&#8221; in the equal to operation.

That example is used to show the type of error you would get in your code.  The actual code that would throw that error would be comparisons between character fields in a temporary table/table variable and with a permanent table in your database.  If you are deploying databases to servers where the server’s default collation sequence could be different than the collation sequence used by your database, then you want to add “[COLLATE database_default](http://msdn.microsoft.com/en-us/library/aa258237(SQL.80).aspx)” to all of your character field definitions when you define a temporary table or table variable.  Using “COLLATE Database_Default” will assign the collation sequence of the current database to the field.  This will allow field comparisons between character fields in temporary tables/table variables and permanent tables to execute with triggering the “collation conflict” error.

Instead of using syntax like:</p> 

<pre>create table #a(SomeID integer, SomeCharValue varchar(20)) <br /><br />declare @a TABLE(SomeID integer, SomeCharValue varchar(20)) </pre>

Use the following:</p> 

<pre>create table #a(SomeID integer, SomeCharValue varchar(20) COLLATE database_default) <br /><br />declare @a TABLE(SomeID integer, SomeCharValue varchar(20) COLLATE database_default)</pre>

This will work no matter what the collation sequence for either tempdb or your database.  You don’t need to query the server to check what the sequence.  The big limitation is that you have to explicitly define the columns in the temporary table.  If you were using SELECT INTO syntax to create the temporary table implicitly by the columns in the SELECT statement, the temporary table will use the collation of tempdb.  You would need to structure the SQL.  For example, if you were using syntax like this:</p> 

<pre>select name, crdate, filename<br />into #a<br />from master.dbo.sysdatabases<br />drop table #a</pre></p> 

You would need to rewrite it to look like this:</p> 

<pre>create table #a(<br />  name sysname collate database_default,<br />  crdate datetime,<br />  filename nvarchar(260) collate database_default<br />)<br />insert #a(name, crdate, filename)<br />select name, crdate, filename<br />from master.dbo.sysdatabases<br />drop table #a</pre>

You pay a small penalty by the extra SQL to explicitly define the temporary table, but you gain with having code that will work on any server.