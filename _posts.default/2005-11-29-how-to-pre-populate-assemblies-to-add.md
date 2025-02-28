---
id: 358
title: How to pre-populate assemblies to the Add References dialog in Visual Studio 2005
date: 2005-11-29T15:02:00-05:00
layout: post
guid: http://www.rajapet.com/?p=358
permalink: /2005/11/29/how-to-pre-populate-assemblies-to-add/
---
This one is good to keep track of when working in a team enviroment where everyone uses their own folder structures.

> Here are some options I found that worked for me when I tried them on my machine:
> 
> </p> 
> 
>   1. Add a new sub-key under HKEY\_LOCAL\_MACHINE\SOFTWARE\Microsoft\.NETFramework\v2.0.50727\AssemblyFoldersEx (or the same sub-key under HKEY\_CURRENT\_USER if you want the assemblies to appear only for the current user instead of all users).  The default value of the sub-key should be the folder path that you want Visual Studio to look in for assemblies to include in the Add References dialog.  This registry path is specific to VS 2005 and the .NET Framework 2.0 and will not work for previous versions of VS or the .NET Framework.  It is documented in [this MSDN document](http://msdn2.microsoft.com/en-us/library/ftcwa60a.aspx).
> 
> 
>   2. Add a new sub-key under HKEY\_LOCAL\_MACHINE\SOFTWARE\Microsoft\.NETFramework\AssemblyFolders (or the same sub-key under HKEY\_CURRENT\_USER if you want the assemblies to appear only for the current user instead of all users).  The default value of the sub-key should be the folder path that you want Visual Studio to look in for assemblies to include in the Add References dialog.  This registry path is global and any folders listed here will be processed by VS .NET 2002, VS .NET 2003 and VS 2005 as well as the .NET Framework 1.0, 1.1 and 2.0.  It is documented in [this KB article](http://support.microsoft.com/Default.aspx?kbid=306149).
> 
> 
>   3. Place a copy of the file in the folder c:\Program Files\Microsoft Visual Studio 8\Common7\IDE\PublicAssemblies.  This path is dependent on the version of Visual Studio that you have installed and whether or not you installed it to the default path, so you may need to adjust it as needed for your system.  The path that I list is for a default install of VS 2005.
> 
> 
> 
>  
> 
> [[Aaron Stebner&#8217;s WebLog]](http://blogs.msdn.com/astebner/archive/2005/11/28/497693.aspx "Adding assemblies to the Add References dialog in Visual Studio 2005")