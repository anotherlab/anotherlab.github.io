---
title: How to replace a installed buggy .MSI file with a fixed one.
date: 2005-12-27T15:28:00-05:00
---
Aaron listed a couple of ways of removing a buggy .msi file that was installed, but would not uninstall. This is why I test all of my .msi files with VMWare. Being able to rollback changes to a virtual machine is priceless.

> 
> 
> </p> 
> 
>   1. **Forcibly install a fixed version of the MSI** &#8211; for this option, I took my newly fixed MSI that no longer had the uninstall bug and ran the following Windows Installer command line to force it to be installed over the top of the buggy one that was stuck on my system: **msiexec.exe /fvecmus my_product.msi**.  This command line forcibly replaced the old installation with the new one by running from the source MSI and recaching the copy of the MSI in %windir%\installer.  This removed the bug that blocked uninstall, and after that I was able to launch uninstall from Add/Remove Programs and everything worked as expected for me. 
>   2. **Manually edit the cached MSI** &#8211; for this option, I found the locally cached copy of the MSI in %windir%\installer (by looking at timestamps and finding the most recently created file in that folder), opened it in the [Orca](http://astebner.sts.winisp.net/Tools/orca.zip) MSI editing tool, and then manually removed the entries from the LaunchCondition table that were blocking uninstall from running.  This option can be used to fix simple errors, but complex errors will likely be difficult to manually fix in an MSI editor such as Orca.
> 
> 
> 
>  
> 
> from [[Aaron Stebner&#8217;s WebLog]](http://blogs.msdn.com/astebner/archive/2005/12/24/507294.aspx "Trick for setup developers - how to remove a setup package with a known uninstall bug")
