---
title: Proof by lack of evidence
date: 2008-06-17T04:00:00-05:00
---
CNET’s Matt Asay wrote an article for CNET’s News.com that was just so bad, it gets the “[Epic](http://www.urbandictionary.com/define.php?term=epic+fail) [Fail](http://media.g4tv.com/images/blog/2007/12/06/633325462873135493.jpg)” [tag](http://images.google.com/images?q=epic+fail).  You can get the gist of how bad it is by the first few lines:

> **Vista&#8217;s big problem: 92 percent of developers ignoring it**
> 
> And to think Microsoft used to be popular with the developer crowd&#8230;
> 
> Not anymore. A recent report from Evans Data shows fewer than one in 10 software developers writing applications for Windows Vista this year. Eight percent. This is perhaps made even worse by the corresponding data that shows 49 percent of developers writing applications for Windows XP.

Wow, I’m not sure where to start on this one.  I started by visiting the Evans Data web site that Asay refered via this [link](http://www.evansdata.com/press/viewRelease.php).  It was vague and provide no actual metrics.  How that “one in 10” number was arrived that was never specified.  Sounds pretty bogus to me.

What they did say was this:

> Only eight percent of North American software developers are currently writing applications to run on Microsoft&#8217;s Vista operating system, while half are still writing programs for XP, according to Evans Data&#8217;s Spring 2008, North American Development Survey. These same developers forecast a fragmented Windows market in 2009 with only 24 percent expecting to target Vista and 29% expecting to continue with XP.

8% of what?  Is that 8% of all developers writing for the Windows Desktop or is 8% of all North American software developers.  The former is a subset of the latter.  Did they exclude web developers from that count?

The other question is what do they mean by writing for Vista?  Does that mean writing for features specific to the Vista platform or does it mean writing the code so that it behaves under Vista?  Did they break that out by managed code as compared to unmanaged code?  If you are writing managed code like for the .NET Framework or Java, then you are not targeting an OS, you target the managed code framework.

Since Matt conveniently left out any actual numbers, I can use myself as a sample set.  A sample size of 1 is just as relevant and/or meaningless as an undefined sample size. I write shrink-wrapped applications for the Windows desktop market.  I do both Win32 coding (with Delphi 2007) and for the .NET Framework (with Visual Studio 2008).  All of my code is tested on XP, Vista, Server 2003, and Server 2008.  

With the .NET Framework, I have no code that is OS specific and I didn’t have to change any of it for Vista or Server 2008.  For the Delphi code, some minor changes were made to account for the location of the local application data folder.  That was all we had to do.  It’s something like 5 lines of Delphi code out 500,000+.  Of course by using Delphi 2007, we get the benefit of the Delphi VCL being Vista aware.  We get the Aero Glass effects and the new UI for dialogs without any code changes.

Does that mean we are not targeting Vista?  No, it just means for our applications, that Windows XP and every OS that comes after it is tested and supported.  That leads back to the critical failure point of Matt Asay’s article.  He’s making broad assumptions based on no evidence.  I’m reminded of that old quote by [Leonard H. Courtney](http://en.wikiquote.org/wiki/Leonard_H._Courtney), “There are three kinds of lies: lies, damned lies, and statistics.”

I don’t usually read news.com anymore, in fact I came across Matt Asay’s article in a [blog post by Steve Trefethen](http://www.stevetrefethen.com/blog/TechmemeHelpingDriveTrafficToSensationalCnetBlogPost.aspx).  So I’m not familiar with Matt Asay’s body of work.  I don’t know if he wrote this out of ignorance out or as Steve put it: “written for no other reason than to generate traffic for c|net.”  I would like to know how much actual research Matt performed for his article.</p> </p> </p> </p> </p> </p> </p> </p> </p> </p> </p> </p> </p> </p> </p> </p> </p> </p> </p> </p> </p> </p> </p> </p> </p> </p> </p> 

The title of this post comes from the “You Are Wrong Because” portion of Scott Adams book, “The Joy of Work: Dilbert&#8217;s Guide to Finding Happiness at the Expense of Your Co-Workers”.  The context was that Adams has stated that irrational people are easily persuaded by anything that has been published.  I think that’s applicable with with Matt Asay’s article.

_{updated on 6/23/08]_  
I removed the link to Matt Asay’s article because I didn’t want to give him any more traffic.  It’s not that there would be a lot coming from my blog, it’s more of a principle thing.  I had originally included a link so that people could make up their own mind, but I think I have enough of his article to make my point.  And if you really want to read it, you know where to find it.
