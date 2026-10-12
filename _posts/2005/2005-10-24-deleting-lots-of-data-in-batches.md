---
title: Deleting lots of data in batches
date: 2005-10-24T14:54:00-05:00
---
The fun part is in the &#8220;where&#8230;&#8221; bit, knowing how to set your query to only get a portion of the data is heavy lifting here.  
I know where I&#8217;m going to be using this in some soon to be written code. For the code, the data will timestamped, I can safely iterate by day and nuke all of the records for each day.

> 
> 
> So we&#8217;ve all come across the need to delete 10 million records. however we all no that this won&#8217;t be quick and will result in a large log file and as we get nearer deleting the 10 millionth row the process is going very slowly.
> 
> 
> 
> Well the standard way around this is to run the command in batches, this way our transaction is never very big. So you can write a while loop and check an iterator, but first you need to get into the loop so you need to store the iteration in a variable and have something like this
> 
> 
> 
> set rowcount 10000  
> declare @rc int  
> set @rc =0  
> while @rc < 1000   
>   begin   
>   &#8211;Do my update/delete etc      
>   delete from mytable where &#8230;.  
>   set @rc = @rc+1  
>   end
> 
> 
> 
> 
> 
> Well in SQL 2005 in SQLCMD mode and the new TOP clause in an update/delete you can do the following
> 
> 
> 
> &#8211;your update statement  
> delete top (10000) from mytable where &#8230;.  
> :go 1000
> 
> 
> 
> which of these looks easier to you. I vote for number 2.
> 
> _[via [WebLogs @ SqlJunkies.com](http://www.sqljunkies.com/WebLog/simons/archive/2005/10/23/17204.aspx "SQLCMD in SQL 2005  to delete lots of data in batches")]  
>_
