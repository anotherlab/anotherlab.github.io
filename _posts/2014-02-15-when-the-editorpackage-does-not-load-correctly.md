---
title: When the EditorPackage does not load correctly
date: 2014-02-15T22:09:59-05:00
---
I had this &#8220;The &#8216;Microsoft.VisualStudio.Editor.Implementation.EditorPackage&#8217; package did not load correctly.&#8221; error message when I started up Visual Studio 2013.  My PC had rebooted earlier in the day as a result of some Windows Updates.  Now I was getting this error dialog:

<img style="margin: 5px auto; display: block; text-align: center;" title="The 'Microsoft.VisualStudio.Editor.Implementation.EditorPackage' package did not load correctly." alt="The 'Microsoft.VisualStudio.Editor.Implementation.EditorPackage' package did not load correctly." src="https://i2.wp.com/www.rajapet.net/photos/i-bp7gmZL/0/O/i-bp7gmZL.png?w=497"  /> 

This is telling me to open ActivityLog.xml, and hopefully an answer will be found.  So I opened up that file and found some error entries

<pre class="brush: xhtml; gutter: true">&lt;entry&gt;
 &lt;record&gt;541&lt;/record&gt;
 &lt;time&gt;2014/02/16 02:00:07.011&lt;/time&gt;
 &lt;type&gt;Error&lt;/type&gt;
 &lt;source&gt;VisualStudio&lt;/source&gt;
 &lt;description&gt;SetSite failed for package [Microsoft.VisualStudio.Editor.Implementation.EditorPackage]&lt;/description&gt;
 &lt;guid&gt;{E269B994-EF71-4CE0-8BCD-581C217372E8}&lt;/guid&gt;
 &lt;hr&gt;80070057 - E_INVALIDARG&lt;/hr&gt;
 &lt;errorinfo&gt;No EditorOptionDefinition export found for the given option name: Graphics/Simple/Enable
Parameter name: optionId&lt;/errorinfo&gt;
 &lt;/entry&gt;</pre>

Something must have changed with the Windows updates and it was enough to cause an issue. This problem seems happens enough with various versions of Visual Studio that you can [bingle](http://letmebingthatforyou.com/) it and get the same answer.  You need to clear the ComponentModelCache folder.  For Visual Studio 2013, it&#8217;s located in the **%LOCALAPPDATA%\Microsoft\VisualStudio\12.0** folder.

I renamed ComponentModelCache to ComponentModelCache.Borked and restarted Visual Studio.  It started right up and without any errors.
