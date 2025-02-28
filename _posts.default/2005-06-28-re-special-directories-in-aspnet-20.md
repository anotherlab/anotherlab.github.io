---
id: 438
title: 'RE: Special Directories in ASP.NET 2.0'
date: 2005-06-28T14:04:00-05:00
layout: post
guid: http://www.rajapet.com/?p=438
permalink: /2005/06/28/re-special-directories-in-aspnet-20/
---
Here are some interesting tidbits about ASP.NET 2.0&#8230;.

> ASP.NET 2.0 introduces a number of special directories for application resources. These directories live as subfolders in the application root, have special names, and offer various shortcuts and conveniences to web developers. One such folder is the App\_Code folder. You can drop a .cs file into the App\_Code folder, even while an application is running, and the runtime will automatically compile all the code inside the folder into an assembly. 
> 
> The App\_Code folder is one of those features experienced developers will shun in favor of class libraries. Other folders have definite advantages. For example, the App\_Browsers folder will allow you to update browser definitions (browsercaps) for an application. In a shared hosting environment today, you&#8217;d have to clutter up web.config with new browsercaps. There are also special directories for skin files (App\_Themes), resource files (App\_GlobalResources, App\_LocalResources, App\_Resources), and web references (App\_WebReferences). As always, the trusty Bin directory will also be around. Then there is App\_Data. You can plop SQL Server data (.mdf) and log files (.ldf) into the directory, and have the engine attach dynamically by using AttachDBFileName in the connection string. App_Data will be a useful feature for people in shared hosting environments, where XCOPY and FTP deployment options are the only options available. 

_[Via [K. Scott Allen](http://odetocode.com/Blogs/scott/archive/2005/06/28/1881.aspx)]_

I would like to see how the App_Data directory will play out in the real world. Most of the shared hosting plans have their own mechanism for handling client databases, it looks easy to add a database by just FTP&#8217;ing it in, but what about when you want to replace a database? You&#8217;ll still need to detach a database first.