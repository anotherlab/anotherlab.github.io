---
id: 149
title: Adding SQL Server logins and user accounts for multiple databases in one pass
date: 2008-06-20T18:56:00-05:00
layout: post
guid: http://www.rajapet.com/?p=149
permalink: /2008/06/20/adding-sql-server-logins-and-user/
---
We have a few applications that include bits that are service applications.  These applications talk to SQL Server databases and they authenticate using SQL Server logins, as opposed to using Windows Authentication.  We recently changed the account that the services were using to a new account with a more robust password.  When the services are deployed, they will have an update mechanism that will add the new login account.  For internal testing, I wanted to give our testers the ability to add the server login and database user for all of their test databases in one shot.  I ended up with a script that looked like this:

<div>
  <div>
    <pre><span>   1:</span> <span>use</span> [master]</pre>
    
    <pre><span>   2:</span>  </pre>
    
    <pre><span>   3:</span> <span>-- create server login if if does not already exist</span></pre>
    
    <pre><span>   4:</span> <span>if</span> <span>not</span> <span>exists</span> (<span>SELECT</span> 1 <span>FROM</span> sys.sql_logins <span>where</span> name = <span>'myservice'</span>) </pre>
    
    <pre><span>   5:</span> <span>create</span> login myservice <span>with</span> password = <span>'wEEzPHUxce0xhzQFEeF8OHS2KqYYkxTA'</span>, Check_expiration = <span>OFF</span></pre>
    
    <pre><span>   6:</span>  </pre>
    
    <pre><span>   7:</span> <span>-- Create a cusror that will let us iterate through a list of user </span></pre>
    
    <pre><span>   8:</span> <span>-- created databases, skipping over the system databases</span></pre>
    
    <pre><span>   9:</span> <span>declare</span> c <span>cursor</span> fast_forward <span>for</span> </pre>
    
    <pre><span>  10:</span>   <span>select</span> name </pre>
    
    <pre><span>  11:</span>   <span>from</span> master.dbo.sysdatabases </pre>
    
    <pre><span>  12:</span>   <span>where</span> name <span>not</span> <span>in</span> (<span>'master'</span>, <span>'tempdb'</span>, <span>'pubs'</span>, <span>'model'</span>, <span>'msdb'</span>)</pre>
    
    <pre><span>  13:</span>  </pre>
    
    <pre><span>  14:</span> <span>declare</span> @name <span>varchar</span>(128)</pre>
    
    <pre><span>  15:</span> <span>declare</span> @<span>sql</span> <span>varchar</span>(800)</pre>
    
    <pre><span>  16:</span>  </pre>
    
    <pre><span>  17:</span> <span>open</span> c</pre>
    
    <pre><span>  18:</span>  </pre>
    
    <pre><span>  19:</span> <span>fetch</span> <span>next</span> <span>from</span> c <span>into</span> @name</pre>
    
    <pre><span>  20:</span>  </pre>
    
    <pre><span>  21:</span> <span>while</span> <span>@@fetch_status</span> = 0</pre>
    
    <pre><span>  22:</span> <span>begin</span></pre>
    
    <pre><span>  23:</span>   <span>print</span> @name <span>-- display the name of the database</span></pre>
    
    <pre><span>  24:</span>  </pre>
    
    <pre><span>  25:</span>   <span>-- Drop the user and schema. this may need to be augmented depedning how you define your roles</span></pre>
    
    <pre><span>  26:</span>   <span>select</span> @<span>sql</span> = <span>'use ['</span>+@name+<span>'];if exists (select 1 from information_schema.tables where Table_name in ('</span><span>'SomeTableUniqueToMyApp'</span><span>', '</span><span>'AnotherTableUniqueToMyApp'</span><span>')) if exists (select 1 from sys.database_principals where name = '</span><span>'myservice'</span><span>') begin IF EXISTS (SELECT 1 FROM sys.schemas WHERE name = '</span><span>'myservice'</span><span>') begin DROP SCHEMA myservice end drop user myservice end'</span></pre>
    
    <pre><span>  27:</span>   <span>execute</span> (@<span>sql</span>)</pre>
    
    <pre><span>  28:</span>   </pre>
    
    <pre><span>  29:</span>   <span>-- Add the user</span></pre>
    
    <pre><span>  30:</span>   <span>select</span> @<span>sql</span> = <span>'use ['</span>+@name+<span>'];if exists (select 1 from information_schema.tables where Table_name in ('</span><span>'SomeTableUniqueToMyApp'</span><span>', '</span><span>'AnotherTableUniqueToMyApp'</span><span>')) if not exists (select 1 from sys.database_principals where name = '</span><span>'myservice'</span><span>') create user myservice for login myservice'</span></pre>
    
    <pre><span>  31:</span>   <span>execute</span> (@<span>sql</span>)</pre>
    
    <pre><span>  32:</span>  </pre>
    
    <pre><span>  33:</span>   <span>-- Define the user's role  </span></pre>
    
    <pre><span>  34:</span>   <span>select</span> @<span>sql</span> = <span>'use ['</span>+@name+<span>'];if exists (select 1 from sys.database_principals where name = '</span><span>'myservice'</span><span>') execute sp_addrolemember db_owner, myservice'</span></pre>
    
    <pre><span>  35:</span>   <span>execute</span> (@<span>sql</span>)</pre>
    
    <pre><span>  36:</span>   </pre>
    
    <pre><span>  37:</span>   <span>fetch</span> <span>next</span> <span>from</span> c <span>into</span> @name</pre>
    
    <pre><span>  38:</span> <span>end</span></pre>
    
    <pre><span>  39:</span>  </pre>
    
    <pre><span>  40:</span> <span>close</span> c</pre>
    
    <pre><span>  41:</span>  </pre>
    
    <pre><span>  42:</span> <span>deallocate</span> c</pre>
    
    <p>
      </div> 
      
      <p>
        </div> 
        
        <p>
          This script starts off in the master database and will require admin access rights to the server.  If we break down the script, we can review what each section does and why it’s doing it
        </p>
        
        <p>
          Lines 4-5 will create the login if it does not already exist.  The Check_Expiration option is set to “OFF” to verify that password expiration policy will not be applied to this login account.  The BOL for SQL Server 2005 states that <a title="CREATE LOGIN (Transact-SQL)" href="http://msdn.microsoft.com/en-us/library/ms189751.aspx">this option defaults to “OFF”</a>, but I like to explicitly set that option for a couple of reasons.  One reason is that it stands out when you read the script.  Another reason would be that a future service pack or later version of SQL Server could default that setting to on.
        </p>
        
        <p>
          Lines 9-12 create a cursor that provides a list of databases.  We skip over the system tables to save some processing.
        </p>
        
        <p>
          Lines 17-22, 37-42 handle the mechanics of opening up the cursor and iterating through each row in the set of database names.
        </p>
        
        <p>
          Lines 26-27 create a dynamic SQL statement that performs the following steps and then executes that statement:
        </p>
        
        <ol>
          </p> 
          
          <li>
            Change the database context to the current database that was located by the cursor
          </li>
          <li>
            Uses the information_schema.tables view to use this database only if contains two tables that are known to exist in my application database.  This will prevent the user from being added to the wrong database.
          </li>
          <li>
            If this user has a schema, drop the schema.
          </li>
          <li>
            Drop the user from the database.
          </li>
          <li>
            Execute the dynamically created SQL statement.
          </li>
          <p>
            </ol> 
            
            <p>
              Lines 30-31 create a dynamic SQL statement that performs the following steps and then executes that statement:
            </p>
            
            <ol>
              </p> 
              
              <li>
                Change the database context to the current database that was located by the cursor
              </li>
              <li>
                Uses the information_schema.tables view to use this database only if contains two tables that are known to exist in my application database.  This will prevent the user from being added to the wrong database.
              </li>
              <li>
                Create the user and map that user to the login account created at line 4
              </li>
              <li>
                Execute the dynamically created SQL statement.
              </li>
              <p>
                </ol> 
                
                <p>
                  Lines 34-35 create a dynamic SQL statement that performs the following steps and then executes that statement:
                </p>
                
                <ol>
                  </p> 
                  
                  <li>
                    Change the database context to the current database that was located by the cursor
                  </li>
                  <li>
                    Uses the information_schema.tables view to use this database only if contains two tables that are known to exist in my application database.  This will prevent the user from being added to the wrong database.
                  </li>
                  <li>
                    Adds the user to the db_owner role.  Your application may need fewer rights for the user.
                  </li>
                  <li>
                    Execute the dynamically created SQL statement.
                  </li>
                  <p>
                    </ol> 
                    
                    <p>
                      We do give our customers the ability to run with just Windows Authentication, but configuring services to run under domain accounts is an additional set of steps that most of our customers prefer not to use.  It’s a much simpler <a href="http://en.wikipedia.org/wiki/Out-Of-Box_Experience">OOBE</a> if the services use SQL Server authentication.
                    </p>