---
title:  Command for keeping your phone awake while plugged in
author: anotherlab
categories: 
  - powershell
  - abd
  - power
---
![Automating the settings](/assets/images/steampunk-robot-with-phone.jpg)

Usually when I'm writing .NET MAUI code for Android, I use an emulator to test the code. It's fast and there are fewer things that can go wrong. And most of time it's good enough.

When you need to access something hardware related, you want real hardware. I'm working on stuff that uses BLE and you can't really test with an emulator. You need the real deal. So I'll use my phone.

One annoyance of using a real device is that it will turn the screen off after X minutes of inactivity. Usually just before you want to test some code. There is a setting that you can change to override this.

If you go to Developer Options, under settings, there should be a setting named ["Stay awake"](https://developer.android.com/studio/debug/dev-options#general). You need to have developer mode enabled, but if you are writing Android apps you already know that.

![Developer Options](/assets/images/developer-options.png)

I'm lazy and I hate having to dig through options. This is something that you can do through the command line. You can enable the stay awake session with the following [adb](https://developer.android.com/tools/adb) command:

{% highlight powershell %}
adb shell settings put global stay_on_while_plugged_in 3
{% endhighlight %}

And to turn it, do the following:

{% highlight powershell %}
adb shell settings put global stay_on_while_plugged_in 0
{% endhighlight %}

To get the current status, use this

{% highlight powershell %}
adb shell settings get global stay_on_while_plugged_in
{% endhighlight %}

To make this even ~~lazier~~ easier for me, I added a pair of functions to my PowerShell profile.

{% highlight powershell %}
function adb-stay-on {
  .${Env:ProgramFiles(x86)}\Android\android-sdk\platform-tools\adb.exe shell settings put global stay_on_while_plugged_in 3  
}

function adb-stay-off {
  .${Env:ProgramFiles(x86)}\Android\android-sdk\platform-tools\adb.exe shell settings put global stay_on_while_plugged_in 0
}
{% endhighlight %}

Let's break that down

`.` means that this is an executable

`${Env:ProgramFiles(x86)}` is the environment variable that points to the `Program Files (x86)` folder

`${Env:ProgramFiles(x86)}\Android\android-sdk\platform-tools\adb.exe` is the full path to the adb command

`shell settings put global stay_on_while_plugged_in 3 ` Shell accesses the OS, settings put means update a setting and stay_on_while_plugged_in 3 is the setting to enable the stay on setting.

The functions work even when I don't have adb on the path. Now I can invoke `adb-stay-on` when I have connected my phone to my PC to use for debugging. And when I'm done, I can just `invoke adb-stay-off`.

This will not prevent the device from going to the lock screen. There are various ways of preventing that. I have a Samsung Galaxy and I have it set to stay unlocked when I'm home.
