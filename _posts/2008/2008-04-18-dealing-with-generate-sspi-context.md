---
title: 'Dealing with the &quot;Cannot generate SSPI context&quot; error message'
date: 2008-04-18T17:45:00-05:00
---
One of our sales engineers came up to me with with a problem that I had not come across before.  He was getting the error &#8220;Cannot generate SSPI context&#8221; when he tried to back up a database. Before getting too deep into the problem, I&#8217;ll lay out the background of how the problem occurred.

Our applications work with SQL Server 2000 and 2005.  Our desktop applications have the ability to back up the SQL Server database and store the backup on the local machine.  The backup command is issued to the database server, typically on it&#8217;s own server.  The account that SQL Server runs under typically can only access the local file systems.  You can get around that by running SQL Server under an account with network access, but as a shrink wrapped application, we want to under the default installation of SQL Server.

To get around the file system access, I wrote a win32 service that runs on the same machine as SQL Server.  Our applications back up the database through my agent service.  When the agent receives a backup request from a client, it does the following:

  1. Performs some preventative maintenance on the database
  2. Defragments the log file
  3. Backs up the database to local path
  4. Compresses the database backup to a .zip file
  5. Sends the compressed backup to the client
  6. Deletes the backup and compressed backup from the server.

It does a few other things, but those steps are the highlights of the backup process.  Our engineer was getting the &#8220;Cannot generate SSPI context&#8221; error right at step one.  I have never come across that error so it was time to fire up Google and go searching.  One of the top hits for goggling that error message was a KB article, [811889](http://support.microsoft.com/kb/811889 "How to troubleshoot the "Cannot generate SSPI context" error message").  It was informative, but not especially helpful for me.  The top hit was much more helpful, [“Cannot generate SSPI context” error message, when connect to local SQL Server outside domain](http://blogs.msdn.com/sql_protocols/archive/2005/10/19/482782.aspx), on the SQL Protocols blog.  Who knew that SQL Protocols had it&#8217;s own blog.  This post had all of the good details of what was happening and suggestions on how to resolve it.  I like that.

In short that error can occur when all of the following are true:

  1. The hosting machine of SQL Server is connected to a network, including home network or dialup connection, but it is disconnected from its domain.
  2. The OS of the hosting machine is Windows XP or 2000. Not windows 2003.
  3. The connection is to a local SQL Server.
  4. Connection configuration causes network library to choose TCP/IP provider.

The root cause is that agent service is using integrated security to connect to the local server over TCP/IP.  The SSPI in the error message stands for Security Support Provider Interface.  SSPI is a set of Windows API that handle delegation and authentication over data transport layers (TCP, Named Pipes, etc).  With TCP/IP and SSPI, the Kerberos protocol is used to authenticate the user account.  This will attempt to access the Active Directory services of the domain that the user is logged into.  If that domain is not accessible, the authentication attempt will fail.  This check will only occur if SSPI detects that it is on a network.  If it&#8217;s not on a network, it will use NTLM, which for our situation will work just fine.

In our case, the engineer has a laptop and he logs into it with a domain account.  If he&#8217;s demoing the products at a clients site, he may have a network connection, but not be connected to our domain.  The immediate work around was for him to close his network connection and do his backup.  Literally all he needed to do was to press a button on his laptop to turn off his wireless adapter.

The long term solution will be for me to change conditions #3 or #4.  The code is currently hard coded to connect to a sever named &#8220;(local)&#8221;, I may try replacing that with the TCP/IP loopback address 127.0.0.1.  If that doesn&#8217;t work, I add a setting that allows the agent service to connect with the Shared Memory or Named Pipes providers.
