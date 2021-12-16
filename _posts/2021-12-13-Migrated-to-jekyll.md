---
layout: post
title:  "Moved the blog from WordPress to Jekyll"
date:   2021-12-15 10:31:33 -0500
categories: jekyll update
---
First post under the new regime.

# Back story

For a long time, this blog has been created with WordPress.  It's now a <a href="https://jekyllrb.com/" target="_blank">Jekyll</a> site.

The blog started as a free blog hosted on Google's Blogger platform. It's <a href="http://anotherlab.blogspot.com/" target="_blank">still there</a>, but hasn't been touched in 8 years. It was fine, but I felt limited by the platform. 

The second incarnation was on WordPress. I did it the hard way.  I created a Linux VM on Azure and manually wired up the <a href="https://en.wikipedia.org/wiki/LAMP_(software_bundle)" target="_blank">LAMP stack</a>.  It was a good learning experience with Linux and WordPress.

It was fine until a few years ago when there was a serious attack on WordPress sites.  It was a vulnerability with man of the plugins used on WordPress sites.  My site was one the ones that was taken down.

With a bit of amount of work, I was able to restore the site. I viewed the entire VM as compromised and generated a new VM in Azure. This time I used a <a href="https://bitnami.com/stack/wordpress" target="_blank">Bitnami WordPress</a> image so there was a lot less work to get it up and running. I still had to add my own SSL certificate through <a href="https://letsencrypt.org/" target="_blank">Let's Encryt</a>.  I also signed up for a <a href="jetpack.com/upgrade/backup/" target="_blank">Jetpack</a> subscription to let them manage the backups of the site.

Because this is a self-hosted WordPress site, I am responsible for updating the various moving parts. That was easy to do with the old system, annoying to do with the Bitnami image. It seems that the preferred way to do updates was to create a new VM and migrate the WordPress data over. That's a little too much work.

# New Boss in Town
WordPress is a great platform, but it's overkill for what I need, which is just a blog host.  So I decided to migrate it over to Jekyll.  I edit the blog on my own machine, in Ubuntu on Windows 10. It uses <a href="https://www.markdownguide.org/" target="_blank">Markdown</a> for the posts, which is handy for just knocking out stuff. The Jekyll tooling will bundle the files to a static set of pages that can be hosted by just about anything.

Since it's a static site, it has a tiny footprint and has much less exposure to being hacked. If it did get hacked, it would be fixed the next time I pushed out an update. I was able to install a WordPress plugin that exported the existing site to Jekyll formatted Markdown files. I'll have to tweak some of posts. The content is all there, but there are some CSS styling issues to resolve.  The source code was using a WordPress plugin for doing syntax highlighting on code snippets. Jekyll has the equivalent feature, it's just a matter of going back and editing the old posts.

And since Jekyll is a static site engine, dynamic features like comments are not included out of the box. There are options for that and I'll get that working at some point.

The Jekyll tooling is very Linux oriented. I'm running Windows 10, so I used Ubuntu running on WSL2. This gave me the power of the Linux command line tools while still leaving over the option of using Windows tools for file editing. It's easy to access the Windows file system from Linux on WSL2 and vice versa. There's a really cool Markdown editor called <a href="markdownmonster.west-wind.com" target="_blank">Markdown Monster</a> that makes editing a breeze. I highly recomend it
