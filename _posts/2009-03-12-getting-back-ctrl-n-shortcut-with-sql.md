---
title: Getting back the Ctrl-N shortcut with SQL Server 2008’s SSMS
date: 2009-03-12T14:27:00-05:00
---
After I installed SQL Server 2008, I noticed that the Ctrl-N keyboard shortcut in the SQL Server Management Studio (SSMS) no longer worked.  What it’s supposed to do is to open up a new query tab.  In my install of SSMS 2008, the Ctrl-N key did nothing.  Pressing Ctrl-N was burned into my brain. It was a serious [context switch](http://havemacwillblog.com/2008/10/16/productivity-and-the-context-switch/) for me to have to select a menu item or press a button to get a new query tab.  

A [friend](http://twitter.com/AlexSilverstein "Alex Silverstein") of mine gave me a simple tip that fixed it.  Change the keyboard layout to “SQL Server 2000” and then back to “Standard” and that will restore the default keyboard mappings.  That fixed it and I belatedly found it documented [here](http://sqlblog.com/blogs/tibor_karaszi/archive/2008/08/26/missing-f8-or-ctrl-n-in-ssms-2008.aspx), [here](http://forum.cornerstone.se/blogs/sql/archive/2008/08/26/missing-f8-or-ctrl-n-in-ssms-2008.aspx) and [here](http://connect.microsoft.com/SQLServer/feedback/ViewFeedback.aspx?FeedbackID=362331).  I don’t know why I didn’t check the [series of tubes](http://www.boingboing.net/2006/07/02/sen-stevens-hilariou.html) for the answer, it was pretty obvious how to fix it.

To change the keyboard mappings, select Tools->Options from the SSMS menu and then go to Environment->Keyboard.  From that spot, you can change the keyboard layout.  Change the layout and press the “Ok” button to save the changes.  Then, repeat the steps and select the standard layout and press “Ok” again.  That will set the default keyboard mappings, which will include the Ctrl-N mapping.
