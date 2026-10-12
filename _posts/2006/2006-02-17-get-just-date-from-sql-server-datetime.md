---
title: Get just the date from a SQL Server datetime column
date: 2006-02-17T17:28:00-05:00
---
This should be faster than the other way ( converting it to a varchar and lopping off the time part).

> _SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE()))_
> 
> Courtesy of [[Greg&#8217;s Cool [Insert Clever Name] of the Day]](http://coolthingoftheday.blogspot.com/2006/02/get-only-date-from-datetime-in-t-sql.html "Get Only Date from DateTime in T-SQL")
