---
title:  MyFirebaseMessagingService android:exported needs to be explicitly specified
date:   2023-03-22
author: anotherlab
summary: How to add android:exported to a Firebase service with Xamarin Android
largeimage: /assets/steam_punk_beker.jpg
categories: 
  - Android
  - Xamarin
tags: 
  - Xamarin
  - Android
  - API
---
{:refdef: style="text-align: center;"}
![Changing the API](//assets/steam_punk_beker.jpg)
{: refdef}

I needed to make a small change to an Android apop that we have in the Google Play store. I made the change, generated a new apk and we submitted to the app store. And was immediately rejected by Google. Our app was targetting API level 30 and the Google now requires API level 31 or later.

The app is a Xamarin.Forms app and I opened up the Android project and changed changed android:targetSdkVersion in the manifest from 30 to 31. And then the app stopped building.
I have a new course that was just published this week on Pluralsight, ["Xamarin.Forms 5 Fundamentals"](http://www.pluralsight.com/courses/xamarin-forms-5-fundamentals.). It's seven hours of tutorials and demos for the developer new to Xamarin.Forms.

From my own product blurb:
> You will learn how to set up a Xamarin.Forms development environment and get started building apps. First, you will gain the knowledge of the basic structure. Next, you will understand how to use data binding to wire the data to the UI. Finally, you will know how to customize the UI with styling and theming. When you are finished with this course, you will have the skills and knowledge of the Xamarin.Forms framework to get started building cross-platform, native mobile applications.

If you want to learn about how to use MVVM, Maps, localization, styling, etc; please check the course.

If you are working with [Maui](https://learn.microsoft.com/en-us/dotnet/maui?WT.mc_id=DT-MVP-5000200), a lot of this will still be applicable. The parts that are different, well, stay tuned.
