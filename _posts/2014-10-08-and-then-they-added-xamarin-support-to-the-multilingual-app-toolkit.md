---
title: And then they added Xamarin support to the Multilingual App Toolkit
date: 2014-10-08T06:33:35-05:00
---
As of 6am EDT today, Microsoft&#8217;s [Multilingual App Toolkit](http://aka.ms/matpreview "Multilingual App Toolkit") officially supports Xamarin for making it easy to manage language translations in mobile apps. Originally designed for Windows Store apps, the Multilingual App Toolkit (which I&#8217;m just going to call MAT) allows you to add new language resources and generate RESX files to compile into your app. It uses the XLIFF format for storing the translated resources and can import, export, and even machine translate your native text into other languages.

XLIFF stands for Xml Language Interchange File Format and is an industry standard file format that language translation companies can use to translate your text. XLIFF has some rudimentary workflow features that you track when a new text string has been added, or translated, or approved.

Prior to version 4, MAT only knew how to generate RESX files. That&#8217;s fine for Windows apps, but Android and iOS have their own formats. Android uses XML files in the folders for each language or local. The format is similar to the RESX format. For iOS, they store the string resources in text files, as key value pairs.

Last fall, [I played around with that version](http://www.rajapet.com/2013/12/cross-platform-localization-for-mobile-apps-in-code-magazine.html) and used T4 templates to render Android and iOS native resource files from the Windows RESX files. The MAT team decided to add that capability into MAT and improve on it. You can now add MAT support directly to Xamarin.Android and Xamarin.iOS projects. If you enable MAT support for Android, you can right on an Android project and add new languages to the project. They will be XLIFF files and will generate Android strings.xml files for each language.

Microsoft&#8217;s Cameron Lerum has been working on MAT and has brought it with him to Xamarin&#8217;s Evolve conference. I&#8217;ve had early access to beta builds of MAT 4 and it works much better than my mess of T4 scripts.

<div style="width: 546px" class="wp-caption aligncenter">
  <img loading="lazy" class="" src="https://i1.wp.com/www.rajapet.net/Category/Xamarin-Evolve-2014/i-zJ4RzQb/0/M/CameronMiguelDemoCropped-M.jpg?resize=536%2C450" alt="" width="536" height="450"  />
  
  <p class="wp-caption-text">
    Microsoft&#8217;s Cameron Lerum demoing the Multilingual App Toolkit with Xamarin.iOS for Xamarin CTO Miguel de Icaza
  </p>
</div>

The latest thing from Xamarin has been Xamarin.Forms, which allows you to write common UI code for Android, iOS, and Windows Phone. MAT v4 works just fine with it. Put your string resources in a RESX file and put that file in a shared library. Then you can access the compiled resource strings from both the code behind and in the XAML markup. You&#8217;ll need to add an IMarkupExtension to your project, but that will give you databinding to the localized string resources.

To find out more about the new version of the Multilingual App Toolkit, Cameron just [posted an article](http://blogs.msdn.com/b/matdev/archive/2014/10/08/mat-v4-0-technical-preview-adds-xamarin-support.aspx) on it on the MAT blog.  If you are attending the Xamarin Evolve conference this week, look for Cameron or myself and we can demo the new version.  If you are in Atlanta on this Saturday, the 11th, I will be doing [a presentation at the Atlanta Code Camp](atlantacodecamp.org/2014/speaker/Chris-Miller) that will feature how to use MAT to add localization support to native mobile apps.
