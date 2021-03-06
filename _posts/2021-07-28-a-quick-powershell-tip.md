---
title: A quick PowerShell tip
date: 2021-07-28T15:19:08-05:00
excerpt: Simple tip for adding your own memory aid to your PowerShell profile.
categories:
  - PowerShell
tags:
  - Powershell
  - tips
---
I have a bunch of PowerShell functions that I stick in my $profile file. Simple stuff, things to make my day to day development work easier. With my sieve-like memory, I need a quick way to see the functions. So I wrote a script named &#8220;mine.ps1&#8221; and it&#8217;s basically a tiny help file. It has stuff like this

{% highlight powershell %}
write-host Commands -ForegroundColor White
write-host "get-guid-clipboard" -ForegroundColor Yellow
write-host "set-alias lsd get-by-date" -ForegroundColor Yellow
write-host "Set-Alias touch Set-FileTime" -ForegroundColor Yellow
{% endhighlight %}

In my $profile, I define those functions. They could (and should) be in a separate file, but I&#8217;m lazy. This is part of my PowerShell profile:

{% highlight powershell %}
function Set-FileTime{
    param(
      [string[]]$paths,
      [bool]$only_modification = $false,
      [bool]$only_access = $false
    )
  
    begin {
      function updateFileSystemInfo([System.IO.FileSystemInfo]$fsInfo) {
        $datetime = get-date
        if ( $only_access )
        {
           $fsInfo.LastAccessTime = $datetime
        }
        elseif ( $only_modification )
        {
           $fsInfo.LastWriteTime = $datetime
        }
        else
        {
           $fsInfo.CreationTime = $datetime
           $fsInfo.LastWriteTime = $datetime
           $fsInfo.LastAccessTime = $datetime
         }
      }
     
      function touchExistingFile($arg) {
        if ($arg -is [System.IO.FileSystemInfo]) {
          updateFileSystemInfo($arg)
        }
        else {
          $resolvedPaths = resolve-path $arg
          foreach ($rpath in $resolvedPaths) {
            if (test-path -type Container $rpath) {
              $fsInfo = new-object System.IO.DirectoryInfo($rpath)
            }
            else {
              $fsInfo = new-object System.IO.FileInfo($rpath)
            }
            updateFileSystemInfo($fsInfo)
          }
        }
      }
     
      function touchNewFile([string]$path) {
        #$null > $path
        Set-Content -Path $path -value $null;
      }
    }
   
    process {
      if ($_) {
        if (test-path $_) {
          touchExistingFile($_)
        }
        else {
          touchNewFile($_)
        }
      }
    }
   
    end {
      if ($paths) {
        foreach ($path in $paths) {
          if (test-path $path) {
            touchExistingFile($path)
          }
          else {
            touchNewFile($path)
          }
        }
      }
    }
  }

function get-by-date {get-childitem | sort LastWriteTime }
function get-guid-clipboard { [guid]::NewGuid() | Set-Clipboard }
set-alias lsd get-by-date
Set-Alias touch Set-FileTime
Set-Alias -Name guidc -Value get-guid-clipboard -Description "Get a GUID and copy it to the clipboard"
function get-mine {. d:\\scripts\mine.ps1}
write-host "Type 'get-mine' for my local functions"
[System.Net.Dns]::GetHostByName($env:computerName).HostName.ToLower()
{% endhighlight %}

The touch functions came from the [ss64.com site](https://ss64.com/ps/syntax-touch.html). I end by displaying the current machine name. When you remote into a box of boxes, it&#8217;s good to know where you currently are. Now when I fire up a new shell, I&#8217;ll see something like this:

{% highlight powershell %}
PowerShell 7.1.3
Copyright (c) Microsoft Corporation.

https://aka.ms/powershell
Type 'help' to get help.

Type 'get-mine' for my local functions
uberbox
Loading personal and system profiles took 929ms.
{% endhighlight %}
