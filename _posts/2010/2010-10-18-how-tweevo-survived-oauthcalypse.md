---
title: How TweeVo survived the OAuthcalypse
date: 2010-10-18T03:09:00-05:00
---
Last month, I spent a few evenings adding OAuth support to [Brian Peek&#8217;s](http://brianpeek.com/blog/default.aspx) TweeVo application.  TweeVo is a little WPF based application that runs in the background and logs what your TiVo has recorded to a specified Twitter account.  I’ve been running it on and off as [@AnotherTiVo](http://twitter.com/anothertivo). Brian keeps a Twitter list of known TweeVo accounts [as tweevousers](http://twitter.com/peekvo/tweevousers).

It&#8217;s a good learning tool for showing how to query a web server and how to post to Twitter using the Twitter API, all wrapped up as a WPF application.  What it does is very clever and Brian did a [nice article about it](http://blogs.msdn.com/b/coding4fun/archive/2010/02/19/9966722.aspx) on the Coding4Fun site.

The web server is the [built in HTTP server that runs on the TiVo box](http://www.tivocommunity.com/tivo-vb/showthread.php?s=&threadid=215838&perpage=20&pagenumber=1).  You can use that web server to get a list of everything that has been recorded by your TiVo.  Brian wrote a nice, clean application that would query the selected TiVo units on your home network.  TweeVo polls each unit and checks the &#8220;Now Playing&#8221; list to see what shows were recorded since the last check by TweeVo.  It then posts the name of the show, plus a [http://www.zap2it.com/](http://twitter.com/anothertivo) link to the specified Twitter account.  The Zap2It link will list some information about the show, plus a link to tell your TiVo to record that show.

The original version of TweeVo posted to Twitter using the username and password for the account.  This was called Basic Authentication or just Basic Auth. The user’s credentials were stored in a config file by TweeVo and they were encrypted so nothing else could read it.  Brian released it a while back and and it was a lot of fun for the people who used it.  Then came the OAuthcalypse.

Twitter supported two forms of authentication, Basic Auth and [OAuth](http://oauth.net/core/1.0/).  Twitter announced in the Spring that support for Basic Auth was being phased out and everyone using the Twitter API needed to implement OAuth.

With OAuth, the application requesting Twitter access with the application key.  To get the application key, you would request one for your application from Twitter.  If they approves your request, you would get a consumerKey and a consumerSecret.The user would be presented with a web dialog asking if they wanted to allow access to their account to the application and they would be prompted for their user name and password.  

If they allowed it, Twitter would send back an access token and application would use that token and their own api key to access the Twitter API.  The web dialog would redirect back to the calling web application and life was good for the user.

That’s an over simplification of the process, but it describes the basic mechanism for allowing an web application to post to your Twitter timeline.  There are a few advantages to using OAuth.  Since the application uses an access token, you could change your password without having to update the application.  Plus you could revoke the access token at any time from your Twitter web page.

For desktop application, it was a little trickier.  You still needed to present the web dialog from Twitter to request access.  Since you couldn’t get back to desktop application from a web page, the user would be presented with a [PIN](http://en.wikipedia.org/wiki/Personal_identification_number) from the web dialog.  He would then manually type the PIN into an entry field provided by the desktop application.  The app would then request the access token from Twitter by providing the application key and the PIN.

While this mechanism keeps the user’s credentials away from the application, it’s annoying to use.  Plus you have now introduced a point of failure where the user types in the PIN.  A more streamlined approach called [XAuth](http://dev.twitter.com/pages/xauth) was made available by Twitter for desktop applications.

XAuth works by consolidating a few of the steps.  The user provides the user name and password to the application.  The application then requests the access token by passing the credentials and the application key.  This skips over the access request dialog and sends back the access token.  For the end user, this is a much simpler.  

The original shutoff date for Basic Auth was June 30th, 2010.  This date became commonly known as the OAuthcalypse.  Due to heavy Twitter usage [around World Cup activity](http://mashable.com/2010/06/17/oauthcalypse-delayed/), the Twitter team pushed the OAuthcalypse date to August.  On August 16th, Basic Auth usage would start get rate limited and a final shutoff occurred on August 30th.

The OAuthcalypse basically prevented TweeVo from posting to Twitter.  Brian was a little busy in September and I offered to help add OAuth/XAuth support to TweeVo.  I did some reading and played around with some .NET implementations of XAuth.

We implemented XAuth with TweeVo and tested it in late September.  Much of the XAuth code was based on code that been posted in a set of [blog posts by Shannon Whitely](http://www.voiceoftech.com/swhitley/index.php/2010/03/twitter-xauth-with-net/).  I made a few changes to Shannon’s code, but the his implementation was sound and it saved me quite a bit of time.  That allowed me to spend more time reworking the TweeVo code to use XAuth and do more testing.  If you were using TweeVo 1.0, now is the time to [get version 1.1](http://www.brianpeek.com/blog/archive/2010/02/20/tweevo.aspx).
