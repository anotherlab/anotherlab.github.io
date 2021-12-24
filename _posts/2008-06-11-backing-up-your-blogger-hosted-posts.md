---
id: 158
title: Backing up your Blogger hosted posts
date: 2008-06-11T16:39:00-05:00
layout: post
guid: http://www.rajapet.com/?p=158
permalink: /2008/06/11/backing-up-your-blogger-hosted-posts/
---
This blog is hosted on Google&#8217;s Blogger platform.  It has it&#8217;s own domain name, but it&#8217;s still on Blogger.  While I have faith in our Google Overlords, I still like keeping a local backup of the blog posts.  There&#8217;s a nice open source Blogger backup utility named &#8220;Blogger Backup&#8221;.  It&#8217;s written <strike>in C#</strike> in VB.NET and is [hosted on CodePlex](http://www.codeplex.com/bloggerbackup).

When it&#8217;s running, you&#8217;ll see a window that looks like this:

<map name="phoMap_30016">
  <area href="http://www.photrade.com/forwardAd.php?photo_id=30016" />
</map>

[<img src="https://i1.wp.com/www.photrade.com/photos/personal_30016_430x350_0_0_1_0.jpg?w=680" usemap="#phoMap_30016"  />](http://www.photrade.com/ChrisMiller?photo_id=30016)  
_[Sell photos on photrade](http://www.photrade.com/) | [By Chris Miller](http://www.photrade.com/ChrisMiller)_ 

You save each post as it&#8217;s own file, or put them all inside one big, honkin&#8217; file.  The posts are saved as XML to make it easier to process.  You can use Blogger Backup to restore the posts back to your blog.  That would be handy if you accidentally delete a blog post.  You could also use the saved XML files to port your blog to another platform.  While I have no intention of moving this blog off of Blogger, it&#8217;s good to know that I would have a way of migrating all of my posts to a new platform.

Blogger Backup is a .NET application, you&#8217;ll need to have the .NET Framework 2.0 installed.  To communicate with Blogger, it uses the [GData.Net](http://code.google.com/p/google-gdata/ "The GData .NET Client Library provides a library and source code that make it easy to access data through Google Data APIs.") (Google Data API for .NET) library.  I wasn&#8217;t familiar with GData, it&#8217;s a [Apache licensed](http://www.apache.org/licenses/LICENSE-2.0) API that provides programmable access to many of Google&#8217;s services:

  * Base 
  * Blogger 
  * Calendar 
  * Spreadsheets 
  * Google Apps Provisioning 
  * Code Search 
  * Notebook 
  * Picasa Web Albums 
  * Document Feed 
  * Contacts 
  * YouTube 
  * Google Health 

GMail is not on the list, but that would be asking for trouble.  The last thing we need is a Google API for sending spam through GMail.  The API is not limited to .NET, they have versions for Python, Java, and Objective-C.  I think you could do some interesting things with the GData API and their Calendar.

If you are wondering about the screenshot, I&#8217;m playing around with the beta for [Photrade](http://photrade.com/).  It has some cool features, it&#8217;s worth checking out.

_[Updated on 6/12/2008]  
_ For some reason I thought Blogger Backup was written in C#, when it’s actually VB.NET.