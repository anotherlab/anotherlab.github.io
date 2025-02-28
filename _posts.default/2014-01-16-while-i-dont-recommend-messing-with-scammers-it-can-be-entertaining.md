---
id: 590
title: 'While I don&#8217;t recommend messing with scammers, it can be entertaining'
date: 2014-01-16T20:17:33-05:00
layout: post
guid: http://www.rajapet.com/?p=590
permalink: /2014/01/16/while-i-dont-recommend-messing-with-scammers-it-can-be-entertaining/
---
I was doing coding on my home machine when the phone rang.  The Caller ID said &#8220;Out of State&#8221;.  When Caller ID comes up like that, I know the call will not be in my benefit.

I answered the phone and there was a 30 second delay before someone speaks on the other end.  I like to imagine that I was called by an [ED-209](http://www.omnicorp.com/products/ed-209.php) and it&#8217;s cycling down and that&#8217;s why there is a delay.

&#8220;Hello this is Andy from Windows, we have reported a security report with your computer.  You have a virus and we are calling to fix it.&#8221;

Ok, this is the start of a scam.  The right thing to do here is to just hang up.  Don&#8217;t engage these idiots.

So I decided to play along.  I was testing some code that I had written with a virtual machine of Windows 7 running.  I had a few brain cycles to waste while I was working. This is what I replied back with:

Me: &#8220;Oh no, what happened?  How do we fix it&#8221;  
Andy: &#8220;We are from Windows, we received reports of malware running and you need to fix it&#8221;  
Me: &#8220;Ok!  What do we do?&#8221;

Andy: &#8220;Can you go to your computer? Take your time, I can wait.&#8221;  
Me: &#8220;I&#8217;m sitting right in front of it now&#8221;.  
Andy: &#8220;Please go to the computer&#8221;  
Me: &#8220;I&#8217;m already at the computer. Take your time figuring that out, I can wait&#8221;

Andy: &#8220;Look at your keyboard. On the left side there is a button spelled C-T-R-L. Do you see that key?&#8221;  
Me: &#8220;Yes, I do&#8221;  
Andy: &#8220;What is on the key to the right of the CTRL key?&#8221;  
Me: &#8220;It has a window on it. I love this key. It lets me do things&#8221;.

Andy: &#8220;Ok, I need to to press that window key and while holding it down, press the R key and then let go.  
Me: &#8220;Ok, I did it&#8221;  
Andy: &#8220;What do you see?&#8221;  
Me: &#8220;Solitaire&#8221;  
Andy: &#8220;What did you say?&#8221;  
Me: &#8220;Solitaire just started&#8221;  
Andy: &#8220;That should not happen&#8221;  
Me: &#8220;Oh no, is that the virus?&#8221;  
Andy: &#8220;Yes that is your virus. Please close Solitaire press the window key then the R key&#8221;  
Me: &#8220;Solitaire!&#8221;

We repeat the Win-R shenanigans a few more times, then I tell him that the Run dialog came up.

Me: &#8220;A window named Run just came up.  Is that the virus?&#8221;  
Andy: &#8220;No, that is not the virus.  What does this window have on it?&#8221;  
Me: &#8220;The name of the program, folder, document, or Internet weasel, and Windows will open it for you.&#8221;  
Andy: &#8220;Do you see a space panel next to the word open?&#8221;  
Me: &#8221; A SPACE PANEL?  Did NASA install a virus on my PC?&#8221;  
Andy: &#8220;No, NASA did not install a virus on your PC. It&#8217;s a box that you can type text into&#8221;  
Me: &#8220;Do you mean the drop down combo box?&#8221;  
Andy: &#8220;Yes, please type **eventwr** into the panel&#8221;  
Me: &#8220;It started solitaire again. Is this the virus?&#8221;  
Andy: &#8220;Lets try this again..&#8221;

Andy walk me through the launching of the  Windows Event Log Viewer&#8221;. I had a idea of what he was going to do next, so I decided to ramp up things&#8230;

Andy: &#8220;What do you see now?&#8221;  
Me: &#8220;It says **Event Viewer**&#8221;  
Andy: &#8220;Great! Now we can show you evidence of the malware on your PC. On the left side of the **Event Viewer**, you should see **Event View Local.  **Can you read to me what is listed under that?&#8221;  
Me: &#8220;Custom Views, Windows Log, Application and Services Logs, Subscriptions, Pizza&#8221;.

That threw Andy and he made me repeat that list twice. But that didn&#8217;t stop Andy&#8230;

Andy: &#8220;I want you to left click **Custom Views** twice, quickly&#8221;  
Me: &#8220;Ok!  Did this fix the virus?&#8221;  
Andy: &#8220;No, this will show you that you have a virus.  You should see some text underneath **Custom Views**.  Please read them to me.&#8221;  
Me: &#8220;Cisco, Waffle, Administrative Events&#8221;  
Andy: &#8220;Please click twice on **Administrative Events.** Now you will see the virus activity. Did you click on it?&#8221;  
Me: &#8220;Yes, I did. No virus here! Yay!&#8221;  
Andy: &#8220;No, do you see the red error messages? That&#8217;s from the virus&#8221;

Of course you would see error messages with the red icon in the event log. It wouldn&#8217;t be Windows if some app or service wasn&#8217;t complaining about something.  But I was going to make him work a little harder&#8230;

Me: &#8220;I don&#8217;t see any error messages&#8221;  
Andy: &#8220;What?  There must be something there&#8221;  
Me: &#8220;Nope&#8221;  
Andy: &#8220;What does it say at the top?  
Me: &#8220;Administrative Events and the Number of events is zero&#8221;

Andy is trooper and continues on. He has me click on the **Application Log** under **Windows Logs**. There&#8217;s always an error or two there.  I play dump and tell him that there are only information messages

Andy: &#8220;Read me what it says for the first one&#8221;  
Me: &#8220;The disk fragmenter successfully completed defragmentation on C:&#8221;  
Andy: &#8220;That is your virus. We can fix you. You need to go to our website and we can fix it from there. Do you know which web browser you have&#8221;  
Me: &#8220;Yes, I have the Internets. It&#8217;s running now&#8221;  
Andy: &#8220;What do you see on your Internet?&#8221;  
Me: &#8220;This page could not be loaded&#8221;  
Andy: &#8220;You have to have Internet or we can&#8217;t help&#8221;  
Me: &#8220;I have Internet, I can get to the Bing&#8221;

Andy walks me through how to identify the address field and asks me to type in http://www.support.me.  That page will redirect to a LogMeIn page.  LogMeIn is not part of the scam, but they provide tools so that support people can take remote control of your PC to fix problems.  That&#8217;s usually a good thing. Just not in this case.

So that tells me that they are going to take over my PC remotely. Even though I&#8217;m playing with a virtual machine, I&#8217;m still not going to let that happen&#8230;

Andy: &#8220;Do you see the **start download** button?&#8221;  
Me: &#8220;No&#8221;  
Andy: &#8220;What do you see?&#8221;  
Me: &#8220;Technology Support for a Connected World&#8221;

I was on support.com and we played the random url game for a minute.  I then went to www.support.me

Me: &#8220;I keep going to www.support.me, but it keeps going to LogMeIn Rescue. Is that the virus?&#8221;  
Andy: &#8220;No, that is the tool we use to fix your PC.  You see a place to enter a code?  I need you to enter that code&#8221; _[Andy reads a 6 digit code to me]_ &#8220;and press the download button&#8221;  
Me: &#8220;It doesn&#8217;t work&#8221;  
Andy: &#8220;What?  Please try it again, you maybe typed it wrong

Of course I was typing it in wrong.  I was following the universal programmers rule of typing in all &#8220;9&#8221;s and hoping that it was an invalid code.  it came back as invalid and with an error message.

Me: &#8220;It says **Code does not exist. Please contact your support provider.**&#8221;  
Andy: &#8220;OK, I get you another code&#8221;

Andy gets another code and I report back that I get the same message.  I can hear some tension in his voice now.  He&#8217;s so close to taking over my machine.  Andy tells me that he is putting his support manager on the line.  I go through the same process with both codes with new guy.  He gives up and says that I am being tranferred over to his IT guy.  This guy does does the same bit and coughs up a 3rd code. I drive this guy nuts by repeating the numbers back to him transposed.  He gets annoyed and hangs up on me.

So I click the &#8220;Report Abuse&#8221; button on the LogMeIn page and call the number listed on that page.  After a remarkably short time on hold, I get a friendly CSR on the line and I start telling her what happened.  She asked if I was given a 6 digit code.  I told her that I had three of them.  She asked how I got three and when I explained that I kept repeating the error message, she started laughing and said that I had made her day.

The end result was the accounts that these scammers had opened with LogMeIn  have been burned and the LogMeIn people are going to look into how they were registered.  Did I stop this people? No, they&#8217;ll just open some new accounts.  But I did waste their time, the time spent trying to get me to play their game meant that one less person was targeted by them today.