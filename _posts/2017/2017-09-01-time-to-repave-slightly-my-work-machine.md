---
title: Time to repave (slightly) my work machine
date: 2017-09-01
categories:
  - Annoyances
tags:
  - Repave
  - Reset
---
<img loading="lazy" class="alignnone size-medium" src="https://i2.wp.com/photos.smugmug.com/photos/i-knxjknW/0/2d8e6a0d/L/i-knxjknW-L.jpg?resize=680%2C509&#038;ssl=1" width="680" height="509"  />

After lunch on Wednesday, I rebooted my work PC and it did not come back.  [ADB](https://developer.android.com/studio/command-line/adb.html) had somehow lost the ability to see my actual Android devices.  I had tried a few things and was at the &#8220;[Have you turned it off and on again](https://www.youtube.com/watch?v=nn2FB1P_Mn8)&#8221; step.  I shutdown it and restarted it.   Windows 10 was not very happy.  I got the light blue screen of death.  It had a useless QR code and the ever so helpful message &#8220;critical service failure&#8221; message.

After a few rounds of rebooting and trying the standard self-repair options, I surrendered and handed it over to our IT guy.  I pretty much knew what the end game would be, but decided to let someone handle it.  He did pretty much the same things that I did and we decided to let Windows reset itself.

[Windows Reset](https://support.microsoft.com/en-us/help/12415/windows-10-recovery-options) is both a good thing and a bad thing.  The good thing is that it basically says that your current Windows OS is rubbish and it will install a fresh one.  One that will be hopefully less damaged than the one that you are currently using. Or in my case, not using.  All of your data files are left intact.  Or at least in the condition that they were in before the SS Minnow goes for a  [three hour tour](https://www.youtube.com/watch?v=S3HFXSgWps8).

I'm not sure what the root cause of the problem was.  I was nearly out of space on the primary drive and it's been my experience that Windows doesn't behave well when it runs out of room.  I had rebooted the day before and it was just fine then.  Today I had updated the Android SDK and that pretty much chewed through the remaining free space on the primary drive.  I could have probably used used Mike Halsey's help.  [Mike Halsey](https://www.youtube.com/user/halseymike) has xray vision for this sort of thing.

I'm due for a new machine at work and we had ordered it the day before.  So there really wasn't much point in completely repaving this machine.  I just needed to install the stuff that I would need for the week or so until the new machine comes in.  So it's time to install the bare minimum I need to get what I need to work on for the next week or so.

Office 2016  
We have Office 365 so this wasn't an optional installation

[Android Studio](https://developer.android.com/studio/index.html)  
While I do nearly all of my Android development with Xamarin, there are times where it's useful run some code in Android Studio.

[Visual Studio 2017](https://www.visualstudio.com/downloads/)  
This is where the good stuff happens.  I installed the latest preview bits.  I usually leave the preview versions to virtual machines, but this machine will be in my hands for a week or too.

[Visual Studio Code](https://code.visualstudio.com/insiders)  
I have a few projects that are firmware that have their own C compilers, but no IDE.  Visual Studio Code is turning into my text editor of choice.  I like the latest and greatest, so I always install the Insiders edition.

SQL Server 2016 Developer Edition and SQL Server 2017 Management Studio  
I have data needs.

[Chrome](https://www.google.com/chrome/)  
It's more useful to than Edge for most stuff.  I still use Edge, but most of the time I use Chrome.

[Paint.Net](https://www.getpaint.net/)  
For making a quick hack of the Windows 10 background.  Why isn't this bundled with Windows?

Spotify  
Sometimes I need some music to help me concentrate.  I have the attention span of a mal-adjusted toddler, playing music with a good beat tends to keep me focused.

Since I installed Android Studio before Visual Studio, it installed the Android SDK and assorted tools first.  Visual Studio installs a second set and in a separate location.  Android Studio places it a user profile folder, Visual Studio in a Program Files x86 folder.  Since I'm using Intel's HAXM kernel driver to accelerate Google's Android emulator, I need to know which IDE's Android SDK installed HAXM.  When I get the new machine, I'll install the Android SDK first and set each IDE to use that SDK.

In the meantime, I'll starting making a list of the tools that I need to install on a new machine.  There is considerable overlap with what I install on my Macbook these days, but there are still key differences.
