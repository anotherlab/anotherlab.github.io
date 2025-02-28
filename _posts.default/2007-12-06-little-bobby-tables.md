---
id: 221
title: Little Bobby Tables
date: 2007-12-06T15:51:00-05:00
layout: post
guid: http://www.rajapet.com/?p=221
permalink: /2007/12/06/little-bobby-tables/
---
Not too long ago, the online comic [xkcd](http://xkcd.com/ "xkcd - A webcomic of romance, sarcasm, math, and language.") ran a strip that just killed me.

[<img src="https://i0.wp.com/imgs.xkcd.com/comics/exploits_of_a_mom.png?w=680"  />](http://xkcd.com/327/)  
(thanks to [Randall Munroe](http://xkcd.com/about/) for providing the image link for hotlinking)

Our applications make extensive use of a table with a very similar name.  Most of our programmers got the joke and had a good laugh.  Our QA staff found it hysterical.  Had they been drinking milk, it would have sprayed out of their noses.

It does demonstrate quite effectively how easy it is to intentionally damage a database through a [SQL injection](http://en.wikipedia.org/wiki/Sql_injection "SQL injection is a technique that exploits a security vulnerability occurring in the database layer of an application.") attack.   The user enters in string literal characters into an entry field and alter the logic of the SQL statement being executed.  In the example displayed in the comic, the insert or update statement that would be been populated from the entry fields has been truncated.  A command to drop the students table would be executed immediately after the truncated insert/update had been executed.

This is an easy attack to block.  You have at least three ways to prevent this attack from going through.

Don&#8217;t create your insert or update statements directly from the user editable entry fields.  If you use a parameterized SQL statement, that will block the attack.  The injection text will get written to the database as part of the entry field, but the injection SQL will not have been executed.  You get some additional benefits.  With SQL Server, the server will cache the execution plans of parameterized queries, providing a faster execution time when the next insert or update statement is execute.

Don&#8217;t run the application with database login account that has enough rights to modify the database structure.  If you really want to lock down the access rights, block direct access to the tables and do everything through stored procedures. 

&#8220;Sanitize your database inputs&#8221;.  That usually involves the most amount of work, but a well designed application is usually doing some level of field validation.  Just filtering out the &#8220;;&#8221; from the entry field is enough to block the attack.