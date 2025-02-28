---
title: 'RE: Performance Analysis Tools from Microsoft (Free)'
date: 2005-10-07T15:54:00-05:00
---
You can never have enough tracing tools&#8230;..

> You may have noticed that Micorsoft have opened up and are particpating more and more in the community, blogs, newsgroups, events etc. One of the others is the making available of the tools used internally. 
> 
> 
> 
> Having just got my latest SQLMag I read with interest the [article](http://www.windowsitpro.com/Article/ArticleID/47465/47465.html?Ad=1) on tools being used in Microsoft PSS  (Product Support Services). These tools are available for download from Microsoft
> 
> 
> 
> <http://support.microsoft.com/default.aspx?scid=kb;en-us;887057>
> 
> 
> 
> The one that most interests me is the read80Trace. This processes trace files, including rollover files, and provides summary information, aggregates etc. The great thing is that it works out the sp calls from the text data so you don&#8217;t have to do it yourself. And then stores the data in a normalised database so you can perform your own queries on it.
> 
> 
> 
> There is one gotcha, in that it needs EndTime in your trace files, which isn&#8217;t in a trace by default. If you have trace files you want to process using this tool you can load your data into a table add a derived column of EndTime that is dateadd(ms,duration,starttime), load the trace back into profiler and save to a file. Not great but it does work.
> 
> 
> 
> These tools can also be used to reprocess the profiled data.
> 
> 
> 
> If you haven&#8217;t look at these tools you should, the help is quite useful as is the article above.

_[Via [SQLJunkies Blogs](http://sqljunkies.com/WebLog/simons/archive/2005/10/07/17043.aspx)]_
