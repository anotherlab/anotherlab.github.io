---
title: Another way of deleting data in chunks
date: 2005-11-11T16:04:00-05:00
---
I&#8217;m bloggin this because I&#8217;ll need it in a few weeks&#8230;.

> 
> 
> Michael Campbell has blogged about removing data from a table in chunks <http://sqladvice.com/blogs/repeatableread/archive/2005/09/20/12795.aspx>. This can be simplified even further in SQL Server 2005
> 
> 
> 
> DELETE TOP (2000) FROM MyBigTableWHERE someCondition = true  ORDER BY Dateolumn ASC
> 
> 
> 
>  
> 
>   [[ via WebLogs @ SqlJunkies.com]](http://sqljunkies.com/WebLog/simons/archive/2005/11/10/17361.aspx "Deleting/archiving data in SQL Server 2005")
