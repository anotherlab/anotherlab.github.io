---
title: Exceptions and Threads
date: 2005-12-14T15:14:00-05:00
---
Scott Allen has a [good post](http://odetocode.com/Blogs/scott/archive/2005/12/14/2618.aspx "Death by Unhandled Exception") about a difference in how unhandled exceptions are dealt with in .NET 2 from how they were handled in 1.1 In 1.1, if a thread has a unhandled exception, the app would continue to run and there wouldn&#8217;t be any notice of an error. In .NET 2.0, an unhandled exception in a thread will take out the app, just like if it had occurred in the main thread.

I&#8217;m not sure how other people will like that, but that&#8217;s good news in my book. If an unhandled exception is going to take down an application, then it should happen across the board, not just in the main thread.

One of the projects that I am working on now is a set of services (.NET 1.1) that collect data from 3rd party GPS vendors. They are multi-threaded and I have spent a good deal of time working on the concurrency issues and error handling. If one of the background collection threads goes down, I really want to know about. I have try/catch in all of the places that need it, but if I have missed something, I want it to go down in flames instead of pretending nothing has happened.

Service applications, by their very nature, need to be able to document when an exception occurs. Writing to the Windows event log is pretty much a requirement. When the excrement hits the rotating air displacement device, the event log is your friend. I&#8217;ve been using [Log4Net](http://logging.apache.org/log4net/index.html) and logging error messages to my email account through it&#8217;s [SmtpAppender](http://logging.apache.org/log4net/release/config-examples.html#smtpappender).

Log4Net was a pain to getting working, but it&#8217;s a much simpler mechanism than the Logging block in Enterprise Library. One of the requirements of the service is that it be easy to configure for the end user. I don&#8217;t want the end user to have run or even know about the &#8220;Enterprise Library Configuration console&#8221; that the Enterprise Library uses to manage the configuration settings. It&#8217;s a whole lot of overkill for what I needed.
