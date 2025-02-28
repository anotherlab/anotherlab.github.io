---
title: Using the test form from remote connections for .NET web services
date: 2008-08-21T14:16:00-05:00
---
I’m working on a web service using C# and targeting the .NET 2.0 Framework.  Nothing terribly fancy, but it has some code to log the caller’s IP address (via HttpContext.Current.Request.UserHostAddress).  While testing the code, I like using the test form functionality that .NET provides with web services.  By design, it only works locally.  If you try to use the test form from a remote machine, you’ll get the error:

> The test form is only available for requests from the local machine

That’s fine, when you expose a web service you don’t want to make it too easy for people to start poking at your web service methods with a pointy stick.  Still, I wanted to test it from another machine and it saves time being able to enter in different values without having to code up a test framework.  Plus, I wanted to make sure that my code was reliably picking up the caller’s IP address.

After just a tiny bit of searching in the <a href="http://en.wikipedia.org/wiki/Series_of_tubes" target="_blank">series of tubes</a>, I found how to easily enable the web service test form for remote connections.  Juan Ignacio Gelos <a href="http://geekswithblogs.net/juang/archive/2005/11/28/61437.aspx" target="_blank">posted</a> what you need to add to the web service web.config file to enable the test form.

<pre><span>&lt;</span><span>configuration</span><span>></span><br /><span>&lt;</span><span>system.web</span><span>></span><br /><span>&lt;</span><span>webServices</span><span>></span><br /><span>&lt;</span><span>protocols</span><span>></span><br /><span>&lt;</span><span>add</span> <span>name</span><span>="HttpGet"</span><span>/></span><br /><span>&lt;</span><span>add</span> <span>name</span><span>="HttpPost"</span><span>/></span><br /><span>&lt;/</span><span>protocols</span><span>></span><br /><span>&lt;/</span><span>webServices</span><span>></span><br /><span>&lt;/</span><span>system.web</span><span>></span><br /><span>&lt;/</span><span>configuration</span><span>></span></pre>



You are still limited to run methods that have simple data types as input, but it’s very handy for testing.  Since this setting lives in web.config, it’s easy to remove it when I run a build.  I’m using <a href="http://www.finalbuilder.com/" target="_blank">FinalBuilder</a> on a dedicated build box and it’s easy to clean up .config files so that developer settings get scrubbed before the files get packages into an installer.
