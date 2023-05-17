---
title:  Updating UsbSerialForAndroid to support API 31
date:   2023-05-07
author: anotherlab
summary: How to add android:exported to a Firebase service with Xamarin Android
largeimage: /assets/steam_punk_beker.jpg
categories: 
  - Android
  - Xamarin
tags: 
  - Xamarin
  - Android
  - API
  - USB
  - Serial
---
{:refdef: style="text-align: center;"}
![Changing the API](//assets/steam_punk_beker.jpg)
{: refdef}

A few years back I ported a Java library to C#. There was a specific need for the project. We need to communicate with an RFID reader over USB. And it needed to be on Android. And we are using Xamarin Android. There wasn't much available for C# that fit, but I did find a really good Library that fit the bill.That was [usb-serial-for-android](https://github.com/mik3y/usb-serial-for-android).

I had a few choices for consuming that library. I could create [a binding library](https://learn.microsoft.com/en-us/xamarin/android/platform/binding-java-library/?WT.mc_id=DT-MVP-5000200) that provides a C# wrapper for the library. That would allow me to use C# calls to access the library. Or I could use the Java Natve Interface (JNI) to call the Javacode directly

Or…

I could port the library from Java to C#. There would be more work initially, but it would be C# all the way down.  My code would be talking to the USB Manager on the Android device, to the serial chipset in the cable, and then to the actual device itself. I didn't want to add one more layer of Java on top of all of that.

The actual porting went smoothly. Java and C# are close enough that most of the code went over mostly  as is.  There were naming convention changes and how they handled memory copying were different, but it wasn't as bad as I thought it would be.

The drawback to porting the code was that I had drawn a line in the sand at the point in time when I ported.  Because I had made some changes, I had no intention of bringing over any new changes from the Java library. Their library was pretty mature at point.

We made the decision to open-source the project early on. There were a number of reasons for doing so.

1. The big reason was that I had started with someone else's open-source project. Sharing what I did just seemed like the right thing to do.
2. This library supports multiple chipsets that provide RS-232 serial support over USB.  I had one of them on hand, I had no way to testing anything else. Letting others use the code with their hardware would work out any bugs or missing functionality. People were free to fork the code and submit pull requests.

After making the library available, I was largely hands off. This was a project to solve something for work and once it was solved, I moved on to other projects. I kept my hands in to answer questions and to manage pull requests, but I wasn't using the library.

This week, I decided to get back in the game a little bit. I wanted to build the library and run it on the Android hardware that I have now. Befor jumping back into the code, I needed to get the hardware setup. While the original hardware that I used had two USB ports, that's exceedly rare in the Android world. Our tablet was a bespoke design. On a side note, having a custom Android platform is something to avoid at all costs. Trust me on this.

For the serial connection, I needed a Serial over USB adapter. There are multiple chipsets out there that support RS-232 serial over USB. I picked [a cable from Gearmo](https://www.gearmo.com/shop/usb2-0-rs-232-serial-adapter-led-indicators/). It had [Das Blinkenlights](https://www.techfak.uni-bielefeld.de/~joern/jargon/blinkenlights.HTML) so that you could get a visual indicator that you had a connection.  It uses the FTDI chipset, a reliable chipset for this sort of thing. 

To keep things simple, I bought two of the Gearmo One of the phone, one for my PC.  To connect the cables to each other, I needed a Null modem adapter. That will correctly map the connections between the two cables. That's a commodity item from Amazon. You want a DB9 female to female null modem adapter. I used [this one](https://www.amazon.com/gp/product/B075XGRLXW), it seemed pretty and it worked just fine. And a USB-A to USB-C adapter so I could plug the cable into my phone.

Now that I had the hardware, I wanted to verify that it all worked before throwing some code at it. I installed an app named [Serial USB Terminal](https://play.google.com/store/apps/details?id=de.kai_morich.serial_usb_terminal) on my phone. On the other of the connection, I was just going to run something on Windows. I grabbed [Serial Debug Assistant](https://apps.microsoft.com/store/detail/serial-debug-assistant/9NBLGGH43HDM) from the Microsoft Store. I connected the cables and ran the apps and it all just worked.

Since the serial cable would be using my phone's USB port, I needed to enable Wireless debugging.  On my phone (Samsung Galaxy S22 Ultra), I opened up the Settings app, selected Developer Options and then scrolled down to the Debugging section. I enabled "Wireless debugging" and then set "Always allow" on the dialog that popped up and then clicked the "Allow" button. The next step was to tap on "Wireless debugging" to open a menu for connecting. I selected "Pair device with pairing code". That displayed a popup with a pairing code and an IP address & port.  From my PC, I typed

```bash
adb pair IP:port
```
Where IP and port were the ones from the popup on the phone. It then prompted me for the pairing code. I now had a ADB connection to my phone over my Wi-Fi. For security, you'll need to turn Wireless debuggin on each time after a reboot.

Now that I knew the connection worked, I could run the library. I cloned it from the repo and compiled and ran it. The repo has a the library and a demo app that uses the library. I had written it for Xamarin.Android years back and a user had updated it to support multi-targetting and it now supported .NET 6. I added .NET 7 as a target and then compiled and ran the app.

The sample is pretty crude. It enumeraates the available serial over USB ports and presents them in a list. You click on an item in the list and it would open a connection, using the default settings for that driver.

When I ran the app, it identified the Gearmo cable as FTDI chipset. When I clicked on it, the app blew up.  My phone is running Android 13, which is API 33.  With API 31 (Android 12), Google made a breaking change, which produced an error like this:

```bash
Targeting S+ (version 31 and above) requires that one of FLAG_IMMUTABLE or FLAG_MUTABLE be specified when creating a PendingIntent.
```

Mention where and why
Mention that Immutable failed
Mention that the enums are in .NET 6 but not Xamarin Android

Talk about versions and releases