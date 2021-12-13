---
id: 502
title: SqlDataReader performance tips
date: 2005-04-07T15:52:00-05:00
layout: post
guid: http://www.rajapet.com/?p=502
permalink: /2005/04/07/sqldatareader-performance-tips/
---
[SqlDataReader performance tips](http://sqljunkies.com/WebLog/amachanic/archive/2005/04/06/10462.aspx)

Some quick and easy performance tips for ADO.NET, courtesy of [Adam Machanic](http://sqljunkies.com/WebLog/amachanic/).

He talks about calling GetOrdinal before looping through a DataReader. We do the same thing with classic ADO in Delphi when we need to optimize the scrolling through a recordset.

The other tip is to use static cases instead of Get<datatype>

[Roman Rehak](http://www.sqljunkies.com/weblog/roman/) commented with the tip to always close the explicitly connection when you are done with the reader.</datatype>