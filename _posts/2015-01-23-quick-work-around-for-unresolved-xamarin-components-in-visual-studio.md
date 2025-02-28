---
title: Quick work around for unresolved Xamarin components in Visual Studio
date: 2015-01-23T12:53:17-05:00
---
Have you ever had an unresolved component when  using the Xamarin plugin win Visual Studio?  You add a component from the Xamarin Component Store and after you installed it, it comes up as unresolved.

There is a path limitation that causes this error.  The components come packaged in a zip file with files inside folders.  When this length of the file paths in the zip file are factored in with the path length of your project, it can exceed Windows limits when the component is being added.

This only seems to be a factor when the component is being added.  Once the component has been added to the project, the path length is well within what Windows allows.  It also appears to be a Windows only issue, Xamarin Studio on OS X does not have this issue.

The way around this is to have your project on a shorter path.  There are a couple of ways of doing this.  The obvious way is to move your solution to a shorter path.  That&#8217;s annoying, especially if your code is already mapped a source control system that is expecting the files to be in the original path.

Another way around it is to make the path shorter via a [directory junction](https://msdn.microsoft.com/en-us/library/windows/desktop/aa365006(v=vs.85).aspx). A directory junction is like a symbolic link, but is easier to get rid of when you are done with it.  You create a link with a shorter path to the original path and then reopen the solution using the shorter path.  You add the component, it will install cleanly now because the path length is no longer an issue.

Your code is still in the original location.  You didn&#8217;t move it, you just created an alias to that location and that aliased location looks and feels like a real path.  Once you have added the component, you can either leave the link or remove it.

You can add the link from the command, or you can install a [shell extension](http://schinagl.priv.at/nt/hardlinkshellext/hardlinkshellext.html#download "Link Shell Extension") and do it from Windows Explorer.  I&#8217;m a command line kind of guy so I prefer to do it that way with the [mklink](https://technet.microsoft.com/en-us/library/cc753194.aspx "mklink documentation from TechNet") command.

Open up a command prompt shell with admin access (Run as Administrator).  Once you have an admin shell, use the following syntax:

<pre class="brush: powershell; gutter: false">mklink /j new-path original-path</pre>

For example, to create a shorter path c:\source\xamarin\myapp and have the new path named c:\x, do the following

<pre class="brush: shell; gutter: false">mklink /j c:\x c:\source\xamarin\myapp</pre>

Now you can open your solution from the c:\x folder.

To get rid of a directory junction, just use the rmdir (rd) command.  To get rid of c:\x, you would execute the following:

<pre class="brush: shell; gutter: false">rd x</pre>

That removes the directory junction, but does not touch the original location.
