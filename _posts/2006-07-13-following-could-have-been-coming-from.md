---
date: 2006-07-13T17:50:00-05:00
---
The following could have been coming from my desk (but didn&#8217;t)

> 
> 
> Overheard at work today.
> 
> 
> 
> <blockquote dir="ltr">
>   <p>
>
>   </p>
>   
>   <p>
>     &#8220;It&#8217;s <a href="http://www.wise.com/Wise/Products/Installations/WiseforWindowsInstaller/Overview.aspx">Wise</a>, so I really don&#8217;t ask questions. I just work around it.&#8221; — <a href="http://www.alieniloquent.com/">Sam Tesla</a>, 7/12/2006
>   </p>
> </blockquote>
> 
> 
> 
> <p dir="ltr">
>   If you&#8217;ve worked with the Wise for Windows Installer, you&#8217;ll understand&#8230;
> </p>
> 
><img loading="lazy" src="http://excastle.com/blog/aggbug/5679.aspx" width="1" height="1" /> [[Joe White&#8217;s Blog]](http://excastle.com/blog/archive/2006/07/12/5679.aspx "Wise solutions")

I finally received confirmation from Wise Tech Support that the last bug that I reported was a real bug. You can&#8217;t install a service written in .NET 2.0 on a machine with the 1.1 and 2.0 Frameworks installed. Wise runs the installutil.exe from the Framework to install the service and they pick the wrong version to run. Of course, it may be fixed for the next release, but that&#8217;s tentative. My work around of using undocumented methods to self-install will continue to be used.
