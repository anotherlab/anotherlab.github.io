---
title: And then my blog was defaced
date: 2017-02-21
categories:
  - WordPress
tags:
  - WordPress
---
A couple of weeks ago my blog was defaced through a security hole in <a href="https://wordpress.org/">WordPress</a>. About 800,000 blogs were hit via something called the REST-API exploit. I saw something like this on the main page of my blog:

<figure>
<img loading="lazy" src="https://i2.wp.com/photos.smugmug.com/photos/i-2GtTbXb/0/S/i-2GtTbXb-S.jpg"/>
<figcaption>Hacked message</figcaption></figure>

I blurred out the identifying text and graphics.  No sense giving any credit to the ones behind the hack.  I actually support their cause, but not this kind of stuff.

At that point I had no idea what had happened.  I figured it was either someone had hacked the OS or someone had hacked WordPress.  I went in and deleted the post and then my blog stopped working.  I was too busy at the time to deal with it, so I just shut the blog down.  I was running a virtual machine up in the cloud and I had installed Linux, MySQL, and WordPress manually,  I recommend doing that at least once.  But no more than just once.  I had to manually edit a bunch of files so that my WordPress site was the default site for the machine.

I then found out that the problem was caused by [a security hole in WordPress 4.7.0/4.7.1](https://blog.sucuri.net/2017/02/content-injection-vulnerability-wordpress-rest-api.html) that had since been quietly patched in 4.7.2.  My blog was not set up to automatically update WordPress, so it was one of the 800k that had been hit.

<figure><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Paris_Tuileries_Garden_Facepalm_statue.jpg/512px-Paris_Tuileries_Garden_Facepalm_statue.jpg" alt="Paris Tuileries Garden Facepalm statue"><figcaption>I should have had automatic updates turned on</figcaption></figure>

I had backups of the blog, so I knew I could get it back up and running.  I decided to take some time and start over again.  While it would be easy to just delete the posts, there reports that Remote Command Execution (RCE) attacks were being attempted through this exploit.  I don’t think that I had any plugins that would allow a RCE attack, but I decided to err on the side of caution.
I looked at some of the sites that offer WordPress hosting, but I decided to do it in a VM again.  The price is roughly the same as some of the cheaper hosting plans, but I would have full control over the site.  I would also have full responsibility for keep it up and running too, there’s never a free lunch.

Instead of installing everything myself, I used <a href="https://bitnami.com/stack/wordpress" target="_blank">Bitnami's one-click WordPress installer</a>.  In the Azure marketplace, Bitnami has an installer that will install the server edition of <a href="https://en.wikipedia.org/wiki/Ubuntu_version_history#Ubuntu_14.04_LTS_.28Trusty_Tahr.29">Ubuntu 14.04 LTS &#8220;Trusty Tahr&#8221;</a> with all of the bits to run WordPress.  The &#8220;LTS&#8221; designation is important, it stands for Long Term Support and this version will be supported until April, 2019.  It included the <a href="https://www.phpmyadmin.net/">PhpMyAdmin tool</a> for managing MySQL databases.  I created a new database and restored the table with the posts from my old blog.  I backed up the new blog database (just to be safe).  I tried installing all of the rows from that table into the new blog, but that broke the blog.  Something in the hacked posts was probably doing something bad.  I restored the new blog from the backup and then exported the old blog posts up to the date that it was hacked.  I restored those records and the blog was happy.

So the blog was more or less ready to go at this point.  I installed <a href="https://vaultpress.com/">VaultPress</a> and it immediately blocked people trying to do things to it.  It wasn't really public yet.  It had a DNS name visible to the outside world, but not my DNS name.  I went to my DNS registrar (GoDaddy) and updated the DNS records to redirect rajapet.com from the old VM to the new one.   With the DNS updated, I was able to do something that I had meaning to do for a while: Add SSL/TLS support and enable HTTPS for the blog.

I'm not doing anything that really needs HTTPS, but the browsers are really pushing for sites to use HTTPS.  In the old days, that meant buying a SSL certificate, installing it, configuring your site to use it, etc.  The people behind <a href="https://letsencrypt.org/about/">Let's Encrypt</a> have changed that story.  It's a free an open Certificate Authority that provides free certificates to allow anyone to enable a trusted HTTPS site.  All you need is to own your own domain (and have some level of access to the web server).  They provide the cert and the tools to install and update the certificate.

<figure>
<a href="https://letsencrypt.org/"><img src="https://i0.wp.com/photos.smugmug.com/photos/i-KvZhFDs/0/M/i-KvZhFDs-M.jpg" /></a>
<figcaption>Let’s Encrypt is a free, automated, and open Certificate Authority</figcaption></figure>

It was just slightly tricky to get the Let's Encrypt tools to work on my site.  Bitnami's installation of Apache and WordPress are slightly different than standard installs.  Not wrong, just different enough that automated Let's Encrypt tool didn't complete it's task.  The documentation on the Bitnami site is very good and walks you through the <a href="https://docs.bitnami.com/azure/components/apache/#how-to-install-the-lets-encrypt-client" target="_blank">Let's Encrypt manual steps</a>.  I set the certificate to use rajapet.com rather than www.rajapet.com.  The &#8220;www.&#8221; is archaic and I don't need it for this site.  With good stuff like Let's Encrypt, there is really no excuse not to use HTTPS any more.

I edited the httpd-app.conf file that Bitnami uses in place of the .htaccess file to redirect HTTP and www.rajapet.com requests to the simpler https://rajapet.com. If you are running Bitnami's WordPress install, it's pretty easy to change and is more or less documented <a href="https://community.bitnami.com/t/change-url-from-http-to-https-in-bitnami-wordpress/47301" target="_blank">here</a>.  In /opt/bitnami/apps/wordpress/httpd-app.conf, you'll want to add the following lines after the line with &#8220;RewriteEngine On&#8221;:

{% highlight plaintext %}
#SSL redirection
RewriteCond %{HTTPS} !on
RewriteRule ^ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]

# Replace www.xxxx with xxxx
RewriteCond %{HTTP_HOST} ^www\.(.*)$ [NC]
RewriteRule ^(.*)$ https://%1/$1 [R=301,L]
{% endhighlight %}
    
The first block takes any request that uses HTTP and replaces it with HTTPS. The second block strips out the &#8220;www.&#8221; from the start of the URL.  You can still use HTTP or &#8220;www.&#8221;, but you'll be taken to https://rajapet.com each time.  With a 301 redirect to let search engines know that this is a permanent change of the link.  After making that change, remember to restart Apache.

So the blog is back, I only restored the posts, past comments may or not come back.  I installed the usual security plugins, but I need to install the code formatting plugins.  I picked a new theme that's pretty basic and mobile friendly.  That will probably change, it's kind of on the &#8220;blah&#8221; side.  At least it is as I have it setup.  I used to have an about page that had a form for entering comments.  That was a SPAM magnet and I had disabled it just before the hack attack.  If you want to get in touch with me, the best bet is through one of the social media links in the sidebar.
