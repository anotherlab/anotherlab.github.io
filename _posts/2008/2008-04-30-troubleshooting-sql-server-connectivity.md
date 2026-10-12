---
title: Troubleshooting SQL Server connectivity issues
date: 2008-04-30T12:17:00-05:00
---
Xinwei Hong (MSFT) wrote a great troubleshooting guide on [how to identify and resolve SQL Server connectivity issues](http://blogs.msdn.com/sql_protocols/archive/2008/04/30/steps-to-troubleshoot-connectivity-issues.aspx "Steps to troubleshoot connectivity issues") on the [SQL Protocols blog](http://blogs.msdn.com/sql_protocols/default.aspx "Discussions related to Microsoft's SQL Server Protocols - Netlibs, TDS and SOAP. Topics include connections and SQL connectivity").

Xinwei broke it down to 6 possible causes:

  1. Network issue.
  2. SQL Server configuration issue.
  3. Firewall issue.
  4. Client driver issue.
  5. Application configuration issue.
  6. Authentication and logon issue. 

For each cause. Xinwei lists some background on why that cause could a problem along with specific commands to run to help diagnose the problem.  For example, to determine if #2, SQL Server configuration issue, is the root cause of the problem; the following steps are listed:

> You need to make sure the target SQL Server is running and is listening on appropriate protocols. You can use SQL Server Configuration Manager (SCM) to enable protocols on the server machine. SQL Server supports Shared Memory, Named Pipes, and TCP protocols (and VIA which needs special hardware and is rarely used). For remote connection, NP and/or TCP protocols must be enabled. Once you enabled protocols in SCM, please make sure restart the SQL Server.
> 
>  
> 
> You can open errorlog file to see if the server is successfully listening on any of the protocol. The location of errorlog file is usually under:
> 
> %ProgramFile%Microsoft SQL Server/MSSQLxx.xxx/MSSQL/Log
> 
> If the target SQL instance is a named instance, you also need to make sure SQL Browser is running on the target machine. If you are not able to access the remote SQL Server, please ask your admin to make sure all these happen.

 

This guide is definitely worth keeping bookmarked.  When a client calls and they can&#8217;t connect to their database, having a list like the one Xinwei provide should make it easy to resolve the problem.  Or at the very least, rule out [the usual suspects](http://en.wikipedia.org/wiki/Usual_suspects).
