---
title: On sharing media files between Windows Phone and OS X
date: 2015-10-19T16:08:09-05:00
---
<img loading="lazy" class="aligncenter" src="https://i1.wp.com/www.rajapet.net/Other/2015-Blog/i-KPZnLnc/0/S/Windows-Phone-File-Transfer-for-Mac-S.png?resize=400%2C158" alt="" width="400" height="158"  />There used to be a Windows Phone Connector app in the Mac App store.  It was the way to directly copy music and images to and from a Windows Phone and a Mac.  That app apparently stopped working when [Yosemite](https://en.wikipedia.org/wiki/OS_X_Yosemite) was released and some time ago Microsoft pulled the app from the Mac App store.

The question of how sync music from a Mac to a Windows Phone comes up in the forums every now and then.  Well, not that often.  The Venn diagram of OS X and Windows Phone users has a very tiny overlap area.  I reached out the Windows Phone account on Twitter and had the following exchange:

<blockquote class="twitter-tweet" lang="en">
  <p dir="ltr" lang="en">
    <a href="https://twitter.com/LumiaHelp">@LumiaHelp</a> Is there a version of the Windows Phone Connector for Mac that works with El Capitan?
  </p>
  
  <p>
    — Chris Miller (@anotherlab) <a href="https://twitter.com/anotherlab/status/654368326236438528">October 14, 2015</a>
  </p>
</blockquote>



<blockquote class="twitter-tweet" lang="en" data-conversation="none">
  <p>
    <a href="https://twitter.com/anotherlab">@anotherlab</a> 1/2 Windows Phone customers are still able to sync with their Mac by using third-party​ cloud services. We removed
  </p>
  
  <p>
    — Lumia Help (@LumiaHelp) <a href="https://twitter.com/LumiaHelp/status/656180841542868992">October 19, 2015</a>
  </p>
</blockquote>



<blockquote class="twitter-tweet" lang="en" data-conversation="none">
  <p dir="ltr" lang="en">
    <a href="https://twitter.com/anotherlab">@anotherlab</a> 2/2 the app so we could focus our resources elsewhere. ^JR
  </p>
  
  <p>
    — Lumia Help (@LumiaHelp) <a href="https://twitter.com/LumiaHelp/status/656180889123028992">October 19, 2015</a>
  </p>
</blockquote>



Windows Phone uses [MTP](https://en.wikipedia.org/wiki/Media_Transfer_Protocol) (Media Transfer Protocol) as the way to expose your documents to other devices.  Apple does not do MTP, at least not at a way that exposes it to Finder or iTunes.  It does support it partially within some apps, for the purpose of accessing photos from cameras that connect as MTP devices, but only within that context.

Since OS X does not have any file system support for MTP devices, you have two choices.  You can try locating a 3rd party MTP app or go the cloud.

One OS X app that I came across is named [SyncMate](http://mac.eltima.com/sync-mac.html).  It says it will allow you to sync up Android and MTP devices, so it should work.  It&#8217;s not free, but if you have a bunch of devices that your Mac just doesn&#8217;t play well with, it&#8217;s worth checking out.

There is a free app call [XNJB](http://www.wentnet.com/projects/xnjb/) that provides MTP support, but it looks like it has not been updated in a  few years.  I would be surprised if it still worked.  I would imagine that whatever changes that Apple made to OS X to break Microsoft&#8217;s app would have also broken XNJB.

Microsoft&#8217;s suggested solution is to use cloud services.  Like OneDrive or Dropbox.  If you have a Windows Phone, you should be using OneDrive to backup your photos.  But for transferring music, that&#8217;s awkward and slow.  If you like to change your music frequently from your own collection, using a  cloud service to transfer the music across will work. But your&#8217;re not going to like it.

If you use a Mac, the user experience with Windows Phone (and Android to a lesser degree) is going to be less than optimal.  Apple wants a walled garden and they generally achieve it.  I can&#8217;t imagine the number of people who only have a Mac and a Windows Phone to be a large number.  I can see why Microsoft hasn&#8217;t done anything to update their Connector app.   It&#8217;s hard to justify spending the development cycles on a product with a tiny user base.
