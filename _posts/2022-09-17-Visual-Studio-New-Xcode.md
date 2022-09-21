---
title:  Running the iOS simulators after updating to Xcode 14
date:   2022-09-17
largeimage: /assets/giger-dev-001.png
categories: 
  - Coding
  - VisualStudio
  - Xcode
tags: 
  - Xamarin
  - Maui
  - xcode-select  
---
{:refdef: style="text-align: center;"}
![Deployment Target](/assets/giger-dev-001.png)
{: refdef}
So Apple updated Xcode on my Macbook from 13.4.1 to 14. I wasn't paying much attention to the prompts or even the version numbers. After doing so, I could not longer access the iOS Simulators from Visual Studio. This happened for both Xamarin.Forms projects and for Maui. From Windows or the Mac, it was broken. 

From the Mac, when I went to pick a simulator for a Maui project, this happened with [Visual Studio 2022 17.4, Preview 2](https://learn.microsoft.com/en-us/visualstudio/releases/2022/mac-release-notes-preview#17.4.0-pre.2?WT.mc_id=DT-MVP-5000200).

{:refdef: style="text-align: center;"}
![Lower the 'Deployment Target'?](/assets/no_sim_edit.png)
{: refdef}

That "Lower the 'Deployment Target' to see the older simulators or check your Apple SDK path" message was somewhat less than helpful. I couldn't figure out where to even set the Deployment target in Dotnet Maui. 

I then loaded up a Xamarin.Forms app that was working fine a few days ago and saw the same results. I guess at this moment in time, Xcode 14 is not fully suppported. At some point it will all line up again, but in the meantime I need some iOS simulation. This wasn't a regression in VS 17.4, this was Apple. Time to rollback Xcode and give that a shot.

Xcode is actually pretty decent about handling this. You can have multiple versions of Xcode installed and change up which one is the one that answers the call to duty. If you trying out Xcode betas, this is the way. All you need is gigabytes of disk storage and the patience to download and install the Xcode bits.

The first thing that you need to do is to download the version of Xcode to install. You can get every release of Xcode from xcodereleases.com. While that site is not Apple affiliated with Apple, all of the download links are from developer.appple.com. They are the official releases. I grabbed the final the Xcode 13 release, 13.4.1 from [here](https://developer.apple.com/services-account/download?path=/Developer_Tools/Xcode_13.4.1/Xcode_13.4.1.xip).

[Extract](https://osxdaily.com/2018/11/02/open-extract-xip-file-mac/#:~:text=Assuming%20you%20haven't%20associated,the%20Finder%20of%20Mac%20OS.) the contents of the .xip file. It will be named Xcode.app. Since you already have an Xcode.app in the Applications folder, you'll need to rename it. My preference is to name it with version. In this case, Xcode13_4_1.app. Then drag it to the Applications folder.

And then make it the default Xcode. From a shell, run the following

{% highlight shell %}
sudo xcode-select -s /Applications/Xcode13_4_1.app
{% endhighlight %}

To verify that this is now the current version of Xcode, run the following

{% highlight shell %}
sudo xcode-select -p
{% endhighlight %}

That should come back with something like

{% highlight shell %}
/Applications/Xcode13_4_1.app/Contents/Developer
{% endhighlight %}

After doing that, I restarted Visual Studio and I had the simulators back

{:refdef: style="text-align: center;"}
![Thar be simulators'?](/assets/yes_sim_edit.png)
{: refdef}


To switch back to latest version, just run xcode-select again

{% highlight shell %}
sudo xcode-select -s /Applications/Xcode
{% endhighlight %}


After posting this, a friend [posted](https://twitter.com/BiloganSteve/status/1571477869817204738) with a link to where this issue was raised.  It's posted as an issue in the [xamarin/xamrin-macios](https://github.com/xamarin/xamarin-macios/issues/15954) repo.