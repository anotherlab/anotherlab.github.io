---
id: 328
title: Jack of all trades, master of none.
date: 2006-01-24T15:02:00-05:00
layout: post
guid: http://www.rajapet.com/?p=328
permalink: /2006/01/24/jack-of-all-trades-master-of-none/
---
[Jeff Atwood](http://www.codinghorror.com/blog/) has a good [rant](http://www.codinghorror.com/mtype/mt-tb-renamed.cgi/496) about people asking for web sites that scale to devices like PDA’s or crackberry’s.  He takes the view that it would be nice if every web site could scale from cell phone size to desktop, but that it’s not always a realistic request.  

I’m with Jeff on this.  While it’s fairly straight forward to parse a browser’s user agent string and redirect to the appropriate destination, you have to make a risk/reward assessment on the cost of implementing your site that way.  Just because it’s posible to do something, it doesn’t mean that it’s a practical thing to do.  A site like Google, that’s an obvious choice to run at any size.  You can use a search engine without any graphics and a minimal amount of actual typing.

That choice doesn’t always make sense.  For example, our [company’s](http://www.versatrans.com/) new product is a web based school bus tracking application.  [Microbrowser](http://en.wikipedia.org/wiki/Microbrowser) compatibility was not even on the radar.  We know who our initial client base will be and what they will be using. And viewing live feeds of where their fleet currently is really doesn’t play well at 176&#215;220.  And we know that this application will be run from transportation and administration offices, not out in field.  The time it would take to develop an alternate presentation layer would take away from the development time needed for other parts of the application.  

I’m not buying the argument that you can handle the grunt work with CSS, it’s a non-trivial task to support handheld browsers.  That market is very fragmented right now with the choices of browers.  Add handhelds to the testing mix, and your QA costs just suddenly became a lot more expensive.  You have usage plan costs to eat, various models of handhelds that have to be available for testing, etc.

<blockquote dir="ltr">
  <p>
    <em>Millions of Web users are out there with cell phones. If you don’t get your site to work properly with a cell phone, you’re turning away customers and that sucks. It’ll get called out.</em>
  </p>
</blockquote>

Comments like that are why I stopped reading [Scoble](http://scobleizer.wordpress.com/2006/01/01/one-wish-for-2006/) too.

If we had actual demand from our customers for microbrowser support, of course we would consider implementing that level of functionality.  It boils down that we are not going to lose customers right now if we only support desktop browsers.