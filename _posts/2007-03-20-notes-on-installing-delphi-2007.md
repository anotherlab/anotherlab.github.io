---
title: Notes on installing Delphi 2007
date: 2007-03-20T20:58:00-05:00
---
I got the email yesterday from [CodeGear](http://www.codegear.com/ "Where developers matter"). It was a link to download the newly released [Delphi 2007](http://www.codegear.com/Products/Delphi/Delphi2007forWin32/tabid/236/Default.aspx "Delphi® 2007 for Win32®"). I will be getting the DVD from CodeGear as part of the Software Assurance that I have, but I wanted to try the new installer. This is their first release using installer technology from [InstallAware](http://www.installaware.com/). As it happens, I&#8217;m considering switching from [Wise For Windows Installer](http://www.wise.com/) (WFWI) to InstallAware, so it&#8217;s a good oppourtunity to see their installer in action.

The installer is a minimal (4MB) installer. It grabs the bits that it needs from the Internet from the bits that it needs and the bits that you want. It took a while to download the installer. There were three options, HTTP, FTP, and Galileo. From my office, none of them worked. Once again, our [SonicWall](http://chris.pirillo.com/2005/01/10/sonicwall-content-filter-service/) firewall has safely protected me from downloading stuff that I need. After a few attempts, I went to Plan B. That was my home PC. I remoted into that box, immediately downloaded the installer without any grief and copied the file back to my office PC.

Once I had the installer, I ran it on my Vista box. The Vista box is my backup PC and I just put Vista in it to test our apps under a [hostile environment](http://www.geonet.org.nz/whiteisland.html). The first thing installer did (after I answered &#8220;Continue&#8221; to the ever present UAC) was to announce that it needed the .NET 2.0 SDK and it was going out to get them. It transferred about 360MB or so of .NET parts and then installed them. 

After about 30 minutes or so, I got the &#8220;Welcome to the InstallAware Wizard for RAD Studio Setup&#8221; page in the setup dialog. Which led to the EULA and registration pages. Oddly enough, it defaulted to &#8220;CodeGear&#8221; as the company name. Come on folks, that value can be read from the registry. The &#8220;Next&#8221; button flickered as I typed into each field. I don&#8217;t know that that&#8217;s Vista, Windows Installer, or InstallAware. I&#8217;m guessing it&#8217;s Vista&#8217;s non-support for my ancient NVIDIA TNT2 card that it treats as a standard VGA device.

Then I was prompted for what features to install. I have the Enterprise version, there were many features. It wanted about 1GB and called itself &#8220;CodeGear RAD Studio&#8221;. After one more confirmation prompt, the installer went back to the mothership to download the bits it needed.

It was done after 90 minutes. Now comes the fun part. How many of the Delphi 2006 components will work as advertised?

<div>
  Tech Tags: <a href="http://technorati.com/tag/Codegear" rel="tag">Codegear</a> <a href="http://technorati.com/tag/Delphi+2007" rel="tag">Delphi+2007</a> <a href="http://technorati.com/tag/Sonicwall" rel="tag">Sonicwall</a> <a href="http://technorati.com/tag/Vista" rel="tag">Vista</a>
</div>
