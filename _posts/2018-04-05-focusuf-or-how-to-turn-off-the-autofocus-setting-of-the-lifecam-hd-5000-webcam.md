---
id: 2855
title: FocusUF or how to turn off the autofocus setting of the LifeCam HD-5000 webcam
date: 2018-04-05T20:41:39-05:00
author: Chris Miller
layout: post
guid: http://rajapet.com/?p=2855
permalink: /2018/04/05/focusuf-or-how-to-turn-off-the-autofocus-setting-of-the-lifecam-hd-5000-webcam/
collect_box_size:
  - collect-square
categories:
  - Annoyances
tags:
  - Autofocus
  - C
  - DirectShow
  - Webcam
---
<div style="width: 409px" class="wp-caption alignnone">
  <img loading="lazy" class="size-medium" src="https://i0.wp.com/photos.smugmug.com/photos/i-BgcrnZW/0/7d3ad5c8/S/i-BgcrnZW-S.jpg?resize=399%2C225&#038;ssl=1" width="399" height="225"  />
  
  <p class="wp-caption-text">
    Welcome to the FuzzyCam
  </p>
</div>

Note from the future: I updated the code and blogged about it [here](https://rajapet.com/2020/03/20/return-to-focusuf/).

Why am I out of focus? It&#8217;s because I have a Microsoft LifeCam HD-5000 and I&#8217;m running Windows 10. The LifeCam HD-5000 webcam is a decent webcam with an annoying feature. The autofocus keeps shifting the focus around if you move your head slightly. It goes in and out of focus and locks in after a second or two.  When you are in a video chat, this can get very annoying (very quickly) for the other viewers. Your face will shift in and out of focus and it&#8217;s just a distraction.  Microsoft used to supply drivers for the HD-5000 and it had a control app where you could adjust the focus settings. Since Windows 8, they stopped as the OS directly supported the webcam.

I&#8217;m not able to sit motionless while on a webcam. I needed a work around. There is a registry hack that lets you turn off autofocus. I prefer to avoid hacks like that when it&#8217;s something that I could code around. So after seeing [some stuff on StackOverflow](https://stackoverflow.com/questions/18124646/manually-focus-camera-in-emgu-cv/18189027#18189027) on how to use the IAMCameraControl interface in DirectShow, I wrote a tiny command line app called FocusUF.

FocusUF uses the <a href="https://www.nuget.org/packages/DirectShowLib/" rel="nofollow">DirectShowLib library</a> library to provide nice, friendly C# access to DirectShow. The DirectShowLib library maps the DirectShow Interfaces for use from a .NET app. With that library, it was little more than a handful of lines of code to access webcam controls. The app is hard coded to connect to a LifeCam HD-5000, but it would be easy enough to change the code for other webcam.

The code was written with Visual Studio 2017, it has not been tested with any other compiler. The source code is up on GitHub via this [handy little URL](https://github.com/anotherlab/FocusUF).

## How it works

To use the DirectShowLib library, I added it via nuget.

`Install-Package DirectShowLib`

The next step was to get access to the webcam. Using DsDevice from DirectShowLib, I was able to get the list of devices for the category of VideoInputDevice. Then I do a LINQ query to filter that list for the first match &#8220;Microsoft® LifeCam HD-5000&#8221;. If you are having a autofocus problem with a different brand or model of webcam, just replace that name with the name of your webcam. You can dump out the list of DsDevices and peek at the name property until you see your webcam.  


Now that I have a DirectShow  sDevice that represents the webcam, I create a filter to expose the control interface of the web cam. DirectShow uses a module system called filters to expose device functionality. I create a new object that implements the IFilterGraph2 interface so that we can add a new filter. After getting that filter, I cast it to an IAMCameraControl to get access to the setter and getter methods. I get the current focus level and mode from the webcam.  I then set the focus to the current level and force the focus mode to manual.



## <a id="user-content-how-to-use" class="anchor" href="https://github.com/anotherlab/FocusUF/blob/master/README.md#how-to-use" aria-hidden="true"></a>How to use

Launch the app that will be using the webcam. Wait until it is in focus and then run FocusUF. It will detect the webcam and flip the autofocus setting to manual and lock it to the current focus setting. The setting will persist until the webcam is reset or another app changes the focus setting.

<div style="width: 409px" class="wp-caption alignnone">
  <img loading="lazy" class="size-medium" src="https://i2.wp.com/photos.smugmug.com/photos/i-8ZMBJkS/0/07d4a10a/S/i-8ZMBJkS-S.jpg?resize=399%2C225&#038;ssl=1" width="399" height="225"  />
  
  <p class="wp-caption-text">
    I probably looked better out of focus&#8230;
  </p>
</div>

The name &#8220;FocusUF&#8221; is a tip of the hat to the YouTube channel <a href="https://www.youtube.com/user/arduinoversusevil/featured" rel="nofollow">AvE</a>, where the host uses the phrase &#8220;Focus You F@*&&#8221; whenever his video camera loses focus.