---
id: 37
title: One week with FiOS TV
date: 2011-04-05T04:59:00-05:00
layout: post
guid: http://www.rajapet.com/?p=37
permalink: /2011/04/05/one-week-with-fios-tv/
---
It’s been a week since I switched from Time Warner Cable to Verizon FiOS TV.  After years of having only one choice in my town for cable TV, Verizon just started offering FiOS TV. While I appreciate the quality of support that I had received from TWC, I was ready to switch providers.  I’m getting better technology at lower price from VZ.

I already had FiOS Internet, bundled with the Verizon Phone service.  I had TWC digital cable with a single Set Top Box (STB) and a CableCARD for my TiVo HD.  I was able to get their digital lineup on two TV sets, and a limited selection of their lineup on the analog channels on two more sets.  I love my TiVo and had two Series 2 boxes on the analog cable, and a TiVo HD connected to the digital cable.  The combined total of FiOS Internet, TiVo subscriptions, phone, and cable, came to around $200 a month.  My FiOS Internet connection speeds where set to 20 MB/s down, and 5 MB/s up.

I upgraded to the FiOS Extreme Triple Play package.  This gave me a selection of channels a little better than the selection that I had TWC digital cable.  I also gained a faster Internet connection, rated at 25MB/s in both directions.  Over the last week, I did spot tests at different times and I was getting results like this:

<img src="https://i1.wp.com/www.speedtest.net/result/1224347137.png?w=680" data-recalc-dims="1" /> 

If you use any online service for printing digital pictures, you’ll appreciate that upload speed.  On the days where I need to work from home, the connection to my office network is fast enough that I feel like I am at the office.

