---
id: 3148
title: Return to FocusUF
date: 2020-03-20T22:49:29-05:00
author: Chris Miller
layout: post
guid: http://rajapet.com/?p=3148
permalink: /2020/03/20/return-to-focusuf/
spay_email:
  - ""
categories:
  - Uncategorized
---
A while back, I [blogged](https://rajapet.com/2018/04/05/focusuf-or-how-to-turn-off-the-autofocus-setting-of-the-lifecam-hd-5000-webcam/) about a command line hack to set the focus for a web cam.&nbsp; I was using a Microsoft LifeCam HD-5000 and it has the annoying habit of refocusing if you move around in your seat.

It&#8217;s two years later and I have had a request for a compiled version of the FocusUF.  It wasn&#8217;t much more than a paragraph of code and I put it up on [GitHub](https://github.com/anotherlab/FocusUF) for anyone to use.  That&#8217;s all I had wanted to do, just the share the code and move on.

It&#8217;s not a product, it&#8217;s a block of code.&nbsp; I had resisted putting a compiled version up because it&#8217;s not something I wanted to support.&nbsp; But if you are not a .NET developer, it&#8217;s big ask to take that code and make a tiny command line tool.&nbsp; I get it.&nbsp; I decided to add a compiled version of the code to the GitHub repository.&nbsp; For use as is, no support.

I went back to the project and fired it up.&nbsp; It&#8217;s been two years and management has made some changes.&nbsp; I&#8217;m using Visual Studio 2019 and I no longer use that web cam.&nbsp; I upgraded to a Logitech c922 and no longer use the LifeCam.

The good news is the code compiled with no changes from VS 2019.&nbsp; Which is what [I expected](https://tenor.com/sDps.gif).&nbsp; When I ran it, tt crashed and burned with an error.&nbsp; Which I did [not expect](https://tenor.com/Kgay.gif).&nbsp; It literally dies on the second line of code.&nbsp; The first two lines of code look like this:

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: csharp; highlight: [6]; title: ; notranslate" title="">
// Get the list of connected video cameras
DsDevice&#91;] devs = DsDevice.GetDevicesOfCat(FilterCategory.VideoInputDevice);

// Filter that list down to the one with hyper-aggressive focus
var dev = devs
  .Where(d =&gt; d.Name.Equals("Microsoft® LifeCam HD-5000"))
  .FirstOrDefault();

</pre>
</div>

I broke the second line into multiple lines to make this a little easier to follow.&nbsp; I was getting a null exception on the highlighted line, specifically on d.Name.

For some reason, one of the items in the devs array has null for a name and that broke my code.&nbsp; It was never a problem before, because the LifeCam was first in the list returned by GetDevicesOfCat.&nbsp; Since I no longer had that web cam plugged in, the LINQ query was going through the entire list.&nbsp; And then erroring out trying to call Equals() on a null value. [SPOILER ALERT! That assumption was completely wrong.]

I was curious to see what was null. When I want to quickly visually data structures, I like to use [LINQPad](https://www.linqpad.net/). So I copied and pasted those two lines into LINQPad and pulled in the [nuget package for DirectShowLib](https://www.nuget.org/packages/DirectShowLib/).&nbsp; I then used the Dump() extension method to look at what was being returned for GetDevicesOfCat.<figure class="wp-block-table is-style-stripes">

<table class="">
  <tr>
    <th>
      DevicePath
    </th>
    
    <th>
      Name
    </th>
  </tr>
  
  <tr>
    <td>
      @device:pnp:\?\usb#vid_046d&pid_085c&mi_00#7&18173bf5&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global
    </td>
    
    <td>
      c922 Pro Stream Webcam
    </td>
  </tr>
  
  <tr>
    <td>
      @device:pnp:\?\root#psycamera#0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}{9f25a503-ac24-460f-9196-8553ad691ef0}
    </td>
    
    <td>
      null
    </td>
  </tr>
  
  <tr>
    <td>
      @device:sw:{860BB310-5D01-11D0-BD3B-00A0C911CE86}{3403512D-FE5D-4D68-B053-E86D662E4D58}
    </td>
    
    <td>
      ChromaCam
    </td>
  </tr>
</table></figure> 

And there&#8217;s the null value.&nbsp; That was odd and we&#8217;ll get back that in minute.&nbsp; In the meantime, let&#8217;s fix that code.&nbsp; Instead of trying to be clever and use the Equals() function, I changed the code to just use the equals operator and let it handle the null check.&nbsp; That one line becomes:

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: csharp; highlight: [2]; title: ; notranslate" title="">
var dev = devs
  .Where(d =&gt; d.Name == "Microsoft® LifeCam HD-5000")
  .FirstOrDefault();
</pre>
</div>

I compiled the code and ran it.&nbsp; And it did nothing.&nbsp; Which is what I expected since I no longer had the LifeCam plugged in.&nbsp; More importantly, it didn&#8217;t throw an error.

I went back and added some Console.Writeln() statements so the app would at least say what it was doing or not doing.&nbsp; I built it again, zipped up the .dll & .exe files and added the [zip file](https://github.com/anotherlab/FocusUF/blob/master/win32/focusuf.zip) to a new win32 folder in the GitHub repository.&nbsp; So if you don&#8217;t have access to Visual Studio, you can grab just that zip file and get the FocusUF.exe app.&nbsp; But I&#8217;m not supporting that app.&nbsp; If it doesn&#8217;t work for you, just grab the code and compile it.

With the repo updated, it&#8217;s time to see what is our little null friend. If you look at the DevicePath, it has a wierd name buried in it. What is psycamera? If you google it, you find that a lot of people mispell &#8220;spy camera&#8221;. So that was no help. Names that are null set off my spidey senses. I wasn&#8217;t going to let that one just sit there with a look at it.

Going with the path of least resistance, I fired up Device Manager to see if something looked unfamilair or out of place. Sure enough, under &#8220;Cameras&#8221;, there was a new item named &#8220;Personify Virtual Camera Universal&#8221;. The Personify name was vaguely familiar [SPOILER ALERT] and I had a pretty good idea of what was going on, but I decided to double click on it and drill into the details.

[Literally](https://tenor.com/uMmi.gif) into the details. I selected the Details tab and select Device Instance Path from the drop-down list. That gave us this:<figure>

<img src="https://i0.wp.com/photos.smugmug.com/Blog/n-zwT5d/2020/i-pF6Z8M7/0/53d4ae95/L/psycamera-L.png" alt=""  /> </figure> 

And there is the mystery psycamera. Going back to the LINQPad dump, the third item that the list returned by GetDevicesOfCat was named ChromaCam. [ChromaCam](https://www.chromacam.me/) is a virtual webcam. It lets you replace your background with an image. And ChromaCam is made by a company named Personify. I&#8217;m not sure exactly what they are doing with the psycamera device, but it&#8217;s fairly innocuous. When I wrote the code two years ago, I did not have ChromaCam, so my code back then only had to deal with a single item in the devs list.

I did see if the code would compile with Visual Studio code and I think it would, but not [out of the box](https://stackoverflow.com/questions/47707095/visual-studio-code-for-net-framework). It looks like it would be more trouble than its worth. But I do recommend ChromaCam, it&#8217;s fun to play with.