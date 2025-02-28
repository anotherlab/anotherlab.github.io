---
title: What to do when a Windows 7 desktop icon has the wrong image
date: 2010-02-25T21:58:00-05:00
---
We are in the middle of rebranding our applications and as part of the rebranding, the icons for each application have been updated.  We are having lots of fun cramming Vista styled icons through ancient resource compilers, but that’s another story.

We provided a rebranded application to our QA tem for testing.  The first thing the QA manager did was to drag the app to her Windows 7 desktop, replacing the previous version.   Oddly enough, the image appeared for the icon.  I went back and checked the build process, that image was no longer there.  yet, it appeared on her desktop.  It also occurs with Vista as well.

I had originally posted how to do this by deleting the iconcach.db, but that is such a crude hack that I have pulled it.  After posting this message, I came across a much simpler mechanism.  

If you call <span><a title="MSDN: SHChangeNotify Function" href="http://msdn.microsoft.com/en-us/library/bb762118%28VS.85%29.aspx">SHChangeNotify(SHCNE_UPDATEDIR, SHCNF_IDLIST, 0, 0)</a>, from shell32.dll, this will cause the icon cache to be refreshed.  This happens in real time, no need to restart explorer or rebooting.  This is easy to call from just about every programming environment. If you need a stand alone app,  Helge Klien wrote a simple command line tool and posted it at <a title="Free Tool: Refresh the Desktop Programmatically" href="http://blogs.sepago.de/helge/2007/11/22/free-tool-refresh-the-desktop-programmatically/">Free Tool: Refresh the Desktop Programmatically</a>.  I’ve added the SHChangeNotify() call to my installers, the users will never be bothered by this.</span>
