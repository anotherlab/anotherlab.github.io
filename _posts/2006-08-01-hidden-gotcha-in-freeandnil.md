---
title: Hidden gotcha in FreeAndNil()
date: 2006-08-01T04:10:00-05:00
---
Time to go memory leak hunting in my service. I&#8217;m using [AutomatedQA](http://www.automatedqa.com/)&#8216;s [AQTime 4](http://www.automatedqa.com/products/aqtime/index.asp), a really cool tool. I&#8217;ve used it&#8217;s profiling features in the past, but not the memory leak detection. Since Delphi frees up your allocated memory when you exit the app and/or service, it&#8217;s too easy to get sloppy and not free up singleton types of objects. Well, that makes it harder to find actual memory leaks as AQTime is going to flag everything that wasn&#8217;t explicitly freed up as a leak. And that will lower the [s/n](http://mm.iit.uni-miskolc.hu/Data/texts/hackers_jargon/signal-to-noiseratio.HTML) ratio to make the too to hard to use. 

So I&#8217;m pounding through the code and making sure that everything gets created, gets freed. Great fun, I recommend it for the entire family. I&#8217;m starting the service (actually the app version of service, but that&#8217;s another posting), then exiting it after it initiatizes. That way I can clear out all of the obvious suspects and then turn my attention to the serious memory leaks.

So I&#8217;m in the middle of doing this, when one of the objects that I am now explicitly freeing is now blowing up when I free it. And not in a good way. This object, let&#8217;s call him Fredo (not really the name), owns a few accessory objects (call them Phil and Reuben). In Fredo&#8217;s destructor, Fredo is destroying Phil & Reuben. In Phil&#8217;s destructor, Phil references another object belonging to Fredo and blows up because Fredo has gone fishing and doesn&#8217;t exist anymore.

It took a while to figure out what was going on. You see Fredo wasn&#8217;t actually fishing, Fredo was still around. Phil was accessing Fredo through a global variable (bad legacy code) because Fredo was a singleton. The variable that reference Fredo had been set to nil, even though Fredo was still in existence.

It took a while, but I figured where and how I had broken Fredo. The code that I had added to destroy Fredo looked like this:

<pre>FreeAndNil(Fredo);</pre>

The FreeAndNil() procedure was added back around Delphi 3 or so. You pass in an object reference, it free&#8217;s that object and sets the reference to nil. Horse and buggy thinking for the managed code set, but useful in non-managed versions of Delphi. The problem was that FreeAndNil doesn&#8217;t exactly work that way. Let&#8217;s take a quick peek at that code:

<pre><br /><b>procedure</b> FreeAndNil(<b>var</b> Obj);<br /><b>var</b><br />  Temp: TObject;<br /><b>begin</b><br />  Temp := TObject(Obj);<br />  Pointer(Obj) := <b>nil</b>;<br />  Temp.Free;<br /><b>end</b>;<br /></pre>

It&#8217;s setting the variable to nil before it free&#8217;s it. It&#8217;s not how it&#8217;s documented and it caused my code to fail. There&#8217;s nothing wrong with how FreeAndNil is coded, by setting the variable to nil first, other objects can check to see if it still exists and not try to access that object while it&#8217;s being destroyed. I just would preferred that the documentation more accurately described the actual functionality.

<div>
  Tech Tags: <a href="http://technorati.com/tag/Delphi" rel="tag">Delphi</a> <a href="http://technorati.com/tag/AutomatedQA" rel="tag">AutomatedQA</a> <a href="http://technorati.com/tag/AQTime" rel="tag">AQTime</a> <a href="http://technorati.com/tag/FreeAndNil" rel="tag">FreeAndNil</a> <a href="http://technorati.com/tag/Fredo" rel="tag">Fredo</a>
</div>
