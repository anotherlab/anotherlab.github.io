---
title: Taking care of a pet peeve with the Xamarin Build Host
date: 2015-02-04T01:29:06-05:00
---
I write code in Windows with Visual Studio, but parts of it compile and debug on OS X.  I&#8217;m doing mobile (Android, iOS, and Windows) development with Xamarin and the iOS part needs to be compiled on OS X.  Xamarin provides an app called the Xamarin Build Host that runs on OS X and allows for their tools in Visual Studio to communicate with the tools on OS X.

<img loading="lazy" class="alignright" src="https://i0.wp.com/www.rajapet.net/Other/2015-Blog/i-z8tNbZF/0/S/unpair-S.png?resize=150%2C150" alt="" width="150" height="150"  /> The hardest part with getting that to work is having the Xamarin plugin in Visual Studio make the connection to the [Xamarin Build Host](http://developer.xamarin.com/guides/ios/getting_started/installation/windows/introduction_to_xamarin_ios_for_visual_studio/).  Xamarin uses Apple&#8217;s [Bonjour](https://developer.apple.com/bonjour/index.html) services to identify remote devices on the network.  It works great when it works.  When it doesn&#8217;t work, you can specify the IP address of the OS X box and the plugin will connect to Build Host in that way.

As [someone](https://twitter.com/cameronlerum) wiser than me once said, &#8220;Xamarin needs to display the local IP address(es) on the Xamarin Build Host window &#8220;. Bonjour doesn&#8217;t work on the corporate network at work.  Between my Windows PC being on an Ethernet connection and my Macbook Pro on Wi-Fi, there are enough [disturbances in the Space-Time Continuum](http://www.zazzle.co.uk/space+time+continuum+postcards) to keep Bonjour from reliably letting Visual Studio from seeing my copy of the Xamarin Build Host.  Connecting via IP address is the way I have to set the connection.  Which works, until the IP address changes.

[<img loading="lazy" class="alignleft" src="https://i1.wp.com/www.rajapet.net/Other/2015-Blog/i-W7JcNjw/0/S/geektool-S.png?resize=150%2C150" alt="" width="150" height="150"  />](http://projects.tynsoe.org/en/geektool/)My IP address can change depending on the favor of the Wi-Fi gods.  I wanted a quick way of checking the current IP address of my Macbook.  One of my co-workers suggested using [GeekTool](http://projects.tynsoe.org/en/geektool/).  GeekTool is a utility that can display all sorts of useful information via scripts.

I found a nice [IP address script](https://github.com/jacobsalmela/geeklets/blob/master/network-and-ssid-in-color.sh) in the github account of Jacob Salmela.  I made some changes to have the color match my current desktop, but it&#8217;s mostly based on Jacob&#8217;s code.  I have it set that GeekTool will run the script every 10 minutes.  It will display the IP information on the desktop like this:

<img loading="lazy" class="aligncenter" src="https://i0.wp.com/www.rajapet.net/Other/2015-Blog/i-vs3xL5S/0/S/2015-02-03_13-46-40-S.png?resize=400%2C134" alt="" width="400" height="134"  /> 

The SSID is displayed, along with the Wi-Fi and Ethernet IP addresses.  Very handy and gives me the same kind of information that I can get on Windows with the wonderful [BGInfo](https://technet.microsoft.com/en-us/sysinternals/bb897557.aspx) tool from SysInternals.
