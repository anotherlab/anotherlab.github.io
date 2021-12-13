---
id: 64
title: Suppressing a repeated column value in SQL
date: 2010-04-29T20:37:00-05:00
layout: post
guid: http://www.rajapet.com/?p=64
permalink: /2010/04/29/suppressing-repeated-column-value-in/
---
I was asked by one of my co-workers for some SQL help. He needed a SQL statement that would suppress repeated column values for the result set. Basically the value would be shown for the first row and blanked for each successful row that had the same value. Typically you would handle this in the application code, we had a case where we had to pass data to another application and we needed to do this within a single SQL select statement.

For example if we have the values: </p> 

<pre>username             Category<br />-------------------- ----------<br />Brian                cs<br />Tom                  cs<br />Joe                  cs<br />Allen                cs<br />Bill                 ts<br />Steven               ts<br />Fred                 ts<br />Ted                  ts</pre>





We would want to return this as the output 

<pre>username             Category<br />-------------------- ----------<br />Brian                cs<br />Tom                  <br />Joe                  <br />Allen                <br />Bill                 ts<br />Steven               <br />Fred                 <br />Ted                  </pre>



Using the following table structure: 

<pre name="code">create table test(id int, cat varchar(10), username varchar(20))</pre>



We can make a query like 

<pre name="code">select t.username<br />,case<br />  when t.id = (select top 1 id <br />               from test t3 <br />               where t3.cat = t.cat <br />               order by t3.cat, t3.username) then t.cat<br />  else ''<br />end as Category<br />from test t<br />order by t.cat, t.username</pre>



What the case keyword is doing is a sub-select on the same table and uses top 1 to match on only the first row for each set of categories.  If we match, we use the category value, otherwise we use an empty string value.  This is not very inefficient, you are doing the sub-select for each row of the query.  We needed to do this because the situation only allowed a single SQL statement to be executed.  We were working with a small set of records and this executed without any delay.



If you can call a stored procedure or execute a batch of SQL, you can split this up and gain a performance increase for larger sets of data.  Instead of doing the sub-select on each row, populate a [table variable](http://www.sqlteam.com/article/using-table-variables) with the first row for each category.  Then do a [left join](http://www.w3schools.com/sql/sql_join_left.asp) from the main table to the table variable.  The combined SQL would look something like this:

<pre name="code">declare @q table(cat varchar(10), username varchar(20))<br />insert into @q(cat, username)<br />select t.cat, MIN(t.username)<br />from test t<br />group by t.cat<br /><br />select t.username, COALESCE(q.cat,'') as Category<br />from test t<br />left join @q q on t.cat = q.cat and t.username = q.username<br />order by t.cat, t.username</pre>



Another way to get this affect is to use a [Common Table Expression](http://msdn.microsoft.com/en-us/library/ms190766.aspx "Using Common Table Expressions") (CTE) as part of the query.  This would behave like the table variable, but you would have just a single select statement.  This would be useful for reporting tools where you can only specify a single SQL statement to retrieve the data.



Using the above example data, the new select statement would look like this

<pre name="code">with cte as<br />(<br />  select cat, min(username) as username<br />  from test<br />  group by cat<br />)<br />select t.username, COALESCE(c.cat,'') as Category<br />from test t<br />left join cte c on t.username = c.username and c.cat = t.cat<br />order by t.cat, t.username<br /></pre>



This query should be perform well (if not better) as the query with the table variable.