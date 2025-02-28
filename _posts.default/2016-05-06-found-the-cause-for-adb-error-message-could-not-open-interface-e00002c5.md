---
title: "Found the cause for ADB error message “Could not open interface: e00002c5”"
date: 2016-05-06
---
<figure>
<a href="https://www.flickr.com/photos/peterhess/2976755407"><img loading="lazy" class="" src="https://i2.wp.com/photos.smugmug.com/photos/i-bX9mPQR/0/S/i-bX9mPQR-S.jpg" alt="Frustration with Computers" /></a>
<figcaption><a href="https://www.flickr.com/photos/peterhess/2976755407">Frustration</a> by Peter Alfred Hess</figcaption></figure>

I spent way too much time tracking down a problem that prevented ADB on my Macbook from seeing my phone.  While at the [Xamarin Evolve](https://evolve.xamarin.com/) conference last week, I hooked up my Nexus 6P to my Macbook Pro to try some Xamarin.Forms code.  I connected the phone and checked the box on the phone that prompted to allow debugging.  The Xamarin Studio IDE did not see the phone.

So I opened up a terminal window and start issuing ADB commands.  If you don't do Android development, [ADB stands for Android Debug Bridge](http://developer.android.com/tools/help/adb.html) and it provides the communication channels that allow a development tool to talk to an Android device or emulator.

I ran the command “adb devices” and it came back with “no devices”.  To get more information, I ran the command to stop the ADB service and restart it:

{% highlight shell %}adb kill-server ; adb devices{% endhighlight %}

That generated the following output

{% highlight shell %}
List of devices attached
* daemon not running. starting it now on port 5037 *
adb I 2192 55546 usb_osx.cpp:259] Found vid=18d1 pid=4ee2 serial=8XV7NXXXXXXXXXXX
adb I 2192 55546 usb_osx.cpp:259]
adb E 2192 55546 usb_osx.cpp:331] Could not open interface: e00002c5
adb E 2192 55546 usb_osx.cpp:265] Could not find device interface
* daemon started successfully *
{% endhighlight %}

The 8XV7NXXXXXXXXXXX is an obfuscated version of my phone's serial number.  So ADB could see that I had a device connected.  The [Android File Transfer](https://www.android.com/filetransfer/) app could also see the phone, so the connection was there.  Just something was interfering with ADB.

Since I was at a Xamarin conference, I grabbed a Xamarin Android engineer and we started digging in.  First thing was to use his phone and cable, to rule out my phone and/or cable as being the problem.  We saw the same problem with his phone.   So we tried the obvious steps:

  * Rebooted the Macbook.  Nope
  * Used the other USB port. Nope
  * Downloaded a new copy of the Android SDK. Nope
  * Ran an Android emulator.  That worked, indicating the problem was between the USB port and ADB
  * Grabbed a more senior Android engineer who told us to go look at the ADB source code.

The engineers had classes to assist with so it was down to just me.  I went and looked at the [source code to the usb_osx.cpp](https://github.com/android/platform_system_core/blob/master/adb/usb_osx.cpp) unit from ADB on Github.  The line numbers didn't match up exactly, but the error was that it literally could not open the USB port.  That meant another process had it's [greedy little mitts](http://www.ravelry.com/patterns/library/greedy-little-mitts) on my USB port

I rebooted the Macbook in [safe mode](https://support.apple.com/kb/PH21875?locale=en_US).  That would run OS X with out the 3rd party apps.  Sure enough, ADB was able to connect just fine.  That was the first clue, then some people in real life and on the Internets suggested that it may be a tethering app.

Apparently at some point last year, I installed [EasyTether](http://www.mobile-stream.com/easytether/android.html),  I don't use it, but had neglected to uninstall it.  And it's documented on the [EasyTether FAQ page](http://www.mobile-stream.com/easytether/android_faq.html#adbmacosx) that it will break ADB's connection with devices.  I pointed Finder to /System/Library/Extensions and sure enough, I had EasyTetherUSBEthernet.kext installed.  I could have used kextunload to just unload the EasyTether extension, but I decided to just yank it out.  I dragged it over to the Trashcan and rebooted.

I plugged my phone in and ADB saw it.

<figure><img loading="lazy" class="" src="https://i1.wp.com/photos.smugmug.com/photos/i-6tx22wp/0/S/i-6tx22wp-S.png" /><figcaption>This made me happy</figcaption></figure>

I could use my phone for debugging again.  I use Android emulators about half of the time, but when I want to see how the app behaves on actual device, there's no beating the real thing.  Plus, debugging touch on a Mac just plain sucks.

I've been using [Vysor](http://www.vysor.io/) to mirror the Android screen to the desktop and it works great.  I can use the actual device's screen or control it from the Macbook.    If you are doing a presentation and want to show what is running on your Android device, get Vysor.  It's a Chrome and and uses ADB, so it works on Mac, Windows, and probably Linux.
