---
title:  "Moved the blog from WordPress to Jekyll"
date:   2021-12-15 10:31:33 -0500
categories: Jekyll WordPress Blog
---
First post under the new regime.

# Back story

For a long time, this blog has been created with WordPress. It's now a <a href="https://jekyllrb.com/" target="_blank">Jekyll</a> site.

The blog started as a free blog hosted on Google's Blogger platform. It's <a href="http://anotherlab.blogspot.com/" target="_blank">still there</a>, but hasn't been touched in 8 years. It was fine, but I felt limited by the platform. 

The second incarnation was on WordPress. I did it the hard way. I created a Linux VM on Azure and manually wired up the <a href="https://en.wikipedia.org/wiki/LAMP_(software_bundle)" target="_blank">LAMP stack</a>. It was a good learning experience with Linux and WordPress.

It was fine until a few years ago when there was a serious attack on WordPress sites. It was a vulnerability with many of the plugins used on WordPress sites. My site was one the ones that was taken down.

With a bit of amount of work, I was able to restore the site. I viewed the entire VM as compromised and generated a new VM in Azure. This time I used a <a href="https://bitnami.com/stack/wordpress" target="_blank">Bitnami WordPress</a> image so there was a lot less work to get it up and running. I still had to add my own SSL certificate through <a href="https://letsencrypt.org/" target="_blank">Let's Encryt</a>. I also signed up for a <a href="jetpack.com/upgrade/backup/" target="_blank">Jetpack</a> subscription to let them manage the backups of the site.

Because this is a self-hosted WordPress site, I am responsible for updating the various moving parts. That was easy to do with the old system, annoying to do with the Bitnami image. It seems that the preferred way to do updates was to create a new VM and migrate the WordPress data over. That's a little too much work.

# New Boss in Town
WordPress is a great platform, but it's overkill for what I need, which is just a blog host. So I decided to migrate it over to Jekyll. I edit the blog on my own machine, in Ubuntu on Windows 10. It uses <a href="https://www.markdownguide.org/" target="_blank">Markdown</a> for the posts, which is handy for just knocking out stuff. The Jekyll tooling will bundle the files to a static set of pages that can be hosted by just about anything. In this case, it's hosted under <a href="https://pages.github.com/" target="_blank">GitHub Pages</a>.

Since it's a static site, it has a tiny footprint and has much less exposure to being hacked. If it did get hacked, it would be fixed the next time I pushed out an update. I was able to install a WordPress plugin that exported the existing site to Jekyll formatted Markdown files. I'll have to tweak some of posts. The content is all there, but there are some CSS styling issues to resolve. The source code was using a WordPress plugin for doing syntax highlighting on code snippets. Jekyll has the equivalent feature, it's just a matter of going back and editing the old posts.

And since Jekyll is a static site engine, dynamic features like comments are not included out of the box. There are options for that and I'll get that working at some point.

The Jekyll tooling is very Linux oriented. I'm running Windows 10, so I used Ubuntu running on WSL2. This gave me the power of the Linux command line tools while still leaving over the option of using Windows tools for file editing. It's easy to access the Windows file system from Linux on WSL2 and vice versa. There's a really cool Markdown editor called <a href="markdownmonster.west-wind.com" target="_blank">Markdown Monster</a> that makes editing a breeze. I highly recommend it.

# The process
So writing and updating posts is very different than the traditional WordPress experience. With the WordPress site, I would create posts in the site, using the WordPress web tools. Until it was was posted, it would be a draft. Their <a href="https://wordpress.org/gutenberg/" target="_blank">Gutenberg editor</a> was a block based editor that I was never comfortable with.

With Jekyll, I just create a Markdown file with the right tags and in the right folder. Then I use git to push it to the repo for the site. Between the git command and the <a href="https://github.com/cli/cli" target="_blank">GitHub CLI</a>, I can do the workflow right from the command line.

As for backing up the site, it's backed up and versioned by being a GitHub repository. If I need to rebuild the Ubuntu environment, I would need to reinstall a few things (brew, Jekyll, gh), but it's not rocket science. I can also backup and restore the Ubuntu environment. It's as simple as:

