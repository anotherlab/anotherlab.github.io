---
id: 51
title: A Disaster Recovery Plan is useless if you don’t verify that it works.
date: 2010-08-30T13:43:00-05:00
layout: post
guid: http://www.rajapet.com/?p=51
permalink: /2010/08/30/disaster-recovery-plan-is-useless-if/
---
I was just reading a Computerworld article about how [American Eagles Outfitters just went through an eight day web outage](http://www.computerworld.com/s/article/9182159/American_Eagle_Outfitters_learns_a_painful_service_provider_lesson "American Eagle Outfitters learns a painful service provider lesson - Computerworld") (originally covered by [StorefrontBacktalk](http://www.storefrontbacktalk.com/securityfraud/oracle-backup-failure-major-factor-in-american-eagle-8-day-crash/)).  It started when some hardware failed, then the backup hardware failed, then the software designed to restore the data to the replacement hardware failed, and finally their disaster recovery site wasn’t ready.  They were doing the right things: backups, backups of backups, and an alternate site in case their main site is dead in the water.  It just didn’t work when it was needed.  They were [flat out down for 4 days, and then only had minimal functionality for another four days](http://storefrontbacktalk.com/e-commerce/down-for-8-days-american-eagles-site-disaster).

Being down or not fully functional for 8 days is a huge amount of time if you are an online retailer, but it would be catastrophic for just about any company to their network down or seriously hobbled for over a week.  How effective would your company be today if you had were isolated computers, without any Internet access.  On the plus side, that means no Farmville, which would actually be a productivity gain.  But life without email, that’s another story.  For most companies, email is a basic tool of business and you can’t get by without it.

You need to have a disaster recovery (DR) plan.  You have to plan on the basis that a meteor has taken out your building one night, and all your business tools are gone.  You need to backup the key assets of your network.  If it’s on a computer and you need it, then it should be backed up.

Those backups need to be off site.  If your office complex is under 8 feet of water, those backup tapes are going to under 8 feet of water too.  Your IT staff needs to be taking those backups offsite.  It could as simple as taking the backups to a safe deposit box, or a live backup of your system to alternate location.

You also need a disaster recovery site.  You need backup network equipment that you can bring online with your current data.  It could be a dedicated hosting facility or a rack of servers at another location if your company has more than one office.  The important thing is that it’s periodically tested.  A DR site is no good if it doesn’t work.  That is what was the biggest failure for American Eagles Outfitters, their final point of protection wasn’t ready and had never been tested.

You also need to plan for the human resources.  If a disaster strikes your office, you need to have a plan to contact all of the employees and arrange for alternate office facilities.  if your DR site is up and running, it wont do you any good if none of your employees can access it.

Being prepared with a DR plan is not a one time task or expense.  IT departments need to have the support and resources to keep the plan updated.  And they need to be able to test it on a period basis.  A plan that works today with X amount of data, could be utterly useless next year when you have Y amount of data.  You need to be able validate that your backups worked and that they can be restored in a reasonable amount of time.

That’s the hard sell, with companies looking to keep their costs down, it’s hard to keep items like this in the IT budget.  I look at what happened to American Eagles Outfitters as a cautionary tale of what happens if you skimp on an IT budget.  

The money quote for [why the DR site was not fully functional](http://www.storefrontbacktalk.com/securityfraud/oracle-backup-failure-major-factor-in-american-eagle-8-day-crash/):

> “I know they were supposed to have completed it with Oracle Data Guard, but apparently it must have fallen off the priority list in the past few months and it was not there when needed.”

Penny wise, pound foolish.