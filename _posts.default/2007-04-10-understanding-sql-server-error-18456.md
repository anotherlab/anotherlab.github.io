---
id: 250
title: Understanding SQL Server error 18456
date: 2007-04-10T14:57:00-05:00
layout: post
guid: http://www.rajapet.com/?p=250
permalink: /2007/04/10/understanding-sql-server-error-18456/
---
I came across an odd problem with SQL Server Express.  We have a test server with various versions of SQL Server installed for QA to use.   Of the QA techs was unable to connect to the instance of SQL Server Express when he used a SQL Server login.  The code was not returning an error error code, so I decide to take a look at it.

I tried connecting to Express from MS SQL Server Management Studio under that account.  SSMS returned an 18456 error, basically it couldn&#8217;t connect.  That was just slightly more useful than what I had before, but it provide two things.  It ruled out the app as cause of the problem, and it gave something that I could google with.

The best match I got was [Understanding &#8220;login failed&#8221; (Error 18456) error messages in SQL Server 2005](http://blogs.msdn.com/sql_protocols/archive/2006/02/21/536201.aspx "Understanding "login failed" (Error 18456) error messages in SQL Server 2005"), on the [SQL Protocols](http://blogs.msdn.com/sql_protocols/default.aspx "Discussions related to Microsoft's SQL Server Protocols - Netlibs, TDS and (new for SQL 2005) SOAP. Topics include connections and SQL connectivity.") blog.  Basically, the error 18456 error is purposely vague to prevent nasty people from trying to hack into your server.  To figure out why the login failed, you need the &#8220;error state&#8221;.  Error state is not returned to the client, but it&#8217;s written to the log file.  That file will be in the LOGS folder of that instance of SQL Server under the name ERRORLOG.   From the log file, you&#8217;ll get more information about why the login failed:

<pre><p>
  2007-04-10 09:54:45.14 Logon       Error: 18456, Severity: 14, State: 8.<br />2007-04-10 09:54:45.14 Logon       Login failed for user 'youridhere'. [CLIENT: 10.0.0.1]<br />
</p></pre>



From the first line, we get the eror state.  Yay, it&#8217;s 8.  So what does that mean?  The states are documented in the blog posting reference above, but I couldn&#8217;t find it in my copy of the BOL.  It is documented in the online version (and probably in the latest BOL) at <a title=""Login failed for user '<user_name>&#8216;.&#8221;&#8221; href=&#8221;http://msdn2.microsoft.com/en-us/library/ms366351.aspx&#8221;>SQL Server 2005 Books Online</a>.  Here are the documented states:





<table width="100%" border="1">
  </p> </p> 
  
  <tr>
    </p> 
    
    <th>
      State
    </th>
    
    <p>
    </p>
    
    <th>
      Description
    </th>
  </tr>
  
  <p>
  </p>
  
  <tr>
    </p> 
    
    <td>
      </p> 
      
      <p>
        2
      </p>
    </td>
    
    <p>
    </p>
    
    <td>
      </p> 
      
      <p>
        User ID is not valid.
      </p>
    </td>
  </tr>
  
  <p>
  </p>
  
  <tr>
    </p> 
    
    <td>
      </p> 
      
      <p>
        5
      </p>
    </td>
    
    <p>
    </p>
    
    <td>
      </p> 
      
      <p>
        User ID is not valid.
      </p>
    </td>
  </tr>
  
  <p>
  </p>
  
  <tr>
    </p> 
    
    <td>
      </p> 
      
      <p>
        6
      </p>
    </td>
    
    <p>
    </p>
    
    <td>
      </p> 
      
      <p>
        An attempt was made to use a Windows login name with SQL Server Authentication.
      </p>
    </td>
  </tr>
  
  <p>
  </p>
  
  <tr>
    </p> 
    
    <td>
      </p> 
      
      <p>
        7
      </p>
    </td>
    
    <p>
    </p>
    
    <td>
      </p> 
      
      <p>
        Login is disabled, and the password is incorrect.
      </p>
    </td>
  </tr>
  
  <p>
  </p>
  
  <tr>
    </p> 
    
    <td>
      </p> 
      
      <p>
        8
      </p>
    </td>
    
    <p>
    </p>
    
    <td>
      </p> 
      
      <p>
        The password is incorrect.
      </p>
    </td>
  </tr>
  
  <p>
  </p>
  
  <tr>
    </p> 
    
    <td>
      </p> 
      
      <p>
        9
      </p>
    </td>
    
    <p>
    </p>
    
    <td>
      </p> 
      
      <p>
        Password is not valid.
      </p>
    </td>
  </tr>
  
  <p>
  </p>
  
  <tr>
    </p> 
    
    <td>
      </p> 
      
      <p>
        11
      </p>
    </td>
    
    <p>
    </p>
    
    <td>
      </p> 
      
      <p>
        Login is valid, but server access failed.
      </p>
    </td>
  </tr>
  
  <p>
  </p>
  
  <tr>
    </p> 
    
    <td>
      </p> 
      
      <p>
        12
      </p>
    </td>
    
    <p>
    </p>
    
    <td>
      </p> 
      
      <p>
        Login is valid login, but server access failed.
      </p>
    </td>
  </tr>
  
  <p>
  </p>
  
  <tr>
    </p> 
    
    <td>
      </p> 
      
      <p>
        18
      </p>
    </td>
    
    <p>
    </p>
    
    <td>
      </p> 
      
      <p>
        Password must be changed.
      </p>
    </td>
  </tr>
</table>

<a name="sectionToggle0"></a>

<a name="sectionToggle0">Any other error state is considered to be an internal error.</a>



So it boils down to the password being incorrect, which in this case it was. 



<div>
  Tech Tags: <a href="http://technorati.com/tag/SQL+Server+2005" rel="tag">SQL+Server+2005</a> <a href="http://technorati.com/tag/Error+State" rel="tag">Error+State</a> <a href="http://technorati.com/tag/18456" rel="tag">18456</a> <a href="http://technorati.com/tag/Login+Failed" rel="tag">Login+Failed</a>
</div>