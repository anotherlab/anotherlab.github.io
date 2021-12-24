---
id: 2639
title: And then my blog was defaced
date: 2017-02-21T16:08:58-05:00
author: Chris Miller
layout: post
guid: http://rajapet.com/?p=2639
permalink: /2017/02/21/and-then-my-blog-was-defaced/
collect_box_size:
  - collect-square
categories:
  - WordPress
tags:
  - WordPress
---
<div class="getty embed image" style="background-color: #fff; display: inline-block; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; color: #a7a7a7; font-size: 11px; width: 100%; max-width: 509px;">
  <div style="padding: 0; margin: 0; text-align: left;">
    <a style="color: #a7a7a7; text-decoration: none; font-weight: normal !important; border: none; display: inline-block;" href="http://www.gettyimages.com/detail/540848970" target="_blank">Embed from Getty Images</a>
  </div>
  
  <div style="overflow: hidden; position: relative; height: 0; padding: 66.601179% 0 0 0; width: 100%;">
  </div>
  
  <p style="margin: 0;">
    </div> 
    
    <p>
      A couple of weeks ago my blog was defaced through a security hole in <a href="https://wordpress.org/">WordPress</a>. About 800,000 blogs were hit via something called the REST-API exploit. I saw something like this on the main page of my blog
    </p>
    
    <p>
      <div style="width: 347px" class="wp-caption alignnone">
        <img loading="lazy" class="size-medium" src="https://i2.wp.com/photos.smugmug.com/photos/i-2GtTbXb/0/S/i-2GtTbXb-S.jpg?resize=337%2C300&#038;ssl=1" width="337" height="300"  />
        
        <p class="wp-caption-text">
          Hacked message
        </p>
      </div>
    </p>
    
    <p>
      I blurred out the identifying text and graphics.  No sense giving any credit to the ones behind the hack.  I actually support their cause, but not this kind of stuff.
    </p>
    
    <p>
      At that point I had no idea what had happened.  I figured it was either someone had hacked the OS or someone had hacked WordPress.  I went in and deleted the post and then my blog stopped working.  I was too busy at the time to deal with it, so I just shut the blog down.  I was running a virtual machine up in the cloud and I had installed Linux, MySQL, and WordPress manually,  I recommend doing that at least once.  But no more than just once.  I had to manually edit a bunch of files so that my WordPress site was the default site for the machine.
    </p>
    
    <p>
      I then found out that the problem was caused by <a href="https://blog.sucuri.net/2017/02/content-injection-vulnerability-wordpress-rest-api.html">a security hole in WordPress 4.7.0/4.7.1</a> that had since been quietly patched in 4.7.2.  My blog was not set up to automatically update WordPress, so it was one of the 800k that had been hit.
    </p>
    
    <p>
      <div style="width: 522px" class="wp-caption alignnone">
        <a title="By Alex E. Proimos (http://www.flickr.com/photos/proimos/4199675334/) [CC BY 2.0 (http://creativecommons.org/licenses/by/2.0)], via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File%3AParis_Tuileries_Garden_Facepalm_statue.jpg"><img loading="lazy" src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Paris_Tuileries_Garden_Facepalm_statue.jpg/512px-Paris_Tuileries_Garden_Facepalm_statue.jpg" alt="Paris Tuileries Garden Facepalm statue" width="512" height="342" /></a>
        
        <p class="wp-caption-text">
          I should have had automatic updates turned on
        </p>
      </div>I had backups of the blog, so I knew I could get it back up and running.  I decided to take some time and start over again.  While it would be easy to just delete the posts, there reports that Remote Command Execution (RCE) attacks were being attempted through this exploit.  I don&#8217;t think that I had any plugins that would allow a RCE attack, but I decided to err on the side of caution.
    </p>
    
    <p>
      I looked at some of the sites that offer WordPress hosting, but I decided to do it in a VM again.  The price is roughly the same as some of the cheaper hosting plans, but I would have full control over the site.  I would also have full responsibility for keep it up and running too, there&#8217;s never a free lunch.
    </p>
    
    <p>
      Instead of installing everything myself, I used <a href="https://bitnami.com/stack/wordpress" target="_blank">Bitnami&#8217;s one-click WordPress installer</a>.  In the Azure marketplace, Bitnami has an installer that will install the server edition of <a href="https://en.wikipedia.org/wiki/Ubuntu_version_history#Ubuntu_14.04_LTS_.28Trusty_Tahr.29">Ubuntu 14.04 LTS &#8220;Trusty Tahr&#8221;</a> with all of the bits to run WordPress.  The &#8220;LTS&#8221; designation is important, it stands for Long Term Support and this version will be supported until April, 2019.  It included the <a href="https://www.phpmyadmin.net/">PhpMyAdmin tool</a> for managing MySQL databases.  I created a new database and restored the table with the posts from my old blog.  I backed up the new blog database (just to be safe).  I tried installing all of the rows from that table into the new blog, but that broke the blog.  Something in the hacked posts was probably doing something bad.  I restored the new blog from the backup and then exported the old blog posts up to the date that it was hacked.  I restored those records and the blog was happy.
    </p>
    
    <p>
      So the blog was more or less ready to go at this point.  I installed <a href="https://vaultpress.com/">VaultPress</a> and it immediately blocked people trying to do things to it.  It wasn&#8217;t really public yet.  It had a DNS name visible to the outside world, but not my DNS name.  I went to my DNS registrar (GoDaddy) and updated the DNS records to redirect rajapet.com from the old VM to the new one.   With the DNS updated, I was able to do something that I had meaning to do for a while: Add SSL/TLS support and enable HTTPS for the blog.
    </p>
    
    <p>
      I&#8217;m not doing anything that really needs HTTPS, but the browsers are really pushing for sites to use HTTPS.  In the old days, that meant buying a SSL certificate, installing it, configuring your site to use it, etc.  The people behind <a href="https://letsencrypt.org/about/">Let&#8217;s Encrypt</a> have changed that story.  It&#8217;s a free an open Certificate Authority that provides free certificates to allow anyone to enable a trusted HTTPS site.  All you need is to own your own domain (and have some level of access to the web server).  They provide the cert and the tools to install and update the certificate.
    </p>
    
    <p>
      <div style="width: 610px" class="wp-caption alignnone">
        <a href="https://letsencrypt.org/"><img loading="lazy" class="size-medium" src="https://i0.wp.com/photos.smugmug.com/photos/i-KvZhFDs/0/M/i-KvZhFDs-M.jpg?resize=600%2C400&#038;ssl=1" width="600" height="400"  /></a>
        
        <p class="wp-caption-text">
          Let’s Encrypt is a free, automated, and open Certificate Authority.
        </p>
      </div>
    </p>
    
    <p>
      It was just slightly tricky to get the Let&#8217;s Encrypt tools to work on my site.  Bitnami&#8217;s installation of Apache and WordPress are slightly different than standard installs.  Not wrong, just different enough that automated Let&#8217;s Encrypt tool didn&#8217;t complete it&#8217;s task.  The documentation on the Bitnami site is very good and walks you through the <a href="https://docs.bitnami.com/azure/components/apache/#how-to-install-the-lets-encrypt-client" target="_blank">Let&#8217;s Encrypt manual steps</a>.  I set the certificate to use rajapet.com rather than www.rajapet.com.  The &#8220;www.&#8221; is archaic and I don&#8217;t need it for this site.  With good stuff like Let&#8217;s Encrypt, there is really no excuse not to use HTTPS any more.
    </p>
    
    <p>
      I edited the httpd-app.conf file that Bitnami uses in place of the .htaccess file to redirect HTTP and www.rajapet.com requests to the simpler https://rajapet.com. If you are running Bitnami&#8217;s WordPress install, it&#8217;s pretty easy to change and is more or less documented <a href="https://community.bitnami.com/t/change-url-from-http-to-https-in-bitnami-wordpress/47301" target="_blank">here</a>.  In /opt/bitnami/apps/wordpress/httpd-app.conf, you&#8217;ll want to add the following lines after the line with &#8220;RewriteEngine On&#8221;:
    </p>
    
    <p>
      &nbsp;
    </p>
    
    <pre>    #SSL redirection
    RewriteCond %{HTTPS} !on
    RewriteRule ^ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]

    # Replace www.xxxx with xxxx
    RewriteCond %{HTTP_HOST} ^www\.(.*)$ [NC]
    RewriteRule ^(.*)$ https://%1/$1 [R=301,L]
</pre>
    
    <p>
      &nbsp;
    </p>
    
    <p>
      The first block takes any request that uses HTTP and replaces it with HTTPS. The second block strips out the &#8220;www.&#8221; from the start of the URL.  You can still use HTTP or &#8220;www.&#8221;, but you&#8217;ll be taken to https://rajapet.com each time.  With a 301 redirect to let search engines know that this is a permanent change of the link.  After making that change, remember to restart Apache.
    </p>
    
    <p>
      So the blog is back, I only restored the posts, past comments may or not come back.  I installed the usual security plugins, but I need to install the code formatting plugins.  I picked a new theme that&#8217;s pretty basic and mobile friendly.  That will probably change, it&#8217;s kind of on the &#8220;blah&#8221; side.  At least it is as I have it setup.  I used to have an about page that had a form for entering comments.  That was a SPAM magnet and I had disabled it just before the hack attack.  If you want to get in touch with me, the best bet is through one of the social media links in the sidebar.
    </p>