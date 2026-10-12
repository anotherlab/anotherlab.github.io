---
title: String Date Validator
date: 2005-04-07T15:56:00-05:00
---
[String Date Validator](http://blogs.crsw.com/mark/archive/2005/04/06/829.aspx)

[Mark Wagner](http://blogs.crsw.com/mark) has a nice helper function for validating a date.

<span>private static bool IsDate(string sDate)<br />{<br /> DateTime dt;<br /> bool isDate = true;</span>

    <span>try<br /> {<br /> dt = DateTime.Parse(sDate);<br /> }<br /> catch<br /> {<br /> isDate = false;<br /> }</span>

    <span>return isDate;<br />}</span>
