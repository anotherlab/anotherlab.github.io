---
id: 176
title: A more robust way of converting a string to an enumerated value (enum)
date: 2008-04-30T17:50:00-05:00
layout: post
guid: http://www.rajapet.com/?p=176
permalink: /2008/04/30/more-robust-way-of-converting-string-to/
---
A while back, I [had blogged](http://anotherlab.rajapet.net/2005/04/convert-string-to-enumerated-enum.html) about a tip that Mark Wagner had posted [about converting a string to an enumerated value](http://blogs.crsw.com/mark/archive/2005/04/07/832.aspx).  Tim Sneath posted a [similar tip](http://blogs.msdn.com/tims/archive/2004/04/02/106310.aspx "How do you convert a string into an enum?") even earlier, except his had some additional error logging.  Tim&#8217;s post made it to DotNetKicks, which is good because having the additional error handling is just good coding practice.  

<div>
  <pre><span>enum</span> Sushi<br />{<br />   Ika,<br />   Hirameh,<br />   Tako<br />} <br /><br /><span>// ...</span><br />Sushi lunch = (Sushi) Enum.Parse(<span>typeof</span>(Colour), <span>"Tako"</span>, <span>true</span>);<br />Console.WriteLine(<span>"Sushi Value: {0}"</span>, lunch.ToString());<br /><br /><span>// To avoid an ArgumentException for strings that do have</span><br /><span>// corresponding enumerate values, call Enum.IsDefined() </span><br /><span>// first.</span><br /><br /><span>string</span> NotSushi = <span>"pizza"</span>;<br /><br /><span>if</span> (Enum.IsDefined(<span>typeof</span>(Sushi), NotSushi))<br />{<br />   lunch = (Sushi) Enum.Parse(<span>typeof</span>(Sushi), NotSushi, <span>true</span>);<br />}   <br /><span>else</span><br />{<br /><span>// Add your error logic here</span><br />}</pre>
</div>



Mucho gracias to Tim & Mark&#8230;