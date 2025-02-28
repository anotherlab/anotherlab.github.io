---
title: Externally signing Wise Installation System generated executables
date: 2007-12-18T16:49:00-05:00
---
I had a problem with applying an [Authenticode](http://www.iss.net/security_center/advice/Countermeasures/Authentication/Authenticode/default.htm) digital signature to installer that I had created with [Wise Installation System 9.02](http://www.wise.com/Products/Installations.aspx).  Basically, it was failing with the lovely message:

<a href="https://i0.wp.com/1.bp.blogspot.com/_natoSxTaPFU/R2f8ya7uenI/AAAAAAAAACY/ACIjygQfb5k/s1600-h/ole0.png" target="_blank"><img alt="Could not initialize installation. File size expected=3258503, size returned=3263976" src="https://i2.wp.com/1.bp.blogspot.com/_natoSxTaPFU/R2f8ya7uenI/AAAAAAAAACY/ACIjygQfb5k/s400/ole0.png?w=680" border="0"  /></a> 

The signature was being applied outside of Wise, through our build process.  We use [FinalBuilder](http://www.finalbuilder.com/finalbuilder.aspx) to build all of our applications and it has a handy Authenticode action for applying an Authenticode signature to the target you specify.  If I disabled that action, the installer worked.

Wise has the ability to sign it&#8217;s executables, but that version is hard coded to use Microsoft&#8217;s signcode executable to handle the actually signing.  Microsoft has [deprecated signcode](http://support.microsoft.com/kb/196220) in favor of [signtool](http://msdn2.microsoft.com/en-us/library/aa387764.aspx "All about signtool.exe") and I didn&#8217;t have a copy of signcode laying around.  In all likelihood, the current version of Wise&#8217;s script based installer would be able to use signtool, but I can&#8217;t use the current version because they broke other, more important things.

After a fair amount of googling, I found an [old copy of signcode](http://https://www.thawte.com/dynamic/en/images/support/inetSDk5.zip) on Thawte&#8217;s site on this [page](https://www.thawte.com/ssl-digital-certificates/technical-support/code/msauth.html#sr).  I downloaded the file set and extracted signcode and placed it in my \windows folder.  I fired up Wise and went to the &#8220;Digital Signature&#8221; page in the IDE.  That&#8217;s when I saw the blindingly obvious setting that I needed to set:

[<img alt="" src="https://i0.wp.com/2.bp.blogspot.com/_natoSxTaPFU/R2f-zq7ueoI/AAAAAAAAACg/raZ85Wgenqg/s400/dialog.png?w=680" border="0"  />](https://i0.wp.com/2.bp.blogspot.com/_natoSxTaPFU/R2f-zq7ueoI/AAAAAAAAACg/raZ85Wgenqg/s1600-h/dialog.png)  

On the “Digital Signature” in the Wise Installation System IDE, make sure that the radio button labeled “Add a digital signature externally” has been checked. Once I made that change, everything worked.
