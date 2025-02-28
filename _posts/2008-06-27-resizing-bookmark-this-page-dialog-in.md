---
title: Resizing the “Bookmark this page” dialog in Firefox 3
date: 2008-06-27T20:38:00-05:00
---
</p> </p> 

I like using the new Firefox 3, but there is a little thing that annoys me.   When you go to bookmark a page, you get the “Bookmark this page” dialog.  Inside that dialog, there is a folder tree that will display your bookmark folders.  Out of the box, you can only see a little more than handful of folders at time, you have to scroll around to find the folder to use.  If you are as [hierarchal-retentive](http://www.outdoorphotography.com/files/u1/head_up_ass.jpg) as I am, you can have lots of folders, some nested pretty deep.  I know about the new tags functionality, but I still like to file my bookmarks like a squirrel with his acorns.

The “Bookmark this page” (and the “Page Bookmarked”) dialog isn’t doesn’t have the resize widgets.  You can’t just drag an edge or a corner and resize it with a mouse.  For some reason, it’s size is fixed.  Unless you want to go under the hood and tweak the UI a bit.

There is a file named [userChrome.css](http://kb.mozillazine.org/UserChrome.css) in the chrome sub folder of the [profile folder](http://kb.mozillazine.org/Profile_folder "Profile folder - MozillaZine Knowledge Base").  This file lets you override various GUI settings in the Mozilla product line.  It’s doesn’t exists by default, you have to put one in the chrome folder.  A file named userChrome-example.css should exist already in that folder.  All you need to do is to  copy that file to userChrome.css and you are ready to start.

I added the following CSS code to increase the size of the folder tree control that is located in the middle of the dialog.

<pre>/*<br />* FF3.0, FORCE BIGGER DISPLAY OF FOLDER TREE WITHIN 'BOOKMARK THIS PAGE' POP-UP<br />*/<br />#editBMPanel_folderTree<br />{<br />min-width:400px !important;<br />min-height:600px !important;<br />}</pre>

After adding that definition and saving the file, you will need to restart FireFox.  This should work for Firefox 2, but I haven’t tested it there.  I found that little gem [right here](http://forums.mozillazine.org/viewtopic.php?f=23&t=662373&st=0&sk=t&sd=a&start=15) on the mozillaZine forum.  That will give you a much longer list when you open the folder tree.
