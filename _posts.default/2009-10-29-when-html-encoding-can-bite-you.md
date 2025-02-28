---
id: 75
title: When HTML encoding can bite you
date: 2009-10-29T05:08:00-05:00
layout: post
guid: http://www.rajapet.com/?p=75
permalink: /2009/10/29/when-html-encoding-can-bite-you/
---
I’ve been using [TweetDeck](http://tweetdeck.com/beta/) to follow [Twitter](http://twitter.com/anotherlab).  It’s a great app, but it has some quirks.  Like it’s ginormous memory usage.   Another is how it renders the text of a tweet. I’ve seen a few tweets go by where the text had HTML escape sequences instead of the text.  

This tweet is an example: <http://twitter.com/KristiGustafson/status/5231052312>

It should display as:

> City shelves happy hour: Many of you will be glad we aren’t this city — they’ve shelved their.. <http://bit.ly/10QmUr>

In Tweetdeck, it displays as:

> City shelves happy hour: Many of you will be glad we aren&#8217;t this city &#8212; they&#8217;ve shelved their.. <http://bit.ly/10QmUr>

A screenshot of that tweet:

[<img loading="lazy" title="td" border="0" alt="td" src="https://i0.wp.com/lh6.ggpht.com/_natoSxTaPFU/SukjUH7I66I/AAAAAAAAAXI/Lbc7UlNYT6k/td_thumb%5B1%5D.png?resize=332%2C189" width="332" height="189"   />](https://i0.wp.com/lh6.ggpht.com/_natoSxTaPFU/SukjT4LJoPI/AAAAAAAAAXE/HUVDdDrbalI/s1600-h/td%5B3%5D.png) 

If you view the link on Twitter, you’ll see the text the “right” way.  I couldn’t figure out what was wrong.  I posted a message in the TweetDeck support site and they couldn’t replicate the problem.  Then I looked at bottom line of the tweet.  It has been posted to Twitter from [TwitterFeed](http://twitterfeed.com/).  I had never heard of TwitterFeed, so I signed up for an account.

TwitterFeed is a free service that can scan your blog’s RSS feed and look for new blog postings.  It can then post the first 100 or so characters from the post to your Twitter and/or Facebook accounts.  And that’s where the problem occurs.  

HTML and XML use [escape sequences to define special characters](http://www.w3.org/MarkUp/html-spec/html-spec_13.html).  What you see rendered in the browser is not literally the same text in the source for that page.  Literal characters like “<” and “>” have special meaning in XML and HTML.  To display those characters on the page, they needed to be encoded as < and > respectively.  It’s all magic that goes on behind the scenes, you usually are never aware of it.

When TwitterFeed gets the latest post from your blog, it’s pulling it from the RSS feed and the text is encoded with the right escape sequences.  They then call the Twitter and/or Facebook API to post that text.  They are sending HTML/XML encoded text to functions that are expecting plain text.  When Twitter displays that new blog posting as a tweet, it’s including the encoded text.  Your browser sees that encoding and decodes it back again.  Facebook on the other hand displays the text encoded.

TweetDeck isn’t a browser, it’s a desktop or mobile application.  It renders the tweets as plain text and assumes that the API call that it suing to get tweets from Twitter is sending back plain text.  So the question is where is it broken.  I’ve only seen this problem with entrties posted by TwitterFeed, I would be the first place I would look.  I think they will need to a HTML decode on the text that they are scraping from the RSS feed and send it as plain text to Twitter and Facebook API’s.

btw:  [Kristi Gustafson](http://twitter.com/KristiGustafson) is worth following, even if her text is getting mangled by TwitterFeed.