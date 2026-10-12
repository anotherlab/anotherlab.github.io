---
title: When Page Up and Page Down behave oddly in FireFox
date: 2009-08-29T03:40:00-05:00
---
I was viewing a web page with [Firefox 3.5.2](http://www.mozilla.com/en-US/firefox/personal.html) the other day and I noticed the Page Up and Page Down keys were not behaving the right way.  Instead of scrolling, the page would flash a bit, but nothing really would happen.  I could still scroll with the mouse, but it bugged me.  Bugged me a lot.

I did a bit of searching and discovered an odd little feature.  Select “Options…” from the “Tools” menu.  On the “Advanced tab”, select “General”.  There is an option, “Always use the cursor keys to navigate within pages”.  If that [option](http://support.mozilla.com/en-US/kb/Options+window+-+Advanced+panel?style_mode=inproduct#General_tab) is set, the cursor keys can be used to select text on the page instead of navigating the page.

By default, that option is not set.  However, you can toggle it on and off by pressing the F7 key.  And I must have pressed that key at some point and toggled that feature on.  Once I cleared that setting, I could use the Page Up and Page Down keys to navigate the page again.
