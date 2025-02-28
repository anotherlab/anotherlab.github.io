---
title: Getting a new dev machine set up, OS X Style
date: 2015-02-03T11:36:51-05:00
---
So I&#8217;m on my second Macbook. I use a Macbook Pro for iOS development and I was due for a new one.  I went from a Late 2011 MBP to a late 2014 MBP.  Except now I have a Retina display and a 512 SSD. I&#8217;ve gained an HDMI port, but lost the Ethernet port.  I&#8217;m still not sure if that was a fair trade.

[<img title="DailyHaHa_Funny_Pictures" src="https://i0.wp.com/www.dailyhaha.com/_pics/new_mac.jpg?w=680" alt="DailyHaHa.com Funny Pictures" border="0"  />](http://www.dailyhaha.com/pictures.htm)

I no longer get laptops or PC&#8217;s with spinning rust drives.  The performance benefits of a SSD out weigh the extra cost.  The PCI Express controller is faster than SATA, even with full disk encryption (IT policy).

Now I have to get the tools that I need onto the MBP.  I really don&#8217;t have a master list of what needs to be installed so I&#8217;m making one here.  I&#8217;ll continue to update this blog post as I come across stuff to install for development.

[<img loading="lazy" class="alignleft" src="https://i2.wp.com/www.rajapet.net/Other/2015-Blog/i-4TSWxPC/0/M/xcode-M.jpg?resize=100%2C100" alt="" width="100" height="100"  />XCode](https://developer.apple.com/xcode/)  
Even though I do my coding with the .NET stack using Xamarin, I still need to have Xcode installed.  Apple makes the Xcode compilers part of the tool chain.  Plus that&#8217;s the only way you get the iOS Simulator.  
Where to get it:  Apple OS X App Store

Xcode simulator for iOS 7<img loading="lazy" class="alignright" src="https://i1.wp.com/www.rajapet.net/Other/2015-Blog/i-cNpkQbC/0/S/iossim-S.png?resize=100%2C100" alt="" width="100" height="100"  />  
A new Xcode install wiill just have the current version of iOS in the simulator.  If you want to test against an older version, you need to install it manually.  
Where to get it:  Xcode, preferences, downloads

Xcode command line tools  
Xamarin needs to have the command line tools installed. That&#8217;s the easiest way to get git and svn installed.  
Where to get it:  use Terminal to install Xcode Command Line Tools.

<pre class="brush: bash; gutter: true">$ xcode-select --install</pre>

<img loading="lazy" class="alignleft" src="https://i0.wp.com/www.rajapet.net/Other/2015-Blog/i-GtRVW87/0/Ti/chrome-Ti.png?resize=100%2C100" alt="" width="100" height="100"  /> Google Chrome  
I&#8217;m not looking to go a Safari Adventure&#8230;  
Where to get it: http://www.google.com/chrome/

&nbsp;

[Xamarin<img loading="lazy" class="alignright" src="https://i0.wp.com/www.rajapet.net/Other/2015-Blog/i-p7bp2d9/0/Ti/xamarin-studio-icon-Ti.png?resize=100%2C100" alt="" width="100" height="100"  />  
](https://xamarin.com/) We are not animals, why use anything else?  I drank the Xamarin Koolaid 2 years ago and I can&#8217;t imagine doing mobile development any other way.  
Where to get it: [Subscription Downloads](https://store.xamarin.com/account/my/subscription/downloads%20http://xamarin.com/platform)

Right after Xamarin has finished installing, update the Android SDK. The Android installer will install the latest bits, but if you want to support previous versions of Android, you&#8217;ll want to install those SDKs too.  
Where to get it: Xamarin Studion -> Tools -> Open Android SDK Manager

[<img loading="lazy" class="alignleft" src="https://i1.wp.com/www.rajapet.net/Other/2015-Blog/i-dgpCtwK/0/Ti/virtualbox-Ti.png?resize=100%2C100" alt="" width="100" height="100"  />VirtualBox](https://www.virtualbox.org/)  
Both the Xamarin Android Player and Genymotion require VirtualBox. VirtualBox is a free and open source virtual machine environment.  If you install that first, it makes the Genymotion install easier.  
Where to get it:  [Virtual Box Download Page](https://www.virtualbox.org/wiki/Downloads)

[Genymotion](https://www.genymotion.com)[<img loading="lazy" class="alignright" src="https://i0.wp.com/www.rajapet.net/Other/2015-Blog/i-PW5PPLH/0/S/genymotion-S.png?resize=100%2C100" alt="" width="100" height="100"  />](https://www.genymotion.com)  
Genymotion is a fast Android emulator and supports more versions of Android than any other VM based Android Emulator.  Friends don&#8217;t let friends use the Google Android Emulator.  Google&#8217;s emulator emulates the CPU on the phone, but pays a performance penalty.  Genmotion (and Xamarin and Microsoft) run a version of Android for x86, which gets you virtual machine performance.  
Where to get it:  [Get Genymotion](https://www.genymotion.com/#!/pricing)

[<img loading="lazy" class="alignleft" src="https://i0.wp.com/www.rajapet.net/Other/2015-Blog/i-Rctgxqj/0/Ti/adobe_creative_cloud_logo-Ti.png?resize=100%2C100" alt="" width="100" height="100"  />Adobe Creative Cloud](http://www.adobe.com/creativecloud.html)  
When our graphic designers send me the artwork for our apps, they give it to me in Adobe Illustrator format.  From the AI files, I can script the rendering the images through Photoshop for all of the iOS and Android sizes that I need.  
Where to get it:  [Adobe CC](http://www.adobe.com/creativecloud.html)

Alternatives to Adobe CC:  [GIMP](http://www.gimp.org/) is a very powerful image editor.  An open source project, GIMP is available on many plaforms.  If I didn&#8217;t have an Adobe CC subscription, GIMP would be my tool of choice.  [Inkscape](https://inkscape.org/en/) is another open source tool, but for vector image editing.  Inkscape has the ability to export to XAML, so you have the ability to use resolution independent images on the Windows platforms,  Android 5 supports SVG for vector images and there is the [svg-android](https://code.google.com/p/svg-android/) library for older versions of Android.  Which brings us to&#8230;

[PaintCode<img loading="lazy" class="alignright" src="https://i2.wp.com/www.rajapet.net/Other/2015-Blog/i-bdxPP77/0/Ti/PaintCode-Ti.png?resize=100%2C100" alt="" width="100" height="100"  />](http://www.paintcodeapp.com/)  
PaintCode is an OS X app that will take SVG files and generate iOS drawing code in Objective-C, Swift, or Xamarin C#.  With the image as drawing code, you can manipulate it at runtime, it&#8217;s no longer a static image, but one that you can edit via.

<img loading="lazy" class="alignleft" src="https://i1.wp.com/www.rajapet.net/Other/2015-Blog/i-6tSRf65/0/S/Fusion-S.png?resize=100%2C100" alt="" width="100" height="100"  /> VMware Fusion  
I run Windows on my Macbook Pro.  When I want to carry just one machine and compile for iOS and Windows Phone, this is the simplest solution for me.  A cool thing with Fusion is that it supports Hyper-V, I can run the Windows Phone emulator in a Fusion session.  
Where to get it: [VMware Fusion](http://www.vmware.com/products/fusion)

[Air Server<img loading="lazy" class="alignright" src="https://i2.wp.com/www.rajapet.net/Other/2015-Blog/i-7kHTcJJ/0/S/AirServer-S.png?resize=100%2C100" alt="" width="100" height="100"  />](http://www.airserver.com/)  
When I want to demo an actual iOS device and be able to display on my Macbook, I use AirServer.  AirServer is an [AirPlay](https://www.apple.com/airplay/) receiver for OS X (and Windows). This works great for demos and for sharing with WbeEx or GotoMeeting.  The only caveat is that it uses the same port as the Xamarin Build Host.  The Xamarin Build Host is the app that lets Visual Studio on Window access the Xamarin and Xcode build tools on the Mac.  
Where to get it: [Airserver Download page](http://www.airserver.com/Download)

[AirServer uses a bunch of ports](http://support.airserver.com/customer/portal/articles/1465944), 5000 is used for audio and causes the conflict with Xamarin.  To change the audio port used by AirServer, open up Terminal and run the following command:

<pre class="brush: bash; gutter: false">defaults write com.pratikkumar.airserver-mac com.airserver.raopPort 5010</pre>

[Paragon NTFS for OS X](http://www.paragon-software.com/home/ntfs-mac/)  
Out of the box, OS X can read NTFS but it can&#8217;t write to it.  If you have a large capacity USB drive, it&#8217;s going to be formatted with NTFS.  Paragon makes a stable and cheap NTFS driver for OS X.  
Where to get it: [NTFS for Mac](http://www.paragon-software.com/home/ntfs-mac/download.html)

[<img loading="lazy" class="alignleft" src="https://i2.wp.com/www.rajapet.net/Other/2015-Blog/i-zFkjdnk/0/S/sublime-S.png?resize=100%2C100" alt="" width="100" height="100"  />Sublime Text](http://www.sublimetext.com)  
Sublime is a very nice text editor that is available for multiple platforms.  I like being able to use the same tools on Windows and OS X where possible.  It makes for less things to learn and remember so you can concentrate on getting stuff done.  
Where to get it:  [Sublime Text Download page](http://www.sublimetext.com/2)

[Balsamiq Mockups<img loading="lazy" class="alignright" src="https://i0.wp.com/www.rajapet.net/Other/2015-Blog/i-bntSxfH/0/S/Balsamiq-S.png?resize=100%2C100" alt="" width="100" height="100"  />](https://balsamiq.com/)  
Balsamiq is a great tool for doing wireframe mockups.  When doing quick designs, wireframe mockups let you walk do the basic design and flow, without getting distracted by pixel placement.  This is a other one of the multi-platform tools.  
Where to get it:  [Balsamiq download page](https://balsamiq.com/download/)

[<img loading="lazy" class="alignleft" src="https://i1.wp.com/www.rajapet.net/Other/2015-Blog/i-rnJrwPp/0/S/Adium-S.png?resize=100%2C100" alt="" width="100" height="100"  />Adium](https://adium.im/)  
Adium is a free instant messaging application for OS X that supports multiple chat platforms.  When I want to IM a co-worker, I use whatever platform that they prefer, AIM, Yahoo, Google, Facebook, etc.  Using Adium lets me deal with just one app.  
Where to get it: [Adium.im](https://adium.im/)

RDP<img loading="lazy" class="alignright" src="https://i0.wp.com/www.rajapet.net/Other/2015-Blog/i-KH7M39J/0/S/MSrdp-S.png?resize=100%2C100" alt="" width="100" height="100"  />  
Right now I&#8217;m using the Microsoft Remote Desktop app for OS X.  I used to use CoRD, but Microsoft Remote Desktop looks like it&#8217;s more up to date and I&#8217;ll stick with it.  I don&#8217;t RDP to Windows from OS X that much, the MS one should be enough.  Also CoRD doesn&#8217;t appear to support Mavericks or Yosemite.  
Where to get it: Apple OS X App Store

[Db Browser for SQLite](http://sqlitebrowser.org/)  
This is an open source, cross platform tool for working with SQLite databases.  When writing code that writes to a SQLite database, an external database browser can help validate that you are writing the right data.  
Where to get it:  [Github](http://sqlitebrowser.org/)

When you use the iOS Simulator, you can access files from the simulator image with Finder.  The location will vary, depending on the version of Xcode used.  This [Stack Overflow post](http://stackoverflow.com/questions/1567798/iphone-simulator-location) is a good starting point.

[<img loading="lazy" class="alignleft" src="https://i1.wp.com/www.rajapet.net/Other/2015-Blog/i-B2Sq6bm/0/S/Objectice%20Sharpie-S.png?resize=91%2C89" alt="" width="91" height="89"  />Objective Sharpie](http://developer.xamarin.com/guides/ios/advanced_topics/binding_objective-c/objective_sharpie/)  
This is a tool that Xamarin developed for building binding libraries for Objective-C libraries.  It&#8217;s not the easiest tool to use, but it greatly cuts down the amount of work needed to created a Xamarin C# binding to an Objective-C library.  
Where to get it: [Objective Sharpie](http://developer.xamarin.com/guides/ios/advanced_topics/binding_objective-c/objective_sharpie/)

[OneDrive<img loading="lazy" class="alignright" src="https://i1.wp.com/www.rajapet.net/Other/2015-Blog/i-GtTdtT7/0/S/OneDrive-S.png?resize=89%2C83" alt="" width="89" height="83"  />  
](https://onedrive.live.com/) I use OneDrive.  A lot.  Most of the documents that I work on, I tend to put into OneDrive.  It just makes it easy to not care from which machine that I used to last edit the document.  I have some PhotoShop scripts for generating different sized icons from a single source file.  I keep it in the cloud so I can use it where ever I have Adobe PhotoShop installed.  From a synching perspective, [DropBox](https://www.dropbox.com/) is probably a better choice, OneDrive is backed into everything else that I use so I&#8217;ll stay with it.  
Where to get it: Apple OS X App Store

<img loading="lazy" class="alignleft" src="https://i0.wp.com/www.rajapet.net/Other/2015-Blog/i-HQqKp9v/0/S/snagit-S.png?resize=100%2C100" alt="" width="100" height="100"  /> Snagit  
TechSmith makes the best screenshot capture tool period.  I use this more often that I would have expected to.  Also falls into the category of being available for OS X and Windows.  
Where to get it: [TechSmith](http://www.techsmith.com/snagit.html)

Android File Transfer[<img loading="lazy" class="alignright" src="https://i2.wp.com/www.rajapet.net/Other/2015-Blog/i-vMQJf2X/0/L/AndroidFileTransfer-L.png?resize=100%2C100" alt="" width="100" height="100"  />](https://www.android.com/filetransfer/)  
I had to move some large files from the old MBP to the new MBP and I left my thumb drives at home.  So I used my Nexus tablet as a large, awkward thumb drive.  With Windows, you can just use the tablet as a drive, with a Mac you need the Android File Transfer app.  When you run the app it will display the file system of the connected Android device in a Finder-like window.  You can drag and drop files between the Mac and the Android.  
Where to get it: [Android.com](https://www.android.com/filetransfer/)

Spectacle  
I have an external monitor on the Mac and I was amazed that OS X does not include any keyboard shortcuts for resizing windows, docking to screen edges, or moving windows to other displays.  Unless you use both OS X and Windows on a day to day basis, you don&#8217;t realize how Windows has passed OS X in many areas for UX.  So I installed Spectacle, an open source app for OS X that provides the keyboard shortcuts for moving windows around.  This should be built into the OS.  
Where to get it: [spectacleapp.com  
](http://spectacleapp.com/) Bonus round: Get the cheatsheet from a [StackExchange post](http://apple.stackexchange.com/questions/9659/what-window-management-options-exist-for-os-x/66936#66936).

Microsoft Lync  
We use Lync as our corporate IM and it&#8217;s handy to be able to use from the Mac.  There is an OS X Lync app, but I prefer to use the web application.  It requires a browser plugin, but it more or less works.  
Where to get it: [Lync Web App](https://join.microsoft.com/meet/sebros/TWFQ3LYH)

Disk Inventory X  
This is the Mac equivalent to WinDirStart. It&#8217;s a disk utility app that shows file and folder usage.  
Where to get it: [Lync Web App](http://www.derlien.com/)

iStat Menus  
[<img loading="lazy" class="alignleft" src="https://i1.wp.com/www.rajapet.net/Other/2015-Blog/i-J9NXZSg/0/Ti/StatIcon-Ti.png?resize=100%2C100" alt="" width="100" height="100"  />](https://bjango.com/mac/istatmenus/)This app adds an incredible amount of information to your menubar.  From motherboard sensors, world clocks, CPU & drive usage rates, and detailed network information, there is more stuff than you would use.  It&#8217;s pretty cheap and is updated often.   When I&#8217;m trying to connect the Xamarin plugin in Visual Studio to the Xamarin Build Host, I often have to do it by IP address.  My Macbook&#8217;s IP address changes a lot at work, and gives me a fast way to see the Wi-Fi IP address.  
Where to get it: [bjango.com  
B](https://bjango.com/mac/istatmenus/)onus round: Found about it via [Nat Friedman](https://twitter.com/natfriedman)&#8216;s [newsletter](http://tinyletter.com/natfriedman)

After I get the tools installed, the next thing is to get [Time Machine](http://support.apple.com/en-us/HT201250) set up.   I have an external 2TB USB 3 drive that I use for backing up the Macbook Pro.  Time Machine is one of those OS X features that you can set and forget, it just works.  The hard drive crashed on my previous MacBook Pro, I was able to completely recover my stuff from the Time Machine backup.
