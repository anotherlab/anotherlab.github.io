---
title: Installing the “Copy as Plain Text” add-in in Firefox 3
date: 2008-07-08T14:16:00-05:00
---
</p> </p> 

I’ve installed Firefox 3 over Firefox 2 and it’s been a big improvement in performance and UI experience.  But it doesn’t work with all of the add-on extensions that are available for Firefox 2.  There are some nice extensions that were written for Firefox 2 that have not been updated for Firefox 3.  One that I use a lot is the [“Copy Plain Text”](https://addons.mozilla.org/en-US/firefox/addon/134) add-in, written by [Jeremy Gillick](http://mozmonkey.com/).  This extension provides a &#8220;Copy as Plain Text&#8221; option so that you can copy text from a page and have the formatting stripped out.

The problem is that Jeremy hasn&#8217;t released a version that will run under Firefox 3.  When Firefox installs an add-on extension, it checks the version of the extension and prevents older extensions from being installed.  While this is a good thing in preventing extensions that broke with Firefox 3, it&#8217;s an annoyance for the ones that work just fine.  I&#8217;m not sure what happened Jeremy Gillick, but appears that he has abandoned his simple, but cool extension.</p> </p> </p> </p> </p> </p> 

While reading the comments left on the add-on page, I saw that a user named &#8220;ervee&#8221; ([eRVee Moskovic](https://addons.mozilla.org/en-US/firefox/user/1706835) , and that is how he capitalizes it.) had patched &#8220;Copy Plain Text&#8221; so that it will install with Firefox 3.  It appears that he changed a single line in the install.js file that was bundled in the extension from the line that contained

const gVersion = &#8220;0.3.3&#8221;;  
to  
const gVersion = &#8220;0.3.3b&#8221;;

And that single letter &#8220;b&#8221; is all that was needed to allow Firefox 3 to install this extension.

Ervee posted his modified extension as [http://ervee.moskovic.org/copy\_plain\_text/copy\_plain\_text-0.3.3b-fx+mz+tb.xpi](http://ervee.moskovic.org/copy_plain_text/copy_plain_text-0.3.3b-fx+mz+tb.xpi) 

If you download his modified version of the extension, you have to tell Firefox 3 how to install it.  Save the extension to a local folder, then open the fire from within Firefox 3 by selecting &#8220;Open File&#8221; from the &#8220;File&#8221; menu.  You will then be prompted with the Software Installation dialog. Click install and then restart Firefox when prompted.

An alternative method (documented [here](http://www.accessfirefox.org/Install_Addon_Manually.php)) would be to open the &#8220;Add-ons&#8221; dialog by selecting &#8220;Add-ons&#8221; from the &#8220;Tools&#8221; menu.  Once that dialog has opened, minimize the main form and drag the extension file to the dialog. You will then be prompted with the Software Installation dialog. Click install and then restart Firefox when prompted.

Either way should work, I did the former and the extension is working just fine with Firefox 3.  Thanks &#8220;ervee&#8221;!
