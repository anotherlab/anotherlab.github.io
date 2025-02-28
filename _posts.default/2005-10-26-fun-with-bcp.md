---
id: 388
title: Fun with BCP
date: 2005-10-26T15:01:00-05:00
layout: post
guid: http://www.rajapet.com/?p=388
permalink: /2005/10/26/fun-with-bcp/
---
Here&#8217;s a quick and dirty way to export a table to a text file with SQL Server. With some minor tweaking, it should also work for views and stored procedures that return result sets.

> 
> 
> Here is a simple method of exporting all the data from SQL Server table to a Text File
> 
> CREATE Procedure BCP\_Text\_File  
> (   
> @table varchar(100),   
> @FileName varchar(100)   
> )   
> as   
> If exists(Select * from information_Schema.tables where <table_name=@table>)  
>     Begin  
>         Declare @str varchar(1000)   
>         set @str=&#8217;Exec Master..xp\_Cmdshell &#8221;bcp &#8220;Select * from &#8216;+db\_name()+&#8217;..&#8217;+@table+'&#8221; queryout &#8220;[&#8216;+@FileName+&#8217;](mailto:)&#8221; -c&#8221;&#8217;   
>         Exec(@str)   
>     end  
> else  
>     Select &#8216;The table [&#8216;+@table+&#8217;](mailto:) does not exist in the database&#8217;
> 
> Execute this procedure by giving Table Name and the File Name
> 
> EXEC BCP\_Text\_File &#8216;Employee&#8217;,&#8217;C:\emp.txt&#8217;
> 
> Now all the data from Employee table will be exported to the text file which will be located at C:\emp.txt
> 
> _[from [WebLogs @ SqlJunkies.com](http://www.sqljunkies.com/WebLog/madhivanan/archive/2005/10/26/17217.aspx "BCP - Export data to Text File")]  
>_