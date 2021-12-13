---
id: 103
title: Sorry it didn’t work out
date: 2009-02-10T15:18:00-05:00
layout: post
guid: http://www.rajapet.com/?p=103
permalink: /2009/02/10/sorry-it-didnt-work-out/
---
My work email inbox had a lot of spam this morning.  The messages were very similar in content with subtle variations in the sender and subject fields.  Nothing unusual there.  The odds are that someone got hit with a virus and my email address was in their address book.  That’s the tax we pay for free transmission of email.  [Okay people, move along, there’s nothing to see here](http://www.nationmaster.com/encyclopedia/Officer-Barbrady#Quotes "Obligatory Officer Barbrady reference").

As collateral damage, I also received an automated error message from someone else’s email server.  That person got spammed from the first guy’s virus and the spam email used my email address as the sender.  Once again, typical tactics.  I usually delete these messages without even looking at them, but the error message caught me eye.  The message contained the following text:

> Hi. This is the qmail-send program at something.something.something.net.  
> I&#8217;m afraid I wasn&#8217;t able to deliver your message to the following addresses.  
> This is a permanent error; I&#8217;ve given up. Sorry it didn&#8217;t work out.
> 
> <somebody@alaska.net>:  
> qmail-spawn unable to open message. (#4.3.0) I&#8217;m not going to try again; this message has been in the queue too long.
> 
> &#8212; Below this line is a copy of the message.
> 
> Return-Path: <theguywithavirus@yahoo.co.uk>

The email addresses were changed to protect the innocent.  I found that text to be greatly amusing.  I’m working on a some error handling code for one our products and I am going to find a way to work in the text “This is a permanent error; I&#8217;ve given up. Sorry it didn&#8217;t work out.”.  It’s a subtle bit of humor and for the use case that I working on, entirely appropriate.