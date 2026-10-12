---
title: Quick lesson on how to strip text out using RexEx
date: 2005-10-25T14:24:00-05:00
---
There&#8217;s just something about RegEx that makes my ears bleed. Fortunately other people get it. Here&#8217;s an example of how to filter text out of an expression, courtesy of Jeff Atwood&#8217;s [Coding Horror](http://www.codinghorror.com/blog/archives/000425.html "Excluding matches with Regular Expressions")&#8230;.

> 
> 
> > _  
> > For example, if the word fox was what I wanted to exclude, and the searched text was:  
> >_ 
> > 
> > The quick brown fox jumped over the lazy dog. 
> > 
> > &#8230; and I used a regular expression of \[^&#8221;fox&#8221;\] (which I know is incorrect) (why this doesn&#8217;t work I don&#8217;t understand; it would make life SO much easier), then the returned search results would be: 
> > 
> > The quick brown jumped over the lazy dog. 
> 
> 
> 
> Regular expressions are great at matching. It&#8217;s easy to formulate a regex using what you want to match. **Stating a regex in terms of what you _don&#8217;t_ want to match is a bit harder.**
> 
> One easy way to exclude text from a match is [negative lookbehind](http://www.regular-expressions.info/lookaround.html):
> 
> 
> 
> <pre><br />\w+\b(?&lt;!\bfox)<br /></pre>
> 
> 
> 
> But not all regex flavors support negative lookbehind. And those that do typically have severe restrictions on the lookbehind, eg, it must be a simple fixed-length expression. To avoid incompatibility, we can restate our solution using [negative lookahead](http://www.regular-expressions.info/lookaround.html):
> 
> 
> 
> <pre><br />(?!fox\b)\b\w+<br /></pre>
> 
> 
> 
> You can test this regex in the cool [online JavaScript Regex evaluator](http://www.cuneytyilmaz.com/prog/jrx/). Unfortunately, JavaScript doesn&#8217;t support negative lookbehind, so if you want to test that one, [I recommend RegexBuddy](http://www.codinghorror.com/blog/archives/000027.html). It&#8217;s not free, but it&#8217;s the best regex tool out there by far&#8211; and it keeps getting better with every incremental release.
