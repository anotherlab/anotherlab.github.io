---
title: 'Adding &quot;Install as&#8230;&quot; to context menu'
date: 2005-12-16T17:18:00-05:00
---
This comes from [Michael Willers](http://staff.newtelligence.net/michaelw/PermaLink.aspx?guid=99c458e6-b9cb-421a-b5f5-1ee744af457c), by way of [Dana Epp](http://silverstr.ufies.org/blog/archives/000889.html). This makes it easier to install .msi packages when logged in as a non-admin use. Too many home PC&#8217;s are running in Admin mode, one of the many reasons why we have so many virus attacks out there.

> If you run your box with a non admin account the &#8220;Run as&#8230;&#8221; entry in the context menu is very comfortable. Wouldn&#8217;t it be nice to have something like &#8220;Install as&#8230;&#8221; for MSI-Packages? This is just a registry hack away 
> 
>   1. Run regedit.exe under an account with administrative privileges 
> 
> 
>   2. Create the key HKEY\_CLASSES\_ROOT\Msi.Package\shell\runas\ 
> 
> 
>   3. Set the default value to Install &as&#8230; 
> 
> 
>   4. Create the key HKEY\_CLASSES\_ROOT\Msi.Package\shell\runas\command\ 
> 
> 
>   5. Set the default value to msiexec /i &#8220;%1&#8221;
> </ol> </blockquote>
