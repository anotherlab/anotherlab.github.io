---
title: How expensive are .NET exceptions?
date: 2006-01-23T15:59:00-05:00
---
With .NET, I keep hearing “Don’t use exceptions, they’re expensive” and I have always wondering how true it was.  I’ve been in the camp of using exceptions when you need them and don’t worry about the performance cost.  You want to use them for handling situations where something completely unexpected is happening in the code.  I don’t believe in using them to return an error condition in code, that’s what function return values are for.

But how expensive are they?  It’s all relative, but it turns out that it’s not that painful to use them performance wise.  [Jon Skeet](http://www.developerfusion.co.uk/profile/37774) has a simple bit of code that benchmarks how expensive it is to call exceptions and you can read about in [this article](http://www.developerfusion.co.uk/show/5250/).  The code is pretty simple and the results are only relative to his machine, but he was handling exceptions in the range of 40 to 188 exceptions per millisecond.  Seems quick enough for me, but your mileage may vary.  He noted that running the code inside the debugger will run much slower (many seconds versus a few milliseconds) for the processing of exceptions.  It’s the performance hit from running the code through the debugger that probably led people to think that exceptions are expensive.

There are some caveats with Jon’s example. He calls the same exception repeatedly, it may be more expensive to call many different examples than the same one over and over.  His example was in the Main() function, it wasn’t nested at all.  The deeper, you nest the code, the more expensive the hit is.

Technorati Tags: <a href="http://technorati.com/tag/C%23" rel="tag">C#</a> <a href="http://technorati.com/tag/.NET" rel="tag">.NET</a> <a href="http://technorati.com/tag/exceptions" rel="tag">exceptions</a>
