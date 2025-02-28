---
id: 65
title: What to do when Firefox displays multiple versions of the Java Console in the Add-ons list
date: 2010-04-23T15:09:00-05:00
layout: post
guid: http://www.rajapet.com/?p=65
permalink: /2010/04/23/what-to-do-when-firefox-displays/
---
I upgraded to [Firefox](http://www.mozilla.com/firefox) 3.6.3 the other day and at the same time, upgraded one of the add-ons I use (Xmarks).  I love [Xmarks](http://anotherlab.rajapet.net/%7BCAFEEFAC-0016-0000-0010-ABCDEFFEDCBA%7D "Bookmark sync and search"), but that’s for another time.  When Firefox upgrades an add-on, it displays the Add-ons list, which is a dialog box that lists all of the add-ons that are registered with Firefox.  You can use that dialog to enable or to disable an add-on or see if a newer version of an add-on is available.  

Firefox has two terms for add-ons.  They refer to them as either an add-on or an extension.  They mean pretty much the same thing with Firefox and I’m going with the term that appears in their own documentation, which is extension.

Something was changed in Firefox with the 3.6 release.  I saw a bunch of extensions that were not there before.  I was seeing multiple versions of something called the “Java Console”.

[<img loading="lazy" title="Add-ons with Java Console" height="244" alt="Add-ons with Java Console" src="https://i2.wp.com/lh4.ggpht.com/_natoSxTaPFU/S9G4CrosxPI/AAAAAAAAAcY/RBxhO1KLWSk/Add-ons%20with%20Java%20Console_thumb%5B7%5D.png?resize=227%2C244" width="227" border="0"  />](https://i0.wp.com/lh3.ggpht.com/_natoSxTaPFU/S9G4BBuxxXI/AAAAAAAAAcU/qgSKb1EcxlQ/s1600-h/Add-ons%20with%20Java%20Console%5B9%5D.png) 

This add-on is a [Java development tool](http://www.java.com/en/download/help/javaconsole.xml).  You can use it display error messages from Java applets running on a page.  I never use it and I didn’t want every old version in that list. If you search on “firefox java console multiple” with your favorite search site, you’ll get over 100,000 hits.  So I figured that it wasn’t me, it was Java causing the problem.  One the higher ranked hits for the search took me me to an [article about Java](http://kb.mozillazine.org/Java#Multiple_Java_Console_extensions "Multiple Java Console extensions") in the Mozilla (people behind Firefox) knowledge base.

It appears that when the Java installer is upgrading from a previous version of Java, it’s smart enough to remove or overwrite the previous version of the Java runtime, but not smart enough to remove the previous version of the Java Console extension. The KB article about Java has a link for how to [manually uninstall a add-on](http://kb.mozillazine.org/Uninstalling_add-ons#Global_extension).  You can do it manually or from within Firefox.  I was unable to remove it through Firefox, so I decided to remove it manually with [extreme prejudice](http://en.wikipedia.org/wiki/Terminate_with_extreme_prejudice).

You can register an extension with Firefox in multiple ways.  With Java, the extensions are stored in the following folder:  “%ProgramFiles%\Mozilla Firefox\extensions”.

On my XP machine, a listing of that folder displayed the following:

<pre>Volume in drive C is JOHNSONWAX     Serial number is 00a4:443c<br /> Directory of  C:\Program Files\Mozilla Firefox\extensions\*</pre>

<pre>4/23/2010   9:42         

<DIR>
      .<br /> 4/23/2010   9:42         
  
  <DIR>
        ..<br /> 4/16/2010  10:57         
    
    <DIR>
          {972ce4c6-7e08-4474-a285-3208198ce6fd}<br />11/18/2008  12:37         
      
      <DIR>
            <strong>{CAFEEFAC-0016-0000-0010-ABCDEFFEDCBA}</strong><br /> 2/18/2009  16:52         
        
        <DIR>
              <strong>{CAFEEFAC-0016-0000-0011-ABCDEFFEDCBA}</strong><br /> 5/28/2009  10:31         
          
          <DIR>
                <strong>{CAFEEFAC-0016-0000-0013-ABCDEFFEDCBA}</strong><br /> 8/10/2009  14:35         
            
            <DIR>
                  <strong>{CAFEEFAC-0016-0000-0015-ABCDEFFEDCBA}<br /></strong>11/23/2009  10:29         
              
              <DIR>
                    <strong>{CAFEEFAC-0016-0000-0017-ABCDEFFEDCBA}<br /></strong> 3/31/2010  13:57         
                
                <DIR>
                      <strong>{CAFEEFAC-0016-0000-0019-ABCDEFFEDCBA}<br /></strong> 4/22/2010  11:33         
                  
                  <DIR>
                        <strong>{CAFEEFAC-0016-0000-0020-ABCDEFFEDCBA}<br /></strong>10/09/2009  14:17              49  {E0B8C461-F8FB-49b4-8373-FE32E9252800}<br />             49 bytes in 1 file and 10 dirs    4,096 bytes allocated<br /> 20,867,198,976 bytes free<br /></pre>
                    
                    
                    <p>
                      From this listing, the multiple Java Console entries jump out as because of the multiple folder names that start with “{CAFEEFAC-0016”.  The folder names are <a title="Globally Unique Identifier" href="http://en.wikipedia.org/wiki/Globally_Unique_Identifier">GUIDs</a>, and it looks like Sun has embedded the version number in to the GUID name.
                    </p>
                    
                    
                    <p>
                      You typically will not see the name of the extension in the folder or in any of the file names in the extension folder.  You need to check the folder and read either the chrome.manifast or the install.rdf, files typically found in an extension folder.  When I opened the install.rdf (this file tells FireFox how to register the extension) in the {CAFEEFAC-0016-0000-0010-ABCDEFFEDCBA} folder, this is what I saw.
                    </p>
                    
                    
                    <pre><RDF xmlns="<a href="http://www.w3.org/1999/02/22-rdf-syntax-ns">http://www.w3.org/1999/02/22-rdf-syntax-ns</a>#"<br />     xmlns:em="<a href="http://www.mozilla.org/2004/em-rdf">http://www.mozilla.org/2004/em-rdf</a>#"><br />  <Description about="urn:mozilla:install-manifest"><br />    <strong><em:name>Java Console</em:name><br /></strong>    <em:id>{CAFEEFAC-0016-0000-0010-ABCDEFFEDCBA}</em:id> <br />    <strong><em:version>6.0.10</em:version><br /></strong>    <em:type>2</em:type> <br />    <em:hidden>true</em:hidden><br />    <em:targetApplication><br />      <Description><br />        <em:id>{ec8030f7-c20a-464f-9b0e-13a3a9e97384}</em:id><br />        <em:minVersion>1.0</em:minVersion><br />        <em:maxVersion>5.0+</em:maxVersion><br />      </Description><br />    </em:targetApplication><br />  </Description>      <br /></RDF></pre>


<p>
  The fourth line down lists the extension name as the value of the em:name element and two lines down, you’ll see the version number as the value of the em:version element. Since I could tell that the “{CAFEEFAC-0016” folders belong to the Java Console, all I had to was to delete all of the “{CAFEEFAC-0016” folders, except for the last one.  Once I did that, all I needed to do was to restart Firefox and the extra extensions were gone.
</p>


<p>
  This appears to be a bug with the Java installer when you upgrade over an existing version.  If it’s smart enough to remove the previous runtime, it should be able to remove the previous version of the console.  It would not have been that hard, all they had to to was look at all the extension folders that started with “{CAFEEFAC-0016-0000” and remove the one that was not the current one.
</p>