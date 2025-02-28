---
title: Using PowerShell to set the Num Lock state
date: 2020-07-06T08:36:18-05:00
excerpt: 'A quick PowerShell script for setting the Num Lock state '
image: http://rajapet.com/wp-content/uploads/2020/07/keyboard_mono.jpg
categories:
  - Annoyances
  - PowerShell
tags:
  - POSH
  - RDP
---
During these work from home times, on the [darkest timeline](https://tenor.com/EpSG.gif), I spent a lot of my day using my work PC over an RDP connection. For some reason, every time I connected, the Num Lock status would be set to off. Which is silly and annoying. 

When you are connected to a remote machine and you press the Num Lock key on your keyboard, it toggles the Num Lock state for both the client and guest machine. Which can get confusing if you are working with apps on both machines and the Num Lock state is different between the machines. Ideally, you want the Num Lock state to be the same on both machines.

For me, the preference was a command-line <span style="font-size: inherit;">option for setting Num Lock. My shell of choice on Windows is </span><a style="font-size: inherit;" href="https://docs.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7">PowerShell</a><span style="font-size: inherit;">, so I decided to write a PowerShell script to set the Num Lock Status. The Num Lock key is a toggle switch, press once to turn on, press again to turn off. The script needed to be able to check the current state to be able to set a specified state correctly.</span>

With a little trial and error, I came up with the following script. I put it on gist to make it easier to grab and make your own:

{% gist 863fc3f60379c29b2ebb8478859754c8 %}


I put the comments inline, it should be pretty self-explanatory with the comments. While PowerShell is supported on macOS and Linux now, this is a Windows only script. The `[console]::NumberLock`{:.powershell} expression returns the following error message:

{% highlight plaintext %}
OperationStopped: Operation is not supported on this platform.
{% endhighlight %}

Which is odd, `[console]` is a shortcut for [[system.console](https://docs.microsoft.com/en-us/dotnet/api/system.console?view=netcore-3.1)], a class that is accessible on the macOS Powershell. If you run the following command in a PowerShell on either Windows or macOS, you&#8217;ll get a list of static properties that should be readable from a POSH script.

{% highlight powershell %}
[system.console] | Get-Member -Static -MemberType property | Format-Table 
{% endhighlight %}

And the NumberLock property is listed, but just not implemented. And that&#8217;s not even the real sticking point. This script creates an instance of a WScript object and uses it&#8217;s SendKeys method to pass in a Num Lock key press. WScript is the [Windows Script Host](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/wscript), a technology that lets scripting languages make Windows API calls. A minor sticking point, I only need this Windows. You can get a list of the special keys that SendKeys can send from [here](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.sendkeys.send?view=netcore-3.1).

That&#8217;s the heavy lifting. Because I am lazy, I don&#8217;t want to type in the name of the script. So I created an alias for it.

{% highlight powershell %}
Set-Alias nl d:\scripts\num-lock.ps1
{% endhighlight %}

Now I can just run &#8220;nl&#8221; or &#8220;nl On&#8221; or &#8220;nl Off&#8221; to change the Num Lock state. I added the alias to the profile so it&#8217;s always available. Now when I connect to my work PC, I run &#8220;nl&#8221; and all is well.
