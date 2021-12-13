---
id: 3221
title: Add a POSH ADB to your Windows Terminal
date: 2020-05-15T08:35:19-05:00
author: Chris Miller
layout: post
guid: http://rajapet.com/?p=3221
permalink: /2020/05/15/add-a-posh-adb-to-your-windows-terminal/
categories:
  - ADB
  - Android
  - PowerShell
---
[Windows Terminal](https://www.microsoft.com/en-us/p/windows-terminal-preview/9n0dx20hk701?activetab=pivot:overviewtab) is [so close](https://devblogs.microsoft.com/commandline/windows-terminal-preview-v0-11-release/) to being out of beta. It&#8217;s been my default CLI on Windows for about a year. I still don&#8217;t think in PowerShell, but I try to use PowerShell as my default shell. I just love how you can configure Terminal.

The default shell for me is PowerShell <s>Core</s>, aka [Powershell 7.0](https://devblogs.microsoft.com/powershell/announcing-powershell-7-0/). Out of the box, it doesn&#8217;t have [ADB](https://developer.android.com/studio/command-line/adb) on the path. When I&#8217;m doing Android stuff, I want the ADB. But I don&#8217;t want it to be on the path by default. Just like Visual Studio has the &#8220;Android ADB Command Prompt&#8221; menu option, I wanted to add shell option to Terminals so I can spin up a new PowerShell, but with ADB support. This is what I ended up with:

<figure class="wp-block-image size-large">

<img src="https://i1.wp.com/photos.smugmug.com/Blog/n-zwT5d/2020/i-VkJnhDq/0/f4461e23/L/shellabd-L.png?w=680&#038;ssl=1" alt="" data-recalc-dims="1" /> <figcaption>PowerShell with ADB goodness.</figcaption></figure> 

The first thing I did was to create a PowerShell script that just adds the ADB tooling to the path. My first attempt was:

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: powershell; title: ; notranslate" title="">
$NeedsAdb = $true

foreach ($p in $env:Path.Split(";"))
{
    if ($p -match "android-sdk\\platform")
    {
        $NeedsAdb = $false
        break
    }
}

if ($NeedsAdb)
{
    write-host "Adding Android SDK Platform tools to path"
    $env:Path += ";C:\Program Files (x86)\Android\android-sdk\platform-tools"
}

</pre>
</div>

It walks through the path and checks to see the folder with the ADB bits is already there.&nbsp; If not, it gets added. That worked but seemed like a lot. I did a quick refactor and got it down to this

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: powershell; title: ; notranslate" title="">
$NeedsAdb = $true

$env:Path.Split(";") | ForEach-Object {
    if ($_ -match "android-sdk\\platform") {
        $NeedsAdb = $false
        break
    }
}

if ($NeedsAdb) {
    write-host "Adding Android SDK Platform tools to path"
    $env:Path += ";C:\Program Files (x86)\Android\android-sdk\platform-tools"
}

</pre>
</div>

A little cleaner, but still too much.&nbsp; I was taking the path, splitting it up into an array of strings, and then testing each string.&nbsp; But wait, the path is a string.&nbsp; That made it simpler.&nbsp; Instead of doing a string match on each folder the path, I can make one string match against the whole thing.

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: powershell; title: ; notranslate" title="">
if ($env:Path -NotMatch "Android\\android-sdk\\platform")
{
    write-host "Adding Android SDK Platform tools to path"
    $env:Path += ";${env:ProgramFiles(x86)}\Android\android-sdk\platform-tools"
}

</pre>
</div>

So I called that one add-adb.ps1 and saved it to a common folder that I put scripts in.  Next, I wanted a cosmetic tweak so that I knew which shell has the power of ADB.  I went to [materialdesignicons.com](http://materialdesignicons.com/) and did a search on &#8220;Android&#8221;.  I found an icon named &#8220;android-debug-bridge&#8221;, which was perfect.  I downloaded the .svg version of the icon and then made a .png file out of it with PhotoShop.  I named it android-debug-bridge.png.  Then I made a smaller version to be the icon. You can grab the images and the .ps1 file from the following Gist link: <https://gist.github.com/anotherlab/364e3805d9ea56b574b394127acc9aa6>

Now that I had the script and the images, it&#8217;s time to add a new shell profile.  From within Windows Terminal, select &#8220;Settings&#8221; from the drop-down menu.  You can also press the CTRL+, shortcut.  This will load the settings.json file in the text editor of your choice.  I have Visual Studio Code registered as the default app for JSON files.  You can use a lesser editor, but that&#8217;s on you.

There will be an array of objects named &#8220;list&#8221;.  These objects are the different shells that can be run from within Windows Terminals.  I added the following item to the list array

 

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: jscript; title: ; notranslate" title="">
"list":
&#91;
    {
        "guid": "{50caca3f-bff1-4891-b7f7-e3a05c040003}",
        "fontFace":  "Cascadia Code PL",
        "backgroundImage": "d:/grfx/android-debug-bridge.png",
        "backgroundImageStretchMode": "uniform",
        "backgroundImageOpacity": 0.15,
        "hidden": false,
        "name": "ADB PowerShell",
        "icon": "d:/grfx/adb-32.png",
        "commandline": "pwsh.exe -noe -c D:/scripts/add-adb.ps1"
    },
]
</pre>
</div>

Let&#8217;s go over this line by line.<figure class="wp-block-table">

| Field                                                                                                                                                     | Value                                                                                                                                                        |
| --------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| guid                                                                                                                                                      | It wants a GUID, so just get one.&nbsp; I used [guidgenerator.com](https://www.guidgenerator.com/), but any GUID generator will do.                          |
| fontFace                                                                                                                                                  | I&#8217;m using the Powerline version of Cascadia.&nbsp; More on that in a bit                                                                               |
| backgroundImage                                                                                                                                           | Grab it from my [Gist](https://gist.github.com/anotherlab/364e3805d9ea56b574b394127acc9aa6#file-android-debug-bridge-png) or use your own.                   |
| backgroundImageStretchMode <span style="background-color: rgba(30, 30, 30, 0.2); font-family: inherit; font-size: inherit; font-weight: inherit;"></span> | Size the image to fit the Shell window                                                                                                                       |
| backgroundImageOpacity                                                                                                                                    | I set it to be mostly transparent                                                                                                                            |
| hidden                                                                                                                                                    | If you want to hide this from the list of shells, just set it to True                                                                                        |
| name                                                                                                                                                      | Call it what you want                                                                                                                                        |
| icon                                                                                                                                                      | The tab icon is optional, but you can grab it from my [Gist](https://gist.github.com/anotherlab/364e3805d9ea56b574b394127acc9aa6#file-adb-32-png).           |
| commandline                                                                                                                                               | This is what gets launched. The &#8220;-c&#8221; option says to run the next parameter and the &#8220;-noe&#8221; says not to exit after running the command |</figure> 

And that lets me spin up a new PowerShell with ADB on the path.&nbsp; Mixing PowerShell with ADB makes it easier to do ADB commands that would normally be clunky.&nbsp; For example, I want to test some Android code that would access the photo gallery.&nbsp; When you new up a new Android emulator, there are no images.&nbsp; &nbsp;ADB lets copy files to the emulator&#8217;s filesystem, but it doesn&#8217;t do wild cards. 

You may have notice the &#8220;/&#8221; slash being used instead of &#8220;\&#8221; for file paths. Windows Terminal lets you use the &#8220;/&#8221; as the directory separator and this avoids having to use &#8220;\\&#8221; to get a single &#8220;\&#8221; in.

I have a folder with a bunch of images that I wanted to copy to an Android Emulator image.&nbsp; I then run the following command from PowerShell:

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: powershell; title: ; notranslate" title="">
Get-ChildItem .\*  -Include *.jpg,*.png | Foreach-Object {adb push $_.Name /sdcard/Pictures}
</pre>
</div>

Get-ChildItem gets a directory listing and I use the -Include parameter to only include the files that have the .jpg and .png extension. If I didn&#8217;t need to filter the files list, I could the aliases for Get-ChildItem of gci or ls. I then pipe the results into Foreach-Object. This will execute everything in the {} block for each item. $_.Name is the name of the file and that gets passed to adb push to copy that file to /sdcard/Pictures in the emulator. There&#8217;s a bit of typing, but it does save time when trying to copy a set of files over to Android.

About that &#8220;Cascadia Code PL&#8221; font face.&nbsp; I&#8217;m running a theming engine inside PowerShell called &#8220;Oh-my-posh&#8221;.&nbsp; I&#8217;ll do a longer post on it in the future, but the short story is that it makes the PowerShell prompt contain the current git status for the current folder.&nbsp; Read about it and get it [here](https://github.com/JanDeDobbeleer/oh-my-posh).&nbsp; On the Mac, I use [Oh-my-zsh](https://ohmyz.sh/) to get a souped-up zsh shell.&nbsp; Scott Hanselman did a good write up of Oh-my-posh [here](https://www.hanselman.com/blog/HowToMakeAPrettyPromptInWindowsTerminalWithPowerlineNerdFontsCascadiaCodeWSLAndOhmyposh.aspx).

Oh-my-posh uses Powerline Glyphs ([originally defined here](https://github.com/powerline/powerline)) as part of the status display.&nbsp; So you&#8217;ll need a font that includes the Powerline Glyphs.&nbsp; Microsoft&#8217;s Cascadia Code font has a version with Powerline and you can get it [here](https://github.com/microsoft/cascadia-code/releases).&nbsp; Here&#8217;s what that looked like when I was adding the files to the Gist<figure class="wp-block-image">

<img src="https://i0.wp.com/photos.smugmug.com/Blog/n-zwT5d/2020/i-6GTWwch/0/f94c4d14/M/shellposh-M.png?w=680&#038;ssl=1" alt="" data-recalc-dims="1" /> </figure> 

You can see the color and text information change as I used git to add the icon to the Gist. When working with git, it&#8217;s very handy to easily see which branch you are working with and the current status of that branch.