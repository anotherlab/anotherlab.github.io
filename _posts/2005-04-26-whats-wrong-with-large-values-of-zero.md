---
id: 481
title: 'What&#8217;s wrong with large values of zero?'
date: 2005-04-26T13:15:00-05:00
layout: post
guid: http://www.rajapet.com/?p=481
permalink: /2005/04/26/whats-wrong-with-large-values-of-zero/
---
We are about to roll out an update to one of our applications and we made some schema changes to the database. A couple of floating point fields were changed to the money data type. And that&#8217;s when the [fun](http://www.lafferty.ca/photos/Things/Saab_9-3/crash.jpg) began. QA reported the following error from one of the reports:

<span><strong>Arithmetic overflow error converting numeric to data type numeric.</strong> </span>

After tracing through the stored procedure that drives the report, it boiled down to a [COALESCE()](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/tsqlref/ts_ca-co_9dph.asp) function. When we used 0.00 as the 2nd parameter in COALESCE, it would throw that error under SQL Server 7. Oddly enough this only happens when the first parameter was not null.

The simple fix was to change 0.00 to 0 (no decimal point). Or use [ISNULL()](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/tsqlref/ts_ia-iz_6mek.asp) instead of COALESCE. This problem appears to be fixed in SQL Server 2000.

If you have access to SQL Server 7 (or MSDE 1) and you want to see this for yourself, try the following:

<span>create table foo (id int, cur money null)</span>

<span>insert into foo(id, cur) values (1, null)<br />insert into foo(id, cur) values (2, 0.0)<br />insert into foo(id, cur) values (3, 4.567)<br /></span>  
&#8212; These will work  
<span>select id, ISNULL(cur, 0.00) as c from foo<br />select id, coalesce(cur, 0) as c from foo<br /></span>  
&#8212; This one will fail  
<span>select id, coalesce(cur, 0.00) as c from foo</span>