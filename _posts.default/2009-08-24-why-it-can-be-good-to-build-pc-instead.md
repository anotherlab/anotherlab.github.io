---
id: 84
title: Why it can be good to build a PC instead of buying a prebuilt one.
date: 2009-08-24T18:44:00-05:00
layout: post
guid: http://www.rajapet.com/?p=84
permalink: /2009/08/24/why-it-can-be-good-to-build-pc-instead/
---
After installing Windows 7, I wanted to install [Windows Virtual PC](http://www.microsoft.com/windows/virtual-pc/ "Windows Virtual PC Home Page").  Windows Virtual PC requires that your machine support [hardware virtualization](http://en.wikipedia.org/wiki/X86_virtualization#Hardware_support "Intel and AMD have independently developed virtualization extensions to the x86 architecture. Though not directly compatible with each other, they serve largely the same functions. Either will allow a virtual machine hypervisor to run an unmodified guest operating system without incurring significant emulation performance penalties.").  My home development machine is about two years old and I wasn’t sure it it support hardware virtualization.  I have an AMD X2 64 4800 with an Asus MSI-SLI Deluxe motherboard.  With AMD, the virtualization technology is called “[AMD-V](http://www.amd.com/us/products/technologies/virtualization/Pages/amd-v.aspx "AMD Virtualization (AMD-V™) Technology")’.

AMD provides a [tool](http://support.amd.com/us/Pages/dynamicDetails.aspx?ListID=c5cd2c08-1432-4756-aafa-4d9dc646342f&ItemID=172 "AMD Virtualization™ Technology and Microsoft® Hyper-V™ System Compatibility Check Utility") that will tell you if your machine supports AMD-V.  I downloaded and ran it.  It gave me a message that my motherboard needed a BIOS patch to enable AMD-V.  On surface simple enough, patch the motherboard and off you go.  

I was hesitant on flashing the motherboard with a patch.  My motherboard’s BIOS was working just fine and there is some risk involved with flashing the BIOS to a new version.  If something goes wrong during the flash process, you can [brick](http://en.wiktionary.org/wiki/brick#Verb "To make an electronic device nonfunctional and usually beyond repair") the motherboard.  Or you could find out the new BIOS makes your system worse.  Plus, I had no idea if a new version actually would enabled AMD-V.

Fortunately, Asus has a decent support forum and I was able to [post a message](http://vip.asus.com/forum/view.aspx?id=20090823202545671&board_id=1&model=M2N-SLI+Deluxe&page=1&SLanguage=en-us "Is hardware virtualization supported") asking about hardware virtualization.  Within an hour, I received a detailed response that the new BIOS versions did enable hardware virtualization and a list of steps on how to flash the BIOS.  I’ve flashed motherboard BIOS or two before and I pretty much know that drill, but it’s nice to get that level of support.  He did recommend clearing out the existing BIOS settings, which is always a good thing to do whenever you update the firmware of an electronic device.

I grabbed the latest BIOS from the Asus site.  I also grabbed the current version, just in case something went wrong wrong and I needed to go back to the old BIOS.  My motherboard had a flash tool built it and it could access a USB thumb drive before the booting the OS.  I copied the BIOS files to the thumb drive and rebooted.  

As it booted up, I pressed the Delete key to jump into the BIOS setup screen.  I selected the flash utility and picked the current BIOS file.  After a few minutes, the new BIOS was installed.  I cleared out the CMOS settings for the BIOS and rebooted.  I went into the BISO setup again and a had a few new options.  One of which was AMD Virtualization, which was enabled by default.

The next step was a reboot.  Windows came up and all was good.  I ran the AMD tool and it said that AMD Virtualization was good.  That was pretty painless.  When I got this machine 2 years ago, I had it built from a hand picked list of components.  I’ve had good luck with Asus motherboards and I wanted one where it would be easy to update and upgrade.  Plus I wanted a decent power supply.  When you buy an off the shelf PC, you don’t get to pick the components, other than the capacity and number of items.  

I used to do the actual assembly, but I’ve found it easier to have it assembled by the place where I buy it from.  That way they can make sure that all of the parts fit together and nothing is missing.  If something is DOA, they’ll find it when they assemble and test the system.