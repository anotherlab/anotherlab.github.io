---
id: 57
title: How to shoot yourself in the foot writing installer upgrades
date: 2010-08-10T21:23:00-05:00
layout: post
guid: http://www.rajapet.com/?p=57
permalink: /2010/08/10/how-to-shoot-yourself-in-foot-writing/
---
I’m in the middle of a development cycle for one of our products, when QA logged an unexpected bug.  When you upgraded an existing version of the product to the new one, only some of the settings were being saved.  This was a new bug, something I did recently broke the installer.

A little background on the product.  It’s a set of data collection services that allow our [Onscreen](http://www.versatrans.com/products/versatrans_onscreen.cfm) product to work with various 3rd party GPS vendors.  I have a generic collection service, plus a handful of services for vendors that can’t work with the generic service. Each collector is a service written with in C# for the .NET Framework.  Most of the settings for each collector are stored in the service’s [app.config](http://msdn.microsoft.com/en-us/magazine/cc163812.aspx) file.

I have written the installer so that it does a full install each time.  If it detects a previous version of the product, it caches the service status (running, disabled, etc) and the app.config file for each service.  It puts the cached files in a temp folder that will get purged at the end of the installation. Then it does a silent uninstall of the previous version and installs the new version.

After the files for the new version have been installed, the installer restores the service status for each collector service and retrieve the cached settings.  I don’t copy the old file over the new, I just retrieve a set of settings and update the default values in the new app.config with the cached values from the previous one.  You don’t want to blindly copy over the app.config, you would wipe out new or changed settings that are required for the new version.

I wrote a simple command line app that gets called by the installer.  it reads the new app.config, the cached copy, and a set of rules in XML format.  For each new file, it looks for the same file in the temp folder created by the installer.  It then does a [XPath](http://en.wikipedia.org/wiki/XPath) search and replace for each rule.  The rules are a little flexible.  It can be directed to replace the default with the cached copy or replace it with a new default value.

When I need to do some file manipulation, I usually write a small command line app instead of trying to have the installer code try to do it.  There’s a couple of reasons for this.  By using a separate app, I get to code and test the file manipulation outside of the installer environment.  Having an installer locate and enumerate a set of files, and then update them based on the contents of others would be a difficult to write and maintain.

Getting back to bug at hand, the installer installs five services by default.  Three of them were getting their settings persisted across upgrades, two were not.  That threw me, for this type of activity usually everything works or everything breaks.  I spent some time tracing through the code, which is always fun with an installer.  I ended up spending quality time with a [VM](http://en.wikipedia.org/wiki/Virtual_machine) of Server 2008 and had my command line app write detailed information to the Windows Event Log.  Crude, but effective.

As it turns out, I created the problem at the start of this development cycle.  I had renamed the executables as part of a rebranding exercise.  When the the code when to locate the cached copy of the service, the new name didn’t match the cached name.   Yes sir, I had shot myself in the foot with a device of my own making.  

I had to tweak my command line app a bit.  As it processed each app.config file, I added a some additional code so that it would make two attempts to load the cached copy.  First attempt would by the current name.  If that fails, it then uses the previous file name.  After that,we were back in business.