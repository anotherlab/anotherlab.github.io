---
title: 'Where is &quot;Step Into&quot; on my Visual Studio 2005 Debug menu?'
date: 2006-09-14T17:59:00-05:00
---
I was debugging some code in VS 2005 when I noticed that I could no longer find &#8220;Step Into&#8221; on the debug menu.  I was already used to the keyboard short cut of F11, but I was wondering why it was no longer on the menu.  After some googling, I found a [post](http://aspadvice.com/blogs/plitwin/archive/2005/11/12/13767.aspx) from Paul Litwin&#8217;s [blog](http://aspadvice.com/blogs/plitwin/default.aspx) that explained how to fix it.  Basicly, the IDE thinks that you just don&#8217;t want to see that menu item and you just need to reset your profile.   Here are the steps that Paul listed on his blog:

  1. Click the Tools->Import and Export Settings menu item 
  2. Choose Reset all Settings 
  3. Don’t save your settings 
  4. Pick a new profile 
  5. [Profit!](http://en.wikipedia.org/wiki/Underpants_Gnomes#The_gnomes)

OK, I couldn&#8217;t resist the last one.  The $64,000 question is why this happened in the first place.  When Paul posted his blog entry, VS 2005 was still new and shiny and the thought was that a prior installation of VS 2005 (beta?) had some how screwed up the settings.  That didn&#8217;t match my setup, I avoided the VS 2005 beta like the plague.  I do have VS 2003 installed, that may have confused VS 2005.  I also installed SQL Server 2005 before VS 2005, that too could confuse VS 2005.

Tech Tags: <a href="http://technorati.com/tag/Step+Into" rel="tag">Step+Into</a> <a href="http://technorati.com/tag/Visual+Studio+2005" rel="tag">Visual+Studio+2005</a> <a href="http://technorati.com/tag/VS+2005" rel="tag">VS+2005</a> <a href="http://technorati.com/tag/Underpants+Gnomes" rel="tag">Underpants+Gnomes</a>
