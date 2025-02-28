---
title: Argh! Now I have to keep track of Remote Desktop
date: 2006-01-03T17:24:00-05:00
---
Raymond Chen has a great [article](http://blogs.msdn.com/oldnewthing/archive/2006/01/03/508694.aspx "The new old thing") that explains why your program may look different under a Remote Desktop or Terminal Services session. If you do double buffering to eliminate screen flickering, you&#8217;ll pay a performance penalty when running over a remote connection. His tip is to have the app&#8217;s code detect if it&#8217;s running in a remote session and disable the double buffering. You get some flickering, but it will be much faster than shoving a large bitmap down the pipe.
