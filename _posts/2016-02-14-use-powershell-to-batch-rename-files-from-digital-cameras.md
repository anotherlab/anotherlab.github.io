---
id: 1379
title: Use Powershell to batch rename files from digital cameras
date: 2016-02-14T13:45:24-05:00
layout: post
guid: http://www.rajapet.com/?p=1379
permalink: /2016/02/14/use-powershell-to-batch-rename-files-from-digital-cameras/
---
If your household is like my household, then you&#8217;ll have more than one digital camera laying around.  My wife and I have similar Sony cameras ([NEX-6](http://www.dpreview.com/reviews/sony-alpha-nex-6) and an [a5000](http://www.dpreview.com/products/sony/slrs/sony_a5000)).  For easy of management and the sake of my own sanity, I back up the images from both cameras together.

I store my images in a chronological order.  A folder for each year, then sub folders for each month.  It&#8217;s simple to manage and it&#8217;s easy to find pictures.  When daughter(0) asks where the pictures are from last year&#8217;s lake vacation, I can tell her it&#8217;s in &#8220;2015\7&#8221;.   There are times where I create folders for special purposes, but by and large the collection is in chronological order.

Since Sony prefixes every image with the letters DSC, I wanted a way differentiate between my images and my wife&#8217;s images.  I also wanted to eliminate any chance of two images having the same name.  There many ways of doing batch file renaming.  I wanted something simple.

That brings us to [Powershell](https://msdn.microsoft.com/powershell).  There&#8217;s very little that you can&#8217;t do with [Powershell](https://technet.microsoft.com/en-us/scriptcenter/dd742419.aspx) and a lot resources for it.  In this case, a batch rename is trivial:

<pre class="brush:powershell"># Pipe the contents of the DIR command
# to the Rename-Item command and do text
# replacement
#
Dir *.jpg, *.arw | 
  Rename-Item –NewName { $_.name –replace “DSC“,”ABM” }
</pre>

That command will take all of the files in the current folder with the .JPG and .ARW (Sony&#8217;s RAW file) extension and rename any of them that have &#8220;DSC&#8221; in the name to use &#8220;ABM&#8221;. This will replace the &#8220;DSC&#8221; in any part of the filename. If you want to just match files that start with &#8220;DSC&#8221;, then you could RegEx pattern matching. Since I didn&#8217;t need that level of pattern matching, I chose not to dive down that rabbit hole.