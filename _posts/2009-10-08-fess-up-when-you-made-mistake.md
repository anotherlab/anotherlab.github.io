---
title: Fess up when you made a mistake
date: 2009-10-08T02:43:00-05:00
---
I was working on a installer project for a new tool that we will be releasing this fall when I hit the most odd error.  Right after the installer started up, it would bomb out with an error message that the some files that it need were missing.  And it only happened when I called a command line app that I wrote from within the installer.  If I commented out the code that executed that app, the installer ran as expected.

Ok, so your first thought would be what is that command line app doing?  It wasn’t my first thought.  It was tested code and it worked just fine in some other installer projects.  That was a rookie mistake and I should have known better.  The app does a few things.  It was designed to cache the settings of an installed app and restore so that if you do an upgrade in place, the settings are migrated from the old version to the new version.  Plus it has code to clean up extra files left around from previous installers.

After beating my head against the wall for day on it, I contacted the technical support for the installer.  They asked for a sample project and I sent one in.  While I was waiting for a response back tech support, I continued to play around with the installer.  This tool ([InstallAware](http://www.installaware.com/)) has been rock solid for me since I started using it, it had to be something that I was doing wrong.

I looked at source code for my command line app and sure enough, under the right conditions, it would delete the files that the installer was using to install the actual app.  That wasn’t good.

Actually it _was_ good, the mistake was in my code which meant I could fix it.  Which I did and my installer did what it was supposed to do.  I would rather fix my own bugs than be dependent on another vendor fixing their bugs.  I had switched from Wise For Windows to InstallAware because it forever to get fixes from Wise.  They released a new build about once a year.  if they didn’t fix the bug and you didn’t have a work around, then that bug became a feature.

Meanwhile, I still had an open support case with InstallAware.  I immediately logged into their support site and I closed out the support request.  I added a brief note explaining that this was self-inflicted and explained why my code was turning in on itself.  A short while later I received a brief note from one of their support engineers thanking me for the explanation.

I think the courtesy message to tech support is the right thing to do.  First of all it’s just common courtesy, it’s wrong to waste their time tracking down your bug after you have resolved it on your own.  Plus it’s going to help me if I need support from this company again.  If they had spent time tracking down a problem that was caused by my own carelessness, they would be less likely to help out with a legitimate support request.
