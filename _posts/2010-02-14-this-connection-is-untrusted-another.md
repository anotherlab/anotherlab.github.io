---
title: This connection is Untrusted (another ID10T error)
date: 2010-02-14T19:10:00-05:00
---
The other day, my PC died.  After some angst, I was able to [fix it by replacing the power supply](http://anotherlab.rajapet.net/2010/02/what-do-you-mean-computer-wont-turn-on.html "What do you mean the computer wont turn on?").  After starting the PC, I fired up Firefox to check my email.  That’s when the first error message popped up.  I was presented with this lovely error dialog.

[<img loading="lazy" title="SecureConnectionFailed" border="0" alt="SecureConnectionFailed" src="https://i1.wp.com/lh3.ggpht.com/_natoSxTaPFU/S3hKtg-YufI/AAAAAAAAAZs/b3fIYhR2eJs/SecureConnectionFailed_thumb3.png?resize=358%2C162" width="358" height="162"   />](https://i2.wp.com/lh3.ggpht.com/_natoSxTaPFU/S3hKtJSmaGI/AAAAAAAAAZo/2jHsuLhWuSY/s1600-h/SecureConnectionFailed5.png) 

Lovely.  This came from [Xmarks](http://www.xmarks.com/ "Offers bookmark synchronization, search enhancement and web discovery based on sites bookmarked by users."), a browser add-in that I use to keep my browser books marks synchronized across multiple machines.  Which is a really cool thing to have, but I digress.  Still, check it out.

I didn’t play too much attention to it when I saw it.  I just figured it was a glitch on the Xmarks site and cancelled out of it.  I should have paid more attention to it, that dialog had the clue to explain what the problem was.

After cancelling that dialog, I went to my webmail account.  I host my rajapet.net email account through Google Apps and I have HTTPS url to get into the email.  That brought up the “This connection is Untrusted” dialog.

[<img loading="lazy" title="ThisCertificateIsUntrusted" border="0" alt="ThisCertificateIsUntrusted" src="https://i0.wp.com/lh6.ggpht.com/_natoSxTaPFU/S3hKuJkVnNI/AAAAAAAAAZ0/X10GFblQGKs/ThisCertificateIsUntrusted_thumb1.png?resize=351%2C196" width="351" height="196"   />](https://i0.wp.com/lh4.ggpht.com/_natoSxTaPFU/S3hKtwOwcyI/AAAAAAAAAZw/J6XRghjMalQ/s1600-h/ThisCertificateIsUntrusted3.png) 

Oh joy. I just figured that their SSL certificate had expired and I clicked through that one.  I went to my GMail account and the same thing happened.  I tried a few other sites, every site that used a SSL certificate did the same thing.  What did I break?

When I followed the motherboard vendor suggestion of [resetting the bios](http://anotherlab.rajapet.net/2010/02/what-do-you-mean-computer-wont-turn-on.html#biosreset), that included resetting the clock.  My PC date was set to January 1st, 2001.  That was causing the SSL certificate grief.  When you get a SSL certificate for your site, it has a starting and ending date.  Lets take a close look at the error message from the Xmarks add-in.

[<img loading="lazy" title="SecureConnectionFailedClip" border="0" alt="SecureConnectionFailedClip" src="https://i2.wp.com/lh4.ggpht.com/_natoSxTaPFU/S3hKvOtLYJI/AAAAAAAAAZ8/tpH0hPUxD5o/SecureConnectionFailedClip_thumb%5B1%5D.png?resize=359%2C94" width="359" height="94"   />](https://i0.wp.com/lh6.ggpht.com/_natoSxTaPFU/S3hKuo7nAkI/AAAAAAAAAZ4/zD8Ua9r3Rlc/s1600-h/SecureConnectionFailedClip%5B3%5D.png) 

The earliest date that this certificate would be considered valid for was 2/6/2009.  Had I paid closer attention to the error dialog, I would seen that my clock was off.  I went into the Windows clock applet and synched up with a time server and everything went back to normal.  Then I rebooted the machine and went into the BIOS settings to make sure everything was the way I liked.  File this as an [ID10T](http://ars.userfriendly.org/cartoons/?id=19990211) error.
