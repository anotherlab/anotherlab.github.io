---
title: The HP Printer Display Hack (with financial goodness)
date: 2012-09-14T21:19:00-05:00
---
The HP Printer Display Hack article has been posted to the [Coding4Fun](http://channel9.msdn.com/coding4fun) site.  This is an article and application that I wrote that lets you display a stock price on the display panel of an HP (or compatible) laser printer.

The app is written in C# with WPF and it periodically checks the current price of your favorite stock and sends a [PJL](http://en.wikipedia.org/wiki/Printer_Job_Language) command to the printer to put that price on the display.  It comes with a Windows Installer, written with [WiX](http://wixtoolset.org/).

<img src="https://i0.wp.com/www.rajapet.net/photos/i-FW8cvP3/0/L/i-FW8cvP3-L.png?w=680"  /> 

 <img src="https://i0.wp.com/www.rajapet.net/photos/i-jV3RQQG/0/S/i-jV3RQQG-S.jpg?w=680"  />

You can read the [article](http://channel9.msdn.com/coding4fun/articles/The-HP-Printer-Display-Hack-with-financial-goodness) at Coding4Fun.  The [source code](http://printerdisplayhack.codeplex.com/SourceControl/list/changesets) and a [precompiled installer](http://printerdisplayhack.codeplex.com/releases/view/94291) are up on CodePlex,  I would like to thank [Brian Peek](http://www.brianpeek.com/) for letting me <strike>steal</strike> borrow some of the [TweeVo](http://www.brianpeek.com/post/2010/02/20/tweevo.aspx) code for the UI bits.
