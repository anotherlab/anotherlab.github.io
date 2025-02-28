---
title: Wireshark work around for Windows 7
date: 2009-09-10T14:01:00-05:00
---
I do a fair amount of programming at the socket level and [Wireshark](http://www.wireshark.org/) is one the tools that I use to test the data going over the wire.  Wireshark is a free application that analyzes packets going across the network.  It knows about the different protocols and can display the data with a nice GUI front end.  It’s a cross platform tool, and I hit a small snag when I went to Windows 7. 

To capture the packets, Wireshark uses pcap, which is an API for capturing network data.  Unix/Linux systems use a libpcap library, Windows uses WinPcap.  When you install Wireshark under WIndows, the installer checks to see if WinPcap is installed and if it’s not, it runs a bundled installer for the latest version of WinPCap.

When I installed Wireshark on my Windows 7 box, the installer was unable to install WinPCap.  It displayed the following error message:

> This version of Windows is not supported by WinPcap 4.1 beta5.

Oh, the joy of using a new version of Windows.  There is a work around.  Download the WinPcap installer from [here](http://www.winpcap.org/install/default.htm) and install it first.  When you install it, run it in Vista compatibility mode.  

  1. With Explorer, Right-click on the installer and select “Troubleshoot compatibility”.  This will bring up the “Program Compatibility” dialog. 
  2. Select the second option, “Troubleshoot program”.
  3. Under “What problems do you notice”, select the first checkbox, “The program worked in earlier versions of WIndows but wont install or run now”.  Then press the “Next” button.
  4. Under “Which version of Windows did this program work on before?”, select “Windows Vista”.  Press the “Next” button.
  5. Under “Test compatibility settings for the program”, press the “Start the program…” button.  This should allow you to install WinPCap.
  6. After the installer has completed, press the “Next” button on the “Test compatibility settings for the program” dialog.
  7. On the “Troubleshooting has completed. Is the problem fixed?” page,  select “Yes, save these setting for this program” to close out the “Program Compatibility” dialog

At this point, you should have WinPcap successfully installed and you can now run the Wireshark installer.  The Wireshark installer will detected that WinPCap is already in place and you can complete the install.
