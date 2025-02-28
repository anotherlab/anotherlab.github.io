---
title: My MVP V-Conf session on localization for mobile apps is out
date: 2015-05-30T23:04:09-05:00
---
Two weeks ago I participated in the [Microsoft Virtual Conference](http://mvp.microsoft.com/en-us/virtualconference.aspx).  I did a session on cross platform localization for native apps using .NET.  It&#8217;s a continuation of the localization [article](http://www.rajapet.com/2013/12/cross-platform-localization-for-mobile-apps-in-code-magazine.html) that I did for CODE magazine 18 months ago.

The V-Conf was two days with 5 concurrent tracks running.  The US MVPs had IT, Developer, and Consumer tracks.  The Latin American MVPS had a combined track in Spanish.  The Brazilian MVPs had a track in Portuguese.  Each session had a presenter who was responsible for the content, plus a moderator who handled questions from the audience during the session.  Anyone could attend from the comfort of their home or office.  And it was free.

I had the great luck of having a Microsoft MVP and Xamarin Developer Evangelist, [James Montemagno](http://mvp.microsoft.com/en-us/mvp/James%20Montemagno-5001149), as my moderator.  He did a great job and did it with the presenter&#8217;s equivalent of having one hand tied behind his back.  James was at the airport, waiting for a flight.  He used his phone as a hotspot for his laptop in a busy terminal.

I talked about the why and the how of localization.  I concentrated on how to use the [Multilingual App Toolkit](https://dev.windows.com/en-us/develop/multilingual-app-toolkit) and [Xamarin.Forms](http://xamarin.com/forms) to quickly build and test multilingual apps.  I was able to use the new Android emulator that comes with Visual Studio 2015 to show the same app running side by side in different languages.  I thought about using Release Candidate of Visual Studio 2015, but I decided not to tempt the [Demo Gods](http://www2.rdrop.com/~paulmck/DemoGods/).  But I did want the new Android emulators that come with VS2015.

> Tip:  
> To use the Visual Studio 2015 Android Emulator with Visual Studio 2013 (or any other Android development tool), you can run the following command line:

<pre class="brush:ps; gutter:false;">"%ProgramFiles%\Microsoft Emulator Manager\1.0\emulatormgr.exe" /sku Android</pre>

That will launch the Emulator manager and let you install different virtual Android device images and run them.

<div style="width: 648px" class="wp-caption alignnone">
  <img loading="lazy" class="" src="https://i2.wp.com/www.rajapet.net/Other/2015-Blog/i-kWXgN4p/0/L/Visual%20Studio%20Emulator%20Manager-L.png?resize=638%2C600" alt="Visual Studio Emulator for Android" width="638" height="600"  />
  
  <p class="wp-caption-text">
    Visual Studio Emulator for Android
  </p>
</div>

Like [Genymotion](https://www.genymotion.com/#!/) and the [Xamarin Android Player](https://xamarin.com/android-player),  the Microsoft Android Emulator runs as a virtual x86 image.  This starts up and runs much faster the Android Emulator that comes with the Android SDK.  The Android Emulator emulates the phone down to the native chipset, which is usually ARM based.  It&#8217;s a high fidelity simulation, but it&#8217;s very slow.  Running x86 device images provide a much better experience for coding and testing.

The cool thing about the Microsoft Android Emulator is that it runs under Hyper-V, which means you can run it with the Windows Phone emulator.  Genymotion and the Xamarin Android Player run inside [Virtual Box](http://www.oracle.com/technetwork/server-storage/virtualbox/overview/index.html), which does not play well with Hyper-V.

For the V-Conf session, I wanted as many of the simulators running at the same time on the same screen.  This way the audience could see the same app running in multiple languages.  Unfortunately this precluded showing the iPhone simulator on the same screen that was being shared with the audience.  Since the demo app was written with Xamarin.Forms, the iOS version would have behaved very much like the Android and Windows Phone versions of the app.   The audience didn&#8217;t miss much without the iOS experience.

As a presenter, I would log into a Lync/Skype for Business session and when it was my turn, I would present my screen and do my presentation.   To keep the screen size at sane size for bandwidth, we were recommended to use a 1280&#215;720  screen resolution.

I run two identical monitors on my home machine, at 1920&#215;1080.  Knocking one of them down to 1280 was jarring.  The nice thing about using the Microsoft emulators is that they have a &#8220;Fit to Screen&#8221; button on the floating taskbar that comes with the emulator

<div style="width: 182px" class="wp-caption alignnone">
  <img loading="lazy" class="" src="https://i0.wp.com/www.rajapet.net/Other/2015-Blog/i-nmnKXvh/0/L/size%20to%20screen-L.png?resize=172%2C300" alt="The Fit to Screen button" width="172" height="300"  />
  
  <p class="wp-caption-text">
    The Fit to Screen button
  </p>
</div>

Clicking the Fit to Screen button would scale the emulator to fit the height of the current screen resolution.  It also kept the emulators more or less equally sized on the screen.  I had enough room to run three emulators side by size.

<div style="width: 1610px" class="wp-caption alignnone">
  <img loading="lazy" class="" src="https://i1.wp.com/www.rajapet.net/Other/2015-Blog/i-dqVb9Fh/0/X3/side%20by%20side-X3.png?resize=680%2C393" alt="" width="680" height="393"  />
  
  <p class="wp-caption-text">
    Two instances of Android and one of Windows Phone.  All three running the same app.
  </p>
</div>

I ran one instance of a 5&#8243; Android phone with Android 5 (aka Lollipop), another 5&#8243; Android with Android 4.4 (Kitkat), and 4.7&#8243; Windows 8.1 phone image.  The Lollipop phone I left in English.  During the presentation, I added a German translation to the app and switched the Kikkat phone to German.   I forgot to reboot the phone after making the change, James reminded me about that step.

With Windows Phone, I left the phone in English, but showed how to use code to force a specific language at run-time.  This is very handy because if you don&#8217;t read the language you are testing, it can be awkward to reset the phone (especially Windows Phone) back to your native tongue.

> Tip:  
> To avoid having to change the phone locale and rebooting, you can force a specific locale when the app starts up by setting the [CurrentCulture](https://msdn.microsoft.com/en-us/library/system.threading.thread.currentculture(v=vs.110).aspx) and [CurrentUICulture](https://msdn.microsoft.com/en-us/library/system.threading.thread.currentuiculture(v=vs.110).aspx).

<pre class="brush:csharp">// Force the app to use a specific language
// In this case, French
Thread.CurrentThread.CurrentCulture 
    = new CultureInfo("fr-FR");

Thread.CurrentThread.CurrentUICulture 
    = Thread.CurrentThread.CurrentCulture;

</pre>

Microsoft has posted the video from my session [here](http://channel9.msdn.com/Events/MVP-Virtual-Conference/MVP-Virtual-Conference-Americas-2015/Dev2-Cross-Platform-Localization-for-Mobile-Apps-Using-NET).  The slide deck from the presentation should be posted up there soon.  In the meantime, I posted it up on [Slideshare.net.](http://www.slideshare.net/anotherlab/mvp-virtual-conference-americas-2015-cross-platform-localization-for-mobile-apps)  Some of the slides use animations to place images over the text and you may want to download the deck instead of viewing it online.

The source code for the sample project is up on [GitHub](https://github.com/anotherlab/TheDoctors).  It does require Xamarin.Forms.  If you don&#8217;t have [Xamarin](http://xamarin.com/platform) and would like to try the code, they do have a 30 day free trial.

This presentation was geared around Xamarin.Forms, but this is also applicable for &#8220;Classic&#8221; Xamarin.Android and Xamarin.iOS.  The Multilingual App Toolkit has support for Xamarin.Android and Xamarin.iOS and can create the platform native string resource files for Android and iOS.

In addition to my session, I was the moderator the Microsoft Band session presented by [Christine Flora](https://mvp.microsoft.com/en-us/mvp/Christine%20Flora-5000933).  She had first slot of the day and had to deal with bandwidth problems that prevented the audience from seeing most of her presentation.   Christine showed how to connect to Project Online and display the current status to your Microsoft Band.  That&#8217;s actually a lot cooler than the apps currently available for the band that allow you to add a custom logo to the Band.

<blockquote class="twitter-tweet" lang="en" data-conversation="none">
  <p dir="ltr" lang="en">
    Want to find out what&#8217;s behind this tile? Sign up for my session to find out. <a href="http://t.co/slhmCDNSXw">http://t.co/slhmCDNSXw</a> <a href="https://twitter.com/hashtag/MVPvConf?src=hash">#MVPvConf</a> <a href="http://t.co/sCPlmWMblQ">pic.twitter.com/sCPlmWMblQ</a>
  </p>
  
  <p>
    — Christine Flora (@velvetdagger) <a href="https://twitter.com/velvetdagger/status/597928323696623616">May 12, 2015</a>
  </p>
</blockquote>

  
She did a great job and Microsoft will be posting an updated version of her presentation shortly.  If you follow [Christine](https://twitter.com/velvetdagger) on the Twitters, she&#8217;ll let you know when the updated Band session will be available.

I had a lot of fun doing the session and I want to thank Microsoft for letting me be one of presenters.  I also want to thank James Montemagno for being my moderator.  If you are going to do a presentation that uses a lot of Xamarin technology, you can&#8217;t go wrong with having a Xamarin Developer Evangelist assisting you. Read James&#8217;s [blog](http://motzcod.es/).  Go right now, I&#8217;ll wait.  I used [his tips](http://motzcod.es/post/115523285992/material-design-theming-for-xamarin-forms-android) on how to bring some of the Material Design goodness to Android version of my demo Xamarin.Forms app.
