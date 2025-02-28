---
id: 240
title: TestDriven.NET and Visual Studio Express
date: 2007-06-05T21:08:00-05:00
layout: post
guid: http://www.rajapet.com/?p=240
permalink: /2007/06/05/testdrivennet-and-visual-studio-express/
---
There&#8217;s been a lot of blog postings about Jamie Cansdale&#8217;s legal issues with Microsoft in the last few days.  Jamie has a product called TestDriven.NET that integrates unit testing within the Visual Studio IDE.  The problem is that Jamie has integrated TestDriven.NET within [Visual Studio Express](http://msdn.microsoft.com/vstudio/express/) and Microsoft would like him not to do that.

Visual Studio Express is the free version of [Visual Studio 2005](http://msdn2.microsoft.com/en-us/vstudio/aa973782.aspx) intended for the hobbyist/student programmer.  Because it&#8217;s free, Microsoft took a few steps to prevent VS Express from taking away sales from the other members of the Visual Studio product line.  Basically, you are not allowed to extend Visual Studio Express with additional functionality.

Jamie found to register TestDriven.NET so that it would work withing VS Express.  Jamie stated that he used published API calls, everything was above the board.  [Information posted](http://blogs.msdn.com/danielfe/archive/2007/06/01/testdriven-net-and-express-technical-information.aspx) by Dan Fernandez (Lead Product Manager for Visual Studio Express) would indicate otherwise:

> The TestDriven.NET product is implemented as a Visual Studio Add-In.  In the Visual Studio Standard, Professional, and Team System SKUs, TestDriven.NET is installed as an Add-In and gets loaded into the IDE through the Add-In Manager.  In the Visual Studio Express SKUs, because we disabled extensibility (macros, Add-ins, and VS Packages), the Add-In Manager is removed and therefore Add-Ins are not detected or loaded.  Jamie has created additional components specifically for the Express SKUs to work around this technical limitation.  He takes advantage of an extensibility point that allows user controls (such as a button class) to customize entries in the Properties window.  <u>When his property extender gets called, he executes code that</u> <u>finds, loads and injects the TestDriven.Net assembly into the Express SKU’s running process</u>, thus replacing the functionality of the removed Add-In Manager.  This explains why he instructs Visual Studio Express users to open the Properties window in order to enable TestDriven.NET.  Once his code is injected into the Express SKU’s running process it can add menu items, enable features that were disabled, and in general take over that instance of Express. These special loading mechanisms that Jamie has built exclusively for the Express SKUs are unauthorized workarounds to the SKUs’ technical limitations.

Right after VS 2005 was released, Microsoft contacted Jamie asked Jamie to remove support for VS Express from TestDriven.NET.  After many rounds of email and phone conferences, Jamie complied for a while.  Eventually he re-enabled support for VS Express and Microsoft is now using their lawyers to enforce their request.  You can read most of the emails and the legal correspondence [here](http://weblogs.asp.net/nunitaddin/archive/2007/05/30/microsoft-vs-testdriven-net-express.aspx).

When I first read about this, my initial thought was Microsoft was sticking to the little guy.  That&#8217;s really not the case here.  Microsoft spent a considerable amount of resources developing the Express line of Visual Studio products and it was clear from the start that you were not supposed to extend the architecture of the tool.  For that limitation, you have a powerful development environment that you could develop commercial applications with.

People have been making the argument that it&#8217;s OK to extend the functionality because Microsoft is already doing it by releasing additional products (like [Popfly](http://msdn.microsoft.com/vstudio/express/popfly/default.aspx)) designed for VS Express.  That has nothing to with MS&#8217;s requirement that third parties are prohibited from extending Express.  This isn&#8217;t unique to Microsoft.  [CodeGear](http://www.codegear.com/) does the same thing with [Turbo Explorer](http://www.turboexplorer.com/) lineup.  You can&#8217;t install third party components into [Turbo Delphi Explorer](http://www.turboexplorer.com/delphi). 

Jamie appears to be stuck on the what specific part of the EULA is being violated.  I don&#8217;t think it matters.  The request to pull VS Express from TestDriven.NET was a reasonable one and he should complied with it.

_postscript&#8230;_  
It&#8217;s entertaining to read the comments posted on Dan&#8217;s blog, especially [here](http://blogs.msdn.com/danielfe/archive/2007/05/31/visual-studio-express-and-testdriven-net.aspx#comments).  While I&#8217;m not surprised by the number of people who just don&#8217;t know the facts, there were many postings by people saying that MS vs Jamie was a reason to dump MS and only use open source tools.  

Give me a break!  If you are making decision on what tool to use over a clear cut EULA violation, you have rocks in your head.  You should be making that type of decision based on it being the right tool for the job.