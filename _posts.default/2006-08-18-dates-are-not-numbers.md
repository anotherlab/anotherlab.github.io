---
id: 293
title: Dates are not numbers
date: 2006-08-18T19:18:00-05:00
layout: post
guid: http://www.rajapet.com/?p=293
permalink: /2006/08/18/dates-are-not-numbers/
---
One of the other developers that I work with had a question about inserting some date values into a SQL Server database.  The code in question is doing a batch insert and it was implemented as a series of INSERT statements and they get executed in large batches.  He was having some difficulty in getting the right values for the dates.  He was formatting the INSERT statement with the datetime values being formatted as numeric values.  The end result was that the dates were off by two days.  It was easy to fix and is yet another example of a [leaky](http://www.joelonsoftware.com/articles/LeakyAbstractions.html) [abstraction](http://anotherlab.blogspot.com/2006/05/leaky-abstractions-in-wise-for-windows.html) can bite you in the [ass](http://www.phrases.org.uk/bulletin_board/43/messages/989.html).

Dates are not numbers.  You have to consider them to be an intrinsic date type, even if the environment handles them internally as floating point numbers.  It&#8217;s easy to get into the habit of adding 1.0 to datetime variable to increment the time by one day. SQL Server will happily let you do so, and so do many programming languages.  Oddly enough, Sybase Adaptive Server Anywhere wont let you treat datetime values as numbers, they force you to do it the right way.

The problem is how each environment anchors that numeric value to the actual calendar.  What day is day 0?   It depends on what created that value.  For SQL Server, the number 0 corresponds to 1900-01-01 00:00:00.  In the Delphi programming environment that we do a lot of work in, 0 works out to be 1899-12-30 00:00 (a Saturday for those keeping score).  If you pass in a datetime as numeric, when you query it back out of SQL Server, it&#8217;s going to two days ahead of from your original date.

The 1899 date was define by Microsoft when they defined their [OLE Automation](http://en.wikipedia.org/wiki/OLE_Automation) data types.  The .NET runtime uses 0001-01-01 as it&#8217;s starting point.  Those are not the only ways datetime can be encoded.  [Raymond Chen](http://blogs.msdn.com/oldnewthing/default.aspx) did a decent round up on his [blog](http://blogs.msdn.com/oldnewthing/archive/2003/09/05/54806.aspx).

The way we usually pass in datetime variables in non-parameterized INSERT statements is to encode the datetime variable as a string in the standard SQL-92 format (yyyy-mm-dd hh:mm:ss).</p> 

<div>
  Tech Tags: <a href="http://technorati.com/tag/SQL" rel="tag">SQL</a> <a href="http://technorati.com/tag/Delphi" rel="tag">Delphi</a> <a href="http://technorati.com/tag/.NET" rel="tag">.NET</a> <a href="http://technorati.com/tag/DateTime" rel="tag">DateTime</a> <a href="http://technorati.com/tag/Numbers" rel="tag">Numbers</a> <a href="http://technorati.com/tag/1899" rel="tag">1899</a> <a href="http://technorati.com/tag/1900" rel="tag">1900</a> <a href="http://technorati.com/tag/timestamps" rel="tag">timestamps</a>
</div>