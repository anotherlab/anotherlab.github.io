---
id: 291
title: Vista performance (or lack of)
date: 2006-08-24T16:28:00-05:00
layout: post
guid: http://www.rajapet.com/?p=291
permalink: /2006/08/24/vista-performance-or-lack-of/
---
I just installed the Beta 2 of Vista on one of my dev boxes.  It used to be my primary development box until I got a bright shiny new one last year.  About two weeks ago, the hard drive had a massive failure (it needs to be [defraggled](http://www.datadocktorn.nu/us_frag1.php) at this point) and I needed to rebuild the box.  Since we had the Vista DVD, I figured why not.  We set it up as a dual boot, with XP as the &#8220;other&#8221; OS.

After a couple of days of use, I&#8217;ve come the this conclusion.  Vista is a pig.  It&#8217;s slow to boot and slow to run.  It&#8217;s running on an older box, P4 1.7ghz with 1GB of RAM, but that box is fast enough to run XP without any issues.  It&#8217;s slow enough that I am not going to use it as a day to day OS.  I&#8217;ll run XP as the primary OS and I&#8217;ll manually boot into Vista when needed.  The performance issues come with the beta tag, that&#8217;s all and good.  I just can&#8217;t use it.  It felt like OS/2 on a 386.

The fun part was trying to figure out how to get XP back as the default OS.  The new Vista Boot Loader is a strange and wonderful beast, but it&#8217;s not your father&#8217;s boot.ini file.  With boot.ini, it&#8217;s a trivial process to set the default OS.  Vista requires you to use a new command line tool named bcdedit.exe.  With bcdedit, you can specify the default OS, by using the **/default** parameter and the GUID of the OS to run.

The GUID of the OS?  Where the [frack](http://www.andrewraff.com/weblog/2006/01/09_frack.php) do I get the GUID of the OS? If you run **BCDEDIT /enum all**, you get a listing of everything BCDEDIT knows how to load and the includes the GUID.  Except for my XP, which didn&#8217;t get one.  Apparently that&#8217;s a [magic number](http://en.wikipedia.org/wiki/Magic_number_%28programming%29), if you run [**bcdedit /default {466f5a88-0af2-4f76-9038-095b170dc21c}**](http://www.microsoft.com/technet/windowsvista/library/85cd5efe-c349-427c-b035-c2719d4af778.mspx#BKMK_default), the legacy OS becomes the default.

Since I&#8217;m using the Vista Boot Loader, I&#8217;ll need to remember to restore XP&#8217;s boot loader before I rip out this Vista Beta for next one.  In the [Vista](http://www.tech-recipes.com/microsoft_vista.html) section of [Tech-Recipes](http://www.tech-recipes.com/), they have helpful information on how to do [that](http://www.tech-recipes.com/microsoft_vista_tips1040.html).  What you need to do is the following:

  1. Reboot using the XP CD-ROM 
  2. Start the Recovery Console 
  3. Run [FixBoot](http://www.microsoft.com/resources/documentation/windows/xp/all/proddocs/en-us/bootcons_fixboot.mspx?mfr=true) 
  4. Run fixmbr to reset the Master Boot Record 
  5. Exit the Recovery Console 
  6. Reboot

Lifehacker has some tips on how to setup the dual boot [here](http://www.lifehacker.com/software/top/windows-vista-beta-how-to-dual-boot-windows-xp-and-windows-vista-179906.php).</p> 

<div>
  Tech Tags: <a href="http://technorati.com/tag/Vista" rel="tag">Vista</a> <a href="http://technorati.com/tag/Repave" rel="tag">Repave</a> <a href="http://technorati.com/tag/bcdedit" rel="tag">bcdedit</a> <a href="http://technorati.com/tag/Defraggle" rel="tag">Defraggle</a> <a href="http://technorati.com/tag/Tech-Recipes" rel="tag">Tech-Recipes</a> <a href="http://technorati.com/tag/Recovery+Console" rel="tag">Recovery+Console</a> <a href="http://technorati.com/tag/Lifehacker" rel="tag">Lifehacker</a>
</div>