---
title: Restoring missing Build Events in Delphi 2007
date: 2008-10-14T15:22:00-05:00
---
If you have a Delphi 2007 project that was ported from Delphi 2006, then you may be missing the build event project options.  The <a title="Files that end with .dproj are Delphi project files." href="http://www.file-extensions.org/dproj-file-extension" target="_blank">.dproj</a> file that Delphi 2006 creates is does not have a final XML element named PropertyGroup that Delphi 2007 uses.  Without that final PropertyGroup, Delphi 2007 will not enable Build Events as an option.  If you manually edit your .dproj file, just the following lines:

<div>
  <pre><div>
  <!--<br /><br />Code highlighting produced by Actipro CodeHighlighter (freeware)<br />http://www.CodeHighlighter.com/<br /><br />-->
  
  <span>  </span><span>&lt;</span><span>PropertyGroup</span><span>></span><span><br /></span><span>&lt;/</span><span>PropertyGroup</span><span>></span><span><br /></span>
</div></pre>
  
  <p>
    <!-- Code inserted with Steve Dunn's Windows Live Writer Code Formatter Plugin.  http://dunnhq.com --></div> 
    
    <p>
      So that the .dproj files looks like this at the end of the file:
    </p>
    
    <div>
      <pre><div>
  <!--<br /><br />Code highlighting produced by Actipro CodeHighlighter (freeware)<br />http://www.CodeHighlighter.com/<br /><br />-->
  
  <span>  </span><span>&lt;</span><span>PropertyGroup</span><span>></span><span><br /></span><span>&lt;/</span><span>PropertyGroup</span><span>></span><span><br /></span><span>&lt;/</span><span>Project</span><span>></span>
</div></pre>
      
      <p>
        <!-- Code inserted with Steve Dunn's Windows Live Writer Code Formatter Plugin.  http://dunnhq.com --></div> 
        
        <p>
          After making that change, the next time you open that project with Delphi 2007 and select Options from the Project menu, you’ll see Build Events listed.  This only appears to happen if you migrate a Delphi 2006 project over to Delphi 2007.  If you create the project from scratch, you’ll see Build Events list.  That’s how I was able to determine what was missing, I just created a new project and compared the .dproj files.
        </p>
