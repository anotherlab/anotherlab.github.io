---
id: 454
title: More fun with threading
date: 2005-05-27T13:47:00-05:00
layout: post
guid: http://www.rajapet.com/?p=454
permalink: /2005/05/27/more-fun-with-threading/
---
Here&#8217;s an interesting post from [benwu](http://blogs.msdn.com/benwu/default.aspx).  
After executing Thread1 and Thread2, what are the possible values for &#8220;i&#8221;?

<div>
  <span>bool</span> b1 = <span>false</span>; <br /><span>bool</span> b2 = <span>false</span>; <br /><span>int</span> i = 0; <br /><span>private</span> <span>void</span> Thread1() <br />{ <br />    b1 = <span>true</span>; <br />    <span>if</span> (b2) <br />    { <br />        i = 1; <br />    } <br />} <br /><span>private</span> <span>void</span> Thread2() <br />{ <br />    b2 = <span>true</span>; <br />    <span>if</span> (b1) <br />    { <br />        i = 1; <br />    } <br />}
</div>

On multi-processor machines, sometimes it will be zero. Check [here](http://blogs.msdn.com/benwu/archive/2005/05/06/415247.aspx) for his explanation.