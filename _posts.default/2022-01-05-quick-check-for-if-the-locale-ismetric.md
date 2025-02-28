---
title:  A quick check to see if the user's locale is metric or imperial
date:   2022-01-05
categories: 
  - Coding
  - Localization
  - Globalization
tags: 
  - C#
  - CultureInfo
  - RegionInfo  
---
While working on a demo mobile app for a course, I needed to know if the units of measurement on the app would be in [Imperial](https://en.wikipedia.org/wiki/Imperial_units) units or [Metric](https://en.wikipedia.org/wiki/Metric_system) units. Since I'm using C#, the tools are in the framework.

My first pass was just checking the locale and calling it imperial if the locale was "en-US".

{% highlight csharp %}
using System.Globalization;

var locale = CultureInfo.CurrentCulture.Name;

var IsMetric = !locale.Equals("en-US");
{% endhighlight %}

It worked on my machine, but that is pretty flawed. It assumes that only the "en-US" locale use imperial units. While it often feels like the rest of the world is metric, the US is not the only country still on the imperial system. Both Liberia and Myanmar are in the imperial club.

{:refdef: style="text-align: center;"}
![Works on my machine](/assets/say-it-works-on-my-machine-again.jpg)
{: refdef}

This code also makes the assumption that "en-US" is the only locale code for the US.  If you set your phone's region to the US and the language to Spanish, the locale code could be "es-US".  Instead of comparing against the locale name, we can use the [RegionInfo](https://docs.microsoft.com/en-us/dotnet/api/system.globalization.regioninfo) class instead.  We can pass in the locale in to RegionInfo and check it's `IsMetric` property.

{% highlight csharp %}
using System.Globalization;

var locale = CultureInfo.CurrentCulture.Name;

var regionInfo = new RegionInfo(locale);

var IsMetric = regionInfo.IsMetric;
{% endhighlight %}
