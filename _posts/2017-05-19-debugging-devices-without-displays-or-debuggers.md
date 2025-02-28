---
title: Debugging devices without displays or debuggers
date: 2017-05-19
categories:
  - Coding
tags:
  - C
  - Debugging
  - Elatec
---
I've been writing firmware for an RFID reader that connects over USB to an Android device.  Our installers will need to upgrade the readers out in the field and they have no way of knowing which firmware has been installed.  The reader, an [Elatec TWN4](https://www.elatec-rfid.com/en/products/multi-technology-rfid-reader/housed/hf-lf-nfc-multi-technology/), has a pretty decent API that you write code for, using the C language.  Their API includes a wonderful function called &#8220;Beep&#8221;.  You pass in the volume, frequency, how to play the tone (in ms), and finally, how long to be quiet after the tone has been played.  So I have been setting the readers to play a few notes on power up.  This allows the installers to know which firmware has been installed.

The original firmware plays the opening notes to [&#8220;Smoke On The Water&#8221;](https://www.youtube.com/watch?v=ikGyZh0VbPQ).  Because anything that can produce at least 4 notes can play it.  The following C code will beep it's way through some vintage Deep Purple

{% gist 43e59d75423bba23673c834ce1d1f9d1 %}

We added some code to the firmware to allow our app to put the reader is a sleep mode.  Our installers will need to upgrade a few devices out in the field, so it was time to change that tune.  By checking a few different sites, we found simplified chord progressions for some recognizable songs.  My choices were restricted to simple note changes, you can’t generated complicated chords from a device that only knows how to beep.  It does that beep very well, but at the end of the day it’s only a beep.

 I needed to play something else to let the installers know that the firmware had been updated.  Something short, something simple, something simple.  One of my musically inclined co-workers worked out the opening notes of <a href="https://www.youtube.com/watch?v=9jK-NcRmVcw">&#8220;The Final Countdown&#8221;</a> by Europe.  That song has a distinctive opening riff.  <a href="https://www.youtube.com/watch?v=wITDyljrWuA">And</a> <a href="https://www.youtube.com/watch?v=vawrp_gMXJs">many</a> <a href="https://www.youtube.com/watch?v=S5AsyuNia5Y">cover</a> <a href="https://www.youtube.com/watch?v=6GRHANmafp0">versions</a>.  <a href="https://www.youtube.com/watch?v=FjeMDvCdrtc">Some</a> <a href="https://www.youtube.com/watch?v=3U36zas52wk">might</a> <a href="https://www.youtube.com/watch?v=W80X2KzRBFE">say</a> <a href="https://www.youtube.com/watch?v=bJJcrRstHBE">too</a> <a href="https://www.youtube.com/watch?v=fdlB_-2pBTo">many</a>.

 I found a <a href="https://www.audiology.org/sites/default/files/ChasinConversionChart.pdf">note to frequency conversion table</a> and used that to create a set of constants for the notes I needed.  That allowed me to specify the beeps with readable note constants, instead of the frequency values. You can get those constants <a href="https://gist.github.com/anotherlab/180855ddcb4c71a11d7ad4c0c243942b">here</a>.  With the use of those constants, you can play the opening notes of &#8220;The Final Countdown&#8221; with the following code:

 {% gist c3e2ebe72020a6df44902434e614687 %}

 When using the constants, the code is much easier to read.  And it becomes much easier to create new song intros. With that in place, the installers can quickly check the firmware version by powering up the RFID reader.  At some point I’ll refactor the code to just read the values from an array.  The current design is easy to setup and read, I may just stay with what works.

Right now, I need to use Elatec’s development tools to push the firrmware out via a simple GUI.  If I could get a command line tool for pushing the firmware out, I could add code to the firmware to return the version number from a query sent over USB.  That would allow me to write a simple app or Powershell script to identify a connected reader, query the version, and then push the update out.  If anyone from Elatec ever reads this, a command line firmware updater would be very helpful.

Decades of using development tools like Visual Studio has accustomed me to being able to use a debugger to step through the code.  Writing code where you can’t visually debug it, requires thinking out side the box.  I can test much of the code by having the reader send back text, but when testing with the device that it will be hooked up to, that would interfere with how they work.  Sometimes you just have to use a different path out of the machine to see what it’s doing.
