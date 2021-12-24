---
id: 642
title: How to use Bing Code Search when ReSharper is installed
date: 2014-02-17T23:23:26-05:00
layout: post
guid: http://www.rajapet.com/?p=642
permalink: /2014/02/17/how-to-use-bing-code-search-when-resharper-is-installed/
---
Microsoft Research just released a cool add-in for Visual Studio 2013 called [Bing Code Search](http://visualstudiogallery.msdn.microsoft.com/a1166718-a2d9-4a48-a5fd-504ff4ad1b65 "Bing Code Search").  It allows you to search for code samples from with the IDE and has enough context awareness to use the variables from your code.

<img style="margin: 0px 5px 5px 0px; float: left; cursor: pointer;" onclick="window.open('https://i2.wp.com/www.rajapet.net/photos/i-t9QMwkL/0/O/i-t9QMwkL.png?resize=680%2C442', 'pop', 'toolbar=0, location=0, directories=0, status=0, menubar=0, scrollbars=0, copyhistory=0, resizable=1, width=680 , height=442 , left=0, top=0'); if((navigator.appName=='Microsoft Internet Explorer' && navigator.appVersion.substring(0,3)=='4.0')==false) pop.focus();" alt="" src="https://i2.wp.com/www.rajapet.net/photos/i-t9QMwkL/0/O/i-t9QMwkL.png?resize=680%2C442" width="680"  />  
If you have [ReSharper](http://www.jetbrains.com/resharper/) installed, the two do not play together.  You need to trigger Intellisense to get Bing Code Search to activate. ReSharper overrides the Visual Studio Intellisense for it&#8217;s additional functionality.  That prevents Bing Code Search from working.

Hopefully [Jetbrains](http://www.jetbrains.com/) will update ReSharper to work with Bing Code Search and <del>hopefully Microsoft will provide an alternate means of triggering Bing Code Search</del> just read the last paragraph of this post.  In the mean time, you can hack away around the problem by disabling ReSharper when you want to use Bing Code Search.

<del>The easiest</del> A clunky way I found to do that was to write a macro that calls the ReSharper toggle command and then bind that macro as a button on the standard tool bar.  Since originally posting this,  two comments left from JetBrains provide easier ways of doing this.

Install the [Virtual Commander](http://visualstudiogallery.msdn.microsoft.com/deda8ac1-75e6-4068-89ab-b607cee38f2d) (or [here](http://vlasovstudio.com/visual-commander/)) extension.  This tool will let you create commands and extensions.  After installing Virtual Commander and restarting Visual Studio, select &#8220;Commands&#8230;&#8221; from the VCMD menu.  In the Commands panel click the &#8220;Add&#8221; button.

This will open up the command editor window with a new command already scaffolded.  You just need to add the command that will toggle ReSharper on and off, **ReSharper_ToggleSuspended**.  The command should look something like this

<pre class="brush: vb.net">Imports EnvDTE
Imports EnvDTE80

Public Class C
    Implements VisualCommanderExt.ICommand

    Sub Run(DTE As EnvDTE80.DTE2, package As Microsoft.VisualStudio.Shell.Package) Implements VisualCommanderExt.ICommand.Run
        DTE.ExecuteCommand("ReSharper_ToggleSuspended")
    End Sub
End Class</pre>

The text that you enter in the name field will be what shows up as the caption of the button on the tool bar. You can test the command by clicking on the Run button.  You should the Resharper menu disappear from the IDE.  Press Run again to bring it back,

<p style="text-align: center;">
  <a href="https://i2.wp.com/www.rajapet.net/photos/i-9XSq458/0/O/i-9XSq458.png"><img loading="lazy" class="aligncenter" style="margin-top: 0px; margin-bottom: 5px;" alt="" src="https://i1.wp.com/www.rajapet.net/photos/i-9XSq458/0/S/i-9XSq458-S.png?resize=400%2C148" width="400" height="148"  /></a>
</p>

After saving the command, you can add it to a toolbar. I placed it on the standard toolbar, so I would know where it was at all times.  Select **Tools->Customize&#8230;**, then click the Commands tab.  You can put this button anywhere, but I placed it on the Standard menu.  Click the **Add Command&#8230;** button.  Then scroll down the Categories list and click on **VCmd**.  Select the Command you had entered, if it&#8217;s the first one then it will be Command01.  Press the **OK** button to add the command as a toolbar button, then press **Close** to close the Customize dialog.

If all went well, you will have a new button on the tool bar, with the name of the command as it&#8217;s caption.  And now you can toggle ReSharper on and off at any time.

[Edit]  
An easier alternative (thanks to [Jura](https://twitter.com/gorohoroh)) would be to bind a shortcut key to the ReSharper command.  Another suggestion would be to bind a shortcut key to Tools.LaunchSnippetSearch (thanks to [Matt](http://twitter.com/citizenmatt)) that would open snippet search pane.  Use **Tools->Options->Keyboard** to access the key bindings.