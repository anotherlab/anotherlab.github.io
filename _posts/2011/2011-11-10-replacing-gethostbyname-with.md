---
title: Replacing GetHostByName with GetHostAddresses
date: 2011-11-10T06:06:00-05:00
---
I’m working on some C# code that needs to send some data over a socket connection.  The user can specify the destination by name or by IP address.  I was using syntax like the following to get the address

<pre>IPAddress addr = Dns.GetHostByName(host).AddressList[0];<br /><br />IPEndPoint endPoint = new IPEndPoint(addr, 9100);</pre>

That worked, but VS2010 spits out the following warning:

&#8216;System.Net.Dns.GetHostByName(string)&#8217; is obsolete: &#8216;&#8221;GetHostByName is obsoleted for this type, please use GetHostEntry instead. [http://go.microsoft.com/fwlink/?linkid=14202&#8243;&#8216;](http://go.microsoft.com/fwlink/?linkid=14202%22')    

So I replaced the call to [GetHostByName](http://msdn.microsoft.com/en-us/library/system.net.dns.gethostbyname.aspx) with [GetHostEntry](http://msdn.microsoft.com/en-us/library/ms143998.aspx). When I passed in the IP address as a string GetHostByName, it threw an error, &#8220;No such host is known&#8221;. 

That&#8217;s not good. I didn&#8217;t want to use obsolete code, but the recommended replacement wasn&#8217;t working. I did a bit of searchnng on the Internets and found that GetHostEntry attempts to do a DNS reverse resolve and that doesn&#8217;t always work. As it turns out, GetHostEntry is not the only method that can be substituted for GetHostByName. [GetHostAddresses](http://msdn.microsoft.com/en-us/library/system.net.dns.gethostaddresses.aspx) will return the IP address for the specified host. I was able to use the following code without any warnings: 

<pre>IPAddress addr = Dns.GetHostAddresses(host)[0];<br /><br />IPEndPoint endPoint = new IPEndPoint(addr, 9100);</pre>

And we are good.
