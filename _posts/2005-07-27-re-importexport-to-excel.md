---
id: 423
title: 'RE: Import/Export to Excel'
date: 2005-07-27T13:34:00-05:00
layout: post
guid: http://www.rajapet.com/?p=423
permalink: /2005/07/27/re-importexport-to-excel/
---
Every now and then, I need to send stuff from SQL to Excel&#8230;.

> <span>Apart from using DTS and Import/Export wizard, we can also use this query to export data from SQL Server2000 to Excel and vice versa</p> 
> 
> <p>
>   Create an Excel file named testing having the headers same as that of table columns and use this query
> </p>
> 
> <p>
>   insert into OPENROWSET(&#8216;Microsoft.Jet.OLEDB.4.0&#8217;, <br />&#8216;Excel 8.0;Database=D:\testing.xls;&#8217;, <br />&#8216;SELECT * FROM [SheetName$]&#8217;) select * from SQLServerTable
> </p>
> 
> <p>
>   To export data from Excel to new SQL Server table,
> </p>
> 
> <p>
>   select * <br />into SQLServerTable FROM OPENROWSET(&#8216;Microsoft.Jet.OLEDB.4.0&#8217;, <br />&#8216;Excel 8.0;Database=D:\testing.xls;HDR=YES&#8217;, <br />&#8216;SELECT * FROM [Sheet1$]&#8217;)
> </p>
> 
> <p>
>   To export data from Excel to existing SQL Server table,
> </p>
> 
> <p>
>   Insert into SQLServerTable Select * FROM OPENROWSET(&#8216;Microsoft.Jet.OLEDB.4.0&#8217;, <br />&#8216;Excel 8.0;Database=D:\testing.xls;HDR=YES&#8217;, <br />&#8216;SELECT * FROM [SheetName$]&#8217;)
> </p>
> 
> <p>
>   </span>
> </p>
> 
> <p>
>   <img loading="lazy" src="http://sqljunkies.com/WebLog/aggbug.aspx?PostID=16233" width="1" height="1" />
> </p></blockquote> 
> 
> <p>
>   <i>[Via <a href="http://sqljunkies.com/WebLog/madhivanan/archive/2005/07/27/16233.aspx">SQLJunkies Blogs</a>]</i>
> </p>