---
id: 166
title: Does knowing C make you a better programmer?
date: 2008-05-27T20:26:00-05:00
layout: post
guid: http://www.rajapet.com/?p=166
permalink: /2008/05/27/does-knowing-c-make-you-better/
---
[Joel](http://www.joelonsoftware.com/AboutMe.html) and [Jeff](http://www.codinghorror.com/blog/archives/000021.html) had a [conversation](http://blog.stackoverflow.com/index.php/2008/04/podcast-3/) about the merits of knowing how to program in C.  Joel&#8217;s take was knowing how to program in C makes you a better program.  I&#8217;m in that camp, with some [other](http://blog.darrenstokes.com/2008/05/22/do-you-really-need-to-know-c-i-think-so/) [people](http://www.ericsink.com/entries/c_morse_code.html) (Darren and Eric).

After college, I did mostly C programming.  That was back in the days when 640K wasn&#8217;t the punch-line to a joke, but a real limit that drove you nuts.  Having a good working knowledge of C gave you a better understanding how memory was allocated and how it was used.  [Pointer arithmetic](http://en.wikipedia.org/wiki/Pointer_arithmetic) was part of the natural order of programming.  It made you a careful with what you allocated and how you managed it.

There&#8217;s a still a place for unmanaged code, whether it&#8217;s C, C++, Delphi, or some other language.  You get a lot functionality with managed code (more ways of accessing data, garbage collection, etc), but there&#8217;s no free lunch and there&#8217;s a substantial footprint for each process that uses the .NET Framework.  I&#8217;m typing this with Windows Live Writer, an app that&#8217;s written for the .NET Framework.  It&#8217;s using 54MB right now as I type.  That&#8217;s a lot of memory for a WYSIWG blog tool.  Just because you have a garbage collector doesn&#8217;t mean that it&#8217;s being used effectively.  It&#8217;s still good to clean up after yourself and a good C/C++ programmer does that.

Eric Sink compared knowing C with knowing Morse code.  It&#8217;s a flawed argument in that Morse code is not the underpinnings of the technology that came after it, but it&#8217;s close enough to the spirit of the argument to have some merit.  My dad learned Morse code 30+ years ago when he got his ham license.  It was a big deal back then and you couldn&#8217;t get your ham license with being able to demonstrate your proficiency with Morse.

Once he got his license, he rarely if ever used Morse to send out a message.  But every now and then, he would pick up a faint signal that had bounced around the ionosphere and it would be in Morse.  He would sit at his radio and pick out the words that of the dashes and dots.   

But how can you use that analogy to demonstrate the value of C to a managed code programmer?  For many programmers, I&#8217;m sure it doesn&#8217;t mean anything to them.  If you are just doing web programming for some giant [LOB](http://en.wikipedia.org/wiki/Pointer_arithmetic) app, only knowing VB.NET or C# probably isn&#8217;t much a of a liability.

On the other hand, If you do any [P/Invoke](http://www.pinvoke.net/) work, you&#8217;ll calling DLLs that were mostly written in C or C++.  Having a knowledge of those languages makes it a little easier to understand the data structures and calling conventions used by the DLL.  If you working with binary data that came from unmanaged code, knowing how that data is represented in it&#8217;s native environment will make it easier to understand what it is and how to use it.

Darren Stokes made the assertion that programmers who know C seem to solve complicated problems faster than those who don&#8217;t know C.  I don&#8217;t know of you can make that case.  With the push to teach only managed code at school, the programmers that came up knowing C are a bit older than the programmers who don&#8217;t know C.  That programmer who has the C experience is probably someone who has been around longer and has that much more experience to draw from.  I wonder if anyone has down any actual studies that compare the level of productivity from programmers with C experience compared with programmers that only know only managed code.