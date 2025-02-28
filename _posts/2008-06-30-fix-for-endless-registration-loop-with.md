---
title: Fix for endless registration loop with Delphi 2006
date: 2008-06-30T19:54:00-05:00
---
</p> 

With the acquisition, our login accounts are being migrated to a new domain.  We are doing this in multiple parts, with the first part changing our existing domain logins from using our last name plus first initial (millerc) to what is referred as the [User Principal Name](http://support.microsoft.com/kb/243280/EN-US/ "MSKB Article 243280: Users Can Log On Using User Name or User Principal Name") (basically our email addresses).  Of course, when I say “we”, I refer to our IT manager.  I’m just along for the ride and to make witty comments when it breaks.  That part went smoothly, the second step occurred last Sunday night when said IT Manager changed our logins (pre Windows 2000 format) from last name plus first initial to last name “.” first name (chris.miller).

<pre><p>
  When we logged in this morning and started up Borland Developer Studio 2006 (aka Delphi 2006), something broke.  We would get errors like
</p>

<br /><br />

<p>
  The license manager reported the following error: <br /><br />License storage c:\documents and settings\millerc\.borland\borlands.lic does not apply to current user or host machine. <br /><br /><br />Please register your Borland products(s).(7006).
</p>

<br /><br />

<p>
  Do you want to run the registration wizard?
</p></pre>

or

<pre><p>
  Fatal error validating license for Borland Developer Studio 2006 <br /><br />The license manager reported the following error: <br /><br /><br />Missing activation file.  Please register again. (7029).
</p>

<br /><br />

<p>
  Do you want to run the registration wizard?
</p></pre>

Just what I wanted to see first thing on a Monday morning.  [Thank you, sir. May I have another?](http://en.wikiquote.org/wiki/Animal_House)

Each time we would run the registration wizard, we would go through all of the steps to register Delphi and it would report that it was successfully registered.  After closing the wizard, we would get the same error message again.  Not a good sign.

I ran the registration wizard one more time and selected register by phone and called the number for US support.  The support representative was friendly but had no clue for what was happening.  The only thing she could was to open a support case.  I tried a few more times after completing the call and found out that you could only register 10 times, after that your registration code has been used up.  I was somewhat less than thrilled when I found that little gem.

After four hours had passed, I decided to call that support number again.  The support representative that answered this time was much more helpful.  He immediately contacted a support engineer, who knew what the problem was and referred to it as “an endless registration loop”.  They emailed me a list of instructions and I was able to get Delphi 2006 up and running again.  He also updated my account to accept two more registrations.

The funny part for me was that I had migrated all of my projects to Delphi 2007, which was not affected by the change in user id’s.  I jumped in to help out the other developement team, who were still on Delphi 2006.  

The following is a slightly edited version of the steps that CodeGear support had sent to me.

> 
> 
> Sometimes the registration information on a machine can become corrupted and cause an endless registration loop. This also happens when the user login name is changed or if a machine is changed to log in to a Domain. The following steps should help to resolve the problem. 
> 
> WARNING: These step will remove registration information for other Borland IDE products as well. 
> 
> </p> 
> 
>   1. Close down Delphi and the Registration Wizard if they are running 
>   2. Browse to the .borland directory in your user home directory. For Windows 2000 and XP this will be located at c:\documents and Settings\<username>\.borland 
>   3. Open the file registry.dat and copy the **SerialNumber** and **AuthorizationKey** values stored under &#8220;[Delphi 2006]&#8221;, this save you the step of trying to remember where you had stored that information. Also make a note of either the **UserName** or **EmailAddress** values stored under &#8220;user&#8221;. You will need these values when you register Delphi. 
>   4. Delete the borland.lic and registry.dat files in the .borland directory. You may also want to move those files to another location that is not on the path 
>   5. Remove the .<Random#A> directories from your User Home (directory name will start with a . and contain 6 or 7 random numbers and letters) 
>   6. Remove the .<Random#>.slip files from your User Home file name will start with a . and contain 6 or 7 random numbers followed by .slip) 
>   7. Remove any activation files that you saved in your User Home. These will by default be in the format of reg*.txt 
>   8. Launch BDS 2006 which will activate the Registration Wizard. 
>   9. Cancel completely out of the Registration Wizard (This is an important step and will write new correct default information to your User Home). 
>  10. Launch BDS 2006 a second time and this time register the product when the Registration Wizard comes up. 
>  11. If you ran the registration wizard too many times, your serial number will get locked out. You are limited to 10 installations. If you exceed this count, you will need to call CodeGear (800-523-7070 for the US) and asked for that count to be raised. They can raise the count limit by two each time that you request it. 
> </ol> 
> 
> </blockquote> 
> 
> This worked for me, but the usual [YMMV](http://www.urbandictionary.com/define.php?term=YMMV) caveats apply.  I added steps 3 and 11.  Once you delete the registry.dat file, you will have deleted the cached copy of your serial number and authorization key.  By making a copy of them, it becomes one less this to have to lookup.  If you already have Delphi 2007 or RAD Studio 2007 installed, these steps will not affect them.
