---
title: Delphi Win32 gets a TStringBuilder class
date: 2008-07-29T14:31:00-05:00
---
The next version of Delphi, code named “Tiburon”, is getting some cool new features.  One of these will be the TStringBuilder class and Andreano Lanusse (a CodeGeart Evangelist Leader) <a href="http://blogs.codegear.com/andreanolanusse/2008/07/24/tiburon-building-strings-with-tstringbuilder/" target="_blank">blogged about it</a>.  Basically, it’s a Delphi implementation of the .NET StringBuilder class.  Only it’s available in the managed and unmanaged versions of Tiburon.  Why is this cool?  If you have code that does a lot of string manipulation, using the string class gets expensive, performance-wise.  If you are building up a string piece by piece, each time you add or modify a string, the previous version of the string is discarded and a new string is created.</p> </p> </p> </p> 

The StringBuilder class pre-allocates the memory so that you avoid the constant creating and freeing up of string objects.  If you have code running in aloop, you can get real performance benefits by using StringBuilder.  I’m looking forward to getting Tiburon when it’s released.
