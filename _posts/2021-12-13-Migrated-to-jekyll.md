---
layout: post
title:  "Moved the blog from WordPress to Jekyll"
date:   2021-12-15 10:31:33 -0500
categories: jekyll update
---
First post under the new regime.

For a long time, this blog has been created with WordPress.  It's now a Jekyll site.

The blog started as a free blog hosted on Google's Blogger platform. It's <a href="http://anotherlab.blogspot.com/" target="_blank">still there</a>, but hasn't been touched in 8 years. It was fine, but I felt limited by the platform. 

The second incarnation was on WordPress. I did it the hard way.  I created a Linux VM on Azure and manually wired up the <a href="https://en.wikipedia.org/wiki/LAMP_(software_bundle)" target="_blank">LAMP stack</a>.  It was a good learning experience with Linux and WordPress.

It was fine until a few years ago when there was a serious attack on WordPress sites.  It was a vulnerability with man of the plugins used on WordPress sites.  My site was one the ones that was taken down.

With a fair amount of work, I was able to restore the site. I viewed the entire VM as compromised and generated a new VM in Azure. This time I used a Bitnami WordPress image so there was a lot less work to get it up and running. I still had to add my own SSL certificate through Let's Encryt.  I also signed up for a Jetpack subscription to let them manage the backups of the site.

Because this is a self-hosted WordPress site, I am responsible for updating the various moving parts. That was easy to do with the old system, annoying to do with the Bitnami image. It seems that the preferred way to do updates was to create a new VM and migrate the WordPress data over. That's a little too much work.

WordPress is a great platform, but it's overkill for what I need, which is just a blog host.  So I decided to migrate it over to Jekyll.  I edit the blog on my own machine, in Ubuntu on Windows 10. It uses Markdown for the posts, which is handy for just knocking out stuff. The Jekyll tooling will bundle the files to a static set of pages that can be hosted by just about anything.

Since it's a static site, it has a tiny footprint and has much exposure to being hacked. If it did get hacked, it would be fixed the next time I pushed out an update. I was able to install a WordPress plugin that exported the site to Jekyll formatted Markdown files. I'll have to tweak some of posts. The content is all there, but there are some CSS styling issues to resolve.  The source code was using a WordPress plugin for doing syntax highlighting on code snippets.

And since Jekyll is a static site engine, dynamic features like comments are not included out of the box. There are options for that and I'll get that working at some point.

You’ll find this post in your `_posts` directory. Go ahead and edit it and re-build the site to see your changes. You can rebuild the site in many different ways, but the most common way is to run `jekyll serve`, which launches a web server and auto-regenerates your site when a file is updated.

Jekyll requires blog post files to be named according to the following format:

`YEAR-MONTH-DAY-title.MARKUP`

Where `YEAR` is a four-digit number, `MONTH` and `DAY` are both two-digit numbers, and `MARKUP` is the file extension representing the format used in the file. After that, include the necessary front matter. Take a look at the source for this post to get an idea about how it works.

Jekyll also offers powerful support for code snippets:

{% highlight ruby %}
def print_hi(name)
  puts "Hi, #{name}"
end
print_hi('Tom')
#=> prints 'Hi, Tom' to STDOUT.
{% endhighlight %}

Check out the [Jekyll docs][jekyll-docs] for more info on how to get the most out of Jekyll. File all bugs/feature requests at [Jekyll’s GitHub repo][jekyll-gh]. If you have questions, you can ask them on [Jekyll Talk][jekyll-talk].

[jekyll-docs]: https://jekyllrb.com/docs/home
[jekyll-gh]:   https://github.com/jekyll/jekyll
[jekyll-talk]: https://talk.jekyllrb.com/
