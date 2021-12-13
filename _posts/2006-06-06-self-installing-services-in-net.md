---
id: 303
title: Self installing services in .NET
date: 2006-06-06T21:01:00-05:00
layout: post
guid: http://www.rajapet.com/?p=303
permalink: /2006/06/06/self-installing-services-in-net/
---
I have some service applications that I deploy with [Wise for Windows](http://www.wise.com/wfwi.asp). These particular services are .NET [assemblies](http://www.codeguru.com/columns/csharp_learning/article.php/c5845/). The usual way of registering the .NET assembly as a service is to use the [installutil.exe](http://msdn2.microsoft.com/en-us/library/50614e95.aspx) that comes with the .NET Framework. Wise made it easy to register the assemblies by adding a checkbox in the file properties for self installation. Behind the scenes, Wise must be calling installutil, because it fails when you have multiple versions of the .NET Framework installed. Installutil is not compatible across Frameworks. You can’t install a 1.1 assembly with the 2.0 installutil, and vice versa.

Wise does not let you specify which version of the Framework is being used by a particuliar assembly. It should be able to tell through Reflection, but it doesn’t. This means I can’t specify the correct installutil to use for my services. This is not good and causes my install projects to go down in [flames](http://www.suburbanchicagonews.com/photos/nascar/labonte/images/t400_seq_1.jpg). I really can’t wait for Wise to fix this.

I could call installutil directly, but that means putting all sorts of [fugly](http://www.urbandictionary.com/define.php?term=fugly) code into the install project to correctly locate the appropriate version of installutil. And that code would probably break the minute Microsoft updates the .NET Framework. So we move to Plan B, self-installing services. You would think that this would be a simple walk through the MSDN garden, but their code examples assume that that task is being handled manually via installutil or through a Windows Installer project.

After a bit of Googling, I found a reference to an [undocumented](http://www.flickr.com/photos/raffaella/101466262/) method call, [InstallHelper](http://msdn2.microsoft.com/en-US/library/system.configuration.install.managedinstallerclass.installhelper.aspx), in the [System.Configuration.Install.ManagedInstallerClass](http://msdn2.microsoft.com/en-US/library/system.configuration.install.managedinstallerclass.aspx) class. By using this method, I can install or uninstall the service from the command line. 

I augmented the Main() function in the service class to look like this:



<div>
  <p>
    <span>static</span> <span>void</span> Main(<span>string</span>[] args)
  </p>
  
  <p>
    {
  </p>
  
  <p>
    <span>if</span> (args.Length > 0)
  </p>
  
  <p>
    {
  </p>
  
  <p>
    <span>if</span> (args[0] == <span>&#8220;/i&#8221;</span>)
  </p>
  
  <p>
    {
  </p>
  
  <p>
    System.Configuration.Install.<span>ManagedInstallerClass</span>.InstallHelper(<span>new</span> <span>string</span>[] { <span>Assembly</span>.GetExecutingAssembly().Location });
  </p>
  
  <p>
    }
  </p>
  
  <p>
    <span>else</span> <span>if</span> (args[0] == <span>&#8220;/u&#8221;</span>)
  </p>
  
  <p>
    {
  </p>
  
  <p>
    System.Configuration.Install.<span>ManagedInstallerClass</span>.InstallHelper(<span>new</span> <span>string</span>[] { <span>&#8220;/u&#8221;</span>, <span>Assembly</span>.GetExecutingAssembly().Location });
  </p>
  
  <p>
    }
  </p>
  
  <p>
    <span>else</span> <span>if</span> (args[0] == <span>&#8220;/d&#8221;</span>)
  </p>
  
  <p>
    {
  </p>
  
  <p>
    <span>CollectorService</span> MyService = <span>new</span> <span>CollectorService</span>();
  </p>
  
  <p>
    MyService.OnStart(<span>null</span>);
  </p>
  
  <p>
    System.Threading.<span>Thread</span>.Sleep(System.Threading.<span>Timeout</span>.Infinite);
  </p>
  
  <p>
    }
  </p>
  
  <p>
    }
  </p>
  
  <p>
    <span>else</span>
  </p>
  
  <p>
    {
  </p>
  
  <p>
    System.ServiceProcess.<span>ServiceBase</span>[] ServicesToRun;
  </p></p> 
  
  <p>
    ServicesToRun = <span>new</span> System.ServiceProcess.<span>ServiceBase</span>[] { <span>new</span> <span>CollectorService</span>() };
  </p></p> 
  
  <p>
    System.ServiceProcess.<span>ServiceBase</span>.Run(ServicesToRun);
  </p>
  
  <p>
    }
  </p>
  
  <p>
    }
  </p>
</div>



The “/d” part hasn’t been tested yet. That should allow me to debug the service as an application from within the Visual Studio IDE. As much as I dislike having to use an undocumented class, I’m not going to lose any sleep over it. Microsoft obsoleted documented functions going from Visual Studio 2003 to 2005, I’m not going to worry about one method.

[Edited on 6/8/06]  
I updated the block of code for the &#8220;/d&#8221; part. I needed a timeout to keep the service running, otherwise it just runs through the startup and then exits. You can make it fancier, I just use that code for testing from within the IDE and I can break out of the service when I am done testing it. 

[Edited on 7/20/06]  
After a few go arounds with Wise Technical Support, I sent them a sample installer project that easily duplicate this bug and they did confirm that it was a problem with their current product. There is also a similiar problem where you can&#8217;t install .NET 1.1 services under similiar circumstances. Their fix for my problem will fix the .NET 1.1 service problem too. According to the email that I had received, this is tentatively scheduled for the next release. That would probably be the version 7.0 release. In the meantime, I&#8217;ll stick with my work around.

[Edited on 1/27/08]  
The MyService object in the above code is an instance of a System.ServiceProcess.ServiceBase descendant class that I created in my code.  The descendant class opens up access to the protecteded OnStart() method.  I had created a descendant to ServiceBase and had assumed that was the standard pattern.  I should have been more clear about that part.  This is one of the many reasons why I abandoned Wise for InstallAware.

<div>
  Tech Tags: <a href="http://technorati.com/tag/Wise+For+Windows" rel="tag">Wise For Windows</a> <a href="http://technorati.com/tag/InstallUtil.exe" rel="tag">InstallUtil.exe</a> <a href="http://technorati.com/tag/InstallHelper" rel="tag">InstallHelper</a> <a href="http://technorati.com/tag/ManagedInstallerClass" rel="tag">ManagedInstallerClass</a> <a href="http://technorati.com/tag/C#" rel="tag">C#</a> <a href="http://technorati.com/tag/Visual+Studio+2005" rel="tag">Visual Studio 2005</a>
</div>