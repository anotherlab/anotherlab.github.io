---
id: 60
title: Wifi password cracking in the clouds
date: 2010-07-27T21:02:00-05:00
layout: post
guid: http://www.rajapet.com/?p=60
permalink: /2010/07/27/wifi-password-cracking-in-clouds/
---
Bruce Schneier posted [an article on his blog about wpacracker.com](http://www.schneier.com/blog/archives/2010/07/wpa_cracking_in.html), a service for cracking [WPA](http://en.wikipedia.org/wiki/Wi-Fi_Protected_Access) and other passwords.  Basically, you send them a dump of network traffic from a WiFi network and they will use a brute force algorithm to guess the password.  With a massive dictionary and brute force computing. they claim to be able to crack most WPA passwords in 20 minutes.  Once they have the WPA password, your home network wide open to the outside world.

Some say that with [enough monkeys typing at random on a keyboard](http://www.angelfire.com/in/hypnosonic/Parable_of_the_Monkeys.html), eventually you would get the complete works of [Shakespeare](http://www.npr.org/templates/story/story.php?storyId=92142217).  Actually you wouldn’t (the universe would come to the end first), but that is the general idea of a brute force password attack.  First you use a large dictionary of words, then after exhausting that list you go for a random series of letters and number combinations.  With this company, they are using a 400 CPU cluster and a database of 135 million words.  They are claiming about 20 minutes to crack a password.  That works out to about 7 words a minute per CPU, using from their dictionary.

Processing 7 words a minutes per CPU to test a world from a dictionary doesn’t sound very fast at all.  It does take a lot of computer horsepower to crack WPA passwords. WPA passwords are case sensitive, which means each letter in a password could be either upper or lower case.  An 8 letter word would have 2<sup>8</sup> possible combinations.  It can take a while to work through the iterations, but with enough CPU power, you’ll work though most common words.

The way it works is that someone can park in front of your house and use commonly available software to capture the wireless data being broadcast through your house.  If you are using WPA encryption, then all of the data will be encrypted.  They can then send a copy of that data to the wonderful people at wpacracker and pay them $35.  They will get back your WPA password, if the wpacracker people were able to crack it.

You can make it much,much harder for the password to be cracked.  Just use long passwords and use numbers with the letters.  WPA passwords are case sensitive, so if you limit the characters to just the upper and lower case letters, plus the numbers, you have 62 possible choices for each character in the password.  If you pick an eight character password, you would 62<sup>8</sup> possible passwords.  That’s a pretty big number.  With 16 characters, you get 62<sup>16</sup>, which is 4.something , followed by 28 zeros.  That’s a number beyond big.  A brute force attack with today’s hardware would take centuries to process.  

I use a 32 character password, brute force attempts will fail on that one. But I cheat a little.  I’m not going to remember a 32 character sequence, and it would just take forever when someone visited my home and we had to type in a random 32 character sequence.  What I did was to make up a random 8 character sequence using a 4 letter family name and 4 digits and then repeat that sequence 4 times.  It’s easy to remember and easy to type.  Something like “Doug2112”. It wont show up in the dictionary and it’s not going to get cracked.  When I’m letting someone on our network, I just have them open up notepad and type in the 8 characters and then copy and paste it 4 times into WPA password dialog.

Update:  
If you want to quickly test your password to see how long it would take for a desktop PC to crack it, try <http://howsecureismypassword.net/>.  On that site, they estimate that a desktop PC would crack the “Doug2112” password in 252 days. For that phrase repeated 4 times, they came up with 32 octillion years.  Take that with a grain of salt, but it shows how much harder it is to crack longer passwords.