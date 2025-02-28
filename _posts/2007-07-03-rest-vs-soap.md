---
title: REST vs SOAP
date: 2007-07-03T18:35:00-05:00
---
In the weekly newsletter from [TheServerSide.NET](http://www.theserverside.net/), there was a link to an article titled [&#8220;REST versus SOAP &#8211; the REST story&#8221;](http://searchwebservices.techtarget.com/tip/0,289483,sid26_gci1227190,00.html?track=NL-462&ad=595566&Offer=WStsnret73rest&asrc=EM_NLN_1720842&uid=3232655) by [William Brogden](http://www.wbrogden.com/).  It&#8217;s a few months old, but talk about the recent rise in [REST](http://en.wikipedia.org/wiki/REST) types of services over [XML-RPC](http://en.wikipedia.org/wiki/XML-RPC) and [SOAP](http://en.wikipedia.org/wiki/SOAP).   Brogden briefly covers REST, but he doesn&#8217;t talk about the advantages of REST and why you would ever want to use it over SOAP.  It&#8217;s obvious that he prefers SOAP, but the reasoning was left out of the article.

Having done SOAP and REST for accessing web services, I can see the where it&#8217;s advantageous to use SOAP as opposed to REST (or vice versa).  SOAP is very chatty, but you can send complex data structures to the web service.  Development tools like Visual Studio or Delphi can can read the WSDL from the web service and that gives you the &#8220;intellisense&#8221; autocompletion functionality that can save a lot of coding time.

With REST, you access the web service with just the basic HTTP GET and PUT commands.  You compose a URL for your web method request and the service sends back a response.  The response is usually in XML, but that is dependant on the functionality of the web service.

The drawback with SOAP is that there is more overhead in the construction of the method request and with the parsing of the request on the web service end.  When you have a web service that is serving thousands of requests a minute or second, that overheard may not be needed.

For web services that have relatively simple data types, using REST can provide the functionality that is needed.  You also get the advantage of testing individual method requests from a browser as the method request is basic URL.  

<div>
  Tech Tags: <a href="http://technorati.com/tag/REST" rel="tag">REST</a> <a href="http://technorati.com/tag/SOAP" rel="tag">SOAP</a> <a href="http://technorati.com/tag/REST+vs+SOAP" rel="tag">REST+vs+SOAP</a> <a href="http://technorati.com/tag/XML-RPC" rel="tag">XML-RPC</a>
</div>
