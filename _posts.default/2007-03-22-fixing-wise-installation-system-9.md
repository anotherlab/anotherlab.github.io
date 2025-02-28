---
id: 252
title: Fixing Wise Installation System 9 problem with shortcuts in Vista
date: 2007-03-22T14:31:00-05:00
layout: post
guid: http://www.rajapet.com/?p=252
permalink: /2007/03/22/fixing-wise-installation-system-9/
---
We were testing one of installers under Vista and the dreaded [&#8220;User Account Control&#8221;](http://technet.microsoft.com/en-us/windowsvista/aa906021.aspx) dialog was being launched for every shortcut that was created by the installer.  Running the applications referenced by the shortcuts did not through the UAC, just the shortcuts.

I took a look the shortcuts and they didn&#8217;t have a direct link to the apps.  Instead they looked like this:</p> 

<pre>"C:\Program Files\Company\App\UNWISE.EXE" /W1 "C:\Program Files\Company\App\INSTALL.LOG"</pre>





This was Wise 9&#8217;s attempt to mimic the self-repair feature of Microsoft&#8217;s Windows Installer.  If you are using Wise 9 Professional, you can fix this by opening the shortcut action in the setup editor and clearing the self-repair checkbox.  If you have the Standard version, you&#8217;ll have to edit the installer script (.wse) with a text editor.  For each shortcut, you would remove the line of script reading &#8216;Flags=01000000&#8217; from the Create Shortcut script action code block.  This is documented in the Altiris Knowledgebase as article [23832](http://kb.altiris.com/display/2n/articleDirect/index.asp?aid=23832&r=0.7036554 "KNOWN ISSUE: Shortcut in Wise Installation System 9 points to unwise.exe").  I found that article by searching the Altiris support forums and I came across this [message](http://forums.altiris.com/messageview.aspx?catid=27&threadid=37841 "Desktop shortcut security shield in Vista") thread.



<div>
  Tech Tags: <a href="http://technorati.com/tag/Vista" rel="tag">Vista</a> <a href="http://technorati.com/tag/Wise+Installation+System" rel="tag">Wise+Installation+System</a> <a href="http://technorati.com/tag/User+Account+Control" rel="tag">User+Account+Control</a> <a href="http://technorati.com/tag/Shortcut" rel="tag">Shortcut</a> <a href="http://technorati.com/tag/unwise.exe" rel="tag">unwise.exe</a>
</div>