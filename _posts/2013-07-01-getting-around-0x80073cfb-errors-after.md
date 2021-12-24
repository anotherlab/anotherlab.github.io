---
id: 10
title: Getting around 0x80073cfb errors after installing Windows 8.1 Preview
date: 2013-07-01T04:34:00-05:00
layout: post
guid: http://www.rajapet.com/?p=10
permalink: /2013/07/01/getting-around-0x80073cfb-errors-after/
---
As an attendee of the [//build/](http://www.buildwindows.com/) conference, I received a Surface Pro and an [Acer Iconia W3](http://us.acer.com/ac/en/US/content/series/iconiaw3), along with a USB drive with the Windows 8.1 Preview update for each device. After installing 8.1, Windows Store on the Surface Pro showed that there a bunch of apps that needed updates. So I updated them all and it failed to update five of the apps:

  * Reader
  * Windows Alarms
  * Windows Calculator
  * Windows Reading List
  * Windows Sound Recorder

<div>
  Under the app name, there was the message &#8220;This app wasn&#8217;t installed &#8211; view details.&#8221;. When you click on the message, a dialog would come up with the following message:
</div>

<div>
</div>

> Something happened and this app couldn&#8217;t be installed. Please try again. Error code: 0x80073cb

<div>
  You got two buttons, &#8220;Try again&#8221; and &#8220;Cancel install&#8221;.
</div>

<div>
</div>

Each one reported reported the same error code 0x80073cfb. That error code is defined as ERROR\_PACKAGE\_ALREADY_EXISTS ([see here](http://msdn.microsoft.com/en-us/library/windows/desktop/hh973484(v=vs.85).aspx)) and it basically means that something is wrong with the app signature. It kind of matches, but not exactly and Windows doesn&#8217;t know how to proceed.

<div>
</div>

<div>
  <table align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td>
        <a href="http://www.rajapet.net/Other/blog/4420877_ZCzCW6#!i=2607508140&#038;k=VbhsGTf&#038;lb=1&#038;s=A" title=""><img alt="" src="https://i0.wp.com/www.rajapet.net/photos/i-VbhsGTf/0/L/i-VbhsGTf-L.jpg?w=680" title=""  /></a>
      </td>
    </tr>
    
    <tr>
      <td>
        <span>&#8220;We had to destroy the village in order to save it.&#8221;</span>
      </td>
    </tr>
  </table>
</div>

<div>
  The simplest way around this is to uninstall the version that is already on the machine and then install it again from the Windows Store. It&#8217;s annoying, but doesn&#8217;t take that long. I did it the following way:</p> 
  
  <p>
  </p>
  
  <ol>
    <li>
      Run the Windows Store app and have it try to update the apps
    </li>
    <li>
      Get the errors and while on the &#8220;Installing apps&#8221; screen, then press the Win key to get back the Metro screen
    </li>
    <li>
      Start typing the app name.  When the app appears, do a long press to get the options menu and select uninstall.
    </li>
    <li>
      Go back to the Windows Store app and click on the app that you deleted.  You&#8217;ll see the &#8220;Something happened&#8221; dialog, click the &#8220;Try again&#8221; button.
    </li>
    <li>
      The app should install without any problems now.
    </li>
  </ol>
  
  <p>
    I would love to find a way to script this with Power Shell. What would be nice would be if the Windows Store app would give you an uninstall/reinstall option when it encounters 0x80073cfb errors. I&#8217;m <a href="http://answers.microsoft.com/en-us/windows/forum/windows8_1_pr-windows_store/app-store-error-0x80073cfb-w-81-preview/e9dcdbc6-b618-4e4b-83c7-81229927ab0d" target="">not the only person</a> <a href="http://qnundrum.com/answer.php?q=715994">seeing this</a> and it&#8217;s happening with the Acer, just with a different set of apps. On Acer, it gets that error with these apps:
  </p>
  
  <p>
  </p>
  
  <ul>
    <li>
      Windows Alarms
    </li>
    <li>
      Bing Food & Drink
    </li>
    <li>
      Help & Tips
    </li>
    <li>
      Bing Health & Fitness
    </li>
    <li>
      Windows Reading List
    </li>
  </ul>
  
  <p>
    There is some overlap, but only with 2 of the apps. With the Acer, I found that if I burned Alarms, Help, and Reading List, the Bing apps installed normally. I also had the same problem with the HP Envy 23 that I bought last December. I had to burn the village to save the village on that machine too.
  </p>
  
  <p>
    The burning village image comes from <a href="http://www.flickr.com/photos/stillgray/sets/72157632889684726/with/8517902677/" target="_blank">The Witcher 3 Set</a>, from the Flickr feed of <a href="http://www.flickr.com/photos/stillgray/">Gameranx</a>.</div>