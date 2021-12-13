---
id: 195
title: When will the Visual Studio IDE catchup to the Delphi IDE?
date: 2008-03-28T18:18:00-05:00
layout: post
guid: http://www.rajapet.com/?p=195
permalink: /2008/03/28/when-will-visual-studio-ide-catchup-to/
---
Sometimes it just the little things that annoy you.  If I add a button to a [Delphi](http://en.wikipedia.org/wiki/Borland_Delphi) form, by default it is named **Button1**.  If I double click on **Button1**, a Click event handler is added and is named **Button1Click** and wires it up to the button&#8217;s OnClick event.  [Visual Studio](http://en.wikipedia.org/wiki/Visual_studio) does pretty much the same thing.  Where they is differ is when you edit the button&#8217;s name.

If I renamed **Button1** to something more meaningful like [**DestroyAllMonsters**](http://www.stomptokyo.com/movies/destroy-all-monsters.html), the Delphi IDE will rename the event handler to **DestroyAllMonstersClick**.  When you rename the button in the Visual Studio IDE, it doesn&#8217;t touch the event handler.  That&#8217;s annoying.

Another difference is how Delphi handles event handlers when your delete the code or never add the code.  When you double click on the button and get the new event handler [automagically](http://www.urbandictionary.com/define.php?term=automagically) created and wired up to the control, that event handler has no code.  If you save that file, Delphi removes the event handler.  it does under the assumption that you didn&#8217;t mean to have that event handler and it will clean up the code for you.  Like wise, if you delete the code out of the handler and save the file, Delphi will remove the handler.  

This makes it easy to cleanup code when you remove a control that you didn&#8217;t really want or need any more.  Visual Studio doesn&#8217;t do that for you, or least not in C#.  When you spend your day working in both IDE&#8217;s at the same time, those types of annoyances really can be annoying.