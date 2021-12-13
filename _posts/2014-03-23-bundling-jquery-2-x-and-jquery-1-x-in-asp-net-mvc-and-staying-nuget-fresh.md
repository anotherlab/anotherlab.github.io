---
id: 770
title: Bundling jQuery 2.x and jQuery 1.x in ASP .Net MVC and staying NuGet fresh
date: 2014-03-23T15:00:31-05:00
layout: post
guid: http://www.rajapet.com/?p=770
permalink: /2014/03/23/bundling-jquery-2-x-and-jquery-1-x-in-asp-net-mvc-and-staying-nuget-fresh/
---
<img loading="lazy" class="aligncenter" alt="Fork in the road" src="https://i1.wp.com/www.rajapet.net/photos/i-bvJLJpj/0/L/i-bvJLJpj-L.jpg?resize=400%2C300" width="400" height="300" data-recalc-dims="1" />  
If you use [Nuget](https://www.nuget.org/) to install [jQuery](http://www.jquery.com/) into your application, you&#8217;ll need to take some extra steps to support multiple versions of jQuery.  By default, NuGet will uninstall previous versions of a package.  The way around this is to create another folder inside the scripts folder and put the older jQuery-1._._ files in it. I got the idea for doing this from a [post](http://stackoverflow.com/questions/17783019/bundling-multiple-versions-of-jquery "Bundling multiple versions of Jquery") on StackOverflow

Right click on the Scripts folder and select **Add->New Folder**.  Give the folder a name that has some meaning to you, I used &#8220;compatibility&#8221;.  Select the jquery-1.* files and move them to the new folder.  You can copy them or move them, it doesn&#8217;t really matter.

Then install the latest version of jQuery using NuGet.  From the **Tools** menu, select **Library Package Manager->Package Manager Console**.  From the package manager window run the following:  
Install-Package jQuery

You should see something like this:

<div class="imgwrapper" style="width: 600px; text-align: center; float: left; margin: 0px 5px 5px 0px;">
  <a href="https://i1.wp.com/www.rajapet.net/photos/i-F99phJw/0/L/i-F99phJw-L.png"><img loading="lazy" alt="Package Manager Console" src="https://i1.wp.com/www.rajapet.net/photos/i-F99phJw/0/M/i-F99phJw-M.png?resize=600%2C175" width="600" height="175" data-recalc-dims="1" /></a>
</div>

<div class="imgwrapper" style="width: 600px; text-align: center; float: left; margin: 0px 5px 5px 0px;">
  Package Manager Console
</div>

It installed jQuery 2.1 and then it removed the jQuery 1.10 package.  It complained that it couldn&#8217;t find the intellisense file for the previous version. That&#8217;s because I had moved it to the new folder.

Now it&#8217;s time to update the bundles. When you create a new web project, ASP .Net will create some bundles for you. A bundle is a collection of scripts and stylesheets and does a neat little trick where at debug time you get the individual files as if you had specified each one in the web page. At runtime, the files are minified and consolidated into a single file. This compresses the payload and saves on loading time as the browser only needs to make a single request to get the files in the bundle. Any hoo, if you create a ASP .Net project in the current version of VS, you will get this bundle definition in BundleConfig.cs:

<pre class="brush: csharp">public class BundleConfig
{
    public static void RegisterBundles(BundleCollection bundles)
    {
        bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                    "~/Scripts/jquery-{version}.js"));
        // Other code removed...
    }
}</pre>

This call to bundles.Add creates a new bundle named &#8220;~/bundles/jquery&#8221; and uses the {version} regex placeholder, (\d+(?:.\d+){1,3}), to match the jQuery file without having to specify the version. You don&#8217;t have to worry about your code breaking due to an invalid reference to jQuery when NuGet updates jQuery.

What we do now is add a second bundle that will use the older version of jQuery. Since we copied those files to a new folder, NuGet is blissfully unaware of their continued existence and will not remove them. We just create a ScriptBundle with a new name and have it specify the folder that we put the old version of jQuery in.

<pre class="brush: csharp; highlight: [5, 6]">public class BundleConfig
{
    public static void RegisterBundles(BundleCollection bundles)
    {
        bundles.Add(new ScriptBundle("~/bundles/jqueryold").Include(
            "~/Scripts/compatibility/jquery-{version}.js"));

        bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
            "~/Scripts/jquery-{version}.js"));
        // Other code removed...
    }
}</pre>

The final step is to update the shared layout view that MVC puts the jQuery script reference in.

<img src="https://i0.wp.com/www.rajapet.net/photos/i-hbKpGgN/0/M/i-hbKpGgN-M.png?w=680" title="" alt="" data-recalc-dims="1" /> 

With a new project, you will edit the Views\Shared&#95;Layout.cshtml file. The default jquery reference will look like something this:

<pre class="brush: html; highlight: [1]">@Scripts.Render("~/bundles/jquery")
    @Scripts.Render("~/bundles/bootstrap")
    @RenderSection("scripts", required: false)
&lt;/body&gt;
&lt;/html&gt;</pre>

What we need to do is the replace the @Scripts.Render line with a conditional block of code that checks for older versions of Internet Explorer.

<pre class="brush: html;">&lt;!--[if lt IE 9]&gt;
    @Scripts.Render("~/bundles/jqueryold")
    &lt;![endif]--&gt;
    &lt;!--[if gte IE 9]&gt;&lt;!--&gt;
    @Scripts.Render("~/bundles/jquery")
    &lt;!--&lt;![endif]--&gt;
    @Scripts.Render("~/bundles/bootstrap")
    @RenderSection("scripts", required: false)
&lt;/body&gt;
&lt;/html&gt;</pre>

We use IE&#8217;s [Conditional Comments](http://msdn.microsoft.com/en-us/library/ms537512(v=vs.85).aspx "About conditional comments") to detect previous versions of IE. This a feature specific to IE versions 5 through 9. All other browsers will treat the Conditional Comments as regular HTML comments.

<pre class="brush: html;">&lt;!--[if lt IE 9]&gt;</pre>

With this line, IE 5-9 (and 10 in compatibility view) will treat this as the start of a block of code. All other browsers will treat this as the start of a comment block. The block is closed when it hits &#8220;&#8211;>&#8221;.

<pre class="brush: html;">&lt;!--[if gte IE 9]&gt;&lt;!--&gt;
    @Scripts.Render("~/bundles/jquery")
    &lt;!--&lt;![endif]--&gt;
</pre>

With this block, we are saying if IE is greater than or equal to version 9, to use this block. The &#8220;<!&#8211;>&#8221; on that line tells IE 10 and the other browsers to close out this comment block which makes that block of code available to the browser. This will allow you to stay current by letting NuGet updating jQuery, while still keeping some level of compatibility with older versions. This is one of the times where IE extending HTML in a proprietary way is useful.

<small><em>The fork in the road image was modified from an creative commons licensed image posted by <a href="http://www.flickr.com/photos/ehamiter/4607728796/">Eric Hamiter</a> to his Flickr collection.</em></small>