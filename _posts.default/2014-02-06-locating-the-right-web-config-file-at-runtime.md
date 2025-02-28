---
id: 598
title: Locating the right web.config file at runtime
date: 2014-02-06T12:29:46-05:00
layout: post
guid: http://www.rajapet.com/?p=598
permalink: /2014/02/06/locating-the-right-web-config-file-at-runtime/
---
I created a [Web API](http://www.asp.net/web-api) web service that&#8217;s part of a shrink wrapped application. The service has a web.config that the end user will need to configure some settings in.  Editing a web.config manually is, at best, annoying.

<div style="width: 330px" class="wp-caption aligncenter">
  <img loading="lazy" alt="Man Screaming" src="http://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Scream_crosathorian.jpg/320px-Scream_crosathorian.jpg" width="320" height="480" />
  
  <p class="wp-caption-text">
    If your app requires manual XML editing, then you failed
  </p>
</div>

I usually provide a desktop app for editing the web.config file.  I want the user to be able to point and click as much of the settings as possible. It&#8217;s also possible for this web service to be deployed as multiple instances on the same server, so I wanted to make easier for the user to configure the files.

I wrote a simple WPF app that would let the user edit a specific type of web.config  and that user could edit the settings and not have to worry about the syntax issues that come with the [angle bracket tax](http://norman.walsh.name/2008/05/13/thetax).  I&#8217;m a firm believer in [Steve Krug&#8217;s &#8220;Don&#8217;t make me think&#8221; philosophy](http://www.sensible.com/dmmt.html). And editing XML is about as far away as you can get from that.

Instead of hard coding the path to the web.config file I made the config editor a little smarter and gave it the ability to locate all instances of the web.config that it knows how to edit.   I created a helper class with a few methods that would return a list of web.config files with the full path.  That list was bound to the dropdown list and the code would load the correct web.config when the selection changed.

The first step was to locate all of the web.config files.  In the [Microsoft.Web.Administration](http://msdn.microsoft.com/en-us/library/microsoft.web.administration(v=vs.90).aspx) namespace, we have the [ServerManager](http://msdn.microsoft.com/en-us/library/microsoft.web.administration.servermanager(v=vs.90).aspx) class.  The ServerManager class is documented as &#8220;Provides read and write access to the IIS 7 configuration system.&#8221; .  That&#8217;s exactly what I need.

Take the following method;

<pre>public List GetWebApiFolders()
{
    List folders = new List();

    ServerManager iisManager = new ServerManager();

    foreach (var s in iisManager.Sites)
    {
        foreach (var app in s.Applications)
        {
            foreach (var dir in app.VirtualDirectories)
            {
                if (IsWebApiFolder(dir.PhysicalPath))
                {
                    if (!folders.Contains(dir.PhysicalPath))
                        folders.Add(dir.PhysicalPath);
                }
            }
        }
    }

    return folders;
}</pre>

We iterate through each site in the Sites collection. Then for all of the apps for each site. Then for all of the virtual directories for each app. I call a method called IsWebApiFolder() and pass in the physical path to that virtual directory.  The IsWebApiFolder() method will return true if this folder contains a web.config that my config editor can edit.

Let&#8217;s take a look at IsWebApiFolder()

<pre>private Boolean IsWebApiFolder(string folderName)
{
    Boolean result = File.Exists(
      Path.Combine(folderName, "SomeCustomHandler.ashx"));

    if (result)
    {
        XDocument doc = 
          XDocument.Load(
           Path.Combine(folderName, "web.config"));

        var node = doc.Descendants("appSettings")
          .Elements("add")
          .Where(n =&gt; n.Attribute("key")
          .Value == "Crazy.App");

        result = node.Count() &gt; 0;
    }

    return result;
}</pre>

The first thing it does is to look for a file with an uncommon name.  It doesn&#8217;t matter which file you  pick, just make it fairly unique to your app.  It could even be an empty text file named &#8220;ThisIsTheFooBar.txt&#8221;.  After finding a folder that has what could be my app&#8217;s files, I parse the web.config and look for a specific setting.  If it has that setting, then I&#8217;m pretty confident that I have found the right file. When I find the right file, I return true back to the caller, which then adds that file to the list of web.config files that can be edited.

<p style="font-size: smaller;">
  Screaming Man image By Crosa (Flickr: Scream) [<a href="http://creativecommons.org/licenses/by/2.0">CC-BY-2.0</a>], <a href="http://commons.wikimedia.org/wiki/File%3AScream_crosathorian.jpg">via Wikimedia Commons</a>
</p>