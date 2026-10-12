---
title: What to do when an antivirus vendor has flagged your software as a virus
date: 2009-01-06T16:55:00-05:00
---
I usually don’t talk about where I work, this is my personal blog and where I work really doesn’t matter to the content of blog posts.  This post is a little different, it’s work related and knowing where I work adds some needed context.  I’m a senior software engineer for [Tyler Technologies](http://www.tylertech.com/), in their [VersaTrans Solution](http://www.versatrans.com/). The [VersaTrans product line](http://www.versatrans.com/products/versatrans_rp.cfm) provides school transportation software and services for the K-12 schools.

About a month ago, I came into work to find people waiting at my cubical.  That’s usually not a good way to start off a morning, and it wasn’t.  Apparently McAfee pushed out a virus definition file out the night before and it was flagging our software as a trojan.  Two of our executable files were being flagged.  Our customers were calling in to our technical support department, and they were understandably concerned.  The McAfee antivirus software wanted to quarantine our applications.  That would prevent our customers from using our applications, which is not a good thing.  They use our bus routing and planning software on a daily basis.  Not being able to use our software can cause a lot of problems for a school’s transportation department.  We needed to immediately resolve this.  I usually don’t get involved with technical support issues, but I had the bandwidth to immediately jump on this problem.

The immediate order of business was to replicate the actions of the A/V software.  We wanted to make sure that our software was being actually being flagged before we reported it to McAfee.  We don’t use any of the McAfee products in house, so one of our QA specialists (David) started downloading a trial copy of McAfee’s Enterprise solution.  This is the application that our clients were reporting that they were using.  David would install that copy into a virtual machine and test it in an isolated environment. 

**Thursday, 10:00am**.  I decided to save some time and upload a copy of our application to my home PC.  I have a copy of the home version of the McAfee A/V product.  It comes free as part of my FiOs package.  I’ve been planning on removing it and replacing it with one of the free A/V products, but fortunately it was still installed.  Sure enough, the app was flagged as [“BackDoor-AWQ.svr.gen.e”](http://vil.nai.com/vil/content/v_153569.htm), which is some type of generic server type of trojan that was added to version 5460 of the McAfee A/V database.  Version 5460 was the one that had been just pushed out to all of McAfee’s clients.  David would eventually duplicate the A/V hit, but it would take a while.  Armed with immediate proof from my home PC, I could proceed to the next step.  By the way, it can be very handy to be able securely access your home PC from your office PC.

**10:15am.**  I made my initial call to McAfee.  I went was passed to several CSRs, most of them refused to provide any identification other than their first name.  With each CSR, I was asked for a “grant number”, which was some form of customer identifier.  With each CSR I needed to explain that I was not calling as a McAfee customer, but as a representative of Tyler Technologies and they were false identifying our software as malware.  Each CSR tried to redirect me to their home product support.  With each CSR, I would request to speak with their supervisor when it became obvious that I would not get the support.

**10:30am.** I spoke with “Mike”, who identified himself as Corporate Service Program Supervisor.  He refused to escalate the issue or provide a last name and phone number.  Once again, I asked to speak to his supervisor.  He did not want to do this and we went back and forth a few times and I was persistent.  He finally transferred me to their Consumer Customer Department and provided that phone number (866-622-3911) with great reluctance.

**10:30-10:42am.**  Waited on hold.

While I was on hold, our sales department sent out a mass email to all of our clients.  The email explained that McAfee was falsely identifying our application as a virus and they should not be alarmed and that we were working with McAfee to remedy the situation.  As soon as you can reliably identify that some version of your software is being falsely flagged as a virus, contact your customers.  Trust me, they will appreciate it.

**10:42am.** Spoke to another CSR who couldn’t help resolve the problem, but could transfer me to someone who would be able to help.

**10:45-11:00am.**  Waited on hold.

**11:01-11:30am.** I reached a CSR named Juan at the Dallas office of McAfee.  Juan’s title is Tier III Customer Service and he provided me with his direct phone number and email address.  He asked me to submit a copy of the file being flagged to a web site that they provide for online scanning of files.  This is McAfee Avert® Labs WebImmune and is located at <https://www.webimmune.net/default.asp>.   I registered an account on their site and tried to upload the Routing and Planning (RP) executable known to trigger the McAfee scanner.  I was unable to upload the file because the RP executable is 7.7MB in size and WebImmue would only accept files up to 3MB in size.  Our executable is pre-compressed and there isn’t any other method of shrinking the size down to below 3MB.  This 3MB limitation basically defeats the purpose of having that site. 

I then tried emailing the file to Juan, but our own email server blocked the email because of the file attachment.  That’s bad on our part, but there is more than one way to email a file.

**11:45am.**  I emailed the file to Juan via my personal Hotmail account.  It took a while to make it to Juan, but by 3:00PM, I had an email confirmation from Juan that he had received the file.

**11:58am.**  I received an email from Juan with the following text:

> Mr. Miller,
> 
> I just received an email in regards to the issue that you are currently facing.
> 
> An issue that was incorrectly indentifying some large applications executables files as Backdoor.awq.svr.gen.e has been resolved.
> 
> Attached is an ED to suppress this detection. We have tested the ED against the limited number of files we have received thus far. If the ED doesn&#8217;t work and DAT 5461 hasn&#8217;t shipped then please gather a sample (FTP site in pwd protected zip if larger than 3mb) and escalate via MSTeg.

I forwarded the message to David in QA.  David had set up a virtual machine with a trial version of the McAfee Enterprise virus scanner and could duplicate the problem using the 5460 DAT file.  The “ED” supplied by Juan did not fix the problem, but I am not 100% certain that we had installed it correctly.  Their ED file did not come with any instructions on how to install it and we I promptly notified Juan that it was still a problem for us.

**3:00pm.**  Juan emailed me to notify me that he had received the RP executable from my Hotmail account and he requested a copy of the other executable that was being falsely identified (Ascii Scheduler).  I immediately sent him that file from my Hotmail account.  I did not receive emails from Juan (or any other McAfee representative) after that point.  Both files share about 98% of the same code, I was pretty sure if they fixed the scanner for one of them, it would be fixed for the other.  Especially since we were not the only company affected.  Juan wouldn’t tell me who else had been false identified, but he hinted that they were big companies and they were not happy.

**Friday 9:00am.**  I was told by our QA Manage that DAT version 5461 was pushed out by McAfee overnight and it no longer flags our files as false positives.  We received many happy emails from clients thanking us for the prompt attention paid to the matter.

So what do you do if this happens to you?  I recommend doing the following when a customer reports that your software is being flagged as a virus:

  * Ask the customer for the product name and version number of the antivirus software.  If possible, get the version number and date of the virus database used by the software.  Start taking detailed notes during this process.  You want an audit trail to give your boss to explain where your day went, plus it gives you ammunition when you get stuck with a CSR that wont help your or escalate your call.
  * Ask for the name of the virus or trojan that your software is being flagged as.
  * Get the version number of your executable that is being flagged as a virus.
  * Get a trial version of the A/V software and attempt to duplicate the false positive match.  If you can not duplicate the results, ask the client to send a password encrypted zip archive of the executable being flagged.  You have to consider the possibility that the client’s machine has been infected with a virus and that your application was infected on the client’s machine.  By sending it in a password encrypted zip file, it should pass through the client’s email server and your server without flagging any additional virus checks.
  * Submit your executable to the A/V vendors online support.  Most of them have a web page for submitting a questionable file.  You wont get a fast response back, but when you call their support, they will ask you to do this step so you might as well get it out of the way.
  * Call the A/V vendor and ask for support.  Do not identify yourself as a customer of their A/V software, but as an ISV who has been falsely identified by their software.  If you identify yourself as a customer, you may get shunted down lower priority support queue.  If you have an expensive support contract, that would be different.  Basically, just use the best tools at your disposal.
  * Ask for the CSR’s name and phone number, with extension.  Tell them that you need this information to provide an audit trail for your supervisor.  Be polite but persistent.  If they can not help you, ask for their supervisor and just work your way up their chain of command until you get a CSR that can help you.
  * Stay polite and professional with the CSR.  It’s not their fault that their software is falsely identifying your software as a virus.  They are more likely to expedite a remedy if you are not beating up on them.  It’s likely that you are not the only one being affected by this.
  * When you have a CSR that can help you, work out a plan with target times for how to resolve this.  Let them know that you will be in phone and email contact with them until the matter is resolved.  Basically, you want to get the file or files to them and have enough time for them to test the files and work out a solution.  You do not want to be waiting for hours just to get them the file.  You will want acknowledgement when they have received the file and when they have duplicated the problem.  Your goal is to get them to issue out a new virus update file on the same day.
  * Once you get the problem resolved, send a “thank you” email to the CSR that helped resolve the problem.  If the problem ever occurs again, you want to be able to start with that CSR and not have to waste time going up the CSR tree.

Having to go through all of this was not how I planned on spending my day. I lost the better part of the day dealing with McAfee’s mistake when I could have been working on my own mistakes.  This kind of stuff happens and it’s good to have a plan for dealing with it.
