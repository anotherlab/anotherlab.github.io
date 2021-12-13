---
id: 982
title: Looking back on Xamarin Evolve 2014
date: 2014-10-15T12:22:34-05:00
layout: post
guid: http://www.rajapet.com/?p=982
permalink: /2014/10/15/looking-back-on-xamarin-evolve-2014/
---
Xamarin&#8217;s [Evolve 2014](https://evolve.xamarin.com/) conference was a great experience.  I attended it last week in Atlanta and while you see a lot of the cool new features from the live stream, the personal interactions made attending much more valuable.

Xamarin is much more focused on the enterprise customer.  They have picked up a bunch of new partners (Microsoft, IBM, etc) and companies like Amazon are focusing on Xamarin developers.  The 3rd party component vendors are coming out with component packs for Xamarin.Forms.  If your app needs a charting control, you have a wide range of commercial products to choose from now.

Xamarin.Forms has become a huge hit with developers.  Many of the training and conference sessions were focused on Xamarin.Forms.  If you are looking at Cordova for cross-platform projects, you should take a closer look at Xamarin.Forms.

A big reason to attend conferences like Evolve is to meet and share experiences with other developers and Xamarin staff.  Xamarin does a  really good job of having their people mingle with the users. Many of them were Xamarin users before becoming hired so they have a good understanding of what it&#8217;s like to use their software.

#### Keynote Highlights

##### Xamarin Android Player

During the keynote, Miguel de Icaza launched the Google Android Emulator.   While it was loading, he went on a long and funny rant about how it was.   At the end of the rant, he presented the Xamarin Android Player, their own emulator that uses hardware virtualization to run as fast (or faster) as an actual Android device.

<div style="width: 307px" class="wp-caption aligncenter">
  <a href="https://i0.wp.com/www.rajapet.net/photos/i-NJB39ph/0/L/i-NJB39ph-L.png"><img loading="lazy" class="" src="https://i0.wp.com/www.rajapet.net/photos/i-NJB39ph/0/S/i-NJB39ph-S.png?resize=297%2C300" alt="Xamarin Android Player on OS X" width="297" height="300" data-recalc-dims="1" /></a>
  
  <p class="wp-caption-text">
    Xamarin Android Player on OS X
  </p>
</div>

The Android Player is similar to the Genymotion Player, and on Windows they both use Oracle&#8217;s [VirtualBox](https://www.virtualbox.org/) virtualization product to host the Android images.  If you have used Genymotion, then this will feel familiar.  While everyone uses the personal license for Genymotion, it does require a paid license for commercial use. The Android Player will be free to Xamarin customers.

Android Player is a developer preview release and only has a couple of Android images currently available: Nexus 4 with KitKat and Nexus 5 with Jellybean.  It&#8217;s not clear on how you would add Google Play support, that is not in the downloadable images.  If you do anything

##### Xamarin.Insights

<div style="width: 410px" class="wp-caption alignnone">
  <a href="https://i2.wp.com/www.rajapet.net/Category/Xamarin-Evolve-2014/i-SNQPWzm/0/L/DSC08028-L.jpg"><img loading="lazy" class="" src="https://i0.wp.com/www.rajapet.net/Category/Xamarin-Evolve-2014/i-SNQPWzm/0/S/DSC08028-S.jpg?resize=400%2C266" alt="" width="400" height="266" data-recalc-dims="1" /></a>
  
  <p class="wp-caption-text">
    James Montemagno and Nat Friedman with Xamarin Insights
  </p>
</div>

