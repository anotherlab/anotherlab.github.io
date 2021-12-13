---
id: 313
title: Tao of the Windows Installer
date: 2006-05-12T18:31:00-05:00
layout: post
guid: http://www.rajapet.com/?p=313
permalink: /2006/05/12/tao-of-windows-installer/
---
There are some really good Windows Installer guidelines up on the [Windows Installer Team Blog](http://blogs.msdn.com/windows_installer_team).  [Part 1](http://blogs.msdn.com/windows_installer_team/archive/2006/05/01/587990.aspx) went up yesterday and [Part 2](http://blogs.msdn.com/windows_installer_team/archive/2006/05/12/595950.aspx) went up today.  Most the rules I follow already, due to constant beating of the forehead against the wall experience that I call working with Windows Installer, but it was help to see the rest of them.  I listed them below, with my own comments.  Visit the links for [Part 1](http://blogs.msdn.com/windows_installer_team/archive/2006/05/01/587990.aspx) and [Part 2](http://blogs.msdn.com/windows_installer_team/archive/2006/05/12/595950.aspx) for the full text behind each rule.

<blockquote dir="ltr">
  <p>
    <strong>Rule 1: Learn the Windows Installer Technology</strong>
  </p>
  
  <blockquote dir="ltr">
    <p>
      This is key.  I picked up a lot from Wise’s support forums.  A really good book is <a href="http://www.amazon.com/gp/product/1590592972/qid=1147455507">The Definitive Guide to Windows Installer</a> by Phil Wilson (ISBN: 1590592972)
    </p>
  </blockquote>
  
  <p>
    <strong>Rule 2: Know Your Way Around the Installer SDK</strong>
  </p>
  
  <blockquote dir="ltr">
    <p>
      I’m just starting to get under the hood with the SDK.  I wrote a console app in Delphi that allowed me to upgrade ProductCode and Package code of .msi/.wsi files.  It was part of a plan to heav each build of our application be able to upgrade from each previous build.  Other considerations led to me to shelf that plan, but it was interesting working in the SDK
    </p>
  </blockquote>
  
  <p>
    <strong>Rule 3: Use the “Windows Logo” Program as a Basis For Good Practices<br />Rule 4: Always Use the Latest Version of the Installer</strong>
  </p>
  
  <blockquote dir="ltr">
    <p>
      Both are common sense.
    </p>
  </blockquote>
  
  <p>
    <strong>Rule 5: Build Setup Into Your Application Development from the Start</strong>
  </p>
  
  <blockquote dir="ltr">
    <p>
      On my last project, I fought constantly with the project lead over this.  Having done several installer projects in the past, I knew what I was getting into and planned for the installers from the start.  This made life much easier.
    </p>
  </blockquote>
  
  <p>
    <strong>Rule 6: Get to Know ORCA</strong>
  </p>
  
  <blockquote dir="ltr">
    <p>
      Simply the best tool for diagnosing problems with a .msi file.  You can get from the Windows Server Software Development Kit.  The current version is the “<a href="http://www.microsoft.com/downloads/details.aspx?FamilyId=0BAF2B35-C656-4969-ACE8-E4C0C0716ADB&#038;displaylang=en">Windows® Server 2003 R2 Platform SDK</a>”.
    </p>
  </blockquote>
  
  <p>
    <strong>Rule 7: Work On a Copy</strong>
  </p>
  
  <blockquote dir="ltr">
    <p>
      More common sense.
    </p>
  </blockquote>
  
  <p>
    <strong>Rule 8: Never Cancel a Package Build Before it Finishes</strong>
  </p>
  
  <blockquote dir="ltr">
    <p>
      I never knew about that one.  With installer tool that I’m using (<a href="http://www.wise.com/wfwi.asp">Wise</a>), I don’t see that is being a real issue.
    </p>
  </blockquote>
  
  <p>
    <strong>Rule 9: Use a Clean System for Repackaging</strong><br /><strong>Rule 10: Do Not Repackage Microsoft Updates</strong><br /><strong>Rule 11: Do Not Repackage MSI-Based Applications</strong>
  </p>
  
  <blockquote dir="ltr">
    <p>
      Still more common sense.
    </p>
  </blockquote>
  
  <p>
    <strong>Rule 12: Modify Vendor Packages Using Transforms</strong>
  </p>
  
  <blockquote dir="ltr">
    <p>
      I may be doing this in the near future.  I haven’t had to do any package transforms, but I understand the basic concepts.
    </p>
  </blockquote>
  
  <p>
    <strong>Rule 13: Be careful with Installer GUIDS</strong>
  </p>
  
  <blockquote dir="ltr">
    <p>
      It took a while to sink into my head over the Gang of Three GUIDS, but it’s in my firmware now.
    </p>
  </blockquote>
  
  <p>
    <strong>Rule 14: Use Consistent Package Naming Conventions</strong><br /><strong>Rule 15: Do Not Try to Replace Protected System Files</strong>
  </p>
  
  <blockquote dir="ltr">
    <p>
      Common sense again
    </p>
  </blockquote>
  
  <p>
    <strong>Rule 16: Follow Component Rules</strong>
  </p>
  
  <blockquote dir="ltr">
    <p>
      I need to study this more.
    </p>
  </blockquote>
  
  <p>
    <strong>Rule 17: Understand File Versioning Rules</strong>
  </p>
  
  <blockquote dir="ltr">
    <p>
      One of my pet peeves with Windows Installer.  Why does it ignore the last number of a version number?  If it could use all four parts of the version number, I could have my build to build upgrades and there would be much rejoicing in the land of Queue-ay.
    </p>
  </blockquote>
  
  <p>
    <strong>Rule 18: Improve Performance by Limiting System Restore During Setup<br />Rule 19: Avoid Using the SelfReg Table</strong>
  </p>
  
  <p>
    <strong></strong>
  </p>
</blockquote>

<blockquote dir="ltr">
  <blockquote dir="ltr">
    <p>
      Good tips
    </p>
  </blockquote>
  
  <p>
    <strong>Rule 20: Avoid Nested Installs</strong>
  </p>
  
  <p>
    Having one .msi calling another .msi is something I seriously plan on avoiding.  Just follow Spengler’s warning and <a href="http://en.wikiquote.org/wiki/Ghostbusters">don’t cross the streams</a>.
  </p>
  
  <p>
    <strong>Rule 21: Avoid Using Configuration Data You Don’t Own<br />Rule 22: Differentiate Between User and Application Data<br />Rule 23: Don’t Use Resources You are Installing</strong>
  </p>
  
  <blockquote dir="ltr">
    <p>
      Still more common sense.
    </p>
  </blockquote>
  
  <p>
    <strong>Rule 24: Use Cabinet Files to Reduce Package Sizes</strong>
  </p>
  
  <p>
    I need to look into that more.  I wonder how that would play with installers for web sites.  I could toss all of the .ascx files into a .cab file and the assemblys as separate files.  For Win32 executables, I usually pre-compress them using <a href="http://upx.sourceforge.net/">UPX</a> as part of the <a href="http://www.finalbuilder.com/finalbuilder/">build process</a>, putting them into .cab files would gain nothing.
  </p>
  
  <p>
    <strong>Rule 25: Follow Custom Action Rules</strong>
  </p>
  
  <blockquote dir="ltr">
    <p>
      Some good tips.  I don’t use many custom actions, but it’s good know what not to do
    </p>
  </blockquote>
  
  <p>
    <strong>Rule 26: Consider Storing User-specific Data in a File</strong>
  </p>
  
  <blockquote dir="ltr">
    <p>
      This an interesting one.  Our .NET apps follow this methodology, but our Win32 apps use the registry for most user specific settings.   Something to consider going forward.
    </p>
  </blockquote>
  
  <p>
    <strong>Rule 27: Consider Maintaining Setup in Text File Format</strong>
  </p>
  
  <blockquote dir="ltr">
    <p>
      I would to be able to do this with Wise’s .wsi files.  The problem is that the .wsi is actually a .msi file, and I have yet to see a tool that will reliably convert a .wsi/.msi file to text and back again. I tried <a href="http://users.cyberone.com.au/dbareis/msidiff.htm">MSIDIFF</a>, but something always gets mangled and when you convert a file from one to the other and back again, you don’t always get the same file back.  That’s not a good thing.
    </p>
  </blockquote>
  
  <p>
    <strong>Rule 28: Think about Localisation</strong>
  </p>
  
  <blockquote dir="ltr">
    <p>
      Something I don’t have to deal with…
    </p>
  </blockquote>
  
  <p>
    <strong>Rule 29: Follow the Assembly Rules</strong>
  </p>
  
  <blockquote dir="ltr">
    <p>
      Wise does a good job with this, I usually don’t have to worry about assemblies.
    </p>
  </blockquote>
</blockquote>

<p dir="ltr">
  Tags: <a href="http://technorati.com/tag/Ghostbusters" rel="tag">Ghostbusters</a> <a href="http://technorati.com/tag/Wise" rel="tag">Wise</a> <a href="http://technorati.com/tag/Windows+Installer" rel="tag">Windows Installer</a> <a href="http://technorati.com/tag/Orca" rel="tag">Orca</a> <a href="http://technorati.com/tag/msi" rel="tag">msi</a> <a href="http://technorati.com/tag/upx" rel="tag">upx</a> <a href="http://technorati.com/tag/msidiff" rel="tag">msidiff</a>
</p>