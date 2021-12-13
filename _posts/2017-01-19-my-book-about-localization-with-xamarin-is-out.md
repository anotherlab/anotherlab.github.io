---
id: 2625
title: My book about localization with Xamarin is out
date: 2017-01-19T22:15:46-05:00
author: Chris Miller
layout: post
guid: http://nublog.eastus.cloudapp.azure.com/?p=2625
permalink: /2017/01/19/my-book-about-localization-with-xamarin-is-out/
collect_box_size:
  - collect-square
categories:
  - Uncategorized
---
<div style="width: 220px" class="wp-caption alignleft">
  <a href="http://amzn.to/2i0Ssik"><img loading="lazy" class="size-medium" src="https://i1.wp.com/photos.smugmug.com/photos/i-5kXLPwC/0/S/i-5kXLPwC-S.jpg?resize=210%2C299&#038;ssl=1" alt="Cross-platform Localization for Native Mobile Apps with Xamarin" width="210" height="299" data-recalc-dims="1" /></a>
  
  <p class="wp-caption-text">
    Cross-platform Localization for Native Mobile Apps with Xamarin
  </p>
</div>

Last month Apress published my book on writing localized apps with Xamarin. It&#8217;s titled &#8220;Cross-platform Localization for Native Mobile Apps with Xamarin&#8221; and is available on [Apress&#8217;s site](http://www.apress.com/us/book/9781484224656) or on [Amazon](http://amzn.to/2iPm3bN)

It&#8217;s not a long book, about 110 pages.  It provides the basic information you would need to localize your app for other languages and countries.  It&#8217;s written for the Xamarin developer, but the topics apply to other developers.

After discussing the basics of localization, the book covers how to get your text translated.  There is a chapter that covers the [Multilingual App Toolkit](https://developer.microsoft.com/en-us/windows/develop/multilingual-app-toolkit) (aka MAT), which is Visual Studio extension that is a workflow management tool for language resource files.

<div style="width: 409px" class="wp-caption aligncenter">
  <a href="https://i1.wp.com/photos.smugmug.com/photos/i-cQPD83H/0/XL/i-cQPD83H-XL.png?ssl=1"><img loading="lazy" class="size-medium" src="https://i1.wp.com/photos.smugmug.com/photos/i-cQPD83H/0/S/i-cQPD83H-S.png?resize=399%2C221&#038;ssl=1" alt="Multilingual App Toolkit" width="399" height="221" data-recalc-dims="1" /></a>
  
  <p class="wp-caption-text">
    I love this tool
  </p>
</div>

If you are using Xamarin.Android and Xamarin.iOS to build your apps, you can use MAT to generate Android and iOS string resource files.

Besides translating the text that is compiled into the app, I spend time discussing how to manage language resources coming from web services.  Once again, the MAT is handy for managing language resources server side.

<div style="width: 263px" class="wp-caption alignleft">
  <img loading="lazy" class="size-medium" src="https://i0.wp.com/photos.smugmug.com/photos/i-hDqvm92/0/M/i-hDqvm92-M.png?resize=253%2C450&#038;ssl=1" width="253" height="450" data-recalc-dims="1" />
  
  <p class="wp-caption-text">
    The sample app (Spanish version)
  </p>
</div>

There is a chapter that builds a Xamarin.Forms app from scratch and then localizes it for the Chinese, Spanish, and German languages.  For the German translations, I was helped out by one of my co-workers, [David Krings](https://www.linkedin.com/in/david-krings-69725a2).  David is a native German speaker with technical writing experience.

When translating language resources, a fellow co-worker is one of the best resources.  Besides knowing the language, that person will know the domain of the app.  Context is very important with language translation.

Consider a string resource of &#8220;boot&#8221; in English and you need to translate it to the Polish language.  You need to know which meaning of &#8220;boot&#8221; to translate.  In US English, it means a type of footware and it could be translated as &#8220;kalosze&#8221;.  It could also mean to start up a process, which could translate to &#8220;rozruchu&#8221;.  In UK English, it&#8217;s the part of the car where you store things, that translates more or less as &#8220;bagażnika&#8221;.  Without the context, it&#8217;s easy to get the wrong translation.

For the Chinese and Spanish translations, I used a commercial translation company called [SmartCAT](https://www.smartcat.ai/).  Two of their translators, [Max Diaz](https://plus.google.com/u/0/105903186918341107715) and [Максим Морковкин,](https://plus.google.com/u/0/105411255178381660002) did the Spanish and Chinese translations.  I like how that SmartCAT works and recommend it to anyone that needs translation services performed.  SmartCAT&#8217;s Head of Community, [Vova Zakharov](https://www.linkedin.com/in/vovazk), arranged for the translation services and at the last too.

When you have your app translated, you will need to have done by someone with the language expertise.  Machine translation has come a long way, but it&#8217;s better to do it right.

Besides language translation, the book covers how to deal with numbers, dates, currency, and other country/regional formatting.  The nice thing about using the .NET Framework is that most of the heavy lifting is done for you.  You don&#8217;t have to worry about how to handle it with one OS and then figure it out for another OS.

The source code for the book is up on Github.  You can access it from [Apress/cross-platform-localization-xamarin](https://github.com/Apress/cross-platform-localization-xamarin).  You will want to download or clone the repo to follow along with the book.

And while I&#8217;m thanking people, I wanted to give a shout out to the technical reviewers.  [Craig Dunn](https://www.linkedin.com/in/conceptdev) is part of the Xamarin team that is now part of the Microsoft team. He made this book much, much better.  [Cameron Lerum](https://www.linkedin.com/in/cameronlerum) created the Multilingual App Toolkit, which made most of this book possible.  Between the subject expertise and technical writing skills, I could not have had any better reviewers for this book.