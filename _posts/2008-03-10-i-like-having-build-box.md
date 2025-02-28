---
title: I like having a build box
date: 2008-03-10T17:32:00-05:00
---
This morning I came across a blog by Landon Dyer called [Dadhacker](http://www.dadhacker.com/blog/ "DadHacker: Instant wisdom about any random thing I feel like.").  He got linked by BoingBoing for a entertaining post that he wrote about working on [the Donkey Kong cartridge for Atari](http://www.boingboing.net/2008/03/09/insiders-story-about.html "Insider's story about Atari").  I started reading his other posts and it turns out that I agree with nearly all of his opinions.  Except for build boxes. He [wrote](http://www.dadhacker.com/blog/wp-trackback.php?p=849 "DadHacker: Musings"):

> The best thing you can do for your productivity when you’re tempted to set up that spare machine to do extra work for you is to ditch the thing.

If you are the person only using that build machine, I can see that point.  Almost.  I would argue that it&#8217;s worth the time to have a 2nd machine in case the first one goes to the land whre DOS is eternally blessed.  For a team of programmers, having a dedicated build box is a must have feature.  No more guessing which program set which option to build which executable, they always get built the same way.  Plus it offloads the build process processing from your development environment and that is always a good thing.

The other advantage to having a dedicated build box is that you have have it do everything.  We use [FinalBuilder](http://www.finalbuilder.com/finalbuilder.aspx) and it&#8217;s the kitchen sink of automated build tools.  We build about a half dozen or so shrink wrap ready applications on our build box and they all pretty much follow the same pattern:

  1. Get the latest code from source control
  2. Read an .ini to get the version number and other test resources, the build tool will bake the version number into the compiler and install builder.
  3. Compile the application
  4. Collect all of the bits and put them in a folder for the install builder
  5. Authenticode anything remotely executable that we compiled
  6. Create the installer from all bits that were compiled in the last step and add the necessary required bits ([CaptiveX](http://www.mrbunny.com/) controls, Assemblies, help files, etc).
  7. Copy the installer to a deployment folder for QA to test
  8. Send an email to QA and other interested parties that a new build was available and include a change list in the email.

There are other minor tasks that get performed, but that&#8217;s the gist of it.  And it works for for Delphi Win32 and .NET assemblies, with error handling.  The time our department saves that level of build automation clearly outweighs the the maintenance time on the build box.
