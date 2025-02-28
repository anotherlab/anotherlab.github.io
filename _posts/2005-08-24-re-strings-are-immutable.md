---
title: 'RE: Strings are immutable'
date: 2005-08-24T13:47:00-05:00
---
Sahil has a good post that explains why you should use StringBuilder to concatenate strings instead of just doing &#8220;string a&#8221; + &#8220;string b&#8221;

> 
> 
> <span>So lets see now, look at this code below &#8212;</span>
> 
> <span></p> 
> 
> <p>
>   String
> </p>
> 
> <p>
>   str = &#8220;Sahil &#8221; + &#8220;is&#8221; + &#8221; a&#8221; + &#8221; modern&#8221; + &#8221; man&#8221;;</span>
> </p>
> 
> <p>
>
> </p>
> 
> <p>
>   <span><span>So right in the code above, how many times did the memory get allocated, and then de-allocated? Dude in the above code, first the framework will declare memory for all 5 strings, and as you concatenate them, it will have to reallocate, and copy memory all over, and over, and over and over again until it gets the final &#8220;str&#8221;. This is why, you should use StringBuilder &#8211; because that is not an immutable object. It has the ability to reuse the same memory. </span></span>
> </p>
> 
> <p>
>
> </p>
> 
> <p>
>   <span><span>Now this has other implications too, but as long as you remember to say &#8220;Strings are immutable&#8221; and sufficiently explain what you meant by that, your interviewer will be more or less happy.</span></span>
> </p>
> 
> <p>
>
> </p>
> 
> <p>
>   <span><span></span></span><span> </span>
> </p>
> 
> <p>
>   <img loading="lazy" src="http://codebetter.com/aggbug.aspx?PostID=131114" width="1" height="1" />
> </p></blockquote> 
> 
> <p>
>   <i>[Via <a href="http://codebetter.com/blogs/sahil.malik/archive/2005/08/24/131114.aspx">Sahil Malik [MVP C#]</a>]</i>
> </p>
