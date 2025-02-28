---
id: 304
title: Leaky Abstractions in Wise for Windows
date: 2006-05-30T15:31:00-05:00
layout: post
guid: http://www.rajapet.com/?p=304
permalink: /2006/05/30/leaky-abstractions-in-wise-for-windows/
---
I had just reported a bug with the Wise for Windows Installer (it can&#8217;t call the Install method on a service compiled under the .NET Framework 2.0) and I checked the Altiris support forum to see if there were any other surprises. One of the senior forum members reported [something interesting with the MSI scripting](http://forums.altiris.com/messageview.aspx?catid=20&threadid=31410&enterthread=y). He had a block of code with the following logic:

If NOT Installed AND NOT ARG  
..Do thing1  
..Do thing2  
..Do thing3  
..Do thing4  
..Do thing5  
End If

At runtime, the first three actions inside the block were executed, but not the last two. This was a tricky one to figure out. Wise shows the actions as if they are running in a script, with an actual IF/END IF block. MSI technology is database driven. Instead of a script, you have each action as a row in a table, with the same IF condition defined for each action. Similiar in behavior to a script, but the condition is evaluated for each row. The thing3 action was changing the value of ARG, and when the condition was reevaluated for actions thing4 and thing5, the result of the IF condition had changed. This is another example of how [Leaky](http://www.joelonsoftware.com/articles/LeakyAbstractions.html) [Abstractions](http://weblogs.asp.net/bleroy/archive/2004/12/02/274105.aspx) can bite you in the ass.

Programmers are used to seeing procedural code in a script. Wise does a pretty good job of abstracting out database rules to pseudo scripts, but it&#8217;s not a perfect abstraction. Unless you ran the installer through the debugger, and examine conditions at thing 3 and then at thing4, you would never see what was going on.

<div>
  Tech Tags: <a href="http://technorati.com/tag/Wise+For+Windows" rel="tag">Wise For Windows</a> <a href="http://technorati.com/tag/Leaky+Abstractions" rel="tag">Leaky Abstractions</a> <a href="http://technorati.com/tag/MSI" rel="tag">MSI</a>
</div>