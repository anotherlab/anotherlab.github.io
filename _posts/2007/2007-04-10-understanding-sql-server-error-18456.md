---
title: Understanding SQL Server error 18456
date: 2007-04-10T14:57:00-05:00
---
I came across an odd problem with SQL Server Express.  We have a test server with various versions of SQL Server installed for QA to use.   Of the QA techs was unable to connect to the instance of SQL Server Express when he used a SQL Server login.  The code was not returning an error error code, so I decide to take a look at it.

I tried connecting to Express from MS SQL Server Management Studio under that account.  SSMS returned an 18456 error, basically it couldn&#8217;t connect.  That was just slightly more useful than what I had before, but it provide two things.  It ruled out the app as cause of the problem, and it gave something that I could google with.

The best match I got was [Understanding &#8220;login failed&#8221; (Error 18456) error messages in SQL Server 2005](http://blogs.msdn.com/sql_protocols/archive/2006/02/21/536201.aspx "Understanding "login failed" (Error 18456) error messages in SQL Server 2005"), on the [SQL Protocols](http://blogs.msdn.com/sql_protocols/default.aspx "Discussions related to Microsoft's SQL Server Protocols - Netlibs, TDS and (new for SQL 2005) SOAP. Topics include connections and SQL connectivity.") blog.  Basically, the error 18456 error is purposely vague to prevent nasty people from trying to hack into your server.  To figure out why the login failed, you need the &#8220;error state&#8221;.  Error state is not returned to the client, but it&#8217;s written to the log file.  That file will be in the LOGS folder of that instance of SQL Server under the name ERRORLOG.   From the log file, you&#8217;ll get more information about why the login failed:

```
2007-04-10 09:54:45.14 Logon       Error: 18456, Severity: 14, State: 8.
2007-04-10 09:54:45.14 Logon       Login failed for user 'youridhere'. [CLIENT: 10.0.0.1]
```

From the first line, we get the eror state.  Yay, it&#8217;s 8.  So what does that mean?  The states are documented in the blog posting reference above, but I couldn&#8217;t find it in my copy of the BOL.  It is documented in the online version (and probably in the latest BOL) at [Troubleshooting: Login Failed for User 'x'](https://learn.microsoft.com/en-us/previous-versions/sql/sql-server-2008-r2/ms366351(v=sql.105)) Here are the documented states:

| State | Description |
| ----- | ----------- |
| 2 | User ID is not valid.| 
| 5 | User ID is not valid.| 
| 6 | An attempt was made to use a Windows login name with SQL Server Authentication.| 
| 7 | Login is disabled, and the password is incorrect. | 
| 8 | The password is incorrect.| 
| 9 | Password is not valid.| 
| 11 | Login is valid, but server access failed.| 
| 12 | Login is valid login, but server access failed.| 
| 18 | Password must be changed.| 


So it boils down to the password being incorrect, which in this case it was. 
