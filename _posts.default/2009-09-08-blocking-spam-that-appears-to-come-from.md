---
id: 80
title: Blocking spam that appears to come from your own email address
date: 2009-09-08T15:32:00-05:00
layout: post
guid: http://www.rajapet.com/?p=80
permalink: /2009/09/08/blocking-spam-that-appears-to-come-from/
---
At work, I get a lot of email where the sender has spoofed the email address so that it appears to come my work email address.  It’s annoying and our corporate email filter doesn’t catch it.  I did find a way to block it with a close to 100% success rate.  What I did was to create an email filter in the email application that traps those messages.  I’m using Outlook 2007, but the technique should would work for any email client that has decent filtering.  Here’s how I created the rule (using an obviously fake email address of a known spammer):</p> 

<span><span>1.<span>       </span></span></span>From the Tools menu, select “Rules and Alerts…”

<span><span>2.<span>       </span></span></span>From the “Rules and Alerts…” dialog, press the  “New Rule…” button.

<span><span>3.<span>       </span></span></span>Under “Start from a blank rule” section, select “Check messages when they arrive” template.

<span><span>4.<span>       </span></span></span>Under the dialog for “Which condition(s) do you want to check?”, select &#8220;with specific words in the message header&#8221;

<span><span>5.<span>       </span></span></span>Click on “specific words” to open the dialog box that allows you to enter the search criteria.  I entered the following list, you would enter what matches your junk email and each line is entered in separately:  
X-Barracuda-Envelope-From: sanford.wallace@spamking.com

From: <sanford.wallace@spamking.com>

<span><span>6.<span>       </span></span></span>After closing this dialog, press “Next”

<span><span>7.<span>       </span></span></span>On the “What do you want to do with the message?” dialog, select the following actions:  
mark it as read

clear the Message Flag

move it the specified folder

<span><span>8.<span>       </span></span></span>Click on &#8220;specified&#8221; and select the &#8220;Junk E-mail&#8221; folder.

<span><span>9.<span>       </span></span></span>Click the “Next” button to the Finish rule setup dialog.

<span><span>10.<span>   </span></span></span>Name the rule and set &#8220;Turn on this rule&#8221;.  There is also a checkbox “Run this rule on messages already in “Inbox”.  You can set that checkbox to test the new rule.  If you have lots of messages in your inbox, create a new folder and copy some of the spam into that folder.  Then select that folder and edit the rule.  The “Run this rule…” checkbox will now list the name of the selected mail folder.  Your rule will run much faster on a mail folder with just a few times in it.

 </p> 

As you edit the settings, Outlook will display a text representation of the rule as you configure it.  It should look something like this:</p> </p> 

> Apply this rule after the message arrives  
> with ‘X-Barracuda-Envelope-From: sanford.wallace@spamking.com or From: <sanford.wallace@spamking.com>‘ in the message header  
> clear the message flag  
>   and move it to the Junk E-Mail folder  
>   and mark it as read</p> </p> 

You may need to tweak the rule a bit to match the right messages, but it’s fairly robust.  If you want to allow email from your own address, add an exception to the rule and have the exception match some specific text in your message header or your email signature.