Introduced [Xamarin.Insights](http://xamarin.com/insights), which provide real-time monitoring for Xamarin Apps. You can record every crash that happens and access that data from an online dashboard.  Users can opt in to share their contact information.  This gives you the ability to contact users to let them know when a bug that affected them has been fixed. From their [blog](http://blog.xamarin.com/monitoring-your-apps-with-xamarin-insights/):

> You can add Insights into your application with just a single line of code. Insights will gather and report any uncaught native or managed exceptions. In addition, you will be able to track both past and active sessions, with full access to device statistics such as operating system and screen resolution. If you want a deeper level of control, you can simply “report” any caught exception, along with any additional data that will help you diagnose the issue, using Insights’ simple API.

##### Xamarin Profiler

Also in beta is the new [Xamarin Profiler](http://xamarin.com/profiler) for iOS and Android.  The Xamarin Profiler will track memory and performance.  It will show you where in the code your application is spending the most amount of time and how much memory is being used over time.  The profiler will work with both Xamarin Studio and with Visual Studio.  This makes for a nice addition to the developers toolkit.

##### Xamarin Sketches

<div style="width: 410px" class="wp-caption alignnone">
  <a href="https://i1.wp.com/www.rajapet.net/Category/Xamarin-Evolve-2014/i-3Gqh4cG/0/L/WP_20141008_10_26_06_Pro-L.jpg"><img loading="lazy" class="" src="https://i2.wp.com/www.rajapet.net/Category/Xamarin-Evolve-2014/i-3Gqh4cG/0/S/WP_20141008_10_26_06_Pro-S.jpg?resize=400%2C225" alt="" width="400" height="225" data-recalc-dims="1" /></a>
  
  <p class="wp-caption-text">
    Xamarin CTO Miguel de Icaza using Sketches
  </p>
</div>

Now you have the ability to play with the code in real time with [Xamarin Sketches](http://developer.xamarin.com/guides/cross-platform/sketches/).  You can write code and see it execute as you write it.  It&#8217;s a handy way to test some snippets of code without having to go through the entire build cycle.  It&#8217;s kind of like LINQPad for, but works with OS X, iOS, and Android UI elements.

##### Xamarin.UITest

Based on the [Calabash](http://developer.xamarin.com/guides/testcloud/calabash/introduction-to-calabash/) technology that is in Xamarin Test Cloud, we can now unit the UI with [Xamarin.UITest](http://developer.xamarin.com/guides/testcloud/uitest/),  You can write up test scripts in C# to simulate the user pressing buttons and entering text into the application.  UITest provides a [REPL](http://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop) interface to allow you to interactively query the UI. This is useful for determining the name of the controls to reference in your scripts.

You can run the scripts locally and deploy them to test cloud.  UITest with Nunit allows the developer to set up unit tests for the UI and for the code behind the UI.

##### Xamarin Insights

<div style="width: 410px" class="wp-caption alignnone">
  <a href="https://i2.wp.com/www.rajapet.net/Category/Xamarin-Evolve-2014/i-86XLjZv/0/L/WP_20141008_09_56_38_Pro-L.jpg"><img loading="lazy" class="" src="https://i1.wp.com/www.rajapet.net/Category/Xamarin-Evolve-2014/i-86XLjZv/0/S/WP_20141008_09_56_38_Pro-S.jpg?resize=400%2C225" alt="" width="400" height="225" data-recalc-dims="1" /></a>
  
  <p class="wp-caption-text">
    Xamarin CTO Miguel de Icaza demoing the new profile
  </p>
</div>

We now have the ability to add real time monitoring of our apps via [Xamarin Insights](https://xamarin.com/insights).  You can record every crash that happens and access that data from an online dashboard.  Users can opt in to share their contact information.  That gives you the ability to contact users to let them know when a bug that affected them has been fixed.

And we also learned the proper pronunciation of &#8220;PCL&#8221; and &#8220;nuget&#8221;, courtesy of Miguel de Icaza:

<div style="width: 350px" class="wp-caption alignnone">
  <a href="https://pbs.twimg.com/media/BzzP8zuCYAAOLLl.jpg"><img loading="lazy" src="https://pbs.twimg.com/media/BzzP8zuCYAAOLLl.jpg:small" alt="It's pronounced as Pickles and Newjay" width="340" height="222" /></a>
  
  <p class="wp-caption-text">
    Xamarin CTO Miguel de Icaza during the Evolve Keynote
  </p>
</div>