---
title: Acrobat Reader 7 phoning home
date: 2005-04-15T18:14:00-05:00
---
Remote Approach is a company that has designed a way to track PDF files using Javascript. Each time a person reads these special designed PDF files, a connection to http://www.remoteapproach.com/remoteapproach/logging.asp is made. This allows the company (and PDF author) to gather information such as IP addresses of those who are reading the PDF.

Some ways on how to block it:

  * Use an Acrobat Reader replacement such as [Foxit PDF Reader](http://foxitsoftware.com/pdf/rd_intro.php) or [DjVuLibre](http://djvulibre.djvuzone.org/) 
  * Block connections to http://www.remoteapproach.com through a firewall 
  * Add the line &#8220;remoteapproach.com 127.0.0.1&#8221; to your hosts file 
  * Disable Javascript in Acrobat Reader and it can&#8217;t call home 
      1. Click Edit menu 
      2. Select Preferences 
      3. Select the JavaScript category 
      4. Uncheck Enable Acrobat JavaScript 
      5. Click OK

&#8220;You have no privacy, get over it.&#8221; &#8211; Scott McNealy, Sun Microsystems Inc  
courtesy of [tech-recipes.com](http://www.tech-recipes.com/internet_tips861.html)
