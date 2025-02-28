---
title: Yet another rebuild (Part 1)
date: 2007-02-05T18:15:00-05:00
---
After two and half weeks, I finally got my primary development box back from our IT manager.  The delay was due to fun with RAID.  After two drive failures within 30 days, I&#8217;m not taking any more chances.  BTW, nothing beats having two development boxes.  We are on three year refresh cycles for our PC&#8217;s.  Usually developer boxes get rotated out to other departments.  On the last refresh, I managed to keep my old PC.  I do enough TCP development work, where it&#8217;s handy to have to physically separated machines.  Now, the old box is now the insurance policy for when the hard drive goes on the primary box. 

Now, comes the tedius part, installing all the applications and tools that I use.  After the last drive finalure, I made up a spreadsheet of everything I use, that makes things much easier.  (Note to self: Next time, don&#8217;t store that list on the machine that&#8217;s meant for.  I was lucky, that file was recoverable when the drive went south.)

The first job is getting Windows setup up the way I want it.  That means XP, not Vista.  None of my development tools are certifed for Vista (Visual Studio 2005, BDS 2006), so why tempt fate.  Plus XP came with the box, might was well use the license.  For now, I&#8217;ll run Vista from within a VMWare session.

After installing XP, I needed to get IIS installed.  Then Office.  Since the last drive fell on it&#8217;s sword, I received the Office 2007 disk as part of the MSDN subscription.  I&#8217;ve only had the chance to play with Excel and Outlook, but the usability improvements are real.

The first time I ran Outlook 2007, it connected to our Exchange service and grabbed my mail.  The cool part was that I didn&#8217;t tell it the name of our server or my email account.  It apparently figure that out from AD.  With Outlook 2003, I use LookOut to provide high speed searching of messages.  I don&#8217;t think that&#8217;s supported with Outlook 2007, so I have installed Windows Search.  It seems to work, plus it works across the file system.

The next thing I always disable is the Language Bar toolbar.  Even though you can right-click on the taskbar and de-select the Language Bar, it keeps coming back.  The following steps will take care of that:

  1. Click Start, click Control Panel, and then double-click Regional and Language Options. 
  2. On the Languages tab, under Text services and input languages, click Details. 
  3. Under Preferences, click Language Bar. 
  4. To turn text services off, select the Turn off advanced text services check box. 
  5. Click Yes if you are prompted to confirm your selection. 

Then I add Administrative Tools to the Start Menu.   I use that enough so it&#8217;s handy being able to get in quick.   Now the OS is functional, I can start loading up the tools.

<div>
  Tech Tags: <a href="http://technorati.com/tag/Repave" rel="tag">Repave</a> <a href="http://technorati.com/tag/Reinstall" rel="tag">Reinstall</a> <a href="http://technorati.com/tag/Language+Bar" rel="tag">Language+Bar</a>
</div>
