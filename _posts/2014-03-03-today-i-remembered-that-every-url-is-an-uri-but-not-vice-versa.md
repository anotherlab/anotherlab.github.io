---
id: 681
title: Today I remembered that every URL is an URI, but not vice versa
date: 2014-03-03T13:07:38-05:00
layout: post
guid: http://www.rajapet.com/?p=681
permalink: /2014/03/03/today-i-remembered-that-every-url-is-an-uri-but-not-vice-versa/
---
I was writing some validation code for a desktop app and there are some fields require web page URLs.  My first thought was to a regular expression to validate the input, then this quote came to mind.

> Some people, when confronted with a problem, think “I know, I&#8217;ll use regular expressions.” Now they have two problems.  
> [Jamie Zawinski](http://www.jwz.org/)

Regular expressions can solve many problems, but if there is a method in the .Net Framework that will solve the problem, I&#8217;ll use that first.

I started off using the [IsWellFormUriString](http://msdn.microsoft.com/en-us/library/system.uri.iswellformeduristring(v=vs.110).aspx "Uri.IsWellFormedUriString Method") method from the Uri class.

I created a string extension method called ValidateUrl() and tried it with the following examples

  1. http://foo.com
  2. htp.foo.com
  3. ftp://foo.com
  4. what://foo.com

You can see the results of those examples with the following [.Net Fiddle](http://dotnetfiddle.net/1Nry5H):



The first is valid and we expected that. The 2nd is not valid and is expected. The 3rd is valid and I didn&#8217;t account for that in the code. The last one, **what://foo.com**, that was unexpected. That is obviously not a valid URL. Or at least not valid for the purposes of my app.

But I wasn&#8217;t check to see if the URL was valid, I was checking to see if the URI was valid. A URI consists of a scheme name (&#8220;http&#8221;, &#8220;ftp&#8221;, &#8220;mail&#8221;, etc), followed by the &#8220;:&#8221; character, and then by the path the resource. The Uri.IsWellFormedUriString method does not validate the scheme name, it&#8217;s just validating that the resource was assembled correctly.

Validating for a web page URL would be on me. I can use Uri.IsWellFormedUriString, but I would need to add an additional check to verify that the URI started with http:// or https://. With that modification, the example from above becomes [this Fiddle](http://dotnetfiddle.net/uw4uqA):



And with the same inputs, I now get the results that I need. The one that starts with &#8220;ftp:&#8221; is a valid URL, I&#8217;m returning it as invalid because that meets the requirements of my app. Your mileage may vary.

While testing the code, I came across an example of a valid URL that IsWellFormedUriString will return as invalid. It fails on URLs with embedded unicode characters. Like this one:

http://foo.com/unicode\_✪\_

This apparently broke in .NET 4.5 and was logged as [bug](http://connect.microsoft.com/VisualStudio/feedback/details/778454/breaking-change-to-uri-iswellformeduristring-in-net-4-5 "Breaking change to Uri.IsWellFormedUriString in .NET 4.5"). And according to the notes attached to that bug, it&#8217;s not going to be fixed any time soon. For this project, I know that the URLs that could be entered in by the user would not have unicode characters, so I don&#8217;t have to worry about that.

If I did have to handle unicode characters, that&#8217;s when I would use a regular expression. Someone already went [in search of the perfect URL validation regex](http://mathiasbynens.be/demo/url-regex) and found one from [Diego Perini](https://twitter.com/diegoperini) that handles all sorts of use cases.

Weighing in at 502 characters, this handles just about any valid URL.

<pre>_^(?:(?:https?|ftp)://)(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)(?:\.(?:[a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)*(?:\.(?:[a-z\x{00a1}-\x{ffff}]{2,})))(?::\d{2,5})?(?:/[^\s]*)?$_iuS</pre>

In that format, that regex is what you would call write-once code. Diego posted a commented version of it [as a gist](https://gist.github.com/dperini/729294), you can read that without your eyes bleeding.