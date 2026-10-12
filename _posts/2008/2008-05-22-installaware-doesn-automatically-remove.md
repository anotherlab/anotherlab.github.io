---
title: 'InstallAware doesn&#8217;t automatically remove assemblies from the GAC at uninstall time'
date: 2008-05-22T15:43:00-05:00
---
I am updating the installer for one of our products to check for the presence of the SP1 version of the .NET 2.0 Framework, when I noticed something odd.  The assemblies that I was putting into the GAC were still there after an uninstall.  The guys at [InstallAware](http://www.installaware.com/) seem to think that this is not a problem.  They refer to a topic in the MSDN, [Removal of Assemblies from the Global Assembly Cache](http://msdn.microsoft.com/en-us/library/aa371192.aspx), which describes how the Windows Installer is not responsible for the removal of entries in the GAC:

> The Windows Installer determines whether to allow the removal of a common language runtime assembly based upon a client list it keeps independently of the assembly. The Windows Installer keeps one pin bit to represent Windows Installer clients of the assembly. The installer pins the assembly for the first Windows Installer client and unpins it when the last Windows Installer client is removed. The assembly maintains a pin bit for every client of an assembly.
> 
> The Windows Installer is not directly responsible for the physical removal of common language runtime assemblies from the computer. The installer unpins the assembly when the last Windows Installer client is removed. If the Windows Installer is the last client of the assembly, the common language runtime provides the option to force a synchronous cleanup of the assembly. The cleanup process is atomic and there is no provision for a &#8220;rollback&#8221; at this point. All unpinning of common language runtime assemblies must occur after the user has had a chance to cancel the installation or removal.

That being said, the users want to uninstall everything.  Wise and InstallShield apparently do this.  With InstallShield, there is a property for the installed file called &#8220;Permanent&#8221;.  If it&#8217;s not set, it will be removed from the GAC if there are no other references to the assembly. 

What InstallAware wants you to do is to explicitly remove the assembly during the uninstall portion of the install script.  They provide a command named &#8220;Remove Unpinned Assemblies&#8221; (it&#8217;s listed as &#8220;Remove Assemblies&#8221;).  This command will remove all unpinned assemblies that your installer had places into the GAC.  The code should look like this:  

<pre>Apply Uninstall (get result into variable SUCCESS)<br />  Remove Unpinned Assemblies</pre>





I&#8217;m still not sure if that will always work.  According to InstallAware, there is a bug in Windows Installer where sometimes the installer corrupts the Global Registry cache on .NET 2.0 assembles and there will always be a reference to unreferenced assembly.  The only work around is to delete the (Default) registry key for the assembly in the user and local machine hives.  This mess is documented [here](http://www.installaware.com/forums/viewtopic.php?t=2589 "InstallAware :: View topic - Using Remove Assemblies") in the InstallAware support forum.



The work around sounds worse than the problem.  I&#8217;m not going to do a strafing run on the registry to deal with a Windows Installer bug.  Not when the only consequence is that a few assemblies (in my case, it&#8217;s only a few) get left in the GAC.  There are other ways of removing assemblies from the GAC.  The [gacutil.exe](http://msdn.microsoft.com/en-us/library/ex0ss12c(VS.80).aspx) utility can be used to check the reference count and to remove the assembly,  The &#8220;/lr&#8221; command line parameter will list the reference counts for each assembly.  The &#8220;/u&#8221; parameter will remove an assenbly from the GAC.  For the command-line shy, the free tool [GacView](http://www.nirsoft.net/dot_net_tools/gac_viewer.html "GACView v1.11 - Global Assembly Cache (GAC) Viewer") provides an Explorer like view of the GAC and it&#8217;s easy to use to remove assemblies from the GAC.
