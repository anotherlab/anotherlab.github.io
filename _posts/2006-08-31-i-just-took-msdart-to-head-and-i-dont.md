---
id: 288
title: 'I just took a MSDart to the head and I don&#8217;t feel so well right now.'
date: 2006-08-31T20:35:00-05:00
layout: post
guid: http://www.rajapet.com/?p=288
permalink: /2006/08/31/i-just-took-msdart-to-head-and-i-dont/
---
One of clients went to run some of our applications on their Windows Server 2003 SP1 box and it wasn&#8217;t very pretty. They got the error message: 

### &#8220;The procedure entry point DefWindowProcI could not be located in the dynamic link library msdart.dll&#8221;

Not a very helpful message. It happens when we access an ADO object within our code. We couldn&#8217;t duplicate the problem on our W2K3 SP1 boxes. Some searches through Google seem to point the figure at a corrupted MDAC stack with SP1. When our client rolled SP1 back, the problem went away. Microsoft seems to be aware of a similiar problem as they have a KB article, [889114](http://support.microsoft.com/default.aspx?scid=kb;en-us;889114), that describes a similiar issue in Msdart.dll, but not with W2K3. I have also seen references to another article, [892500](http://support.microsoft.com/default.aspx?scid=kb;en-us;892500), but that one refers to DCOM permissions. I&#8217;m not sure if that one is relevant.

The question now is how to resolve this issue. How many ways can SP1 be installed on Windows Server 2003? Our boxes got SP1 through Windows Update and they have the right version of Msdat.dll.

<div>
  Tech Tags: <a href="http://technorati.com/tag/msdart.dll" rel="tag">msdart.dll</a> <a href="http://technorati.com/tag/Windows+Server+2003" rel="tag">Windows Server 2003</a> <a href="http://technorati.com/tag/SP1" rel="tag">SP1</a> <a href="http://technorati.com/tag/DefWindowProcI" rel="tag">DefWindowProcI</a> <a href="http://technorati.com/tag/889114" rel="tag">889114</a> <a href="http://technorati.com/tag/892500" rel="tag">892500</a> <a href="http://technorati.com/tag/ADO" rel="tag">ADO</a> <a href="http://technorati.com/tag/OLE+DB" rel="tag">OLE DB</a>
</div>