---
id: 1250
title: Trying to get Apple Testflight to send new build notifications
date: 2015-04-09T15:57:54-05:00
layout: post
guid: http://www.rajapet.com/?p=1250
permalink: /2015/04/09/trying-to-get-apple-testflight-to-send-new-build-notifications/
---
I used TestFlight 18 months ago when I finished our first iOS app.  It worked great.  It was a stand alone service that allowed you to beta test your apps before submitting them to the Apple App Store.

Then Apple bought the Testflight company and it works not so great.

The latest hitch is that it doesn&#8217;t generate update notices to testers when a new build is uploaded to iTunes Connect.  As near as I can tell, you have edit the &#8220;What to Test&#8221; field in the app record in iTunes Connect and then save those changes.

Once you do that, the email invitations go right out.  This is not [documented](https://developer.apple.com/library/prerelease/ios/documentation/LanguagesUtilities/Conceptual/iTunesConnect_Guide/Chapters/BetaTestingTheApp.html) by Apple.  I did it mentioned on [Stack Overflow,](http://stackoverflow.com/a/27150153)  If this is a required field for the workflow, it should be documented as such.  It&#8217;s just common sense.

Apple violated some basic rules when they acquired Testflight:

  * If it&#8217;s not broken, don&#8217;t fix it.
  * Don&#8217;t make me think.