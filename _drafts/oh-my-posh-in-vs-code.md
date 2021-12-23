---
layout: post
title:  "Oh My Posh in VS Code Extension"
date:   2021-12-15 10:31:33 -0500
categories: Code, Tools
---
Oh My Posh is really cool mod for PowerShell that gets you the best of Oh My Zh. Once you start using it, the handy git updates on the command can make it easy to keep track of your project’s source control.

When you open up the terminal in Visual Studio Code, you get a new instance of Powershel.. If you have already installed OMP, you’ll notice that the POSH inside Code looks pretty barren.

The reason for this is that OMP is loaded from the profile for POSH. Code is launching POSH with a different profile. So this is easy to fix. Open up POSH and type $profile on the command line. You’ll get back something like this:
C:\Users\anoth\Documents\PowerShell\Microsoft.PowerShell_profile.ps1. Open the file with your favorite editor or notepad.

Next make sure that you have the latest version of POSH in VS Code as the default terminal

Open Code, press F1 or Ctrl-Shift-P to open up the command palette. Run Create New Terminal WIndow. It should look like this. Type $profile and hit Enter and you should see this. Use your favorite editor to open that file. Copy the contents from the first profile to the profile from Code and save it.

Now you can reload Code to see the terminal use the updated profile file. Open up the command palette and run “reload window”. You should now see the updated POSH in it’s OMP glory.