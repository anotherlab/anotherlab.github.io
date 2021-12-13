---
id: 335
title: Paged recordsets from SQL Server for web pages
date: 2006-01-04T21:15:00-05:00
layout: post
guid: http://www.rajapet.com/?p=335
permalink: /2006/01/04/paged-recordsets-from-sql-server-for/
---
I&#8217;ve worked on a few web apps where I displayed a paged list of data, but without storing all of the rows in the view state or as a session variable. I prefer to let SQL Server do the [heavy lifting](http://heavylifting.blogspot.com/ "this link has nothing to do with the subject matter") for these kinds of situations. What I want to do is to get a set of filtered data from SQL Server (2000 or better, my friend) with arbitrary row numbers assigned so that I can ask for all rows between X and Y.

There are a few ways to do this, one way I like to do it is with a stored procedure that generates the data and sends back only what I need. This eliminates most of the storage requirements on the web side of things. Using a sample table, I&#8217;ll write a procedure that lets me grab the data by row numbers.

create table Employee (  
  RecordID integer identity(1,1),  
  LastName varchar(30),  
  FirstName varchar(20),  
  IsDriver char(1)  
)

Assume about 1000 or so records, with about 50% of them with the IsDriver field set to &#8216;Y&#8217;. Here&#8217;s a procedure for getting a set of data with row numbers included.

CREATE procedure QueryByRow  
  @LastName varchar(20),  
  @StartRecord int,  
  @EndRecord int  
AS  
DECLARE @MatchCount int

SELECT @MatchCount =  
(  
  SELECT COUNT(RecordID)  
  FROM EMPLOYEES  
  WHERE IsDriver=&#8217;Y&#8217; AND LastName LIKE @LastName  
)

DECLARE @tmp TABLE(ID int identity(1,1), RecordID int, LastName varchar(20), FirstName varchar(20))

SET NOCOUNT ON

INSERT @tmp(RecordID, LastName, FirstName)  
SELECT RecordID, LastName, FirstName  
FROM EMPLOYEES  
WHERE IsDriver=&#8217;Y&#8217; AND LastName LIKE @LastName  
ORDER BY LastName, FirstName

SET NOCOUNT OFF

SELECT @MatchCount AS Count, t.RecordID, t.LastName, t.FirstName  
FROM @tmp t  
WHERE t.ID BETWEEN @StartRecord AND @EndRecord

This procedure only allows us to filter by last name, but it can be easily extended to do other filtering or even change the sort order. You would start off by calling the procedure with the RecordCount to get your first page by the starting and ending row numbers. You will get back the result set, with the total number of records as the first column. That information you would store as a session variable or in the viewstate. Now that you know the number of records, you can then get any arbitrary set of those records by calling the procedure again, but with different starting and ending row numbers.

EXECUTE QueryByRow &#8216;%&#8217;, 1, 25

Count       RecordID    LastName             FirstName              
&#8212;&#8212;&#8212;&#8211; &#8212;&#8212;&#8212;&#8211; &#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8211; &#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8211;  
494         1           Able                John  
494         36          Baker               John  
494         69          Charles             John  
&#8230;.  
494         6           Dexter              John

If you were showing 25 records per page, and you wanted to display page 3, you would do this:

EXECUTE QueryByRow &#8216;%&#8217;, 0, 51, 75

That would return something like this:

Count       RecordID    LastName             FirstName              
&#8212;&#8212;&#8212;&#8211; &#8212;&#8212;&#8212;&#8211; &#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8211; &#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8211;  
494         2           Marro                John  
494         46          Martinez             John  
494         79          Mitchell             John  
&#8230;.  
494         16          Schwede              John

This would bring back just the 25 rows that you would need. There is, of course, [no free lunch](http://www.columbusdirect.com/travel/plan-for-unexpected/no-free-lunch.htm "Yet another link having nothing to do with the subject matter."). The drawback is that you are executing the same query against the data every time you call this procedure. You have to weigh the performance of that versus the performance of retrieving a full set of data from the SQL Server to the web server and having the web server filter and persist the data. Depending on your data and the load on your server, SQL Server will have the result set cached in memory and each additional call the procedure will be running against data already in memory. 

The use of a [table variable](http://support.microsoft.com/default.aspx?scid=kb;en-us;305977 "To the Knowledge Base!") allows to build the set in memory and create the row numbers. I have seen other examples that used temporary tables and self joins on the table, but table variables seem to place the least demand on the sever resources. This method will work with both SQL Server 2000 and 2005 and is not dependant on any version of ASP.Net.

The other drawback is that other processes could be editing the table between calls to the procedure. This is why the &#8220;Count&#8221; field is returned with each row. Should that value change between calls to the procedure then you know the data was edited in some way and you would have to make sure that your code could display a different number of records than it expected.