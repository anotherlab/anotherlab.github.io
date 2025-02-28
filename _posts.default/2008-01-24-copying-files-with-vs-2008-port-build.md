---
id: 208
title: 'Copying files with VS 2008&#8217;s port-build event under Vista'
date: 2008-01-24T06:32:00-05:00
layout: post
guid: http://www.rajapet.com/?p=208
permalink: /2008/01/24/copying-files-with-vs-2008-port-build/
---
I&#8217;m still working on my [SmugMug](http://www.smugmug.com/) plugin for [Windows Live Writer](http://windowslivewriter.spaces.live.com/). I&#8217;ve ported it from VS 2005 to VS 2008, that was trivial. I&#8217;m at the point where I want to debug the plugin while it&#8217;s being loaded from Live Writer. Normally, this is pretty straight forward. You use the [post-build event](http://msdn2.microsoft.com/en-us/library/e2s2128d.aspx) to copy the plugin&#8217;s files to the Live Writer plugin folder. For my plugin, I used the following build event:

xcopy /D /R /Y &#8220;$(TargetDir)s*.dll&#8221; &#8220;C:\Program Files\Windows Live\Writer\Plugins&#8221;

The next step is to go into the Debug settings for the project and set the **Start Action** to **Start external program**, setting it to the path to the Live writer executable. On my machine, that would be:

C:\Program Files\Windows Live\Writer\WindowsLiveWriter.exe

With that set, all I need to do is to press F5 and my plugin gets built, copied to the Live Writer plugin folder, then Live Writer gets launched. Sounds good, but when I did a test build to verify the files would get copied, I got the following error message:

&#8220;XCOPY /D /Y /R &#8220;C:\dev\DotNet\LiveWriter\SmugMug4WindowsLiveWiter\SmugMug4WLW\bin\Debug\s*.dll&#8221; &#8220;C:\Program Files\Windows Live\Writer\Plugins\&#8221;  
&#8221; exited with code 4. SmugMug4WLWPlugin

Code 4? I had to get Mr Peabody to look [that one](http://www.easydos.com/xcopy.html) up for me. DOS 3.2 ring a bell? At any rate, exit code 4 for xcopy is &#8220;Initialization error (not enough memory, invalid syntax, path not found)&#8221;. That actually was a clue to what the problem was, I was just missing the obvious. I tried pasting that xcopy command into a [Take Command](http://www.jpsoft.com/tcmddes.htm) shell window and it ran without errors. So the syntax was correct, something was blocking it.

D&#8217;oh! I&#8217;m doing this under Vista. Joe User can&#8217;t just copy files into &#8220;program files&#8221; space, that&#8217;s no longer allowed. Only administrators have write access to &#8220;program files&#8221; and I&#8217;m running VS2008 without elevation. I run my Take Command shell as admin, so of course it can write to the plugins folder.

To get around this, I decided to punch a hole through Vista&#8217;s default rights for that folder and give everyone and their dog full access to it. I tried doing it through [icacl](http://en.wikipedia.org/wiki/Management_features_new_to_Windows_Vista#Command-line_tools), but I wasn&#8217;t getting the syntax right. So I just opened up explorer, selected the plugins folder, right-clicked and selected &#8220;Properties&#8221;. I then selected the &#8220;Security&#8221; tab and then selected Users under &#8220;Group or user name&#8221;. Next, I clicked the edit button, to bring up the edit dialog for the access rights. I selected &#8220;Full Control&#8221; and then clicked &#8220;Ok&#8221; all the way home.

That fixed it. VS2008 was able xcopy my plugin without any errors. 

<div>
  Tech Tags: <a href="http://technorati.com/tag/vs2008" rel="tag">vs2008</a> <a href="http://technorati.com/tag/post+build+event" rel="tag">post+build+event</a> <a href="http://technorati.com/tag/Code+4" rel="tag">Code+4</a> <a href="http://technorati.com/tag/xcopy" rel="tag">xcopy</a> <a href="http://technorati.com/tag/Vista" rel="tag">Vista</a> <a href="http://technorati.com/tag/icacls" rel="tag">icacls</a>
</div>