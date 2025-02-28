---
title: 'Technical Support: Verizon FiOS vs McAfee'
date: 2007-10-07T03:04:00-05:00
---
It all started this morning when my wife went to check her email. She said that it wasn&#8217;t working, so I took a quick look. She uses [Thunderbird](http://www.mozilla.com/en-US/thunderbird/) to check her [Verizon FiOS](http://www22.verizon.com/content/ConsumerFios) email account. Thunderbird would connect to the [POP3](http://en.wikipedia.org/wiki/Pop3 "Post Office Protocol version 3 (POP3)") server, incoming.verizon.net, but would time out after a minute or two with the message &#8220;Connection to server incoming.verizon.net timed out&#8221;.

So I [pinged](http://en.wikipedia.org/wiki/Ping#Sample_pinging) incoming.verizon.net and it responded right back, so it didn&#8217;t seem like a [DNS](http://en.wikipedia.org/wiki/Dns) resolution type of error. I logged into her email through Verizon&#8217;s online [webmail interface](http://netservices.verizon.net/portal/link/main/vzcentral "Verizon Central"). That worked, so her account and password were still good. I went to the Verizon FiOS portal page and went through the various help topics. It didn&#8217;t like Firefox so I fired up IE7. It didn&#8217;t like Vista and complained that Windows 98 wasn&#8217;t supported.

That ruled out online support, but it did surrender a toll-free tech support number: (888) 553-1555. (btw, if you ever need to find support number, try the [gethuman database](http://gethuman.com/ "The gethuman 500 database")) I went down the automated phone tree until it got to the part where it said that I would need to speak a human. And then told that the wait time for a human would be 31 minutes. 

Here&#8217;s where Verizon goes the extra mile. I was given the choice between waiting on hold for the next available human or they would call me back in 31 minutes. I took the &#8220;call me back&#8221; option and went on with life. About 30 minutes later, Verizon called back and I got to talk with FiOS tech support rep. That&#8217;s pretty cool.

Within 2 minutes, we determined that the email protection in the McAfee Security Center was blocking Thunderbird. I&#8217;ve only had to call FiOS tech support a couple of time and each time I got a person who knew his stuff and didn&#8217;t blindly follow a script.

Basically, if you go into the [McAfee](http://www.mcafee.com/us/) Security Console and disable email protection, Thunderbird works. Enable it again and Thunderbird can&#8217;t access the POP3 server. Pretty easy to duplicate and it was repeatable.

Yesterday, we saw a McAfee popup notifying that an update had been installed. Mentally, I had filed that under &#8220;Yeah, whatever&#8221;. It seemed that the latest update was the culprit.

This was the free version of McAfee that you can get with FiOS, via [MSN Premium](http://en.wikipedia.org/wiki/MSN_Premium). Getting the free McAfee is a story for another posting, they don&#8217;t make it easy. Since the McAfee was more or less provided by FiOS, I figure there would be support, more or less. The FiOS guy told me that I would have to contact McAfee support and he gave me the number (800-337-6840) and offered to transfer me over.

I took the transfer and spent the next 25 minutes on hold, which was less far exciting than it sounds. After reaching a tech support specialist named &#8220;Terry&#8221;, the real fun began.

The first thing Terry asked me was the email account that I had registered my copy of McAfee Security Center under. I tried explaining to Terry, that I never had to register my copy McAfee and that it was provided by [MSN Premium via Verizon FiOS](http://www.verizon.net/micro/betterway/). Tery mulled thatover for a minute and then asked me for the asset code of my Dell computer. Apparently Terry thought I had eval version McAfee provided by Dell. The funny part is my wife&#8217;s machine is new Dell desktop, but we had ordered it with the [&#8220;no software pre-installed&#8221; option](http://direct2dell.com/one2one/archive/2007/06/13/18049.aspx) and her machine did not come with any preinstalled anti-virus application.

I told Terry that I did not have an asset code to give him and it was not relevant to this issue. At this point he finally [grokked](http://dict.die.net/grok/) that I had the McAfee that comes with MSN Premium and I would not be his database. After walking through the steps that duplicate the problem, Terry told me that the solution would be uninstall McAfee Security Center and install a new version. Terry then gave me an issue number and started to wrap the call up. I had no confidence that this would work and requested for Terry to stay on the line. Terry agreed. 

I asked Terry how that be different a version than the one that had just updated himself. He said that the currently installed copy had corrupted files. I asked how about he knew this and he said that other people were having this issue. I uninstalled McAfee Security Center and downloaded the latest version through MSN Explorer. You get a 500KB installer and it grabs the actual installable bits from the Internet. While it was downloading, it displayed the usual metrics of size, time, download speed. The download speed averaged around 45Kb/sec. I have the 20Mbps/5Mbps plan with FiOS, I should have been getting a much faster download. Terry told me that the was heavy demand on their servers with users having to manually download McAfee Security Center.

So after reinstalling McAfee Security Center, nothing was fixed. Thunderbird would only work if email protection was disable. Terry then asked me to turn off the PC and power it back up with the F8 key pressed down. I asked why, and he said that we would need to [boot up in Safe Mode](http://www.computerhope.com/issues/chsafe.htm#03) to see if the email would work without McAfee Security Center running. I made the point that it would be a waste of time since we already new that it work when email protection was disable. Terry made it clear that this step had to be followed. To make a short story long, that didn&#8217;t work either.

Terry then put me on hold to talk to another support person. After a minute or two on hold, Terry came back to say that this was known issue and an updated would be issued through the McAfee update process within 24 to 48 hours. The work around is to disable email protection and try again in 2 days.

At this point, I have better than an hour and half sunk into this phone call. I told Terry that I was upset that I went through uninstalling, downloading, reinstalling, and rebooting into Safe Mode for an issue that they already knew about. Terry then told me that reinstall had fixed the problem all that reported it. There were a couple others that were not fixed and an update would be coming for them. I then asked Terry how he could use &#8220;all&#8221; in one sentence, but indicate &#8220;not all&#8221; in the next. Terry did not understand that question so we ended the call at that point.

At this point I have a lot of respect for Verizon FiOS tech support and almost none for McAfee. I pretty much got what I paid for, no question about that.</p> 

<div>
  Tech Tags: <a href="http://technorati.com/tag/FiOS%20Thunderbird%20McAfee%20Support" rel="tag">FiOS Thunderbird McAfee Support</a>
</div>
