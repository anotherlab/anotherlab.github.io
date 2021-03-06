---
title: Why I like working on Open Source (back to FocusUF)
date: 2020-04-26T00:52:17-05:00
categories:
  - Annoyances
  - Coding
---
About a month ago, I blogged about [an update to a webcam hack](/2020/03/20/return-to-focusuf/) that I did called FocusUF. There wasn&#8217;t much to the code and I put it all up on GitHub. Someone came along and submitted a pull request that added some cool functionality.  

My version was hardcoded to a single webcam. Because that&#8217;s all I need it for. At the time, I was using a Microsoft LifeCam HD-5000. Someone else created an issue on my GitHub repo asking if I could add support for the HD-6000, which apparently suffers from the same annoyances with focus.

I was going to add a command-line parameter to FocusUF to allow you to specify all or part of the webcam name, but someone else beat me to it. [Cain Hopwood](https://github.com/cainhopwood) updated my code to add that and a bunch of other useful command-line switches. And somehow, I had missed his [PR](https://github.com/anotherlab/FocusUF/pull/2) when it was submitted a month ago.

So I tossed my changes out the window and accept the pull request. It was [pretty good](https://www.youtube.com/watch?v=kRz8-EXlhBo). After merging the changes, I added a couple of things. Cain added code to list all of the webcams. That would fail if you have any webcams that didn&#8217;t support the IAMCameraControl interface from the DirectShowLib. If you have software that runs as a [virtual](https://www.xsplit.com/vcam) [webcam](https://www.chromacam.me/), it probably doesn&#8217;t support IAMCameraControl.  Now when you run it without any parameters, you get the following usage help:

{% highlight plainttext %}
FocusUF 1.2.0.0
Get the source at https://github.com/anotherlab/FocusUF

Usage: FocusUF [--help | -?] [--list-cameras | -l]
[--focus-mode-manual | -fm] [--focus-mode-auto | -fa]
[--set-focus | -f ]
[--exposure-mode-manual | -em] [--exposure-mode-auto | -ea]
[--set-exposure | -e ]
[--camera-name | -n ]
{% endhighlight %}
 

Now when you ask it to list the cameras, you get the following output:

{% highlight powershell %}
.\FocusUF.exe -l
{% endhighlight %}
{% highlight plainttext %}
FocusUF 1.2.0.0
Get the source at https://github.com/anotherlab/FocusUF
Camera: c922 Pro Stream Webcam
    Focus Capability: Auto, Manual
    Focus Range: 0 - 250
    Focus Setting: Auto, 0
    Exposure Capability: Auto, Manual
    Exposure Range: -11 - -2
    Exposure Setting: Auto, -5
Camera: XSplit VCam
    Camera does not expose settings through DirectShowLib
{% endhighlight %}


I also made the search by name case insensitive. That was low hanging fruit. I also updated the compiled version of the code at [focusuf.zip](https://github.com/anotherlab/FocusUF/blob/master/win32/focusuf.zip). While I don&#8217;t support this as a product, it&#8217;s useful for people who don&#8217;t have the compiler installed. And I updated the readme file to document the new changes.

And to go off on a tangent, I&#8217;ve been using a tool (Windows only) named [Markdown Monster](https://markdownmonster.west-wind.com/) to edit the readme files. Markdown Monster is written and supported by [Rick Strahl](https://medium.com/@RickStrahl_13614). You can try it for free and then buy a cheap license for it. Working in Markdown is fairly easy, but it has its own syntax to learn. Markdown Monster gives you a [nice editor](https://medium.com/markdown-monster-blog/why-use-a-dedicated-markdown-editor-1aff2aaad42) with full preview and it makes updating the readme file one less thing to think about.

And that&#8217;s one of the great things about [open-source](https://dev.to/danielshow/an-easy-approach-to-contribute-to-open-source-1d6i) software. Other people can jump in and contribute. I wrote a little tool to fix something that was bugging me. It sparked joy with someone and he added some additional joy to fix something that he needed.
