---
id: 173
title: 'Dealing with the Duplicate Resource: Type 24 when enabling theme support in Delphi 2007'
date: 2008-05-06T14:17:00-05:00
layout: post
guid: http://www.rajapet.com/?p=173
permalink: /2008/05/06/dealing-with-duplicate-resource-type-24/
---
I was writing a little utility in Delphi 2007 to make it easy to work with data stored as the XML data type in SQL Server. While I have been using Delphi 2007 since it was released last fall, this was the first desktop app that I had written from scratch. I threw some components up on the form and I did a quick compile to see how the visual elements looked at runtime. I got the following error message:

[DCC Error] E2161 Warning: Duplicate resource: Type 24 (user-defined), ID 1; File C:\dev\RawDataQuery\RawDataQuery.res resource kept; file c:\program files\codegear\rad studio\5.0\lib\WindowsXP.res resource discarded.

I was dragging and dropping components from an app that I had originally written in Delphi 7 and one of the components was a TXPManifest component. The TXPManifest is component that only appears at designtime. When your code is compiled, it includes the WindowsXP.res resource file, which contains the manifest resource needed to enable XP style themes. In Delphi 2007, you can enable theme support in the project options. It&#8217;s a checkbox labeled &#8220;Enable runtime themes&#8221; on the Application page of the Project Options dialog.

You can&#8217;t have both &#8220;Enable runtime themes&#8221; checked and an instance of TXPManifest in your application. They both try to pull in WindowsXP.res and the second attempt will [FAIL](http://johnnytan88.files.wordpress.com/2007/11/epic-failure.jpg). The fix for this is easy. You can disable the &#8220;Enable runtime themes&#8221; setting or remove the TXPManifest component from your form and remove the reference to xpman in that form&#8217;s uses clause.

My personal preference is to remove the component and unit references and just use the project setting. When there are two methods of doing the same thing, I tend to pick the simpler solution. The fewer the number of moving parts, the less likely it is for something to break.