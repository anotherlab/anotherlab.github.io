---
title: Use Powershell to batch rename files from digital cameras
date: 2016-02-14
---
If your household is like my household, then you'll have more than one digital camera laying around.  My wife and I have similar Sony cameras ([NEX-6](http://www.dpreview.com/reviews/sony-alpha-nex-6) and an [a5000](http://www.dpreview.com/products/sony/slrs/sony_a5000)).  For easy of management and the sake of my own sanity, I back up the images from both cameras together.

I store my images in a chronological order.  A folder for each year, then sub folders for each month.  It's simple to manage and it's easy to find pictures.  When daughter(0) asks where the pictures are from last year's lake vacation, I can tell her it's in “2015\7”.   There are times where I create folders for special purposes, but by and large the collection is in chronological order.

Since Sony prefixes every image with the letters DSC, I wanted a way differentiate between my images and my wife's images.  I also wanted to eliminate any chance of two images having the same name.  There many ways of doing batch file renaming.  I wanted something simple.

That brings us to [Powershell](https://msdn.microsoft.com/powershell).  There's very little that you can't do with [Powershell](https://technet.microsoft.com/en-us/scriptcenter/dd742419.aspx) and a lot resources for it.  In this case, a batch rename is trivial:

{% highlight powershell %}# Pipe the contents of the DIR command
# to the Rename-Item command and do text
# replacement
#
Dir *.jpg, *.arw | 
  Rename-Item –NewName { $_.name –replace “DSC“,”ABM” }
{% endhighlight %}

That command will take all of the files in the current folder with the .JPG and .ARW (Sony's RAW file) extension and rename any of them that have “DSC” in the name to use “ABM”. This will replace the “DSC” in any part of the filename. If you want to just match files that start with “DSC”, then you could RegEx pattern matching. Since I didn't need that level of pattern matching, I chose not to dive down that rabbit hole.
