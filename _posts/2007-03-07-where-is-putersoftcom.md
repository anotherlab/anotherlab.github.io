---
id: 259
title: Where is puterSoft.com?
date: 2007-03-07T19:55:00-05:00
layout: post
guid: http://www.rajapet.com/?p=259
permalink: /2007/03/07/where-is-putersoftcom/
---
Don&#8217;t you hate it when a software component vendor disappears without warning?  In some of our applications, we use a custom datetime edit control named TPSCDateEdit.  This is part of a package from a company named [puterSoft](http://www.putersoft.com/).  We have been using it for about 5 years and when we migrated our Delphi code to Delphi 2006, we got the Delphi 2006 version of their code.

Well, we discovered an annoying cosmetic bug.  If you exit a TPSCDateEdit control without entering in a date, the text of the control gets the date &#8217;12/30/1899&#8242;.  12/30/1899 is the day that the world began if you are a COM based life form.  The control was saving the right data (or in this case the lack of data), it was just the display that looked ugly.

So the first thought was to check puterSoft&#8217;s [web site](http://www.putersoft.com/) to see if this was a known issue and had a fix or work around.  That failed and when I tied to ping the domain name, that failed.  I did some playing around on <http://www.dnsstuff.com/> and I learned that it was hosted at DiscountASP.net and that DNS lookups are failing.  If you perform a <a title="DNS Lookup: putersoft.com A record" href="http://www.dnsstuff.com/tools/lookup.ch?name=putersoft.com&#038;type=A" target="_blank">DNS lookup for puterSoft</a>, it goes into a loop and DNSstuff is smart enough to break out of that loop. 

I can&#8217;t tell if puterSoft is gone or something is all [fracked](http://en.wikipedia.org/wiki/Frack) up with DiscountAsp.net&#8217;s DNS records.  I&#8217;ve emailed Sergiy at puterSoft to see if they are still around.  I also fired off an email to DiscountAsp to see if they can tell me anything.  After 20 minutes, I got a reply back from DiscountASP.NET that the account has been cancelled.  That&#8217;s **Not Good<sup>tm</sup>**.

<a href="http://img50.imageshack.us/my.php?image=churchsignyc2.jpg" target="_blank"><img src="https://i2.wp.com/img50.imageshack.us/img50/4026/churchsignyc2.th.jpg?w=680" border="0" data-recalc-dims="1" /></a> 

Since I&#8217;m not going to get any resolution from puterSoft in the immediate future, I decided to take a whack at it and see if it was a simple fix.  And it looks like it is.

When you exit a TPSCDateEdit, the following methods are called:

  * TPSCCustomDateEdit.PostValue 
  * TPSCCustomDateEdit.SetDateTime 
  * TPSCCustomDateEdit.UpdatePopup 
  * TPSCCustomDateEdit.GetAsText

Other methods are called, these are the ones important here.  UpdatePopup has the following logic:

 

<div>
  <span>If Text </span><span><></span><span> GetAsText Then<br />  Text :</span><span>=</span><span> GetAsText;</span>
</div>

 

The code in GetAsText looks like this:

  

<div>
  <span>function</span><span> TPSCCustomDateEdit.GetAsText:String; </span><span><br />begin<br /></span><span>  Result:</span><span>=</span><span>DateTimeFormat.ToString(DateTime,Kind) </span><span><br />end</span><span>; </span>
</div></p> 

By changing that code to this:

<div>
  <span>function</span><span> TPSCCustomDateEdit.GetAsText:String; </span>
</div>

<div>
  <span></span><span>begin</span><span> </span>
</div>

<div>
  <span></span><span>  if</span><span> DateTime </span><span><></span><span> </span><span></span><span> </span><span>then</span><span> </span>
</div>

<div>
  <span>    Result:</span><span>=</span><span>DateTimeFormat.ToString(DateTime,Kind) </span>
</div>

<div>
  <span></span><span>  else</span><span> </span>
</div>

<div>
  <span>    result :</span><span>=</span><span> </span><span>&#8221;</span><span>; </span>
</div>

<div>
  <span></span><span>end</span><span>; </span>
</div>

 

I get result that I want. And life is good again.

<div>
  Tech Tags: <a href="http://technorati.com/tag/puterSoft" rel="tag">puterSoft</a> <a href="http://technorati.com/tag/DiscountAsp" rel="tag">DiscountAsp</a> <a href="http://technorati.com/tag/Delphi" rel="tag">Delphi</a> <a href="http://technorati.com/tag/TPSCDateEdit" rel="tag">TPSCDateEdit</a> <a href="http://technorati.com/tag/DNSstuff" rel="tag">DNSstuff</a>
</div>