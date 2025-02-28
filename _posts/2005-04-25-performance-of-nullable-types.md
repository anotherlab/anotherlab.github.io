---
title: Performance of Nullable types
date: 2005-04-25T14:23:00-05:00
---
I saw a interesting post by [David Kean](http://davidkean.net/) about the [performance of the nullable types](http://davidkean.net/archive/2005/04/25/393.aspx) in .NET 2.0. The new int? type is about 50% slower than int and the bool? is about 15% than bool. The post is worth reading if only for the great example code for using interfaces.

I&#8217;m not concerned over the speed issue. You don&#8217;t need nullable types everyday and when you do want one, it will be nice to have support for them at the framework. Hopefully the performance issue will be resolved before .NET 2.0 gets out of beta.
