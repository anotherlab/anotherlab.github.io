---
title: "UsbSerialForAndroid: Recent Updates and Improvements"
author: anotherlab
classes: wide
toc: true
header:
  image: /assets/images/usbserialforandroid-steampunk.jpg
categories: 
  - .NET, Android, Hardware
tags:
  - .NET
  - Android
  - .NET MAUI
  - USB
  - Open Source

---
I’ve pushed a new round of updates to **[UsbSerialForAndroid](https://github.com/anotherlab/UsbSerialForAndroid)**, the open-source .NET / C# library that provides USB serial support for Android, including .NET MAUI and Xamarin-based projects.

These changes focus on improving reliability, maintainability, and compatibility with modern .NET and Android tooling.

## What’s New

Recent updates include:

- **General code cleanup and modernization**  
  The codebase has been updated to better align with current .NET and Android best practices, making it easier to maintain and extend.

- **Improved stability and error handling**  
  Several edge cases around device connection, disconnection, and serial communication have been tightened up to reduce unexpected failures.

- **Compatibility improvements**  
  Updates were made to ensure smoother integration with current versions of .NET for Android and .NET MAUI.

- **Documentation and project maintenance**  
  README updates and project metadata improvements to make it clearer how to use the library and what environments are supported.

- **Nuget**  
  Updates are now available on nuget. You no longer have to build the library to use it.


## Breaking Changes
This release supports .NET and drops support for previous versions. Including Xamarin. The last supported SDK by Xamarinwas API 34. As of August 31, 2025, the minimum API level allowed for Google Play apps is now API 35. If someone really wants to use this library with Xamarin.Android, they'll have to use a [previous release](https://github.com/anotherlab/UsbSerialForAndroid/releases/tag/v1.1.1).

The code should work with .NET 8 or .NET 9, but I haven't tested this update with the older versions. If you need to support .NET 8, the [previous release](https://github.com/anotherlab/UsbSerialForAndroid/releases/tag/v1.1.1) should work.

With the release to nuget, I made a change the default namespace for the library. Someone created a nuget package based on a two year old version of this code base and published to nuget under their own name (and without credit to the original authors). I changed the root namespace from `Hoho.Android.UsbSerial` to `Anotherlab.UsbSerialForAndroid` to make it easier to manage on nuget.

The "Hoho" namespace came from original Java library package name, [usb-serial-for-android](https://github.com/mik3y/usb-serial-for-android), and while I based this code from that library, they are separate.

## What can you do with this library?

UsbSerialForAndroid is often used in scenarios involving:

- Hardware integration
- Industrial or diagnostic tools
- Embedded devices connected via USB OTG
- Cross-platform .NET applications targeting Android

These updates aim to make those scenarios more reliable while keeping the API familiar for existing users.

## .NET MAUI
While this code is Android specific, it should work just fine for the Android target of a .NET MAUI app.

## Get the Updates

If you’re already using the library, I recommend pulling the latest changes or updating to the newest package version.

- **GitHub repository:**  
  <https://github.com/anotherlab/UsbSerialForAndroid>

- **Issues and feedback:**  
  Bug reports, feature requests, and pull requests are always welcome.

## NuGet Package Availability
![Logo](https://github.com/anotherlab/UsbSerialForAndroid/raw/main/UsbSerialForAndroid/icon.png) 

[![NuGet version (usbserialforandroid)](https://img.shields.io/nuget/v/usbserialforandroid?style=flat-square)](https://www.nuget.org/packages/UsbSerialForAndroid)

The library can now be added directly via [NuGet](https://www.nuget.org/packages/UsbSerialForAndroid), eliminating the need to manually reference source projects or maintain forks.

This improves:

- Dependency management
- Versioning and upgrades
- CI/CD and reproducible builds
- Integration with .NET MAUI and modern SDK-style projects

NuGet availability also makes it easier to consume UsbSerialForAndroid alongside other Android and cross-platform dependencies.

## Background
This is a project that I have been maintaining on and off for a number of years. We have an application that runs on Android and it needed to communicate with an RFID reader. The reader supports serial communication over USB. At the time, our application was written with Xamarin.Android and it didn't have much for USB Serial communnication support. 

I found a really good open soource library written in Java called [usb-serial-for-android](https://github.com/mik3y/usb-serial-for-android). I ported it to C# more or less line by line. There are differences in the code bases, Java and C# are similar, but not identical. After completing the port from Java to C#, I obtained permission from my employer to make this an open-source library.

## Thanks

Thanks to everyone who has starred the repo, filed issues, or contributed fixes. Open-source feedback is what keeps this project useful and moving forward.

If you’re using UsbSerialForAndroid in a project, I’d love to hear how it’s working for you.