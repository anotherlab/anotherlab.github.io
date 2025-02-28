---
id: 417
title: 'RE: Thread-safe Format'
date: 2005-08-29T13:35:00-05:00
layout: post
guid: http://www.rajapet.com/?p=417
permalink: /2005/08/29/re-thread-safe-format/
---
Oh, the joy of writing multiple threaded applications. I like this little tip that will keep string formatting calls from stepping over each other.

> The Format function isn&#8217;t thread-safe unless you use the overload which takes a FormatSettings argument (because the FormatSettings-less version uses global variables). I use it to compose error messages in a thread I&#8217;m writing, and I want to use the same FormatSettings as the user would normally see in a GUI app. So here&#8217;s what I did. I added a TFormatSettings field to my thread class:
> 
>     TMyThread = <b>class</b>(TThread)<br><b>private</b><br>  FFormatSettings: TFormatSettings;<br><b>protected</b><br><b>procedure</b> Execute; <b>override</b>;<br><b>end</b>;
> 
> Then I set it at the start of the Execute method:
> 
>     <b>procedure</b> TMyThread.Execute;<br><b>begin</b><br>  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, FFormatSettings);<br><b>end</b>;
> 
> This seems to work well.

_[Via [Craig Stuntz&#8217;s Weblog](http://blogs.teamb.com/craigstuntz/archive/2005/08/25/ThreadSafeFormat.aspx)]_