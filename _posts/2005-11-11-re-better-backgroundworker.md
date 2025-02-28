---
title: 'RE: A better BackgroundWorker : CancelImmediately and other goodies'
date: 2005-11-11T17:28:00-05:00
---
Hmm, I can use this for a service testing application that I&#8217;m working on&#8230;

> 
> 
> <div>
>   One of the nice new features you get in .NET 2.0 Winforms is the new BackgroundWorker component. It allows safely executing long tasks in a different thread than the GUI, while allowing an easy event-driven interface to perform the task and respond to events (such as detecting work progress). There are even <a href="http://weblogs.asp.net/rosherove/archive/2004/06/16/156948.aspx">versions of this for .NET 1.1</a> courtesy of <a href="http://www.idesign.net/">Juval Lowy</a>.
> </div>
> 
> <div>
>   One of the things it does <strong>not </strong>support is the ability to Cancel the running task <strong>immediately</strong> rather than waiting for the code to process the Cancel Request (which is vital if your &#8220;DoWork&#8221; code contains tasks that individually take a long time to process). With some Reflectoring, I was able to overcome this obstacle and provide a solution for this problem.
> </div>
> 
> <div>
>    
> </div>
> 
> <div>
>   For the full details and download in VB.NET and C#, read the full article:
> </div>
> 
> <div>
>   <a href="http://weblogs.asp.net/rosherove/articles/BackgroundWorkerEx.aspx">Creating a better BackgroundWorker: CancelImmediately and other goodies</a>
> </div>
> 
> [[ISerializable &#8211; Roy Osherove&#8217;s Blog]](http://weblogs.asp.net/rosherove/archive/2005/11/09/430086.aspx "A better BackgroundWorker : CancelImmediately and other goodies")

[Update] There&#8217;s a good article by Juval Löwy, titled [Asynchronous Windows Forms Programming](http://www.code-magazine.com/article.aspx?quickid=0403071 "Asynchronous Windows Forms Programming") that covers this in great detail
