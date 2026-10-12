---
title: Exporting SMS/MMS messages from Windows Phone 8
date: 2015-06-06T12:33:14-05:00
---
<div style="width: 810px" class="wp-caption alignnone">
  <img loading="lazy" class="" src="https://i0.wp.com/www.rajapet.net/Other/2015-Blog/i-9Sk9kxF/0/L/Windows%20Phone%20Message%20Backup-L.png?resize=680%2C383" alt="" width="680" height="383"  />
  
  <p class="wp-caption-text">
    Windows Phone Message Backup as displayed in the Windows Store
  </p>
</div>

An annoyance with Windows Phone 8 is the lack of any built in facility to export your text messages.  It&#8217;s easy to have the messages backed up, but you can only access them from your phone.

While reading a [message thread](http://answers.microsoft.com/en-us/winphone/forum/wp8-wptext/sms-backup/daabcc3e-696c-4536-b501-b161eb06668a) in the Windows Phone Community forum, I came across a mention of an app for Windows 8 called &#8220;Windows Phone Message Backup&#8221;.  It&#8217;s from Tafidi, and it just works.  You can get it from this [link](http://apps.microsoft.com/windows/app/794c9b46-5a7d-4199-89d6-3d8d613e6d28).

You will need to have previously enabled the text message backup on your phone.  For more details on how to enable the message backup, go to the [Back Up My Stuff](https://www.windowsphone.com/en-us/how-to/wp8/settings-and-personalization/back-up-my-stuff) page and scroll down to **Text Messages** section.

When you run the app, it asks you for the Microsoft account that you use your phone with.  If you have enabled two factor authentication (and you really should do that), create a new [app password](https://account.live.com/proofs/AppPassword?mkt=en-us) and use that.

Once it has authenticated under your account, it will download your message history.  This may take a few minutes.  After the messages are downloaded, they will be grouped by the other party in the message.

To export the messages, you will need to select the other party from the list and then right-click on the message thread.  That will open up a toolbar panel that will allow you to export the messages as text or as an image.

Right now for text, the  only text format is supported is ASCII text, but since that format is listed as a choice, I&#8217;m assuming that other formats will be a later release.

For image exports, you get a long PNG formatted image of the entire message thread, but without the images.  That&#8217;s kind of a big limitation.  You could make screenshots from the app itself, but you would be limited to what fits on the screen.  But that does allow you to capture the images.

So if you need to export SMS messages, this is pretty much the only game in town that works across the carriers.  Different wireless carriers may offer their own tools for accessing the text messages.  I use Verizon Wireless and they have a [decent portal](https://web.vma.vzw.com/vma/webs2/Message.do) that allows you to access messages and also to send and receive them without going through the phone.
