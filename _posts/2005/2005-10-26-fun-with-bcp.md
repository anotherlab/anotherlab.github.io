---
title: Fun with BCP
date: 2005-10-26T15:01:00-05:00
---
Here's a quick and dirty way to export a table to a text file with SQL Server. With some minor tweaking, it should also work for views and stored procedures that return result sets.

{% highlight sql linenos %}
CREATE Procedure BCP_Text_File
( 
@table varchar(100), 
@FileName varchar(100) 
) 
as 
If exists(Select * from information_Schema.tables where <table_name=@table>)
    Begin
        Declare @str varchar(1000) 
        set @str='Exec Master..xp_Cmdshell "bcp "Select * from '+db_name()+'..'+@table+'” queryout "'+@FileName+'"”" -c”'
        Exec(@str) 
    end
else
    Select 'The table '+@table+' does not exist in the database’

Execute this procedure by giving Table Name and the File Name

EXEC BCP_Text_File 'Employee','C:\emp.txt'
{% endhighlight %}

Now all the data from Employee table will be exported to the text file which will be located at C:\emp.txt

[from [WebLogs @ SqlJunkies.com](http://www.sqljunkies.com/WebLog/madhivanan/archive/2005/10/26/17217.aspx "BCP - Export data to Text File")]  
