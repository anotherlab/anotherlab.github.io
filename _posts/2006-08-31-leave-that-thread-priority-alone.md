---
title: Leave that thread priority alone
date: 2006-08-31T17:34:00-05:00
---
During initial [e-Link](http://www.versatrans.com/products/versatrans_e-link.cfm) web service development, I played around with lowering the priority of a background processing thread.  It didn&#8217;t need to run in real time and having the service handling client requests was more important.  For a background housekeeping thread, I lowered it&#8217;s priority to BelowNormal.

Well that didn&#8217;t work quite the way I expected it.  That thread never ran, or it ran so seldom that it was effectively useless.  So I removed the calls to lowering the thread priority and life was good again.  I chalked it up to one of those thread things not to touch and moved on to other tasks.

Today, I saw a [posting](http://www.codinghorror.com/blog/archives/000671.html) on the [Coding Horror](http://www.codinghorror.com/blog/) that explained why you should never mess with thread prioirities.  If you have a thread running at a lower priority and it enters a sleep state, it may never wake up if another thread with a higher priority continues to run.  That&#8217;s an oversimplification, the actual details are described better [here](http://www.bluebytesoftware.com/blog/PermaLink,guid,1c013d42-c983-4102-9233-ca54b8f3d1a1.aspx) by [Joe Duffy](http://www.bluebytesoftware.com/blog/default.aspx).

The moral of today&#8217;s story is &#8220;**Set up your threads at normal priority and let the operating system deal with scheduling them**&#8220;

 

<div>
  Tech Tags: <a href="http://technorati.com/tag/e-link" rel="tag">e-link</a> <a href="http://technorati.com/tag/thread" rel="tag">thread</a> <a href="http://technorati.com/tag/priority" rel="tag">priority</a> <a href="http://technorati.com/tag/BelowNormal" rel="tag">BelowNormal</a> <a href="http://technorati.com/tag/evil" rel="tag">evil</a> <a href="http://technorati.com/tag/Win32" rel="tag">Win32</a> <a href="http://technorati.com/tag/Delphi" rel="tag">Delphi</a> <a href="http://technorati.com/tag/C#" rel="tag">C#</a> <a href="http://technorati.com/tag/Coding+Horror" rel="tag">Coding Horror</a>
</div>
