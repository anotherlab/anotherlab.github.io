---
date: 2005-11-10T16:31:00-05:00
---
Who was Microsoft kidding when they promised to end &#8220;DLL Hell&#8221;? The long dark night of the SQL Server 2005/Visual Studio .NET 2005 beta produced a series of seeming incompatible .NET frameworks. I didn&#8217;t do much beta testing with the 2005 bits, but when I did, I did so from the safe confines of various [VMWare](http://www.vmware.com/) sessions. I&#8217;m now looking at some automated build tools and one of our developers suggested MSBuild. That&#8217;s the last thing you would want, a build tool that will be dependant having the appropriate runtime installed. Plus I want something that supports more than .NET compilers, we are still building Delphi Win32 apps here as well as .NET assemblies.

On a slightly separate target, why RSS Bandit is such a resource hog? I loved the interface, but it would bring the performace of my PC to a flying stop. I just started using [Omea Reader](http://www.jetbrains.com/omea/reader/), and it plays well with others much better than RSS Bandit did.

> 
> 
> &#8230;.Microsoft promosed that DLL Hell would go away, but with the .NET Framework betas, they dropped us into the biggest DLL Hell I’ve ever seen. I can’t uninstall MSH from my system because I installed the .NET Framework 2.0, which required that I uninstall the beta versions. The MSH uninstaller requires the beta framework, which I uninstalled, so I’m stuck. I can’t install the release version of MSH. This sort of thing is just silly, and **I thought it was a problem that we’d solved**. (To be fair, they did promise that this won’t be a problem for release versions of the framework, but how many millions of times were the betas downloaded?)
> 
> 

from [Stevex&#8217;s blog](http://blog.stevex.net/index.php/2005/11/09/rss-bandit-on-net-framework-20/trackback/ "Stevex's blog")
