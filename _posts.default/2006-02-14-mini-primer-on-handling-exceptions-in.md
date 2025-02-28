---
id: 321
title: Mini-primer on handling exceptions in .NET
date: 2006-02-14T14:38:00-05:00
layout: post
guid: http://www.rajapet.com/?p=321
permalink: /2006/02/14/mini-primer-on-handling-exceptions-in/
---
There&#8217;s a lot of good technique in a short article. I wont repeat it all here, just a taste&#8230;

> 
> 
> ###### Code Sample #3:  
> 
> 
> <div>
>   <div>
>     try {
>   </div>
>   
>   <div>
>         // code
>   </div>
>   
>   <div>
>     } catch (Exception e) {
>   </div>
>   
>   <div>
>        throw new ApplicationException(&#8220;Some useful message about what we&#8217;re doing: &#8221; + e.Message);
>   </div>
>   
>   <div>
>     }
>   </div>
> </div>
> 
> <div>
>    
> </div>
> 
> <div>
>   Whoah again. We just lost a lot of information about the original exception, including its stack trace and any inner exceptions it contained and made our debugging lives a lot harder. I would recommend the following code instead:
> </div>
> 
> <div>
>    
> </div>
> 
> <div>
>   <div>
>     try {
>   </div>
>   
>   <div>
>         // code
>   </div>
>   
>   <div>
>     } catch (Exception e) {
>   </div>
>   
>   <div>
>        throw new ApplicationException(&#8220;Some useful message about what we&#8217;re doing&#8221;, e);
>   </div>
>   
>   <div>
>     }
>   </div>
> </div>
> 
> <div>
>    
> </div>
> 
> <div>
>   This code propagates the original exception as the innerException so that we can see the exact origin of the failure.
> </div>
> 
> Courtesy of [[James Kovacs&#8217; Weblog]](http://www.jameskovacs.com/blog/CommonPitfallsWhenHandlingExceptionsInNET.aspx "Common Pitfalls when Handling Exceptions in .NET")