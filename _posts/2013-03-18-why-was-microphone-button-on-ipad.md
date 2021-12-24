---
id: 17
title: Why was microphone button on the iPad virtual keyboard disabled?
date: 2013-03-18T03:03:00-05:00
layout: post
guid: http://www.rajapet.com/?p=17
permalink: /2013/03/18/why-was-microphone-button-on-ipad/
---
After demoing some voice dictation with an iPad app that I am working, the microphone button stopped working.  It was fine for one demo, disabled for the next one.  I could not figure out what had changed.  I kept seeing numerous references for [setting the dictation option](http://support.apple.com/kb/HT5176) and making sure that the iPad had a network connection.  Stuff like this [forum posting](https://discussions.apple.com/thread/4287366?tstart=0) on discussions.apple.com:

> It should be in Settings > General > Keyboard > Dictation, and will only then appear on the keyboard (to the left of the spacebar) if you are onlines &#8211; is that where you are looking in Settings ?

I had a good WiFi connection and I didn’t have a Settings > General > Keyboard > Dictation option.  I tried rebooting the iPad, no change.  The strange thing was that it working at 2pm and not at 5pm and no changes had been made to the iPad.  We have a pool of iPads that we sign out for testing, this one is the 3rd generation iPad and I have removed all of the apps that other people had installed.  The iPad has iOS 6.1.2 installed.

I saw the Bluetooth icon on the status bar.  It was not lit up, so it wasn’t connected to any devices.  So I went into the Bluetooth settings and saw this:

[<img loading="lazy" title="image" border="0" alt="image" src="https://i2.wp.com/lh4.ggpht.com/-wxyK8dxlXl0/UUaEDTQUEpI/AAAAAAAAAEQ/eDu2dv0iCWM/image_thumb%25255B2%25255D.jpg?resize=644%2C484" width="644" height="484"   />](https://i2.wp.com/lh6.ggpht.com/-yy35MSx5tVs/UUaEDOf_SoI/AAAAAAAAAEI/va-9jR_BD7w/s1600-h/image%25255B4%25255D.jpg)

I don’t have ZAGG Keyboard, but someone else must have paired this iPad to one.  In between the demos, I had borrowed another iPad that was in a ZAGG keyboard case.  It must have been in close enough proximity to the one that I was using so that my iPad picked up the other keyboard.  I turned off Bluetooth and the microphone button was back on the iPad keyboard.

That makes no sense.  The iPad was not connected to the ZAGG Keyboard, but it still disabled the microphone button on the onscreen keyboard.  I could not reproduce this with another iPad running iOS5 and a Logitech keyboard.  The microphone button stayed enabled with the keyboard on and off.  One thing comes to mind.  Apple and the keyboard manufactures need to come up with a keyboard button definition for the microphone.  If you are using an external keyboard, it’s annoying to have to bring up the onscreen keyboard to voice dictation.