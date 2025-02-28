---
title: I hate spam that comes in under my own name
date: 2008-02-21T17:08:00-05:00
---
For the last few weeks, I&#8217;ve been getting spam email addressed to my work account with the &#8220;from:&#8221; field set to my work address.  That allows it past our companies spam filters.  The subject line is usually something liken &#8220;January 79% OFF&#8221; and the message body contains a few images, some oddly worded links, and some boiler plate text about receiving this mailing because I am &#8220;subscribed to MSN Featured Offers&#8221;.

The images are blocked by our central spam filter, which means they are being hosted on a known site for spamming.  I haven&#8217;t verified that with our IT manager, but it&#8217;s a safe assumption.  

I&#8217;m going to block this message at my email client (Outlook 2007), but first I&#8217;m going to send a message to the ISP that is hosting the machine that sent the email.  The first thing to do is to see where the images and links are pointing to.  With Outlook, if you right click in the body of the message and select &#8220;View Source&#8221;, Outlook will create a file named email.txt and launches it with the app registered to handle text files.  That&#8217;s usually notepad, but [YMMV](http://www.internetslang.com/YMMV.asp).

For this message, I saw something that looked very much like the spam that was reported to the [new.admin.net-abuse.sightings](http://groups.google.com/group/news.admin.net-abuse.sightings/topics) newsgroup in this [post](http://groups.google.com/group/news.admin.net-abuse.sightings/msg/cc8f5b13f2d10fe6 "news.admin.net-abuse.sightings").

Most of the links were junk, but there was a link to &#8220;s y l l a b l e h e a v y . c o m&#8221; (I added spaces to prevent it from being a live link and inflating it&#8217;s Google ranking).

A quick [search](http://reports.internic.net/cgi/whois?whois_nic=syllableheavy.com&type=domain) in the Internic registry brings up the following results:

<pre>Domain Name: SYLLABLEHEAVY.COM<br />   Registrar: XIN NET TECHNOLOGY CORPORATION<br />   Whois Server: whois.paycenter.com.cn<br />   Referral URL: http://www.xinnet.com<br />   Name Server: NS.XINNETDNS.COM<br />   Name Server: NS.XINNET.CN<br />   Name Server: NS2.XINNETDNS.COM<br />   Name Server: NS2.XINNET.CN<br />   Status: ok<br />   Updated Date: 19-feb-2008<br />   Creation Date: 16-jan-2008<br />   Expiration Date: 16-jan-2009</pre>



That tells us a couple of things.  One, the website is registered by a Chinese registrar.  Two, it was created about a month ago.  The next step is to track down the Registrar, Xin Net.  A quick search on Xin Net, gives us some more information:



<pre>Registrar Name: XIN NET TECHNOLOGY CORPORATION<br />   Address: 1st Floor,2nd Building Section A,BDA BeiGongD, Beijing, China 100176, CN<br />   Phone Number: 86.1058022118<br />   Email: <a href="mailto:domainadmin@xinnet.com">domainadmin@xinnet.com</a><br />   Whois Server: whois.paycenter.com.cn<br />   Referral URL: <a href="http://www.xinnet.com/">www.xinnet.com</a><br />   Admin Contact: cody zhou<br />   Phone Number: +86.10.58.22266-551<br />   Email: <a href="mailto:tech@xinnet.com">tech@xinnet.com</a><br />   Admin Contact: xiaorui wang<br />   Phone Number: +86.1058022118-205<br />   Email: <a href="mailto:admin2@xinnet.com">admin2@xinnet.com</a><br />   Admin Contact: Baosheng Jiang<br />   Phone Number: +86.1058022118-623<br />   Email: <a href="mailto:admin1@xinnet.com">admin1@xinnet.com</a><br /></pre>





 



This gives a whole bunch of email addresses to complain to.  What I did was to send a polite message to all of the addresses listed above.  I sent the following:



> 
> 
> Hello,
> 
> 
> 
> Please excuse this unsolicited message, but I have been receiving numerous spam emails and they link to a site, syllableheavy.com, that you are listed as the registrar of.   This site probably violates your terms of service and I am sure that you do not want to be associated with it.    The message did not originate from that site, but it is using that site.



I then included the message header and the message source.  I doubt that they will do anything, but if they do take action, it takes a spam site offline.



The next thing to do is block additional messages like that.  



</p> 

  * From the Outlook menu, I selected &#8220;Tools->Rules and Alerts&#8221; to create a new junk mail filter.  


  * In the &#8220;Rules and Alerts&#8221; dialog, I clicked &#8220;New Rule&#8230;&#8221;.  


  * Under &#8220;Start from a blank rule&#8221;, I selected &#8220;Check messages when they arrive&#8221;, and then clicked the &#8220;Next&#8221; button.


  * Under &#8220;Which condition(s) do you want to check?&#8221;, I selected &#8220;with specific words in the sender&#8217;s address&#8221; 


  * For the &#8220;with specific words in the sender&#8217;s address&#8221;, I entered my address.  I rarely send myself email from my work account.  When I do, Exchange just uses my first and last name, not the SMTP address.  Then I clicked &#8220;Next&#8221;


  * Under &#8220;What do you want to do with this message&#8221;, I selected &#8220;move it to the specified folder&#8221; and &#8220;mark it as read&#8221;.  I selected &#8220;Junk E-mail&#8221; as the selected folder.  I then clicked the &#8220;Next&#8221; button.


  * I clicked the &#8220;Next&#8221; again to skip over the exceptions to this rule.


  * I gave it a name and set the checkboxes to run it on messages already in the inbox and to enable the rule and clicked finish.


  * Clicked &#8220;Apply&#8221; and then&#8221;OK&#8221; and we are done.



That will permanently take that style of junk mail out of my in box.  I didn&#8217;t permanently delete the message.  About once a week, I take a quick peek in the junk e-mail folder just in case a false positive hit grabs a legitimate email.
