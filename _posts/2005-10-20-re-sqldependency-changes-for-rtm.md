---
title: 'RE: SqlDependency changes for RTM [Sushil Chordia]'
date: 2005-10-20T20:52:00-05:00
---
I want to play with this feature. I have implemented something with similiar functionality using UDP in an extended stored procedure, but this looks much simpler.

> 
> 
> As mentioned in my previous [blog](http://blogs.msdn.com/sushilc/archive/2004/12/07/277701.aspx), SqlDependency is a new feature in .Net framework 2.0, which provide a mechanism to notify an app when a cache is invalidated. We got enough feedback from customers in Beta 2 with regards ease of deployment (some issues [here](http://blogs.msdn.com/sushilc/archive/2005/01/31/363900.aspx)) and security that we decided to make some changes for the final release. These new changes are now available as part of the September CTP. Following is a quick example on how to get Notification working on the September CTP bits. (Things new in September CTP are marked in RED)
> 
> using System;  
> using System.Data;  
> using System.Data.SqlClient;  
> class QuikExe  
> {  
>   public static string connectionstring = &#8220;Get Connection String From The Config File&#8221;;  
>   public void DoDependency()  
>   {  
>     using (SqlConnection conn = new SqlConnection(connectionstring))  
>     {  
>       conn.Open();  
>       Console.WriteLine(&#8220;Connection Opened&#8230;&#8221;);
> 
>       SqlCommand cmd = conn.CreateCommand();  
>       cmd.CommandText = &#8220;Select i from dbo.test&#8221;;
> 
>       //Notification specific code  
>       SqlDependency dep = new SqlDependency(cmd);  
>       dep.OnChange += delegate(Object o, SqlNotificationEventArgs args)  
>       {  
>         Console.WriteLine(&#8220;Event Recd&#8221;);  
>         Console.WriteLine(&#8220;Info:&#8221; + args.Info);  
>         Console.WriteLine(&#8220;Source:&#8221; + args.Source);  
>         Console.WriteLine(&#8220;Type:&#8221; + args.Type);  
>       };
> 
>       SqlDataReader r = cmd.ExecuteReader();  
>       //Read the data here and close the reader  
>       r.Close();  
>       Console.WriteLine(&#8220;DataReader Read&#8230;&#8221;);  
>     }  
>   }
> 
>   public static void Main()  
>   {  
>     try  
>     {  
>       //Start the listener infrastructure on the client  
>       SqlDependency.Start(connectionstring);  
>       QuikExe q = new QuikExe();  
>       q.DoDependency();  
>       Console.WriteLine(&#8220;Wait for Notification Event&#8230;&#8221;);  
>       Console.Read();  
>     }  
>     finally  
>     {  
>       //Optional step to clean up dependency else it will fallback to automatic cleanup  
>       SqlDependency.Stop(connectionstring);  
>     }  
>   }  
> }
> 
> read the rest [here&#8230;](http://blogs.msdn.com/dataaccess/archive/2005/09/27/474447.aspx "SqlDependency changes for RTM [Sushil Chordia]")
