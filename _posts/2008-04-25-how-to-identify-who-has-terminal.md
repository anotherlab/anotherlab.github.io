---
title: How to identify who has a terminal session and how to kill it
date: 2008-04-25T14:52:00-05:00
---
Having the ability to use a terminal service (aka Remote Desktop) session to manage a Windows Server (2000, 2003, and 2008) is very useful.  If you don&#8217;t have a Terminal Services license installed, you are limited to to two active sessions (plus a bonus connection that I&#8217;ll get to in a minute).  If a person disconnects from a session without logging out, it can leave that session running.  That allows you to start a long running task and come back to it later, but it does use up one of the available connections.  If both sessions are being used, you will not be able to create a new terminal service connection to the server.  At this point, you have three options:

Yell down the hallway and ask &#8220;Who has a connection to server XYZ&#8221;.  This never works because either the person who left the connect forgot about it or didn&#8217;t realize that he (or she) was supposed to logout.  The other problem is that you could be working from home and the only thing that the yelling accomplishes will be to attract your dog and your child, both of which will be looking for cookies.

Use the command line tools to identify the open sessions and kill one of them.  There are two tools, qwinsta and rwinsta.  If you run &#8220;qwinsta /?&#8221; from a command shell, you will get the following:</p> 

<pre>qwinsta /?<br />Display information about Terminal Sessions.</pre>

<pre>QUERY SESSION [sessionname | username | sessionid]<br />              [/SERVER:servername] [/MODE] [/FLOW] [/CONNECT] [/COUNTER]</pre>

<pre>  sessionname         Identifies the session named sessionname.<br />  username            Identifies the session with user username.<br />  sessionid           Identifies the session with ID sessionid.<br />  /SERVER:servername  The server to be queried (default is current).<br />  /MODE               Display current line settings.<br />  /FLOW               Display current flow control settings.<br />  /CONNECT            Display current connect settings.<br />  /COUNTER            Display current Terminal Services counters information.<br /><br />                                 </pre>





If you run &#8220;rwinsta /?&#8221;, you get the following:



<pre>rwinsta /?<br />Reset the session subsytem hardware and software to known initial values. <br />

<p>
  RESET SESSION {sessionname | sessionid} [/SERVER:servername] [/V] <br />
</p>

<p>
    sessionname         Identifies the session with name sessionname.<br />  sessionid           Identifies the session with ID sessionid.<br />  /SERVER:servername  The server containing the session (default is current).<br />  /V                  Display additional information.
</p></pre>





For the sample server XYZ, you would run &#8220;qwinsta /server:xyz&#8221;  That will return something like:



<pre>SESSIONNAME       USERNAME                 ID  STATE   TYPE        DEVICE<br /> console                                     0  Conn    wdcon<br /> rdp-tcp                                 65536  Listen  rdpwd<br />                   gatesb                    1  Disc    rdpwd<br /> rdp-tcp#93        jobss                    3  Active  rdpwd</pre>





From that output, we can take one of the IDs that was returned for the remote sessions and use rwinsta to kill that session.  You would use something like:



<pre>rwinsta 1 /SERVER:xyz</pre>





And that will terminate that session, allowing you to open a new session.  You will need admin rights to run that command, but if you are using the admin terminal service connections to the server, then you would already have the necessary access rights to the server. 



There is a third option, you can connect to the console session.  This is the bonus option that I had referred to earlier.  This is the session that you would get if you were physically in front of the server and were logging in on the server&#8217;s mouse and keyboard.  You can specify the console session as a command line parameter to the remote desktop client, [mstsc.exe](http://technet2.microsoft.com/windowsserver/en/library/f47ce263-f72e-469d-bf14-6605b7f4cce51033.mspx?mfr=true "Creates connections to terminal servers or other remote computers, edits an existing Remote Desktop Connection (.rdp) configuration file, and migrates legacy connection files that were created with Client Connection Manager to new .rdp connection files.").  The following syntax can be used to connect to the console session of a server:



<pre>mstsc /console</pre>



That feature will work with Server 2003 and later.  On some machines, qwinsta and rwinsta may have been renamed to query.exe and reset.exe, respectively.



[Updated at 2:42 pm]  
Steve listed an alternative to qwinsta and rwinsta on his [blog](http://www.stevetrefethen.com/blog/LogoffRemoteDesktopSessionRemotely.aspx "Stevetrefethen.com: Logoff Remote Desktop Session Remotely").  He uses quser.exe and logoff.exe, which provide pretty much the same functionality.  On my machine, quser.exe was buried in c:\windows\system32\dllcache, which was odd.  I wonder why it wasn&#8217;t in system32?  quser has an advantage over qwinsta, it lists the logon time and idle time for each session.  That gives you a little more data when you have to kill someone session and you can&#8217;t determine which one must die.
