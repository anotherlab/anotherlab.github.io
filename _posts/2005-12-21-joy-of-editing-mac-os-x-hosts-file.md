---
title: The joy of editing the Mac OS X hosts file
date: 2005-12-21T21:41:00-05:00
---
I have a G4 iMac on my desk. You know, one of the ones that looks like a desk lamp. It competes for space with my two XP boxes. I do my development under XP, the iLamp is for testing our web apps. The ilamp more or less sees our network, but it can&#8217;t resolve workstation WINS names to actual IP addresses. Since I know zip about configuring Mac OS X networking, I figured I would cheat and just add the workstation IP addresses to the hosts file on the iLamp. In a normal OS, you just edit the hosts file and be done with it, not with the iLamp. No sir, you have to mix the cutting edge of 1978 technology with arcane Mac OS X commands. After some googling, I found what I needed here at [macosx.com](http://www.macosx.com/forums/archive/index.php/t-10694.html). You have to run a unix/linix/whatever shell, edit or create the hosts file, then load it with niload. And that&#8217;s the simple way to do it. If you want to do it with the GUI tools, it&#8217;s pretty damn tedius.

> Launch netinfo, located at /Applications/Utilities/NetInfoManager  
> Under the Domain menu, select Security, and Authenticate. Type a username and password with admin prividledges.
> 
> Select, in the Directory Browser, / and then &#8216;machines&#8217;.
> 
> Either press apple-n, the icon that looks like &#8216;new folder&#8217; or go to the Directory menu, and select &#8216;new sub directory&#8217;.
> 
> This should insert a flag at /machines/net_directory
> 
> Unless you are creating an entry for a host named &#8216;new_directory&#8217; you&#8217;ll want to rename it.
> 
> Select, in the &#8216;Directory: new\_directory&#8217; plane that has &#8216;property and Value(s)&#8217; stuff the first, and only entry (&#8220;name | new\_directory&#8221;).
> 
> Under the &#8216;Directory&#8217; menu, select &#8216;Delete value&#8217;.
> 
> The entry should now read &#8216;name | <no value>&#8216;. Which is good.
> 
> Now, enter the hostname, which can be something simple like myfileserver or as &#8216;complex&#8217; as files.danz.quons.net or whatever.
> 
> So, select the name and <no value> line, and go to the directory menu, and select &#8216;insert value&#8217;. (option-apple-i)  
> Now type the hostname.
> 
> Next, we need to input an ip address.
> 
> First, insert a new property, called &#8216;ip_address&#8217;.  
> apple-shift-n or apple-shift-i (eye &#8211; look in the directory menu, you&#8217;ll see it).
> 
> where it says &#8216;new\_property&#8217;, click and type &#8216;ip\_address&#8217;.
> 
> Where it says &#8216;new_value&#8217;, type the ipaddress that goes with the host you inserted.
> 
> If you wish, you can enter more than one hostname, so if for example you wish matrixbaby.graphics.ddn.net and matrixbaby both to go to the same IP, just insert an additional value to the name property:
> 
> Select &#8216;name&#8217; and under, the &#8216;directory&#8217; menu, select &#8216;insert value&#8217; (apple-option-i).
> 
> That should do it, close out of netinfo, and you&#8217;re set. If you wish to properly name your computer, either insert/modify the entry called &#8216;localhost&#8217; and give it a name, in addition to localhost. I think thats what I did. you can also modify the /etc/hostconfig file, change the HOSTNAME= localhost to whatever you wish.
> 
> </no></no>

I guess it could be worse, at least Mac OS X has a command line.
