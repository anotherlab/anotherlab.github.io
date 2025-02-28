---
id: 151
title: Migrating Delphi versions with DevExpress
date: 2008-06-17T16:42:00-05:00
layout: post
guid: http://www.rajapet.com/?p=151
permalink: /2008/06/17/migrating-delphi-versions-with/
---
I usually run on the latest version of Delphi while the other Delphi developers in our department run a version or two back.  I’m the pretty much the sole Delphi developer on our .NET projects and I switch between VS 2008 and Delphi 2007 as needed.  The core Delphi team is on Delphi 2006 because of how our product development and testing cycles work.  We don’t switch compiler versions without coordinating with our QA department.

The core team is moving up to Delphi 2007 later this year for the next release cycle.  The current version of the product will stay in Delphi 2006 and the versions of the 3rd party components will be locked.  While development on the next release goes on, we may need to release updates to the current version.  So we lock the 3rd party components so that QA only needs to test the code specific to the update, plus general regression across the application.

With some component vendors, this makes upgrading more challenging.  We use the [Developer Express](http://www.devexpress.com/) components for [Delphi Win32](http://www.devexpress.com/Products/VCL/ExQuantumPack/ "The QuantumPack™ for Delphi and C++Builder") and for [.NET](http://www.devexpress.com/Products/NET/DXperience/).  DevExpress has wonderful components, but they use monolithic installers that install everything for each compiler per platform.  If I install the latest version of the DevExpress components for Delphi 2007, I’m also going to get the latest version for Delphi 2006.  You can’t install them separately, not without seriously confusing their installer.  Installer technology is scary enough, the last thing you want to is mess areound with the installer.  I wanted something robust, hand tweaking my system to manipulate the installer would be to fragile to have an entire team try it.

After a few emails with DevExpress support, I came with another method.  I wrote a Delphi app that would manually downgrade a DevExpress install for a specific compiler.  You would run this app after running the DevExpress installer and it would rip out the DevExpress current installed bits and replace them with a cached copy of the version that we need to stay at.  It does the following steps:

  1. Check to see if Delphi 2006 is running and stop with a warning message if it’s running.  Here’s how to check to see if Delphi 2006 is running: <div>
      <pre><span>function</span> IsDephi2006Running: <span>boolean</span>;<br />var<br />  handler: THandle;<br />  data: TProcessEntry32;<br />  Delphi2006IsRunning: <span>boolean</span>;<br /><span>function</span> GetName: <span>string</span>;<br />  var<br />    i: <span>byte</span>;<br />    s: <span>string</span>;<br />  begin<br />    result := <span>'';</span><br />    i := 0;<br /><span>while</span> data.szExeFile[i] &lt;> <span>'' do begin</span><br />      result := result + data.szExeFile[i];<br /><br /><span>if</span> uppercase(result) = <span>'BDS.EXE' then begin</span><br />        s := uppercase(ProcessFileName(data.th32ProcessID));<br /><br />        Delphi2006IsRunning := pos(<span>'BDS\4.0\BIN\BDS.EXE', s) > 0;</span><br /><span>end</span>;<br />      inc(i);<br /><span>end</span>;<br /><span>end</span>;<br />begin<br />  Delphi2006IsRunning := <span>false</span>;<br />  handler := CreateToolhelp32Snapshot(TH32CS_SNAPALL, 0);<br /><br /><span>if</span> Process32First(handler, data) <span>then</span> begin<br />    GetName();<br /><span>while</span> Process32Next(handler, data) <span>do</span> begin<br /><span>if</span> Delphi2006IsRunning <span>then</span><br />        break;<br />      GetName();<br /><span>end</span>;<br /><span>end</span>;<br /><br />  result := Delphi2006IsRunning;<br /><span>end</span>;</pre>
      
      <p>
        </div> 
        
        <p>
          </li> 
          
          <li>
            See if the Package Cache key, HKEY_CURRENT_USER\Software\Borland\BDS\4.0\Package Cache, exists in the registry.  If it does rename it.
          </li>
          <li>
            Deregister the DevExpress components from the IDE.  <br />In Delphi 2006, the component packages are registered in HKEY_CURRENT_USER\Software\Borland\BDS\4.0\Known Packages.  The rollback program has a list of list of every DevExpress 5 and 6 package.  My code rips them all out. Before they are removed, their location is cached as this is the folder where the compiled library files are located.  For Delphi 2006, this defaults to “C:\Program Files\Developer Express.VCL\Library\Delphi10”.
          </li>
          <li>
            Using the location the library folder for the DevExpress compiled units, we delete all of the files in that folder.  If you want to be extra cautious, you could just rename that folder and create a new one with the original name.
          </li>
          <li>
            Copy the cached copy of the rollback version of the DevExpress compiled units to the library folder.  I keep a clean copy of the library folder in a protected location on our network.  If you need to rollback your DevExpress components, you’ll want to cache those fiels before doing anything else.  You will also need to cache the list of packages to install.
          </li>
          <li>
            Register the rollback packages into the Known Packages key used in step 3.
          </li>
          <li>
            Copy the runtime packages to the bin folder.  You can get the location of the bin folder by reading the value of RootDir in HKEY_CURRENT_USER\Software\Borland\BDS\4.0.  I keep a cached set of the runtime packages in the same folder that I keep the cached library files.
          </li>
          <p>
            </ol> 
            
            <p>
              This process goes on the assumption that the DevExpress source code is not your Delphi search paths.  We typically leave the source code of the 3rd party components off the search path and just use the compiled units.  You get a faster compile and you don’t have to see other vendors compiler hint and warning messages.  If you want the source code on the search path, the you will need to cache all of the source code files.  At that point, it would be easier to cache the entire “\Program Files\Developer Express.VCL” folder.  And that’s how we upgrade selcted portions of our development environment.
            </p>