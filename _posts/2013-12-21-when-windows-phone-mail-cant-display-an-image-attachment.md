---
id: 576
title: 'When Windows Phone Mail can&#8217;t display an image attachment'
date: 2013-12-21T19:54:48-05:00
layout: post
guid: http://www.rajapet.com/?p=576
permalink: /2013/12/21/when-windows-phone-mail-cant-display-an-image-attachment/
---
I came across a strange little problem [reported in answers.microsoft.com with Windows Phone 8 Mail](http://answers.microsoft.com/en-us/winphone/forum/wp8-wpcamera/unable-to-download-jpg-attachments-from-emails/69d1bb37-d2e5-40dc-952c-107b04557eac). It wasn&#8217;t downloading  jpg images.

The email app that comes with Windows Phone 8 does not display image attachments automatically. You need to tap on them and then they download and you can view them. That drives some people batty, but it saves on bandwidth and prevents web bugs from tracking you.

> When you view an image in an email, you are providing a lot of information about yourself to the sender. First of all, you are telling the sender that your address is active.  Which can mean more spam.  For that reason [Google is now sending all images coming in through GMail through a proxy server](http://gmailblog.blogspot.com/2013/12/images-now-showing.html).

A user reported that he couldn&#8217;t download images from mail. When he tapped on them, just just displayed the &#8220;Downloading&#8230;&#8221; status message.  We traded a few messages and nothing sounded out of the ordinary. So I asked him to me an email with one of those images. And he did.  He sent a few images in an email.  To keep thing simple, I&#8217;ll just refer to a single image and call it &#8220;foo bar.jpg&#8221;. His image had a different file name, but this one matches the naming convention with out using his personal information.

I saw the same thing.  Tapped on the image and saw the &#8220;Downloading&#8230;&#8221; display without ever getting the image. So I started playing around his message.  I used a GMail account and I viewed the message from the GMail web app.  Sure enough, it displayed the image just fine.  That ruled out the image being corrupt.

I saved the image to my PC and looked it with a few apps.  Nothing out of the ordinary, just an image from a Kodak digital camera, according the [EXIF](http://en.wikipedia.org/wiki/Exchangeable_image_file_format) data.

So I decided to poke around a bit. Using GMail, I sent the same picture to another gmail account that I have.  That worked just fine on my phone.  That was strange so I took another look at his email.  His email was sent from Windows Mail. So I sent the same picture to my gmail account from Windows Mail on Windows 8.1.

And I couldn&#8217;t open the picture from Windows Phone Mail.  I could create the problem on my end. That&#8217;s half the battle in fixing bugs, getting past &#8220;It works on my machine&#8221; stage.

<div style="width: 210px" class="wp-caption aligncenter">
  <img loading="lazy" alt="" src="https://i1.wp.com/www.rajapet.net/photos/i-vXzzQMW/0/O/i-vXzzQMW.png?resize=200%2C193" width="200" height="193" data-recalc-dims="1" />
  
  <p class="wp-caption-text">
    Image from the <a href="http://www.codinghorror.com/blog/2007/03/the-works-on-my-machine-certification-program.html">Coding Horror</a>
  </p>
</div>

To completely rule his picture being part of the problem, I went into Paint.Net and created a small jpeg and saved it as &#8220;test.jpg&#8221;. I sent that picture from Windows Mail to the GMail account, and sure enough that worked just fine.

I thought I was going down the right path, but another data point was mocking me. Mocking me to my face. Time to dig in deeper.  I went into GMail and opened up the message that had &#8220;foo bar.jpg&#8221; in it and selected &#8220;Show original&#8221; to see the actual message being sent.  It looked pretty normal, until I got to the part with the image attachment.

<pre>Content-Type: image/jpeg; name="=?utf-8?Q?Foo_Bar.jpg?="
Content-Description: =?utf-8?Q?Foo_Bar.jpg?=
Content-Disposition: attachment; name="=?utf-8?Q?Foo_Bar.jpg?="
Content-Transfer-Encoding: base64</pre>

After that the data for the image itself was included.  The image data was fine, but the file name seemed a little odd. The **=?utf-8?Q?** bit just says that the file name is UTF-8 encoded. The name itself had replaced the space in &#8220;foo bar.jpg&#8221; with an underscore to make &#8220;foo_bar.jpg&#8221;.

When I sent the email from GMail, the content header block for the image looked like this

<pre>Content-Type: image/jpeg; name="Foo Bar.jpg"
Content-Disposition: attachment; filename="Foo Bar.jpg"
Content-Transfer-Encoding: base64</pre>

Gmail did not replace the &#8221; &#8221; with a &#8220;_&#8221;.  When you viewed the both emails on the phone, the file name was displayed with the space. I copied the image to foobar.jpg and sent it from Windows Mail, it worked perfectly.

As near as I can tell, the problem is with the Windows Phone Mail app, everything else seems to handle the images correctly. The question thread has been passed along to Microsoft to take a closer look at.

I&#8217;m not anticipating a quick fix from Microsoft.  But it&#8217;s easy to get around this.  Don&#8217;t send images with spaces in the file name from Windows Mail. Use a different email app or rename the file.