{% highlight text %}
wsl --export Ubuntu c:\data\ubuntu.tar
{% endhighlight %}

Then to restore it, you need to provide a distribution name and a location for the distribution.

{% highlight text %}
wsl --import UbuntuBlog c:\data\UbuntuBlog c:\data\ubuntu.tar
{% endhighlight %}

# What's next
By the time this post is public, I'll have already transferred the domain name over. I have a few images in the WordPress site, I'll need to grab them. When I move from Blogger to WordPress, I made the decision to not host the images in WordPress. Almost all of my blog post images are hosted on my SmugMug site. I figured if I ever moved the blog again, that would be one less thing to worry about.

I also have some draft posts. I had a handful of stuff that I was going to blog about, but never finished. They were not exported, but that's OK. Jekyll has a concept of <a href="https://jekyllrb.com/docs/posts/" target="_blank">draft posts</a> and I'll just put them all in there.

# Post migrations
There is some cleanup that I need to do. I had used a [Jekyll plugin](https://github.com/benbalter/wordpress-to-jekyll-exporter) for WordPress to export the posts to Markdown files. It It converts all pages, posts, and settings to files that can be dropped in to a Jekyll site. It did most of the heavy lifting, but there were some rough edges that needed to be sanded down.

## Titles
At the top of a Jekyll post, there is a metadata section that is called ["Front Matter"](https://jekyllrb.com/docs/front-matter/). It's in YAML format has the title of the post, the date, categories, tags, and other stuff. The plugin was using HTML escape codes for special characters in the title. That was not being parsed correctly and the escape code would print instead of the character. So I added rules in my conversion tool to write the escape codes as the action charactors.

## Other Front Matter cleanup
The export added a bunch of tags that needed to be cleaned. The following is the Front Matter from a post

{% highlight yaml lineno %}
id: 3247
title: Colored notes in OneNote
date: 2020-05-23T15:57:18-05:00
author: Chris Miller
excerpt: A quick way to color paragraphs in OneNote.
layout: post
guid: http://rajapet.com/?p=3247
permalink: /2020/05/23/colored-notes-in-onenote/
spay_email:
  - ""
image: http://rajapet.com/wp-content/uploads/2020/05/ColoredTables.png
categories:
  - OneNote
tags:
  - colors
  - OneNote
{% endhighlight %}
The "id:" tag refers to a row in the WordPress database, so that one goes. The "author:" goes because i's just me. The "excerpt:" tag is a WordPress feature. Jekyll handles excerpts differently. I'll leave it there for now. Same for "images:". The "guid:" and "spay_mail:" tags are WordPress, so they go. I don't need the "permlink:", so it also goes. So after running my conversion tool, I would get Front Matter that would look like this
{% highlight yaml lineno %}
title: Colored notes in OneNote
date: 2020-05-23T15:57:18-05:00
excerpt: A quick way to color paragraphs in OneNote.
image: http://rajapet.com/wp-content/uploads/2020/05/ColoredTables.png
categories:
  - OneNote
tags:
  - colors
  - OneNote
{% endhighlight %}

## CSS & Markup changes
I'm using a Jekyll theme called ["Minimal Mistakes"](https://mmistakes.github.io/minimal-mistakes/). It's a nice clean design and I like. There are a few things that I wanted to change, mostly with some CSS overrides. I'm not touching the actual theme bits. That makes it eassier to update or replace the theme. The way Jekyll's Markdown processor, [kramdown](https://kramdown.gettalong.org/index.html), handles `<figure>`{:.html} is a little quirky and I'm seeing `</figure>`{:.html} in the rendered output. I'm fixing those by hand as I come across them. That's the problem with leaky abstractions, sometimes, you have leaks to patch.
## Code Highlighting
This is a work in progress. For the last few years, I've been using the built in support that WordPress provides for source code highlighting. That is relatively ease for my tool to identify. Jekyll uses a code highlighter called [Rouge](http://rouge.jneen.net/). It does most of the same stuff, and I'll use it as is for now. I can catch most of the snippets that used the WordPress markup, I'll fix up the stragglers as I come across them.
