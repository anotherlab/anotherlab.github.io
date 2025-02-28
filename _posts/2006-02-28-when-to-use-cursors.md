---
title: When to use cursors
date: 2006-02-28T15:28:00-05:00
---
This is cool <a href="http://anotherlab.rajapet.net/" http: title="Running sums, redux">article</a> that describes a good reason for using cursors. The knee jerk reaction from most SQL Gurus is usually &#8220;Cursors bad, sets good&#8221;. But there are times where it actually makes sense to use a cursor over set logic. [Adam Machanic](http://www.sqljunkies.com/WebLog/amachanic/default.aspx) describes a few ways to generate a running sum of one of the columns of data in a record set. His gut reaction was to use varies combinations of self-joins, but the performance was hideous. For each row, you have to sum the values of all of the rows preceding, the performance cost is exponential to the size of the result set.

When he rewrote the query to use a cursor, the performance was dramaticly better, each row only needed to be read once. The performance cost was linear to the number of rows read.

If you stand back and look at the big picture, you may still want to avoid the cursor and just accumulate the running total in the code that is calling the query. That may prove to be the fastest way to execute this type of query.
