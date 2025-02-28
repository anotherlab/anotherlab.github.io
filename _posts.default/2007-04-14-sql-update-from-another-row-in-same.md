---
id: 249
title: SQL UPDATE from another row in the same table
date: 2007-04-14T02:42:00-05:00
layout: post
guid: http://www.rajapet.com/?p=249
permalink: /2007/04/14/sql-update-from-another-row-in-same/
---
My SQL skills are getting rusty.  I have some code where I needed to quickly copy a field from one row in a table to another row in the same table.  Bascially, a self-referencing UPDATE. I knew I could so it with a simple UPDATE statement, but I forgot the ANSI syntax.  Self-joining UDPATE statements can be a little squirrelly, so it&#8217;s best to follow the ANSI standard.  So I went looking for the Master, [Mr. Joe Celko](http://www.celko.com/).

I did a quick google through the newsgroups on [celko update &#8220;sql Server&#8221;,](http://groups.google.com/groups?client=opera&rls=en&q=celko%20update%20%22sql%20Server%22&sourceid=opera&ie=UTF-8&oe=UTF-8&um=1&sa=N&tab=wg "Google Groups search") and I found what I was looking for on the [third match](http://groups.google.com/group/comp.databases.ms-sqlserver/browse_frm/thread/20cc9187b709d6fd/6aa36d4c88b0a40f?lnk=st&q=celko+update+%22sql+Server%22&rnum=3#6aa36d4c88b0a40f).  If you really want to learn SQL as a language, Celko&#8217;s books are very good.

This is what I ended up using:

`<span><span>UPDATE</span> <span>mytable</span> <br /><span>   SET</span> <span>filterdata</span> <span>=</span> <span>(</span><span>SELECT</span> <span>src</span><span>.</span><span>filterdata</span> <br />                       <span>FROM</span> <span>mytable</span> <span>src</span> <br />                      <span>WHERE</span> <span>src</span><span>.</span><span>keyid</span> <span>=</span> <span>5</span><span>)</span> <br /><span> WHERE</span> <span>keyid</span> <span>=</span> <span>1</span> </span>`

The table and field names have been changed to protect the innocent.

<div>
  Tech Tags: <a href="http://technorati.com/tag/Celko" rel="tag">Celko</a> <a href="http://technorati.com/tag/Update" rel="tag">Update</a> <a href="http://technorati.com/tag/self+join" rel="tag">self+join</a> <a href="http://technorati.com/tag/SQL" rel="tag">SQL</a> <a href="http://technorati.com/tag/SQL+Server" rel="tag">SQL+Server</a>
</div>