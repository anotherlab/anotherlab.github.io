---
title: Nine reasons not to use serialization
date: 2005-10-20T17:19:00-05:00
---
There&#8217;s a [good article](http://www.codeproject.com/dotnet/noserialise.asp "Nine reasons not to use serialization by Neil Davidson.  Although .NET provides a number of quick and easy ways to serialize and deserialize data, do not use them. This article explains why. ") on [The Code Project](http://www.codeproject.com/ "The Code Project") that explains why you shouldn&#8217;t use serialization to store data. The root problem is that the information that gets serialized out is strongly typed. In other words, whatever wrote that data out, better be the same thing that read it back in again. Should your code change it&#8217;s data structures, trying to read in serialized data from a previous version will break the code. That kinda defeats the purpose of using XML to store data. And [not in a good way](http://www.cnn.com/SHOWBIZ/9704/07/chasing.amy.review/ "not in a good way").
