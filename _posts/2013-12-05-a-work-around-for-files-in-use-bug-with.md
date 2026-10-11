---
title: A work around for the files in use bug with HeatDirectory in MSBuild
date: 2013-12-05T18:45:00-05:00
---
I have this multi-project solution in Visual Studio 2013 and one of the projects is a Windows Installer project.  It uses [WiX](http://wixtoolset.org/) (Windows Installer XML) 3.8 and when I rebuild the solution, the final result is a nice .MSI file that will install the executable bits from the other projects.

To get the files that need to be bundled with the installer, I copy the files that I need from the project bin folders to a folder in the WiX project named “files”.  This folder is not part of the project or the solution and is not in source control.  I started out with a prebuild event of the WIX project that did the following:

  1. Delete the files folder. I just assume that everything in the folder is obsolete
  2. Robocopy the deployable files from a WPF project to the files folder.
  3. Robocopy an ASP.Net MVC 4 project to the filles folder
  4. Run ctt.exe ([Config Transformation Tool](http://ctt.codeplex.com/)) to clean up the web.config file and set some default values.
  5. Run the [WiX Harvest tool, heat.exe](http://wixtoolset.org/documentation/manual/v3/overview/heat.html), to generate a [.wxi](http://wixtoolset.org/documentation/manual/v3/overview/files.html) include file of all of the files in the files folder.

Using robocopy makes it easy to just the files that you want and not include the files that are not needed for deployment.
