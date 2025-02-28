---
title: 'Not a fan of Vibrant Media&#8217;s intellitxt popups (and how to get rid of them)'
date: 2008-06-05T03:58:00-05:00
---
I was reading a blog about [pulling an XML feed from my TiVo](http://www.tivoblog.com/archives/2006/03/02/getting-the-tivo-roll-on-windows-to-work/) and I kept being distracted by popup ads over key words in the article.  You&#8217;ve probably seen them on other sites, the words have a double underline and they are not actually links.  

In the middle of a sentence, you see a word like this <u><span>Internet</span></u> and it looks almost like a regular link.  Except the color is wrong and the underline is not the same a regular link.  When your mouse hovers over them, a popup ad that has some contextual relationship to the text appears.  In the fake link above, nothing will happen when you mouse over it.  I just used an inline CSS style to do the double underlining.

Vibrant Media calls it &#8220;in-text advertising&#8221;.  I call it a popup and I want it to go away.  As in go away right now.

I can understand the desire to have ads on your blog and I have them here myself.  I&#8217;m using Google to supply the ads on this blog and they are pretty unobtrusive.  I don&#8217;t have any beef with web based advertising as long as it doesn&#8217;t get in the way of the reading the web page.  I don&#8217;t like popups and if I can avoid them, I will.  

In this case it was pretty easy.  I am using Firefox 2, so I installed the [Adblock Plus](http://adblockplus.org/en/) addin.  That little gem will give you fine control over what ads you will see and experience.  For Vibrant based popups, it&#8217;s pretty easy.  For a web site to use Vibrant&#8217;s popups, they need to register an account with Vibrant and add some code to their web page that scans the text and creates something funky with Javascript when the page is rendered.  The web site author gets a url that includes their blog name on the intellitxt.com domain.  With AdBlock Plus, I just added a filter for the text **http://\*.intellitxt.\*** and after I refreshed the web page the popups were gone.  For Opera users, [this link](http://www.flexbeta.net/forums/index.php?s=&showtopic=10549&view=findpost&p=109644 "blocking vibrant pop-ups - Flexbeta") will show you how to block Intellitxt popups.

I would prefer not using AdBlock Pro. When I installed it, it prompted me to pick a subscription for automatically picking up ad filters.  When I did this, it took out most of the ads on every page.  And I don&#8217;t have a problem with Google Ads or other ads that don&#8217;t interfere with the consuming of the content.  So I yanked the subscription list out.  From here on out, I&#8217;m just going to kill the popups and leave the other ads in place.
