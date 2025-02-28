---
title: Adding Google Play Services to Visual Studio Android Emulator
date: 2016-03-16
---
<img loading="lazy" class="alignnone" src="https://i1.wp.com/www.rajapet.net/photos/i-R5kKSrR/0/S/i-R5kKSrR-S.jpg?resize=400%2C251" alt="" width="400" height="251"  />

Out of the box, the [Visual Studio Android Emulator](https://www.visualstudio.com/en-us/features/msft-android-emulator-vs.aspx) (and the [Genymotion emulator](https://www.genymotion.com/), and the [Xamarin Android Player](https://xamarin.com/android-player)) does not support Google Cloud Messaging (GCM) push notifications.  The reason for this is that GCM is part of the Google Play Services.  And the Google Play Services are not included in the virtual machine (VM) images that the Visual Studio Android Emulator uses.

The typical Android device starts with a base Android stack that comes from the [Android Open Source Project](https://source.android.com/) (AOSP).  Device OEMS (Samsung, Huawei, LG, etc) then license the Google Play Services from Google.  On top of that, the OEMs add any customizations that they do to Android.

Google does not allow Microsoft/Genymotion/Xamarin to include the Google Play Services with their builds from the AOSP.  Enough developers have put together versions of the package so that it's a fairly easy process to install. They are commonly packaged under the name “GApps”.

Run the Visual Studio Emulator for Android from the Start Menu.  If you run it from VS, you may not be able to install firmware packages.  Then create a new VM.  For this example, we'll create an Android 5.1 VM.  I tried this with Android 6 and it did not work with the GApps packages that I was able to obtain.

<figure>
<img src="https://i1.wp.com/www.rajapet.net/photos/i-2Zkg8TJ/0/L/i-2Zkg8TJ-L.png"/><figcaption>Emulation Manager</figcaption></figure>

If you are using an existing VM, you'll need to know which CPU architecture or ABI that the VM is running under.  Thanks to a [tip from the nutty people at Intel](https://software.intel.com/en-us/blogs/2014/12/16/how-to-identify-the-image-is-32-bit-or-64-bit-user-space), you can execute an ADB command to see what is on board.

{% highlight powershell %}adb shell getprop ro.product.cpu.abilist
{% endhighlight %}

Also see the documentation for the [Build](http://developer.android.com/reference/android/os/Build.html) class.

SInce we created the VM, we know it's Android 5.1.  If you were working with VM and were not sure of the version, you can check via the Android Settings app or from the command line with the adb command.

{% highlight powershell %}adb shell getprop ro.build.version.release{% endhighlight %}

While we are checking stuff with ADB, the following command will return the SDK version

{% highlight powershell %}adb shell getprop ro.build.version.sdk{% endhighlight %}

<figure>
<img src="https://i0.wp.com/www.rajapet.net/photos/i-6S78rKq/0/M/i-6S78rKq-M.png"/>
<figcaption>Results from the ADB commands</figcaption>
</figure>

First up is the installation of an ARM translator. The VS Android Emulator gets its speed by running an x86 version of Android. The Google Play Services are usually packed up already compiled for ARM. The ARM translator lets ARM code run on an x86 image. This is usually packaged up in a .zip named ARM Translation v1.1.

Installing is easy, drag the .zip on to a running Android VM and follow the prompts.

<figure>
<img src="https://i1.wp.com/www.rajapet.net/photos/i-Dfp2FZc/0/XL/i-Dfp2FZc-XL.png"/>
<figcaption>Dialog that appears after drag and drop the ARM Translator package onto the Android VM</figcaption>
</figure>

If it didn't reboot the VM, reboot it to be safe.  Multiple web sites have a copy of this file.  I downloaded one from the [Tech Bae](http://www.techbae.com/download-install-arm-translation-v1-1-zip-genymotion/) blog.

<figure>
<img src="https://i0.wp.com/www.rajapet.net/photos/i-B54p3Pb/0/O/i-B54p3Pb.png"/>
<figcaption>ARM Translator installed</figcaption>
</figure>

Since we have Android 5.1, we need a GApps package for Android 5.1.  There are a few places where you can download a package from, but not all of them may work.  I was hoping to to use the packages on the [Open Gapps](http://opengapps.org/) project.  None of their packages would install into my VMs.  They all reported an invalid folder error message.

The file sets available from [TeamAndroid](http://www.teamandroid.com/gapps/) should install without any problems.  I downloaded one named gapps-lp-20150314.zip.  The “lp” in the file name stands for Lollypop, the code name for Android 5.

Drag the gapps package and drop it on your Android VM.  You should get a dialog like this:

<img loading="lazy" class="alignnone" src="https://i2.wp.com/www.rajapet.net/photos/i-WRKdg93/1/O/i-WRKdg93.png?resize=426%2C179" alt="" width="426" height="179"  /> 

Click the install button and let it do it's thing.  After it completes, it should shutdown.  Restart it from the Emulator Manager.  After Android starts up, you may see a “Optimizing app X of Y” dialog.  When Android versions upgrade, the apps all need to tuned for the new version.  This is normal.

<img loading="lazy" class="alignnone" src="https://i1.wp.com/www.rajapet.net/photos/i-fwHkhXr/2/O/i-fwHkhXr.png?resize=403%2C160" alt="" width="403" height="160"  /> 

When that is all done, you should see  the Google Play icon in the app drawer.  Launch the app and provide your Google account information.  If you see an endless busy indicator, let it go for a minute, then close and restart Google Play.

You may see an error message about Google Play services having stopped.  That is normal and should go away once the Google Play services have been updated.

After installing GApps, some (many) Google apps and services will probably crash. Do not be alarmed, that is perfectly normal. Most of the files are out of date.

<img loading="lazy" class="alignnone" src="https://i1.wp.com/www.rajapet.net/photos/i-NXxS8Tp/2/O/i-NXxS8Tp.png?resize=403%2C165" alt="" width="403" height="165"  /> 

Get the Google Play app to run long enough for you to login and it will start updating.  To force Google Play to update itself, do the following (from [Android Central](http://www.androidcentral.com/how-update-your-google-play-store-without-sideloading-savage)):

  1. Launch Google Play
  2. Slide out the menu
  3. Tap on Settings
  4. Scroll to the bottom and tap Build version

If a newer version is a available, you'll see a dialog with that information.

<img loading="lazy" class="alignnone" src="https://i0.wp.com/www.rajapet.net/photos/i-G92qSgW/1/O/i-G92qSgW.png?resize=403%2C717" alt="" width="403" height="717"  /> 

At that point, your Android VM will support push notifications.  You can install of Google Play apps like the Maps application.  These steps were tested with Visual Studio Android Emulator but they should work more or less in the same way with the Genymotion and Xamarin emulators.

<span style="line-height: 1.5;">The </span><a style="line-height: 1.5;" href="http://opengapps.org/.">Open GApps</a> <span style="line-height: 1.5;">page looks like it is a promising location to get GApp packages, they have a list of variants.  Basically each variant has more or less of the Google Apps.  To keep things simple, I wanted to use the stock version.  There is a naming scheme for gapps distributions.  It follows the pattern DistName-abi-version-variant-date.zip or a subset of that pattern</span>

For this example, I had downloaded the full version of the x86 Android 6.0 GApps.  that came down with the following command line.

open_gapps-x86-6.0-stock-20160316.zip

It wouldn't install, but that is the accepted pattern for naming GApp packages.  It (and the ARM version) error-ed out with an invalid directory message.  Hopefully this will be addressed in an update to the Visual Studio Android Emulator.

This article's banner image comes from [Arena4G](http://arena4g.com/2015/09/aprenda-um-novo-metodo-para-instalar-apps-android-no-windows-10-mobile.html).
