---
title: Using robocopy with Visual Studio 2008 Post-build events
date: 2010-05-26T19:11:00-05:00
---
I have a solution that has about 15 odd projects in it.  It’s for an application that has multiple optional services with shared assemblies.  Hence the 15 projects.  I have an installer that lets the user pick from which of the optional bits to install.  For ease of maintenance, I version the installer with multiple folders.  Each version gets a folder for the installer source and a folder for the installable bits.

With Visual Studio, the default way of building a solution is to put the compiled assemblies and dependant files inside a bin folder for each project.  Each bin folder can multiple folders for different build options (debug, release, platform, etc).  I wanted a simple way of consolidating the files from each bin folder to a common folder for the installer.

I didn’t want to set the output path, from the Build tab on the project options page.  While I could direct all of the compiled output to a single folder, that would send symbol and [vshost](http://msdn.microsoft.com/en-us/library/ms185331(VS.80).aspx) files over as well.  I didn’t want those files.  I only wanted just what I actually needed for deployment.

I decided on using the [Post-build event](http://msdn.microsoft.com/en-us/library/ke5z92ks.aspx) for each project and copy only the files that I wanted.  I had already created a “deploy” folder from the solution root folder.  So I defined a build event with the following command line:</p> 

<pre>robocopy $(TargetDir) $(SolutionDir)Deploy *.exe *.dll</pre>





If you don’t know [robocopy](http://en.wikipedia.org/wiki/Robocopy), it’s a powerful file and folder copy command line.  It’s been around for years in one [Microsoft SDK](http://www.microsoft.com/downloads/details.aspx?familyid=9d467a69-57ff-4ae7-96ee-b18c4790cffd&displaylang=en "Windows Server 2003 Resource Kit Tools") or another and has been included as part of the OS since at least Vista.  In it’s simplest form, you specify the source folder, the destination folder.  It has a slew of [options](http://ss64.com/nt/robocopy.html).



$(TargetDir) is a [macro](http://msdn.microsoft.com/en-us/library/42x5kfw4(VS.80).aspx) that represents the complete path for folder that the compiled units are created in, like bin\debug\ or bin\release\.  The $(SolutionDir) macro is the path to the solution folder.



I went to build one of the projects in the solution and it failed on the Post-build event.  Error 1, it said.  I copied the robocopy command line from the error message and ran it from a cmd prompt.  It executed without any errors and did exactly wat it was suppsoed to do.  After a little digging, I found out that robocopy returns 1 as an exit code to indicate success.  Since the dawn of time ([January 1, 1970](http://en.wikipedia.org/wiki/Unix_time)), command line programs have returned 0 for the exit code to indicate success and any other value to indicate an error.  It’s a bizarre flaw with an otherwise very useful tool.



Visual Studio 2008 does not appear to have any way of ignoring the exit code.  Well that’s [just ducky](http://en.wikipedia.org/wiki/Just_Ducky).  So what I did was to bury the exit code in an [unmarked grave](http://www.ncptt.nps.gov/identification-of-unmarked-graves/) so that Visual Studio 2008 wouldn’t be able to see or complain about it.  I created a batch file in the solution root folder and named it robopip.cmd.  Robopip has the following contents:



<pre>robocopy %1 %2 %3 %4 %5 %6 %7 %8 /R:1 /XF *vshost*<br />dir %TEMP% >nul</pre>





The first line executes the robocopy command with up to 8 parameters passed in by the build process.  The “/R:1” parameter basically says try once and then die.  The “/XF \*vshost\*” tells robocopy to ignore any file with “vshost” in the same.  The second line is crucial, it’s basically a low impact command to clear the last exit code.  We ask for the directory listing of the user’s temp folder and then toss away the results.  There is probably a more elegant way of clearing the error code, that was the first one that worked for me.



So now, I can use the following Post-event build command with each project.



<pre>$(SolutionDir)robopip $(TargetDir) $(SolutionDir)Deploy *.exe *.dll</pre>





I get the power of RoboCopy without Visual Studio squawking about the exit code.
