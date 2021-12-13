---
id: 1988
title: Quick Powershell tip for avoiding file name collisions when you have images from multiple cameras
date: 2016-12-18T20:43:25-05:00
layout: post
guid: http://www.rajapet.com/?p=1988
permalink: /2016/12/18/quick-powershell-tip-for-avoiding-file-name-collisions-when-you-have-images-from-multiple-cameras/
---
<div class="getty embed image" style="background-color: #fff; display: inline-block; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; color: #a7a7a7; font-size: 11px; width: 100%; max-width: 507px;">
  <div style="padding: 0; margin: 0; text-align: left;">
    <a style="color: #a7a7a7; text-decoration: none; font-weight: normal !important; border: none; display: inline-block;" href="http://www.gettyimages.com/detail/169710953" target="_blank">Embed from Getty Images</a>
  </div>
  
  <div style="overflow: hidden; position: relative; height: 0; padding: 66.666667% 0 0 0; width: 100%;">
  </div>
  
  <p style="margin: 0;">
    </div> 
    
    <p>
      My wife and I both have Sony mirrorless cameras. She has an <a href="http://www.sony.com/electronics/interchangeable-lens-cameras/ilce-5000-kit">Alpha 5000</a> and I have a <a href="https://esupport.sony.com/US/p/model-home.pl?mdl=NEX6&LOC=3#/howtoTab">NEX-6</a>. I back up all of our images to my home dev box, and then to a <a href="https://www.qnap.com/en-us/product/model.php?II=196">QNAP NAS server</a>. The images are stored in folders based on year and month.
    </p>
    
    <p>
      The date based filing makes it somewhat easy to find the images, but when you have images from multiple cameras, you run the slight (but real) risk of having both cameras save an image with the same file name. Both camera use the standard <a href="https://en.wikipedia.org/wiki/Design_rule_for_Camera_File_system#Directory_and_file_structure">DSCXXXXX naming scheme</a>, where XXXXX is number that is being incremented by the camera.  It&#8217;s also a little difficult to quickly separate her images from mine.
    </p>
    
    <p>
      So what I do is to use a quick Powershell command to rename my wife&#8217;s images. I replace the &#8220;DSC&#8221; part of the file name with her initials. So lets say that you wanted to replace the &#8220;DSC&#8221; with &#8220;ABC&#8221;, a simple way would be with the following command:
    </p>
    
    <pre class="brush:ps">Get-ChildItem -Filter “DSC*.*” | 
  Rename-Item -NewName {$_.name -replace ‘DSC’,’ABC’ }

</pre>
    
    <p>
      That will get all of the files in the current folder that match dsc.* and pass that list to the rename-item command. The rename-item will iterate through that list and replace all of the occurrences of &#8220;DSC&#8221; with &#8220;ABC&#8221;. If you only shoot JPEG files, you can filter on &#8220;DSC*.JPG&#8221;. We shoot RAW plus JPEG, so we used the wild card extension to get all of the files.
    </p>
    
    <p>
      Now can I store her images with mine and they all get backed up to multiple places.  I also back them up to multiple cloud providers, because sometimes it falls down.
    </p>
    
    <p>
      If you want to explicitly do just a couple of file extensions, you can use the -Include option instead of -Filter. When you use the -Include option, you must also use the -Path option and set the path. One would be like this.
    </p>
    
    <pre class="brush:ps">Get-ChildItem -Path .\\ -Include *.jpg, *.raw | 
  Rename-Item -NewName {$_.name -replace ‘DSC’,’ABC’ }

</pre>