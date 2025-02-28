---
title: FinalBuilder to the rescue (again)
date: 2007-02-23T20:05:00-05:00
---
One of our applications has an installer that is created with [Wise InstallBuilder 9](http://www.wise.com/).  The application is built from our shiny buildbox under the control of [FinalBuilder](http://www.finalbuilder.com/finalbuilder.aspx).  When FinalBuilder builds the application, it does everything locally on that box.  With one exception, the installer.  The installer script file resides on another box, and our QA department uses the same installer to test various versions of the installer.

To keep our builds separate from QA&#8217;s builds, I have FinalBuilder set to call the Wise compiler with a variables file.  That file is created each time FinalBuilder runs and it defines the version number, the name of the setup.exe and where the setup is created.  By sharing the installer source script with QA, we ensure that our test builds match their final layout.

Which was all good until QA edited that file on a machine that has Wise installed to a non-default location.   For some inane reason, Wise stores the location of the their runtime files in the script file.  When you open that file with the runtime in a different location, Wise throws up a dialog and prompts you to save the correct value in the file.

We have been invoking FinalBuilder from a script and that prevents the Wise dialog from being displayed.  So the build script hangs at that point.  The only way to get control back is to kill the wise32.exe process.  Why does Wise need to store a hard coded path in a script file when it already knows the location of the path?

That&#8217;s annoying.  However, using FinalBuilder makes problems like this trivial to fix.  I added a Copy File action to the FinalBuilder build script to copy the install script to a second file.  That would allow us to pick up any changes that QA makes to the script.  I then added a Text Replace action that did a search and replace on &#8220;D:\PROGRA~1\WISEIN~1&#8221; with &#8220;C:\Program Files\Wise Installation System&#8221;.  And our builds are back in business.

<div>
  Tech Tags: <a href="http://technorati.com/tag/Wise" rel="tag">Wise</a> <a href="http://technorati.com/tag/InstallBuilder" rel="tag">InstallBuilder</a> <a href="http://technorati.com/tag/FinalBuilder" rel="tag">FinalBuilder</a> <a href="http://technorati.com/tag/Automated+Builds" rel="tag">Automated+Builds</a>
</div>
