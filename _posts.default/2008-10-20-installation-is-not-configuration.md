---
id: 111
title: Installation is not configuration
date: 2008-10-20T19:43:00-05:00
layout: post
guid: http://www.rajapet.com/?p=111
permalink: /2008/10/20/installation-is-not-configuration/
---
Christopher Painter has a <a title="DeploymentEngineering.com - The Blog: RFC: SQL Scripts Are Almost Declared Evil" href="http://blog.deploymentengineering.com/2008/10/rfc-sql-scripts-are-almost-declared.html" target="_blank">good post about the problems inherent with with having installers run SQL scripts</a>.  Having an installer communicate with a database server just opens the door to all sorts of issues.  Just handling the connection to the server requires making sure that you have all of the required bits installed and that you can locate, and connect to the server.  None of that code is rocket science, we’ve been using it for years. I just don’t think having it in an installer is the right place for that type of code.

The problem is that you are running that code from inside a relatively fragile box, your installer.  Most installer authoring tools provide rudimentary support for running SQL scripts at install time.  They work just fine when all of your ducks are lined up in a row.   However your clients may be missing an odd duck or two, and you end up with fragile code wrapped inside a DLL that your installer will call.

I’ve always treated the installer package as just part of the actual installation process for the end user.  The main task of the installer is to get the bits of your application in place and handle any prerequisite runtime library your code may need.  When it comes to initializing or updating a database, I leave that to the main application and/or it’s support utilities.  if a SQL script is flawed and or doesn’t handle some edge condition that only one customer has, you can break the install.

By using a full blown application to handle the database task, your life (and your customer’s life) becomes much easier.  By running your own application, you have (or should have) a much richer environment for developing code.  You have complete control over the UI and you do not have to be concerned with trying match the UI style of the installer.   Also the testing and debugging of the database utility code becomes much easier as no longer need to account for the installer.

You also have the ability to run the application at any time after the install, without having to invoke the installer.  If it turns out the problem was a SQL script that didn’t work for that customer, you can immediately email or post online an updated SQL script, without forcing the user to run the installation process again.

We use a mixture of script based installers and Windows Installers and none of them make any attempt to run a SQL script.  I wrote a database utility application that gets launched after an install.  I wrote it when our company supported the MSDE, back in the day of SQL Server 7.  Back then, Microsoft provided absolutely zero for tools to manage the MSDE.  So this utility, by necessity needed to be able to attach and detach databases, back up and restore databases, manage the server and database logins, and perform schema updates.  

Over the years, this utility has matured and is very easy for the end user to use.  We provide all of schema updates in a single, compressed file.  For the use to apply an update the database schema, they just run my utility and it reads the update file and it knows which updates have already been applied and only runs the ones it needs to.

All very easy for the end use, but it would have been a nightmare to get that level of functionality running as part of the installer.  As soon as you add an outside dependency (in this case, the database server), you have added a point of failure that you will have absolutely no control over.