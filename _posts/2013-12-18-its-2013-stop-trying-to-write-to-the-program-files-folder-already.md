---
id: 565
title: 'It&#8217;s 2013, stop trying to write to the Program Files folder already'
date: 2013-12-18T00:12:31-05:00
layout: post
guid: http://www.rajapet.com/?p=565
permalink: /2013/12/18/its-2013-stop-trying-to-write-to-the-program-files-folder-already/
---
<div style="width: 235px" class="wp-caption alignleft">
  <a href="http://ttl4.sunburst.com/"><img loading="lazy" class=" " alt="Type To Learn" src="https://i2.wp.com/www.rajapet.net/photos/i-Hxz98hj/0/S/i-Hxz98hj-S.jpg?resize=225%2C180" width="225" height="180"  /></a>
  
  <p class="wp-caption-text">
    Type to Learn&#8217;s login screen
  </p>
</div>

My daughter asked if I could install [Type to Learn 4](http://ttl4.sunburst.com/index.php), an app that she uses at school.  It provides a fun way to learn typing skills. If a school buys the app, they can provide student accounts and the student can download and install the app at home.

She, of course, had not told me any of this.  I went to the web site for Type To Learn and saw that there were two versions.  A School Login Portal, and the home version.  So I clicked on the home version which took me to Amazon.

<div style="width: 129px" class="wp-caption alignleft">
  <a href="http://www.amazon.com/dp/B004LC3VCW"><img loading="lazy" alt="" src="https://i0.wp.com/www.rajapet.net/photos/i-GsjhW8Z/0/O/i-GsjhW8Z.png?resize=119%2C121" width="119" height="121"  /></a>
  
  <p class="wp-caption-text">
    No middle ground
  </p>
</div>

The first thing I saw was the 2.5 out 5 star rating.  That&#8217;s not a good sign.  It was an inverse bell curve, people either loved it or hated it.  When you see numbers like that, you read the 1 star reviews to see what went wrong.

I zeroed in on the comment posted [here](http://www.amazon.com/review/RP9QLB2RDN16Y/ref=cm_cr_rdp_perm?ie=UTF8&ASIN=B004LC3VCW&linkCode=&nodeID=&tag=).  That user had determined that Type To Learn was trying to write data back to a data file located in it &#8216;s program folder (**C:\program files (x86)\sunburst**). That&#8217;s not a good thing.

<span style="line-height: 1.5;"> Unless you had admin rights, that&#8217;s going to fail.  Starting with Windows Vista, standard users can&#8217;t write to any folders in the </span><strong style="line-height: 1.5;">Program Files</strong> <span style="line-height: 1.5;">or </span><strong style="line-height: 1.5;">Program Files (x86)</strong> <span style="line-height: 1.5;">space.  Just not allowed.  You can write to those folders if you have admin rights.  </span>

<span style="line-height: 1.5;">My kids don&#8217;t have admin rights on the home PC&#8217;s.  They don&#8217;t need them and keeps the PC running smoothly.  Under normal usage, only setup applications should be writing to <strong>Program Files</strong>.</span>

There is also the multiple user situation. If you are writing to one location and you have multiple user accounts on the machine, the you need to make sure that your saved data is multiuser friendly.

> As it turned out, we didn&#8217;t need to buy the app from Amazon, we could just download the app from the School Login Portal.  But we still would have the same problem the data being written back to **Program Files (x86)**.

Where are you supposed to put your application data?  For desktop applications, you have two choices.  Shared data goes into a folder under **%PROGRAMDATA%**, which usually maps to a hidden root folder name &#8216;**ProgramData**&#8220;.

User specific data should go into  **%APPDATA%** or **%LOCALAPPDATA%**.  Under Windows 8.1, **APPDATA** maps to something like **c:\users\username\appdata\roaming**.  This is used for data shared across multiple machines. **LOCALAPPDATA** maps to **c:\users\username\appdata\local** and is where you would store user data for that machine.

So we have an app writing to the verboten **Program Files** folder.  We can&#8217;t change that behavior, but we can allow it to work for a non-admin user without disabling all of the security.  We just need to everyone full access to that folder.

I like to do stuff like that from the command line. When messing around with access rights, I want to be explicit with what I am setting.  That&#8217;s just the way I roll.  With that, our tool is the trusty [Icacls](http://technet.microsoft.com/en-us/library/cc753525.aspx) command.

Icacls is used for setting user and group access to a folder.  It does more than that, but if you don&#8217;t have an IT background. the rest of what it does will make your eyes bleed.  I mean the /verify parameter is documented to &#8220;Finds all files with ACLs that are not canonical or have lengths inconsistent with ACE (access control entry) counts.&#8221;.  You don&#8217;t need to know what that means, trust me.

Here&#8217;s what you need to know:

Run cmd.exe as administrator.  With Windows 8/8.1, this is easy.  From the Metro screen (Yes, I know. I still call it Metro), just type &#8220;cmd&#8221; and right click on &#8220;Command Prompt&#8221; and select &#8220;Run as administrator.  It should look like this:

<img loading="lazy" class="aligncenter" alt="Run as adminitratpr" src="https://i2.wp.com/www.rajapet.net/photos/i-M4kjZMP/0/S/i-M4kjZMP-S.png?resize=243%2C300" width="243" height="300"  /> 

When that cmd window opens up, CD into &#8220;**c:\program files (x86)**&#8220;. That will save you from having to type &#8220;c:\program files (x86)&#8221; over and over again.

[Edit]  
A [cricket player from Eastern Europe](http://tvug.net/post/March-Meeting-Building-Your-First-Windows-Phone-8-Application) sent in the following tip:

> An even easier way to launch an admin cmd prompt is Win+X then A. It’s the newest keyboard shortcut forever burned into my memory.

Now run

<pre>icacls sunburst</pre>

Sunburst is the company that makes or sells Type To Learn, all of the files are in that folder.  You should see the following:

[<img loading="lazy" class="aligncenter" alt="" src="https://i0.wp.com/www.rajapet.net/photos/i-LhvQXRC/0/M/i-LhvQXRC-M.png?resize=600%2C304" width="600" height="304"  />](https://i1.wp.com/www.rajapet.net/photos/i-LhvQXRC/0/O/i-LhvQXRC.png)

That tells us that the TrustedInstaller (i.e. setup programs) and admins have full rights to that folder, every one else has read access

Now run

<pre>icacls sunburst /grant Everyone:(OI)(CI)F</pre>

In human speak, that means give (**/grant**) everyone full access (**F**) to the sunburst folder and all of the files (**(OI)**) in that folder and all of the folders (**(CI)**) in the sunburst folder. Then run &#8220;icacls sunburst&#8221; again to verify that the change took effect.  It should look like this

[<img loading="lazy" class="aligncenter" alt="" src="https://i2.wp.com/www.rajapet.net/photos/i-wwzKrMP/0/M/i-wwzKrMP-M.png?resize=600%2C304" width="600" height="304"  />](https://i2.wp.com/www.rajapet.net/photos/i-wwzKrMP/0/O/i-wwzKrMP.png)

You should see that everone has full rights to that folder. Now you can run Type To Learn as  standard user.