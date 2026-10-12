---
title: Kill all the SQL connections for a DB or app
date: 2012-04-25T18:57:00-05:00
---
One of customers needed to be able to clear all of the connections to a database before running some maintenance tasks on the database.  So the question came my way and after searching the Internets, I ended up with the following T-SQL code

<pre name="code">DECLARE @spid INT    <br />DECLARE @getspid CURSOR    <br />declare @KillCmd nvarchar(128)<br /><br />-- create a table variable to hold the results of the call to sp_who<br />declare @k TABLE (spid INT, <br />  ecid INT, <br />  STATUS VARCHAR(150), <br />  loginame VARCHAR(150), <br />  hostname VARCHAR(150), <br />  blk INT, <br />  dbname VARCHAR(150), <br />  cmd VARCHAR(150), <br />  RequestID int)<br /><br />-- fill the table variable<br />INSERT INTO @k EXEC sp_who<br /><br />-- Create a cursor to use to walk through the table variable<br />-- that matches the database we want to filter on<br />SET @getspid = CURSOR FOR <br />	SELECT spid <br />	FROM @k <br />	where dbname = 'YourDatabaseNameHere'<br /><br />OPEN @getspid    <br /><br />FETCH NEXT FROM @getspid INTO @spid    <br /><br />-- For each row in the table, create a kill command<br />-- kill does not work with variables, we need to<br />-- execute it with sp_executeSQL<br />WHILE @@FETCH_STATUS = 0 <br />BEGIN<br />  SET @KillCmd = 'KILL ' + CAST(@SPId as nvarchar(10))<br />  print @KillCmd<br />  EXEC sp_executeSQL @KillCmd<br />  FETCH NEXT FROM @getspid INTO @spid<br />END<br /><br />-- cleanup<br />CLOSE @getspid<br /><br />DEALLOCATE @getspid</pre>

The way it works is that we call the [sp_who](http://msdn.microsoft.com/en-us/library/ms174313.aspx "sp_who (Transact-SQL)") system stored procedure.  This procedure returns a set that lists current users, sessions, and processs.  From that set, we can get a list of all of the connections for a database.  

Since we need to work with the rows of that set, we create a table variable named @k and populate it with the result set returned from sp_who.  You need to match the number of fields and the field types (or pick field types that SQL can convert automatically). 

Next, we create a cursor and iterate through the rows that match the database name that we want to kill the connections on.  We are using the [kill](http://msdn.microsoft.com/en-us/library/ms173730.aspx "KILL (Transact-SQL)") command to kill the connection.  You basically call kill with the session id to kill, and that session is terminated. In this example, we are matching on the dbname column.  You could easily match by loginame or hostname, depending on your needs.

The kill command has a slight little kink, where you have to pass a literal value to the kill command.  It doesn’t work with variables.  If you try it, you’ll get an “incorrect syntax near…” error message.

To get around this, we fill a string variable with the kill command and the session id.  We then call [sp_executesql](http://msdn.microsoft.com/en-us/library/ms188001.aspx "sp_executesql (Transact-SQL)") to execute our dynamically generated SQL statement. It looks somewhat less than [elegant](http://allthingselegant.tumblr.com/), but it works just fine.

This was written as inline SQL so the customer could add it to his maintenance script.  You could easily make sproc out of it and toss it into the master database.
