---
id: 405
title: 'RE: Why do login dialogs have a &quot;User&quot; field?'
date: 2005-10-12T15:25:00-05:00
layout: post
guid: http://www.rajapet.com/?p=405
permalink: /2005/10/12/re-why-do-login-dialogs-have-user/
---
I like Jeff Atwood&#8217;s blog, but I don&#8217;t agree with his posting about removing the &#8220;User&#8221; field from the dialog box. If you pull the user out of the user/password combination, you have to force unique passwords in your system. That&#8217;s a huge hurdle. I know couples where they share the same password for their individual email accounts. Technically, that&#8217;s less secure than different passwords for each others account, but it&#8217;s easier to manage.

Another problem is that two people could have unique passwords that only differ by a single charactor. If you mistype your password when you login and your password matches the password of another user, then you will login as that user without any warning.

> In [The Humane Interface](http://www.amazon.com/exec/obidos/ASIN/0201379376/codinghorror-20), the late [Jef Raskin](http://en.wikipedia.org/wiki/Jef_Raskin) asks an intriguing question: **why do login dialogs have a &#8220;User&#8221; field?**
> 
> Shouldn&#8217;t login dialogs look more like this?
> 
><img loading="lazy" alt="Login dialog without user field" src="https://i1.wp.com/www.codinghorror.com/blog/images/win2k3_login_no_user_field.png?resize=417%2C201" width="417" height="201" border="0" data-recalc-dims="1" /> 
> 
> And you know what? He&#8217;s right. **Your password alone should be enough information for the computer to know who you are.** 
> 
> Click [here](http://www.codinghorror.com/blog/archives/000413.html) for the rest of that article

_[Via [Coding Horror](http://www.codinghorror.com/blog/archives/000413.html)]_