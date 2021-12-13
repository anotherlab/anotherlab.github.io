---
id: 1402
title: Get AMPed for faster page loading on mobile
date: 2016-02-25T13:53:41-05:00
layout: post
guid: http://www.rajapet.com/?p=1402
permalink: /2016/02/25/get-amped-for-faster-page-loading-on-mobile/
---
<div class="getty embed image" style="background-color: #fff; display: inline-block; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; color: #a7a7a7; font-size: 11px; width: 100%; max-width: 508px;">
  <div style="padding: 0; margin: 0; text-align: left;">
    <a style="color: #a7a7a7; text-decoration: none; font-weight: normal !important; border: none; display: inline-block;" href="http://www.gettyimages.com/detail/200009696-001" target="_blank">Embed from Getty Images</a>
  </div>
  
  <div style="overflow: hidden; position: relative; height: 0; padding: 66.141732% 0 0 0; width: 100%;">
  </div>
  
  <p style="margin: 0;">
    </div> 
    
    <p>
      I just updated this blog to use the <a href="https://wordpress.org/plugins/amp/">Accelerated Mobile Pages (AMP) plugin</a> for WordPress.  <a href="https://www.ampproject.org/">AMP</a> is an open source project designed to optimize page content for mobile pages.  It uses a subset of HTML and some JavaScript to trim down the content of a web page.  <a href="https://amphtml.wordpress.com/2015/12/14/building-a-faster-mobile-web-experience-with-amp/">Early testing</a> has shown that AMP pages load four times faster and use eight times less data than a traditional web page.
    </p>
    
    <p>
      AMP filters out 3rd party JavaScript code (aside from the AMP code), which basically takes out every analytics package.  Iframe and object tags are stripped out.  The HTML5 multimedia tags (img, video, audio) are replaced with custom elements (amp-img, amp-video, amp-audio).  On a page that uses the AMP runtime, a hidden link is added that provides the URL to AMP optimized version of the web page.  With the WordPress plugin, the AMP page is the original URL with &#8220;/amp&#8221; appended to it.  This will work on any hosted WordPress site.  Self hosted sites would need to add the plugin.
    </p>
    
    <p>
      For this blog post, if you want to see the AMP version, click <a href="http://www.rajapet.com/2016/02/get-amped-for-faster-page-loading-on-mobile.html/amp">here</a>.  It will load much faster, but without any special styling.  The banner image will be gone.  I like to use images from the Getty collection and as part of the terms of use, you have to embed the image with their custom template and that template puts the image in an iframe.  And since iframes are forbidden in AMP HTML, good bye image.
    </p>
    
    <p>
      The AMP runtime manages the amp-* HTML tags and can manage the loading and unloading of the resources. CSS is also limited for performance reasons.  That trade off gives you the performance boost on mobile.  AMP is already being used by sites like <a href="https://engineering.pinterest.com/blog/building-faster-mobile-web-experience-amp">Pinterest</a>, <a href="https://amp-by-example.appspot.com/amp-twitter.html">Twitter</a>, <a href="http://www.nytco.com/the-times-is-experimenting-with-google-amp-project/">New York Times</a>, <a href="http://www.theverge.com/2015/10/7/9467149/google-accelerated-mobile-pages-caching-preview">The Verge</a>.
    </p>
    
    <p>
      AMP is not for everyone.  It is basically serving up a subset of your experience and you will lose custom animations, analytics, etc.  So where is it useful?  When you want a page to load as fast as it can.  Like a status page for service.  Google is already indexing AMP pages.  While it&#8217;s not currently giving preference to AMP pages, it does rank pages by page load.  AMP is open source and you can view the code on GitHub in the <a href="https://github.com/ampproject/amphtml">ampproject</a> repository.
    </p>