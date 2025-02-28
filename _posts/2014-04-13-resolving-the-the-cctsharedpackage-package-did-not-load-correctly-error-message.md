---
title: 'Resolving the &#8220;The &#8216;CctSharedPackage&#8217; package did not load correctly.&#8221; error message'
date: 2014-04-13T22:35:41-05:00
---
<img loading="lazy" alt="&quot;'a' stands for headache&quot; by Eduardo Ortiz" src="https://i0.wp.com/anotherlab.smugmug.com/photos/i-F8z5MhD/0/L/i-F8z5MhD-L.jpg?resize=400%2C266" width="400" height="266"  />

After launching an Azure project in Visual Studio 2013, I was handed a &#8220;The &#8216;CctSharedPackage&#8217; package did not load correctly.&#8221; error message.

<img loading="lazy" title="The &quot;The 'CctSharedPackage' package did not load correctly.&quot; error" alt="The 'CctSharedPackage' package did not load correctly." src="https://i2.wp.com/anotherlab.smugmug.com/photos/i-PSdHf9H/0/L/i-PSdHf9H-L.png?resize=400%2C221" width="400" height="221"  /> 

I was unfamiliar with that one, and a quick check of the forums showed that a few people had reported this happening after installing the latest Windows 8.1 update. An update that I had installed two nights ago.

If you check the Visual Studio activity log in **%APPDATA%\Microsoft\VisualStudio\12.0\ActivityLog.xml**, you&#8217;ll see something like this

<pre class="brush: xhtml; gutter: true">&lt;entry&gt;
  &lt;record&gt;1638&lt;/record&gt;
  &lt;time&gt;2014/04/14 02:36:02.772&lt;/time&gt;
  &lt;type&gt;Information&lt;/type&gt;
  &lt;source&gt;VisualStudio&lt;/source&gt;
  &lt;description&gt;Begin package load [CctSharedPackage]  &lt;/description&gt;
  &lt;guid&gt;{77A5A151-6A9B-4D08-BC38-340AB29566E2}&lt;/guid&gt;
&lt;/entry&gt;
&lt;entry&gt;
  &lt;record&gt;1639&lt;/record&gt;
  &lt;time&gt;2014/04/14 02:36:02.773&lt;/time&gt;
  &lt;type&gt;Error&lt;/type&gt;
  &lt;source&gt;VisualStudio&lt;/source&gt;
  &lt;description&gt;SetSite failed for package [CctSharedPackage]  &lt;/description&gt;
  &lt;guid&gt;{77A5A151-6A9B-4D08-BC38-340AB29566E2}&lt;/guid&gt;
  &lt;hr&gt;80070002&lt;/hr&gt;
  &lt;errorinfo&gt;Could not load file or assembly &#039;Microsoft.VisualStudio.WindowsAzure.Diagnostics, Version=2.2.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a&#039; or one of its dependencies. The system cannot find the file specified.&lt;/errorinfo&gt;
&lt;/entry&gt;</pre>

Something in the Windows 8.1 April Update blew out at least one assembly that Visual Studio needed. This has an easy work around. Shut down any instances of Visual Studio that you may have running. Go to &#8220;Programs and Features&#8221; in the &#8220;Control Panel&#8221; and look for an item that starts with &#8220;Windows Azure Tools for Visual Studio 2013&#8221;.

Double-click that item to bring up the modify setup dialog. On that dialog select &#8220;Repair&#8221;.

<img loading="lazy" alt="Azure Tools Modify Setup dialog" src="https://i2.wp.com/anotherlab.smugmug.com/photos/i-jSgBGL4/0/L/i-jSgBGL4-L.png?resize=400%2C230" width="400" height="230"  /> 

That will churn for a minute or two. After that completes, you should be back in business. If you are using the Azure Tools with other versions of Visual Studio, you may may to repair them as well.

An alternative means of fixing this is by re-installing the missing assembly into the GAC as described on Stefan Camilleri&#8217;s [blog](http://edd.stefancamilleri.com/2013/12/12/setsite-failed-for-package-cctsharedpackage/ "SetSite failed for package [CctSharedPackage] | edd - Exception Driven Development").

<pre>&lt;code&gt;C:\Program Files (x86)\Windows Azure Tools\Visual Studio 11.0&gt;gacutil /i .\Microsoft.VisualStudio.WindowsAzure.Diagnostics.dll&lt;/code&gt;</pre>

I chose the self repair option of the Azure Tools installer, because I had no idea if anything else was broken.  That&#8217;s the why Windows Installer technology has the repair option.  It will fix the stuff under the hood that you can&#8217;t easily see.

Once I got that straightened out, I checked to see if there was a later version. I was at v2.2 and v2.3 was released during //Build. So I grabbed that and installed. I probably could have just upgraded straight from 2.2 to 2.3 without repairing the v2.3, but I did this way with out any problems.

<small><em>*The <a href="https://flic.kr/p/4pfyqX">&#8220;a&#8221; is for headache image</a> is from Eduardo Ortiz&#8217;s <a href="https://www.flickr.com/photos/eduardoo/">collection</a> on Flickr</em></small>
