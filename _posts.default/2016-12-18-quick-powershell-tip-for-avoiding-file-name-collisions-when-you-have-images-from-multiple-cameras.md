---
title: Quick Powershell tip for avoiding file name collisions when you have images from multiple cameras
date: 2016-12-18
---
My wife and I both have Sony mirrorless cameras. She has an <a href="http://www.sony.com/electronics/interchangeable-lens-cameras/ilce-5000-kit">Alpha 5000</a> and I have a <a href="https://esupport.sony.com/US/p/model-home.pl?mdl=NEX6&LOC=3#/howtoTab">NEX-6</a>. I back up all of our images to my home dev box, and then to a <a href="https://www.qnap.com/en-us/product/model.php?II=196">QNAP NAS server</a>. The images are stored in folders based on year and month.

The date based filing makes it somewhat easy to find the images, but when you have images from multiple cameras, you run the slight (but real) risk of having both cameras save an image with the same file name. Both camera use the standard <a href="https://en.wikipedia.org/wiki/Design_rule_for_Camera_File_system#Directory_and_file_structure">DSCXXXXX naming scheme</a>, where XXXXX is number that is being incremented by the camera.  It's also a little difficult to quickly separate her images from mine.

So what I do is to use a quick Powershell command to rename my wife's images. I replace the “DSC” part of the file name with her initials. So lets say that you wanted to replace the “DSC” with “ABC”, a simple way would be with the following command:

{% highlight powershell %}
Get-ChildItem -Filter “DSC*.*” |
Rename-Item -NewName {$_.name -replace ‘DSC’,’ABC’ }
{% endhighlight %}
    
That will get all of the files in the current folder that match dsc.* and pass that list to the rename-item command. The rename-item will iterate through that list and replace all of the occurrences of “DSC” with “ABC”. If you only shoot JPEG files, you can filter on “DSC*.JPG”. We shoot RAW plus JPEG, so we used the wild card extension to get all of the files.

Now can I store her images with mine and they all get backed up to multiple places.  I also back them up to multiple cloud providers, because sometimes it falls down.

If you want to explicitly do just a couple of file extensions, you can use the -Include option instead of -Filter. When you use the -Include option, you must also use the -Path option and set the path. One would be like this.

{% highlight powershell %}
Get-ChildItem -Path .\\ -Include *.jpg, *.raw | 
ReRename-Item -NewName {$_.name -replace ‘DSC’,’ABC’ }
{% endhighlight %}
