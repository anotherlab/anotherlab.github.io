---
id: 256
title: 'Why I&#8217;m looking forward to &quot;Orcas&quot;'
date: 2007-03-13T13:47:00-05:00
layout: post
guid: http://www.rajapet.com/?p=256
permalink: /2007/03/13/why-i-looking-forward-to/
---
I have stayed away from the Visual Studio betas (I beta test enough stuff already, thank you), but the more I hear about the next version of Visual Studio (code named [&#8220;Orcas&#8221;](http://msdn2.microsoft.com/en-us/vstudio/aa700831.aspx)), the more inclined I am to installing it in a [VMWare](http://www.vmware.com/products/ws/) session.

[Scott Guthrie](http://weblogs.asp.net/scottgu/default.aspx) has been running a [series](http://weblogs.asp.net/scottgu/archive/2007/03/08/new-c-orcas-language-features-automatic-properties-object-initializers-and-collection-initializers.aspx) of blog posts about the new language features coming in &#8220;Orcas&#8221;.  His [post about Extension Methods](http://weblogs.asp.net/scottgu/archive/2007/03/13/new-orcas-language-feature-extension-methods.aspx) caught my eye.  In a nut shell, [Extension Methods](http://en.wikipedia.org/wiki/Extension_method) let you new methods of an existing object type, without having to subclass that object or modifying the object.

You bascailly create a new static class with a static method.  The first parameter has the keyword &#8220;this&#8221; prepended to it.  This informs the compiler that the new method should be added to the class referenced by &#8220;this&#8221;.

Codegear does [something similiar](http://blogs.codegear.com/abauer/archive/2007/02/24/32322.aspx "How to add a "published" property without breaking DCU compatibility") with Delphi 2007 to allow it be a non-breaking upgrade from Delphi 2006.

Scott also has a good example of how to use LINQ Extension Methods to query an XML file.  That for me was the first I really **[got](http://en.wikipedia.org/wiki/Grok "grok")** the value of LINQ.

[Automatic properties](http://community.bartdesmet.net/blogs/bart/archive/2007/03/03/c-3-0-automatic-properties-explained.aspx) look pretty cool.  It&#8217;s just syntactical sugar, but it goes down pretty good.  I have always been in the habit of creating properties for the public variables of a class in C# and Delphi, this makes it a little quicker write on the C# side.

<div>
  Tech Tags: <a href="http://technorati.com/tag/Orcas" rel="tag">Orcas</a> <a href="http://technorati.com/tag/Extension+Methods" rel="tag">Extension+Methods</a> <a href="http://technorati.com/tag/LINQ" rel="tag">LINQ</a> <a href="http://technorati.com/tag/Automatic+Properties" rel="tag">Automatic+Properties</a>
</div>