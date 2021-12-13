---
id: 1293
title: 'Why the Virtual Keyboard on the Microsoft Band doesn&#8217;t work with Android and iOS'
date: 2015-06-24T10:21:52-05:00
layout: post
guid: http://www.rajapet.com/?p=1293
permalink: /2015/06/24/why-the-virtual-keyboard-on-the-microsoft-band-doesnt-work-with-android-and-ios/
---
<div id="attachment_1294" style="width: 335px" class="wp-caption alignnone">
  <a href="https://i1.wp.com/www.rajapet.com/wp-content/uploads/2015/06/BandVirtualKeyboard.gif"><img aria-describedby="caption-attachment-1294" loading="lazy" class="size-full wp-image-1294" src="https://i1.wp.com/www.rajapet.com/wp-content/uploads/2015/06/BandVirtualKeyboard.gif?resize=325%2C106" alt="Microsoft Band's Virtual Keyboard" width="325" height="106" data-recalc-dims="1" /></a>
  
  <p id="caption-attachment-1294" class="wp-caption-text">
    Microsoft Band&#8217;s Virtual Keyboard (image from Microsoft)
  </p>
</div>

Someone recently asked [why the Microsoft Band Virtual Keyboard only works with Windows Phone 8.1](http://answers.microsoft.com/en-us/band/forum/band_hardware/text-support/38ce710c-a4c6-412e-b10f-4ca3ddba33b5).  I&#8217;ve been using mine with my Lumia Icon and didn&#8217;t realize that replying to a SMS message only partially works in Android and not at all for iOS.  While there doesn&#8217;t appear to be any documentation explain why the functionality is missing from some platforms, I&#8217;ve made a semi-educated guess for the reasons.

With the Band, you have three basic ways of replying to an incoming SMS message .  You can send a predefined text message called a &#8220;quick reply&#8221;.  You can define up to four quick reply messages.  Two are already set up for you: &#8220;I&#8217;ll call you back&#8221; and &#8220;I&#8217;m in a meeting&#8221;.  You can change those two or add two additional through the Microsoft Health App.   They are handy to use when you are in a meeting and need to send a quick response back without having to be that person who plays with his phone during a meeting.

The quick reply messages work with Android and Windows Phone.  In addition to the quick reply messages, with Windows Phone 8.1 you can use a virtual keyboard  or voice dictation on the Band.  Both of which require Windows Phone 8.1.

Voice dictation uses [Cortana on Windows Phone 8.1](https://www.windowsphone.com/en-us/how-to/wp8/cortana/meet-cortana).  You speak into the Band, the audio data is sent to the Phone and Cortana converts it to text and sends it back to the Band.  You can preview the text and then send the reply to the message.  Right now Cortana is Windows Phone 8.1 (and Windows 10) technology.  Microsoft has [announced that they are porting it to Android and iOS](http://blogs.windows.com/bloggingwindows/2015/05/26/your-windows-10-pc-will-love-all-the-devices-you-own/), but it&#8217;s not available yet.  It&#8217;s also not known if the Cortana integration on Android and iOS will extend to working with the Band.

The Virtual Keyboard on the Band uses your phone to process your keypresses and swipes into text.  It uses the [Word Flow](https://www.windowsphone.com/en-us/how-to/wp8/settings-and-personalization/typing-shortcuts) technology in Windows Phone 8.1 to match the swipes to the appropriate word.  To support this on Android, Microsoft would need to port the Word Flow engine to Android.  It&#8217;s doable, but probably low on their backlog.

With iOS, we have a different story.  For an app, in this case the Microsoft Health app, to send an SMS message; it uses the SMS messaging API.  This is exposed through the [MFMessageComposeViewController](https://developer.apple.com/library/prerelease/ios//documentation/MessageUI/Reference/MFMessageComposeViewController_class/index.html) class.  The app composes the message using this class and then uses it to invoke the standard SMS composer view comes up.  The user can view or edit the message and then finally tap the send button to actually send the message.

By design, Apple does not allow apps to send SMS messages without the user confirming the message.  This is to prevent apps from spamming your contacts without your consent or knowledge.  There is a way to send messages without tapping anything on the phone, the Apple Watch supports that now.  At this time, that is handled by the Apple messaging app, I don&#8217;t think Apple has an API call for 3rd party devices to use.

It would be nice if Apple made a public API to allow wearable devices to send SMS messages, but I don&#8217;t see that happening any time soon.  Apple places a higher priority of preventing spam from being sent than allowing 3rd party device access.  Plus opening up directly sending a SMS would help a product that competes with the Apple Watch, and that&#8217;s not in Apple&#8217;s best interests.