---
title: Twitter? Time Warner Cable gets it
date: 2010-04-18T04:25:00-05:00
---
I have a love/hate relationship with Twitter.  Some days, I think it’s greatest time waste since they [invented the meeting](http://quotationsbook.com/quote/25915/).  Other days, it’s an [endless](http://twitter.com/badbanana/statuses/12173953400) [source](http://twitter.com/willplatnick/statuses/12366277060) [of](http://twitter.com/BrianPeek/status/12299760959) [amusement](http://tweetingtoohard.com/).  And on some days, it’s actually useful.  Yesterday was one of the useful days.

At about 9m last night, my 10 year daughter came running into my home office.  Kathryn was convinced that she had broken the TV.  Since the destruction of electronic devices is her sister’s department, I went in to the bedroom to take a look.  Kathryn was watching a show on [TLC HD](http://tlc.discovery.com/hdtv/) and it was not coming in well.  The audio was distorted and the image had tiling artifacts.  I assured my daughter that it wasn’t her fault and sent her off to read a book.

I checked a few channels and sure enough, it wasn’t just TLC HD that was having problems.  Most of the channels had the same problem.  And yet, a small number of channels were just fine.  My decidedly non-scientific search had determined that the SDV channels were having the problem and the non-SDV channels were just fine.  

SDV or [Switched Digital Video](http://en.wikipedia.org/wiki/Switched_digital_video) is a technical hack that allows cable companies to provide more channels than they actually have the physical bandwidth to carry them to every home.  What they do is to only provide a channel when a view switches to that channel.  A cable node will supply somewhere between 1000 to 2000 homes in a neighborhood.  If the cable company provides 200 channels, only a fraction of that number is actually being watched at any time.  

The “Switched” part of SDV means that the frequency that the channels goes out on is not fixed, it can changed based on usage.  When you select a SDV channel from your set top box, the channel request goes back to the cable office.  They check to see if any other box on your node is watching that channel.  If it’s in use, the cable office sends back the frequency that the channel is on, and you get to watch “[Matlock](http://www.tagsrwc.com/matlock/)”.  

It’s a clever hack, but it’s still a hack.  If you get enough people on your node to watch a different channel, it will fall apart like a cheap suit.  While I doubt that would actually happen, it’s technically feasible.  They can spend the money running Fiber optic to each node, and making the last run to house over copper.  Running fiber to each house is very expensive.  Just ask Verizon [how much it costs](http://ecpmblog.wordpress.com/2010/03/27/stat-wiring-a-neighborhood-for-fios-costs-verizon-about-750-per-home-actually-connecting-a-home-to-the-network-costs-another-600/) to wire a neighborhood for FiOS.

If no one else is currently watching that channel, the cable company assigns the channel to an open frequency for your node and sends that frequency back down to your set top box.  If you have a [TiVo](http://www.tivo.com/), the process works the same way.  Your cable company provides a device called a [Tuning Adapter](http://support.tivo.com/app/answers/detail/a_id/133), that manages the frequency negotiation between the TiVo and the cable office.

I have both a set top box and a TiVo HD with a Tuning Adapter.  The set top box was having the audio distortion and video artifacts.  The TiVo wasn’t even displaying the SDV channels.  Since the non SDV channels were crystal clear, I guessed that it wasn’t a signal problem and the problem was more likely than not an issue at the cable office.  Since I could reproduce the problem with just the cable company’s equipment, I decided to call their tech support line.

My cable provider is Time Warner Cable of Albany, NY.  I went to their web site to look up their support number.  I called it and heard a recorded message explaining that there would be a long wait time for technical support.  TWC Albany is pretty well staffed, that only happens when something bad has happened.  

While I was in the hold queue, I saw an option for chat support on their web site.  I tried that and the best thing that I can say about that experience was that it occupied 45 minutes of my time without any resolution.   The sum of the support rep’s skill set was to have me reboot the set top box and when that did not resolve the issue, he then scheduled a service call for a time slot that was 9 hours in the past.  Since my cable package did not include any time travel options, I wrapped up that chat session and tried calling the Albany support number again.  This was about 10pm.

While I was in a never ending on hold queue, I decided to see who from Time Warner Cable was on Twitter at that hour. As it turns out, the corporate office of Time Warner Cable has a bunch of people on Twitter.  Their main support account is [@TWCableHelp](http://twitter.com/TWCableHelp "Time Warner Cable's customer care team--ready to help! Email us at twcable.help@twcable.com") and I could see on [Tweetdeck](http://www.tweetdeck.com/) that they were active at this late hour.  I [tweeted](http://twitter.com/anotherlab/statuses/12317044092) the following message:

> Can @TWCableHelp help with local issues? My SDV channels are unwatchable and I made the mistake of trying TWC online chat

The message was a little snarky, but 45 minutes of chatting with a CSR in India will do that to you.  Within two minutes, I got the following [response](http://twitter.com/TWCableHelp/statuses/12317111509):

> @anotherlab Can certainly take a look into your issue. Had eChat already rebooted the box? ^BP

We then traded a few tweets and Bryan (the ^BP in the message) ended up calling me.  He was very professional and had a pretty good sense of humor.  We immediately ruled out time travel as an option and he was able to remotely check the signal strength coming into my set top box.  Everything looked normal.  While we were discussing what the root cause could be, the problem cleared up.  What ever had been going on at the local office, the problem appeared to have been resolved.  

We checked the channels on the set top box and on the TiVo.  From his end, he could see that about 50 channels where being sent over SDV on my node.  So we picked a few channels were not being sent at that moment. Everything was normal.  

We chatted a bit about my TiVo and I mentioned that a few people had been complaining about the latest software update that went out to the DVRs that TWC supplies.  He wanted to know more about those complaints.  I told him that I didn’t know too much about those problems, but I had read a few complaints on some local sites.  I gave him a few links ([Kristi Gustafson at the Albany Times Union](http://blog.timesunion.com/kristi/25572/what-do-you-want-to-know-about-your-new-time-warner-dvr/ "What do you want to know about your new Time Warner DVR?") and [Albany HDTV](http://albanyhdtv.proboards.com/index.cgi?action=gotopost&board=boxes&thread=3310&post=8998 "TWC finally getting new dig. cable interface")) and he checked them out while we were talking.

Bryan then asked if I had any other questions.  So I asked him about the [CCI Flag](http://en.wikipedia.org/wiki/Copy_Control_Information).  Almost all of the digital channels (except for local stations) carried by Time Warner Albany have the CCI Flag set to 0x02, which is usually referred to as “Copy Once”.  “Copy Once” means that the show can be recorded to a DVR, but it can not be copied from the DVR.  The DVR must respect the CCI Flag, otherwise it would not be allowed to use a [CableCARD](http://en.wikipedia.org/wiki/CableCard), which is needed to access the digital content.

This is not an issue with the DVR that the cable company supplies, but TiVo can do quite a bit more than a cable company DVR.  If you have multiple TiVo DVRs in your house, you can copy shows from one to another.  If you have young children like I do, that is a very handy feature.  We can also copy the shows to a PC for storage and transfer them back at a later date.  The video files are copy protected, it’s not like you can just upload them to the great unwashed masses on the Internet.

I have a couple of TiVo boxes and it’s been handy to watch a show recorded on one TiVo from another.  When the CCI flag is set to “Copy Once”, the only copy allowed is the copy on the first TiVo.  It just wont copy it to another TiVo in the house.  Many cable providers set most of the channels (excluding Pay Per View and premium channels like HBO) to 0x00, which is usually called “Copy Freely”.

Bryan told me that it was a local cable office decision. I told him that the local cable office had made it clear to me that the decision was mandated by Time Warner Corporate.  He said that he would look into it and then would get back to me on that.  i think that he will find that it’s a dead end, but it was worth a shot.

All and all, I was very satisfied with the support provided by Time Warner Cable through their Twitter account.  But please change the CCI flag.
