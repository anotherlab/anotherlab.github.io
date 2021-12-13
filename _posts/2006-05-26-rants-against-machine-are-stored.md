---
id: 307
title: 'Rants against the machine: Are stored procedures inherently evil?'
date: 2006-05-26T13:41:00-05:00
layout: post
guid: http://www.rajapet.com/?p=307
permalink: /2006/05/26/rants-against-machine-are-stored/
---
Jeremy MIller has a good [rant](http://codebetter.com/blogs/jeremy.miller/archive/2006/05/25/145450.aspx "Why I do not use Stored Procedures") against the use of stored procedures. He thinks prefers to keep his code in the application and use T-SQL sparingly. HIs view is that sprocs are harder to test and harder to understand. There&#8217;s a logical disconnect when you business logic is split between the application and the database.

I sort of agree with his viewpoint, but not completely. I think that using sprocs for most [CRUD](http://en.wikipedia.org/wiki/CRUD_%28acronym%29) applications is a waste of time. Adhoc SQL is usually sufficient for that task. But there are plenty of times where a sproc is pretty handy. Our applications are a mixture of Win32 Delphi and C# and work in the same database space. Having some of the business logic at the database level is better reuse of shared code than duplicated code across development platforms.

But I do agree with Jeremy about the additional burdens that come with sprocs. You have to manage the versions. You have the additional burder of having multiple versions of the sproc if you support multiple database vendors (we do SQL Server and Sybase SQL Anywhere). Your programmers need to know more about SQL than &#8220;SELECT * FROM SomeTable&#8221;.

His complaint about the sprocs being out of sync with the code was a non-starter for me. We version our database schema changes with our application code. If the database version isn&#8217;t in sync with the application version, we force the user to update one or the other. I implemented a simple way to send out database changes with a point and click interface, each new version of our applications is bundled with the database update file that brings the database up to the current application version.

There are performance considerations to consider as well. Once you get past the CRUD, you can get your money out of SQL Server with well designed sprocs. I was able to get 10x improvement recently in one part of a service that I written be replacing a hideously over-complicated adhoc SQL statement with sproc that produced the same results. That sproc split the SELECT statement into multiple statements that stored the individual results into table variables and then combined the individual results into a single result that matched the output of the original SQL statement. Your mileage may vary.

I think we are seeing the swinging of the pendulum from everything must be in a sproc to &#8220;sprocs bad, code good&#8221;. As with most things, I think there&#8217;s some point in between that has your comfort zone. I&#8217;m quite content letting the database layer du jour (ADO/ADO.NET/Code generator) handle the CRUD tasks. When I feel the need for speed, I have no qualms against using &#8220;CREATE PROCEDURE&#8221;.

<div>
  Tech Tags: <a href="http://technorati.com/tag/CRUD" rel="tag">CRUD</a> <a href="http://technorati.com/tag/SQL" rel="tag">SQL</a> <a href="http://technorati.com/tag/T-SQL" rel="tag">T-SQL</a> <a href="http://technorati.com/tag/Sprocs" rel="tag">Sprocs</a> <a href="http://technorati.com/tag/Delphi" rel="tag">Delphi</a> <a href="http://technorati.com/tag/C#" rel="tag">C#</a>
</div>