Since FiOS TV is digital only, I retired my Series 2 TiVo units.  They had been in use since 2005, it was time to say good bye.  TiVo customer support was nice enough to transfer my TiVo HD to the cheaper rate that I was paying on the Series 2. I ended up getting the [Verizon multiroom DVR](http://www22.verizon.com/residentialhelp/fiostv/receivers/equipment+issues/questionsone/124820.htm) with three set top boxes.  Each STB would be able to access the shows recorded on the DVR.  That wiped out the loss of the Series 2 boxes.  For the TiVo HD, I got a CableCARD so it could get the FiOS TV Channels.

Installation was pretty straight forward.  The installer was friendly and professional and had done a lot of FiOS TV installations.  The CableCARD installation was new to him, and we’ll get to that in a minute.  Since I had had FiOS Internet for the last 5 years, most of the installation prep work was already done.  He just had to check all the coax cable connections.and hook up the new hardware.

Time Warner had done a pretty good job with the coax wiring over the years.  The installer only had to do a couple of things with the coax wiring, mainly removing the splitters from the the two TV sets that had the Series 2 boxes.

The first thing that was installed was the FiOS router.  He installed an [Actiontec MI24WR (Rev F)](http://www.actiontec.com/products/product.php?pid=213).  This router took the Ethernet cable coming in from the [Verizon ONT](http://www.dslreports.com/faq/12565) and provided the FiOS Internet over WiFi and through the Ethernet jacks.  It provided CATV and TC/IP to the DVR and STBs over the coax cable.

While this appears to be a decent enough router, my existing [Netgear WNDR3700 router](http://www.netgear.com/products/service-providers/routers-and-gateways/gigabit-ethernet-routers-gateways/WNDR3700.aspx) has better hardware for WiFi.  After the installer got the Actiontec working, I hooked my router to the Actiontec.  I had to make some minor changes to the Netgear to let it coexist with the Actiontec, then I logged into the Actiontec and turned off it’s WiFi radio.

It takes a while for the DVR and STBs to come online.  While we were waiting, we tackled my TiVo HD.  This was installer’s first experience with a CableCARD, so he let me help him out. But first, I need to explain something about using a CableCARD with Time Warner.

Time Warner Cable uses a technology called Switched Digital Video (SDV) to be able to provide their channel lineup with their existing bandwidth.  Usually when you have cable TV, all of the channels that you can get are sent over the cable line at the same time.  Your TV or STB knows what frequency each channel is on and when you change the channel, the appropriate frequency is selected.  Nothing new here, it’s been that way in form or another since the days of [Uncle Milty](http://en.wikipedia.org/wiki/Milton_Berle#Mr._Television).

With SDV, only the channels being watched in your general neighborhood are going over the wire.  When you change the channel, the STB requests to have that channel provided.  If that channel is already being sent your street or apartment building, then you get the current frequency of that channel.  Otherwise the local office enables that channel and tells the STB what frequency it’s on.

A TiVo box has no idea how SDV works.  So the TiVo people and the CableCARD people came up with a device called the [tuning adapter](http://www.timewarnercable.com/neowpa/site.faqs/DigitalCab/SwitchedDi/What-is-a-Tuning-Adapter). It sits between the TiVo and the cable and TiVo knows how to talk to the tuning adapter.  When you change the channel on the TiVo, it sends a message to the tuning adapter, which in turn does the SDV dance with the office, and the end result is that you get your channel.  When it works, it’s fast and transparent to the end user.  My experience with the tuning adapter was that every few months or so, it would lose the ability to get the channels and you would have to reboot it.  This functionality isn’t unique to the TiVo, the TWC DVR and STB just have it built in.

FiOS TV does not use SDV, so I didn’t have to deal with any tuning adapter nonsense.  We pulled the TWC cable card out, unplugged the tuning adapter, and plugged in the VZ supplied CableCARD.  TiVo is very helpful with CableCARDs.  When you insert new one it, TiVo automatically displays the information that installer needs to get the card activated.  With TWC, the installer had to call in the information from the card.  It took a few tries to get it working.  With FiOS, the installer had an app that he installed on my PC and he was able to activate the card easily.

The TiVo immediately saw that the card was activated, and we went through it’s guided setup to tell it that it had a new cable provider.  For some off reason, Verizon had not notified TiVo that my zipcode was covered by FiOS.  I had called TiVo a few days before the install, and they provided me with a list of zipcodes that would work.  I entered in the closest one in, and my TiVo was now in FiOS country.

After telling it that it was now on FiOS TV, the TiVo connected to it’s mothership and downloaded the new lineup and channel guide information.  It then migrated over the season passes from the old TWC channel numbers to the channel numbers used for the same stations on FiOS TV.  I was amazed how well that worked.

We have been using the FiOS TV for a week now and we are very happy with it.  The picture quality appears to be noticeably better than TWC.   Verizon does not apply any additional compression to the programming, and it looks like Time Warner Cable does.

The FiOS DVR is very good.  Very easy to use and works great from the STBs.  On a scaled from 1 to 10, where the basic TWC HD DVR is a 1 and the TiVo HD is a 10, I would rate the FiOS DVR a solid 7.  If you never used a TiVo before, you would be very happy with just the FiOS DVR.  While you can’t pick a show to record from the STB, there are mobile apps iPhone, iPad, Android, and the web, that let you easily program the DVR.  The DVR has a 500GB drive, big enough to record 50 to 70 hours of HD programming or 200 hours of SD programming.  That’s about 3 times more storage than I have with the TiVo HD.

The software running on the DVR and STBs is much nicer than the software running on the TWC STB box.  It’s much snappier to navigate and is just better to use.

There are few drawbacks.  I lost BBC America HD, I’m going to miss that channel.  FiOS TV does have the SD channels, so I still get to see the shows.  It just wont be in HD.  I know, a “First World Problem”, but I did want to be fair.  It sounds like [they are planning on adding BBCA HD](http://forums.verizon.com/t5/ideas/v2/ideapage/blog-id/ideas/article-id/1114/page/1#comments), but I have no idea when.

If the hardware fails, I have to call and have a replacement shipped to my home,  As of right now, there is no local store for getting replacement hardware.  And any TV set that you want to watch FiOS TV with is going to need a CableCARD or cable box.  The days of just plugging the coax into the back of the TV and letting the TV tune the channels are over.

I was a loyal Time Warner Cable customer for close to 20 years.  Their service was professional and they did the best they could with dealing with SDV issues.  And they had no way of matching the Internet speeds that I have had with FiOS.  Verizon has the advantage with the newer technology.  With the cancelling the two TiVo subscriptions and consolidating the cable, phone, and Internet, I will save about $40 to $50 a month.  Since I’m getting more features for less money, I’ll count that as a double win.