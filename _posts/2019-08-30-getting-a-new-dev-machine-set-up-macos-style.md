---
id: 3041
title: Getting a new dev machine set up, macOS Style
date: 2019-08-30T13:35:40-05:00
author: Chris Miller
layout: post
guid: http://rajapet.com/?p=3041
permalink: /2019/08/30/getting-a-new-dev-machine-set-up-macos-style/
categories:
  - Apple
tags:
  - Dev
  - macOS
---
It&#8217;s that time of the decade when I get a new Macbook Pro. I use a Macbook to compile iOS apps with Xamarin which makes it required equipment. Even though my current one was a late 2014 model, it was still fast enough to do what I needed to do. It&#8217;s a work laptop and was out of warranty, so I was due for a new one. The 2014 one will go to another developer.

The last time I did this, I did a [blog post](https://rajapet.com/2015/02/03/getting-a-new-dev-machine-set-up-os-x-style/) on what I installed. This will version will be mostly the same, plus adding the cool new things that have come down the pike in the last 4 years.<figure class="wp-block-image size-large is-resized">

<img loading="lazy" class="alignleft" src="https://i1.wp.com/photos.smugmug.com/photos/i-ccWRHXb/0/1aebbce4/Th/i-ccWRHXb-Th.png?resize=68%2C53&#038;ssl=1" alt="" width="68" height="53"   /> F<strong data-rich-text-format-boundary="true">ileVault</strong><br data-rich-text-line-break="true" />First thing to do is to enable Apple&#8217;s full disk encryption. If someone steals this thing, they can&#8217;t access the files. They can get my body, but not my [soul](http://www.davidsoul.com/).</figure> 

**VPN**  
This is my work laptop. Which means the usually Corporate IT requirements. Which includes a VPN so that I can connect back to the mothership when I&#8217;m remote. Plus the corporate AV solution de jour.

**Files**  
I had tons of files to move over. I was pretty good about keeping the files under the user folder. Between my old MacBook and this one, I used AirDrop. I also copied a fair amount of files from the old Macbook to my home server and then from the [home server](https://www.qnap.com/en-us/product/ts-451+) to the MacBook. 

I took care in copying over the .ssh folder. Which in retrospect was a waste of time, It&#8217;s easier just to regenerate the public keys.

**<img loading="lazy" class="alignleft " src="https://i2.wp.com/photos.smugmug.com/photos/i-KzFgNbB/0/defe016d/Ti/i-KzFgNbB-Ti.png?resize=50%2C50&#038;ssl=1" width="50" height="50"   />Homebrew**  
This is a one of those command tools that makes it easier to get other command line tools (git, node, iterm, etc). [Here&#8217;s a good guide](https://treehouse.github.io/installation-guides/mac/homebrew) for how to install Homebrew.

**<img loading="lazy" class="alignright" src="https://i1.wp.com/photos.smugmug.com/photos/i-t7cfPk3/0/e5fd3300/S/i-t7cfPk3-S.png?resize=245%2C124&#038;ssl=1" width="245" height="124"   />Fira Code**  
If you spend half of your day slinging code around, treat yourself to a font that is designed for coding and has ligature support. [Fira Code](https://github.com/tonsky/FiraCode) is a nice, easy on the eyes font and has the ligature support that your eyes have been craving.&nbsp; Using ligatures with coding is a personal preference and there are [some good arguments](https://practicaltypography.com/ligatures-in-programming-fonts-hell-no.html) against using them.&nbsp; I would suggest turning off ligature support when presenting your code or posting code listings.

<img loading="lazy" class="alignleft" src="https://i2.wp.com/photos.smugmug.com/photos/i-QzCFjGC/0/dd3030d7/Ti/i-QzCFjGC-Ti.png?resize=74%2C71&#038;ssl=1" alt="" width="74" height="71"   /> 

**Iterm2**  
While MacOS comes with fully capable terminal app, there are ones out there that provide a more productive workspace. One of them is Iterm2.&nbsp; Better copy/paste, better tabs, better autocomplete.&nbsp; Just get it from [here](https://iterm2.com/index.html).

**<img loading="lazy" class="size-medium alignright" src="https://i2.wp.com/photos.smugmug.com/photos/i-8wBhx2s/0/60629986/Th/i-8wBhx2s-Th.png?resize=150%2C150&#038;ssl=1" width="150" height="150"   />****Zsh**  
After installing iTerm2, the next thing is to install Zsh with Oh My Zsh. Zsh is an *nix shell built on, but greatly improved over Bash, the standard MacOS shell. [Oh My Zsh](https://ohmyz.sh/) is a an open source kit for managing Zsh. I followed this [guide](https://www.freecodecamp.org/news/how-to-configure-your-macos-terminal-with-zsh-like-a-pro-c0ab3f3c1156/) for installing Zsh and Oh My Zsh. And I&#8217;m learning how to use it from this [cheatsheet](https://github.com/robbyrussell/oh-my-zsh/wiki/Cheatsheet).

**QuickRes**  
If you are doing screen captures, you don&#8217;t always want the captures done at Retina resolution. I usually use a second monitor at 1920&#215;1080 (1280&#215;720 if recording for Pluralsight), but if you only have the MacBook, you can use 3rd party apps to force the resolution down. [QuickRes](https://www.thnkdev.com/QuickRes/) is a popular one. I haven&#8217;t had the need to use of of these utilities, so this is more of a way of stashing that information.

[<img loading="lazy" class="alignleft" src="https://i2.wp.com/www.rajapet.net/Other/2015-Blog/i-4TSWxPC/0/M/xcode-M.jpg?resize=68%2C68" alt="" width="68" height="68"   />](https://developer.apple.com/xcode/)**Xcode**  
Even though I do my coding with the .NET stack using Xamarin, I still need to have [Xcode](https://developer.apple.com/xcode/) installed. &nbsp;Apple makes the Xcode compilers part of the tool chain. &nbsp;Plus that&#8217;s the only way you get the iOS Simulator.

**Certificates**  
The bane of any Apple developer. I have a bunch of developer certs to move over. I didn&#8217;t use any sane way of moving them. I just let Xcode pull them down to the new machine. Afterwards, I discovered [Fastlane](https://fastlane.tools/). 

<img loading="lazy" class="alignright size-medium" src="https://i1.wp.com/photos.smugmug.com/photos/i-ZHZRRvK/0/e2635ea8/Ti/i-ZHZRRvK-Ti.png?resize=82%2C78&#038;ssl=1" width="82" height="78"   /> Fastlane is an open source project designed to manage Android and iOS deployment and it has command line tools and strategies for managing the Unholy Hell that is Apple codesigning. I think I&#8217;m going to redo how we handle certificates and provisioning profiles for the next project and use Fastlane to manage them.

**<img loading="lazy" class="size-medium alignleft" src="https://i1.wp.com/photos.smugmug.com/photos/i-RL4M94n/0/84237635/Th/i-RL4M94n-Th.png?resize=75%2C75&#038;ssl=1" width="75" height="75"   />Visual Studio 2019**  
As a Xamarin developer, this is where I spend a great of deal time in. When installing, make sure to add Xamarin Workbooks. Get it [here](https://visualstudio.microsoft.com/).

After installing VS, I used to have to update ~/.android/advancedFeatures.ini to include the line  
HVF = on  
This sets Google&#8217;s Android Emulator to use Apple&#8217;s Hypervisor-Framework to speed up the performance of an x86 emulator image. I used to use Intel&#8217;s HAXM, but we don&#8217;t need that anymore. The Google Android Emulator can now use the native hypervisor on MacOS and Windows. Taking HAXM out means one less thing to worry about breaking when you update the OS. With the current install of VS 2019, this is set for you.

**<img loading="lazy" class="alignright size-medium" src="https://i1.wp.com/photos.smugmug.com/photos/i-tC2ccGS/0/b419fa4e/Th/i-tC2ccGS-Th.png?resize=75%2C75&#038;ssl=1" width="75" height="75"   />Visual Studio Code**  
This has replaced every other text editor for me on both Windows and the Mac. I use it edit MarkDown files, write C for embedded hardware, quickly hack .csproj files, and pretty much any file that starts with &#8220;.&#8221;. Get it [here](https://code.visualstudio.com/).

If you want to run VS Code from the command line by just typing code, do the following:  
Open the&nbsp;**Command Palette**&nbsp;(⇧⌘P) and type &#8216;shell command&#8217; to find the&nbsp;**Shell Command: Install &#8216;code&#8217; command in PATH**&nbsp;command.

**<img loading="lazy" class="alignleft " src="https://i2.wp.com/photos.smugmug.com/photos/i-r6Jp2Xw/0/ea1a8a7e/S/i-r6Jp2Xw-S.png?resize=75%2C75&#038;ssl=1" width="75" height="75"   />Docker**  
Remember when we used to spin VMs to run specialized apps? I still do run Windows on my Mac, but for everything else we have Docker containers. It&#8217;s 2019 and the ability to run SQL Server on a Mac in a Docker container is old news. So you&#8217;ll probably want [Docker Desktop for the Mac](https://docs.docker.com/docker-for-mac/).

**<img loading="lazy" class="alignright size-medium" src="https://i1.wp.com/photos.smugmug.com/photos/i-9VmbvqC/0/70a75297/Ti/i-9VmbvqC-Ti.png?resize=75%2C75&#038;ssl=1" width="75" height="75"   />Pluralsight Offline Player**  
I&#8217;ve been a big fan of Pluralsight for a number of years. And as of this year, I&#8217;m also a [Pluralsight author](https://www.pluralsight.com/authors/christopher-miller). If you [get the Offline Player App](https://www.pluralsight.com/product/downloads), you can download courses and watch them without an Internet connection. Like on a plane.

**<img loading="lazy" class="alignleft size-medium" src="https://i2.wp.com/photos.smugmug.com/photos/i-f7944MQ/0/8cfeec79/Ti/i-f7944MQ-Ti.png?resize=75%2C75&#038;ssl=1" width="75" height="75"   />Vysor**  
When testing Android code, an actual device works much better than an emulator. [Vysor](https://www.vysor.io/) provides a remote desktop to the Android device, which is handy for using the keyboard and doing presentations. Vysor uses ADB to make the connection, but if you doing Android development work, the odds are high that ADB has already been installed. There is a free version, but get the paid Pro license. You get more features and it keeps the product funded.

**<img loading="lazy" class="alignright " src="https://i2.wp.com/photos.smugmug.com/photos/i-fdFNMpQ/0/b0a10b8f/S/i-fdFNMpQ-S.png?resize=90%2C56&#038;ssl=1" width="90" height="56"   />OneDrive**  
I share files with multiple providers and on multiple machines.&nbsp; I use [OneDrive](https://apps.apple.com/us/app/onedrive/id823766827?mt=12) a lot.&nbsp; I have a personal account of about 20 GB and an Office 365b account for work.&nbsp; I used to be a big fan of Dropbox, but they changed their policies and it costs more to use an account on multiple computers.&nbsp; So I&#8217;m phasing out my usage of DropBox.

**Microsoft Edge**  
Who knew that Microsoft would do a better Chrome than Google? It behaves a lot like Chrome, but it feels a little snappier. Competition is a good thing. Get it [here](https://www.microsoftedgeinsider.com/en-us/).

**Google Chrome**  
While the Chromium based Edge browser is my day to day browser, I still use Chrome. It has better synching of bookmarks and easy access to Google Services. You know where to find it.

**<img loading="lazy" class=" alignleft" src="https://i0.wp.com/photos.smugmug.com/photos/i-sqXRdhB/0/59e043f7/Ti/i-sqXRdhB-Ti.png?resize=75%2C75&#038;ssl=1" width="75" height="75"   />Adobe Creative Cloud**  
[Photoshop and Illustrator](https://www.adobe.com/creativecloud/desktop-app.html) are still the gold standard for working with bitmap and vector images. I also use Premiere and After Effects for inhouse video projects. If you are creating animations with [Lottie,](https://airbnb.io/lottie/#/) you are going to need After Effects.

**<img loading="lazy" class="size-medium alignright" src="https://i1.wp.com/photos.smugmug.com/photos/i-JfJR8K6/0/815af3e9/Ti/i-JfJR8K6-Ti.png?resize=75%2C75&#038;ssl=1" width="75" height="75"   />PaintCode**  
[PaintCode](https://www.paintcodeapp.com/) is one of those really cool developer apps that only exist for the Mac. This app lets you take and edit vector images (.ai, .svg, .pdf) and convert them to resources that you can use in your apps. It can take an image and convert to an object in Swift, Objective-C, C#, and Java. It can also export Android Vector Drawables and SVG files.&nbsp; My typical usage for PaintCode is to take a source image from Adobe Illustrator in .ai format and use it to render Android Vector images along with .png (with the @2 and @3 variants) for iOS.

A really cool feature is if you are creating an object in code, you can assign properties to parts of the images. You can move, rotate, or scale them. Change their colors, animate them, change the visibility. Very handy when you have an object that change appearance based on the input from the user or the data.

**<img loading="lazy" class="alignleft size-medium" src="https://i0.wp.com/photos.smugmug.com/photos/i-NGcWGKq/0/266eca75/Ti/i-NGcWGKq-Ti.png?resize=75%2C75&#038;ssl=1" width="75" height="75"   />Snagit**  
This is probably the best screen capture tool that you can use. I use it on both Windows and Mac and I just love it. From the good people at [TechSmith](https://www.techsmith.com/screen-capture.html).

**<img loading="lazy" class="alignright size-medium" src="https://i0.wp.com/photos.smugmug.com/photos/i-cn7ff6F/0/159f87bb/Ti/i-cn7ff6F-Ti.png?resize=75%2C75&#038;ssl=1" width="75" height="75"   />Camtasia**  
Also from Techsmith comes Camtasia, a video editing app that is great from online training courses. It&#8217;s what I use for making Pluralsight courses.

**<img loading="lazy" class="alignleft size-medium" src="https://i2.wp.com/photos.smugmug.com/photos/i-PgNFzQ2/0/776553cc/Ti/i-PgNFzQ2-Ti.png?resize=75%2C75&#038;ssl=1" width="75" height="75"   />Office 365**  
The Office apps on the Mac have more or less parity with the Windows version. It&#8217;s what we use at work, so I have most of the Office experience. In additional to the standard Office apps, I add [Skype for Business](https://www.microsoft.com/en-us/download/details.aspx?id=54108) and Teams. Our team lives inside MS Teams and it&#8217;s pretty much the same experience on both platforms.

**<img loading="lazy" class="alignright size-medium" src="https://i0.wp.com/photos.smugmug.com/photos/i-rHvGHN5/0/266a6c65/Ti/i-rHvGHN5-Ti.png?resize=75%2C75&#038;ssl=1" width="75" height="75"   />Slack**  
I&#8217;ve installed the [Slack desktop app](https://slack.com/downloads/mac) as an experiment. I have been using the web page, but when you belong to a bunch of Slack sites, it starts getting cumbersome to manage.

**<img loading="lazy" class="alignleft size-medium" src="https://i1.wp.com/photos.smugmug.com/photos/i-m2kXghP/0/9d27fb19/Ti/i-m2kXghP-Ti.png?resize=75%2C75&#038;ssl=1" width="75" height="75"   />Postman**  
A handy tool for checking web service calls. Design and test your web API calls with one tool.&nbsp; Get it [here](https://www.getpostman.com/downloads/).

**<img loading="lazy" class="alignright size-medium" src="https://i2.wp.com/photos.smugmug.com/photos/i-th3Cxjz/0/b7276896/Ti/i-th3Cxjz-Ti.png?resize=58%2C75&#038;ssl=1" width="58" height="75"   />VLC**  
This [video player](https://www.videolan.org/vlc/download-macosx.html) will play just about anything. Video files, DVDs, streaming protocols, etc.

**Google Earth Pro**  
Vey handy when working with KML files and just fun to play with. You can do more with the desktop edition of [Google Earth](https://www.google.com/earth/versions/) than is available with the online versions.

**<img loading="lazy" class="alignleft size-medium" src="https://i1.wp.com/photos.smugmug.com/photos/i-C7FZW2c/0/5378ff6c/Ti/i-C7FZW2c-Ti.png?resize=75%2C75&#038;ssl=1" width="75" height="75"   />Audacity**  
While Adobe CC has a good audio editor with Audition, most of the time when I need to edit an audio file, [Audacity](https://www.audacityteam.org/download/mac/) is just what I need. It&#8217;s free and open source and it does pretty much what most of us need,. I should learn Audition though.

**<img loading="lazy" class="alignright size-medium" src="https://i1.wp.com/photos.smugmug.com/photos/i-2Dndv4Q/0/93bbc4bc/Ti/i-2Dndv4Q-Ti.png?resize=75%2C75&#038;ssl=1" width="75" height="75"   />Parallels Desktop**  
When I need to run Windows on my Mac, I use [Parallels](https://www.parallels.com/products/desktop/pro/). I used to use VMWare Fusion, but it was just a pain in the ass. Dragging a window from a Retina screen to a FHD didn&#8217;t handle the font scaling correctly. And it was slow.

Moving my Windows 10 VM from my old Mac to the new one was trivial. I copied the VM as a file from one machine to the other. I then installed Parallels on the new machine and it was able to open the VM without any complaints. When I enter in the activation code, it prompted me to deactivate the license on the old PC. I hate having to deal with licenses, but this was tolerable.

**<img loading="lazy" class="alignleft size-medium" src="https://i0.wp.com/photos.smugmug.com/photos/i-smM78nJ/0/21d26c95/Ti/i-smM78nJ-Ti.png?resize=75%2C75&#038;ssl=1" width="75" height="75"   />BetterTouchTool**  
This should have been baked into the OS. If you want window snapping features or want to customize the Touch Bar, then get [BetterTouchTool](https://folivora.ai/).

**Disk Inventory X**  
Sometimes you run out of disk space. [This](http://www.derlien.com/) will show you where it went

<p class="has-medium-font-size">
  Windows only apps that I would to see on the Mac
</p>

**Multilingual App Toolkit**  
This is a [Windows only tool from Microsoft](https://developer.microsoft.com/en-us/windows/develop/multilingual-app-toolkit). It provides a workflow for managing language resource files and can perform machine translation through Cognitive Services. It integrates into Visual Studio, but only Windows.

**Markdown Monster**  
This is a neat editor for editing Markdown files. While VS Code has pretty decent support for Markdown, [Markdown Monster](https://markdownmonster.west-wind.com/) is better.

**<img loading="lazy" class="alignleft size-medium" src="https://i0.wp.com/photos.smugmug.com/photos/i-7xPBWj2/0/87018af3/Ti/i-7xPBWj2-Ti.png?resize=75%2C75&#038;ssl=1" width="75" height="75"   />LINQPad**  
I have had days where this is the only development tool that I have touched. When I&#8217;m testing some new .NET code or tweaking calls to a web service, [LINQPad](https://www.linqpad.net/) is the tool that I tend to grab first. And I really want a Mac version.

<p class="has-medium-font-size">
  Hardware
</p>

At my desk, I use both Windows and Mac machines. I often go back and forth. I used to have identical keyboards with separate mice. This takes a fair amount of desk space. For the last 100 years, my keyboard of choice has been the Microsoft Natural Keyboard 4000. If I&#8217;m lucky, I get a year out of one.

After I fried the last one, I decided to switch gears a bit. I got the [Logitech Craft keyboard](https://www.logitech.com/en-us/product/craft) and [MX Vertical Mouse](https://www.logitech.com/en-us/product/mx-vertical-ergonomic-mouse). The MX Vertical supports Logitech&#8217;s Flow feature. When paired to two or three computers, you can treat the desktops as single expanded desktop. When I move the mouse off the right edge of my Windows desktop, the cursor is on the left edge of the Mac desktop. And the keyboard switches at the same time. You can also copy and paste between the computers. It&#8217;s a neat trick and probably works as expected 98% of the time. 

I&#8217;ve been using the MS Natural keyboards since they came out and I&#8217;m still getting used to the regular layout. The vertical mouse helps my wrist more than then keyboard and having just one keyboard on my desk is worth the compromise. They are wireless and use USB-C, which made me like them before opening the box.

**Docks**  
For years, I&#8217;ve been asking for every port that wasn&#8217;t USB-C to just go away. For better or worse, I got my wish with this Macbook Pro. It has 4 USB-C/Thunderbolt 3 ports, and oddly enough given what Apple did to the iPhone, a headphone jack.

My old MacBook Pro has this wonderfully insane dock from Henge Docks. You place the MacBook down and two arms would automagically connect to each side, replicating all of the ports to the back. Except some how it gained a full sized Display Port connector and Ethernet port. It was crazy and fun, but tied to the port configuration of the models that it supported. So they stopped making it. 

I now have one of their new models, the [Stone Pro](https://hengedocks.com/pages/tethered-docks). It sits underneath the Macbook and connects with a USB C/Thunderbolt 3 cable. When I get to work, I just connect the one cable and my external monitor and iOS devices are connected. And it has it&#8217;s own dedicated power supply. Which means I get to leave the Apple brick in my backpack.

I did get a [smaller dock](https://www.amazon.com/HyperDrive-Adapter-Type-C-50Gbps-MacBook/dp/B01N5OWANR) that connects to the side of the MacBook Pro, using two of the USB C connectors. It replicates the ports, plus adds a HDMI connector, USB A ports, and SD/Micro SD card slots. All of which is useful when I go somewhere and want to share my screen.

I do want to note that as much as I love having a chunky USB C charging brick, I already miss the Mag Safe 2 connector. There are 3rd party magnetic USB C connectors, but I have yet to see one that would fully support the power and data functionality. There is something common sense about a power cable that wont drag your laptop off the table when someone trips over the cord. 

I get that it&#8217;s trickier to do data connections with a magnetic connector. A momentary disconnect of the power lines will have little to no effect. Dropping the data lines is different matter altogether. But Apple, find a way to make it work.

In the 4 years since the last Mac upgrade, it has become a lot easier to work all day on the Mac. All of the MS Office apps that I use are there and have more or less parity with the Windows versions. The developments tools are on both. Still better on Windows, but that gap is narrowing. The Mac keyboard still drives me crazy, but since I use external keyboards most of the time, it&#8217;s just something for me to complain about. 

_All product logos in this post are property of their respective owners._