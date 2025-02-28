---
title: I git it now
date: 2013-05-13T20:40:00-05:00
---
Sharing code across OS X and Windows was a bit more challenging than what I had expected. We have our own TFS servers, but Xamarin Studio on the Mac really can&#8217;t do much with them. XS does support git, so I have been using a local repository on the Macbook to version control the source code.  I needed to have that source backed up in a sane mannor.

Local TFS servers do not support git (yet). So to get the git repo into TFS, I need a transfer station of sorts. My other work development box is a Windows 7 machine with access to our TFS server. The fun part is getting the code from OS X to Windows without having to do a bulk copy each time.

The first thing I looked at was [gitstack](http://gitstack.com/). Gitstack is git server that you can use to push your local repo up to. I spent a few hours, but I could not get the Macbook to push the repo up to it. I&#8217;m sure it works somehow, but my basic ignorance of how git works is probably a factor. I don&#8217;t want to have to think to use version control. Tools should not get in the way of the development process.

While local TFS doesn&#8217;t support git, [TFS in the cloud](https://tfs.visualstudio.com/en-us/) does. I went in and created an account. I then created a new project by clicking the &#8220;New Team Project +Git&#8221; button. This will bring up a dialog that will let you create a new tem project and specify git as the version control.

By default TFS uses a Windows Live account for credentials. You can add a secondary set of credentials so that you can pass in a user name/ password to authenticate. I found it non-intuitive to find that option a second time. Follow these steps to create (or edit) a second set of credentials for your account

  1. Login into your TFS account.
  2. In the upper right corner of the screen, you will see a gear icon. Click that gear to go to the control panel
  3. In the upper right corner of the screen, you will see your name or email address and a drop down chevron. Click the chevron and select &#8220;My Profile&#8221; when the dialog opens up.
  4. The &#8220;User Profile&#8221; dialog will appear. You can change your avatar and display name here.
  5. Click on the link labeled &#8220;CREDENTIALS&#8221;. This will switch to the Alternate Credentials tab on the dialog.
  6. Now you can enter in the secondary credentials. The user name must be alpha numeric only, you can&#8217;t use an email address.
  7. Click &#8220;Save Changes&#8221; to save the new credentials.

Now you can use those new credentials when pushing or pulling changes from git. On the Mac, you store those credentials in the OSX keychain so that you will not be prompted each time. I found that the osxkeychain helper that was installed with the OSX version of git to be completely broken. I manually installed a newer copy based on the instructions posted [here](https://help.github.com/articles/set-up-git#platform-mac).

On the OS X side, I had installed git and it was on the search path. I opened up Terminal and in my source code folder, I used git to clone the TFS repo using the following syntax:

<pre name="code">git clone https://myteamname.visualstudio.com/DefaultCollection/_git/myproject<br /><br /></pre>

This created the folder for the project with all of the git bindings. From within Xamarin Studio, I was able to perform local commits and that worked just fine. I tried to do a push from within Xamarin, but it failed because I had different local git credentials than I did for TFS. I could not find anyway from with Xamarin Studio to specify the git credentials. I&#8217;ve posted a question about that in the Xamarin forums, I&#8217;m hoping it&#8217;s something simple.

But I can push and fetch from the command line, so I just created a bash script file and I run that to synch with the remote report. There are some [OS X GUI clients for git](http://git-scm.com/downloads/guis), Harry Wolff reviewed some of them [here](http://harrywolff.com/the-best-mac-git-gui/). Right now, I&#8217;m going to stick to the command line until I grok git. At the end of the day, I have what I wanted: a local git repo on the dev boxes, with a master repo in the cloud.
