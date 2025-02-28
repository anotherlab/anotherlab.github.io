---
title: Checking Hypervisor status with PowerShell
date: 2017-09-03
categories:
  - Virtualization
tags:
  - HAXM
  - Hyper-V
  - Powershell
---
<div style="width: 610px" class="wp-caption alignnone">
  <img loading="lazy" class="size-medium" src="https://i2.wp.com/photos.smugmug.com/photos/i-Gg6pZTX/0/2727179c/M/i-Gg6pZTX-M.jpg?resize=600%2C368&#038;ssl=1" width="600" height="368"  />
  
  <p class="wp-caption-text">
    Image courtesy of <a href="https://www.flickr.com/photos/sergemelki/4662832317">Serge Melki</a>
  </p>
</div>

I needed to find a quick way to see which hypervisor was installed.  I bounce between different development machines and some have Hyper-V enabled and some have Intel's [HAXM driver](https://software.intel.com/en-us/android/articles/intel-hardware-accelerated-execution-manager) installed.  Both assist with virtual machines, but they can't be used together.  I used to be 100% Hyper-V with running virtual machines and Android emulators.  The Microsoft Android Emulator used to be very good, but is suffering from a fair amount of bit rot.  In the meanwhile, Google's Android Emulator has gone from being a great of sitting and watching something load very slowly to a tool that that you can use in real time.

Microsoft's Android Emulator requires Hyper-V and Google's Emulator really needs HAXM in order to have any level of performance.  Since I bound around from machine to machine (with the occasional [repave](/2017/09/01/time-to-repave-slightly-my-work-machine/)), I wanted a quick way to see which hypervisor is installed.  Hyper-V requires a some work to turn on and off. HAXM is a kernel driver.  So I wrote a quick PowerShell script to report the status of each Hypervisor

{% highlight powershell %}
$services = 'intelhaxm', 'vmicheartbeat'

$d = [System.ServiceProcess.ServiceController]::GetDevices() | ? {
  $services -contains $_.Name
}

$s = Get-Service | ? {
  $services -contains $_.Name
}

$d
$s
{% endhighlight %}

The first line just defines an array of names to match one. The next block of code uses [GetDevices()](https://msdn.microsoft.com/en-us/library/x5sy3z2a(v=vs.110).aspx) to return the status of the HAXM driver. The block that follows returns the status of the Hyper-V Heartbeat Service. The last part just dumps out the results.

An alternative way is to pass the service name to [Get-Service](https://technet.microsoft.com/en-us/library/ee176858.aspx) and it will return the status for the specified service. The problem is that it will error out if the specified service does not exist. And while that error message is a status report, it's an ugly way to get that information

I named the script &#8220;hyper-stat.ps1&#8221; and when I run it on a machine with HAXM running, I get the following output

{% highlight powershell %}
.\hyper-stat.ps1

Status   Name               DisplayName                           
------   ----               -----------                           
Running  IntelHaxm          Intel HAXM Service 
{% endhighlight %}

On a machine with Hyper-V and no HAXM, I get this

{% highlight powershell %}
.\hyperv-stat.ps1

Status   Name               DisplayName                           
------   ----               -----------                           
Running  vmicheartbeat      Hyper-V Heartbeat Service    
{% endhighlight %}

If I disable Hyper-V, I would get the following:

{% highlight powershell %}
.\hyperv-stat.ps1

Status   Name               DisplayName                           
------   ----               -----------                           
Stopped  vmicheartbeat      Hyper-V Heartbeat Service             

{% endhighlight %}

There are few ways of scripting this task. This one was simple and I have it on the machines that I use for coding.

Edit: Right after posting this, I realized it didn't actually work. I was originally reporting on the status of vmms, the Hyper-V Virtual Machine Management Service. If Hyper-V is installed, that service will always be running, even when Hyper-V is not enabled. The Hyper-V Heartbeat service is a better test for seeing if Hyper-V is enabled.
