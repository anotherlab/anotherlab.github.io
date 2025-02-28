---
title: Using Powershell to concatenate files and strip off the headers
date: 2014-07-21T11:52:32-05:00
---
<div style="background-color:#fff;display:inline-block;font-family:'Helvetica Neue',Arial,sans-serif;color:#a7a7a7;font-size:11px;width:100%;max-width:478px;min-width:300px;">
  <div style="overflow:hidden;position:relative;height:0;padding:75.104603% 0 49px 0;width:100%;">
  </div>
  
  <p style="margin:0;">
    <div style="padding:0;margin:4px 0 0 10px;text-align:left;">
      <a href="http://www.gettyimages.com/detail/185282284" target="_blank" style="color:#a7a7a7;text-decoration:none;font-weight:normal !important;border:none;display:inline-block;">#185282284</a> / <a href="http://www.gettyimages.com" target="_blank" style="color:#a7a7a7;text-decoration:none;font-weight:normal !important;border:none;display:inline-block;">gettyimages.com</a>
    </div></div> 
    
    <p>
      We had a request from a client to merge some files for an import process that we have.  As part of one of our applications, we can import delimited (comma, tab, etc)  ASCII files.   The client was generating the files from 5 different processes.  Each exported file has a single line header row, and the files were from OS X.  That meant that the files were Unicode encoded and ended each line with only a carriage return.
    </p>
    
    <p>
      Our import process can only handle a single ASCII file with DOS style line endings (carriage return + line feed).  It&#8217;s a legacy system and it can&#8217;t be touched.  What we can do to concatenate the multiple files into a single file and strip out the header rows for every file after the first one.  And change the encoding to ASCII and use the CR+LF combination that DOS loves so much.
    </p>
    
    <p>
      I&#8217;ve been doing a lot of <a href="http://technet.microsoft.com/en-us/scriptcenter/powershell.aspx">Powershell</a> lately, so it made sense with me to continue with that Swiss Army knife of scripting languages.  I ended up with the following script:
    </p>
    
    <pre class="brush:ps">
[CmdletBinding()]
param(
  [parameter(Mandatory=$TRUE,Position=0)]
    [String] $Pattern, # input pattern to match, including path. Example: c:\export\*.txt
  [parameter(Mandatory=$TRUE,Position=1)]
    [String] $Destination # Destination file to write
)

begin {
    $FileCount = 0

    # Get all of the files that match the wildcard pattern

    Get-ChildItem -path $Pattern | ForEach-Object {
        Write-Verbose "$FileCount $_.FullName"

        if ($FileCount -eq 0) {
            # For the file, just write it out as ASCII
            Get-Content $_.FullName | out-file -FilePath $Destination -Encoding ascii
        }
        else {
            # For each additional file, skip the header line and append as ASCII to the destination
            Get-Content $_.FullName | select -skip 1 | out-file -FilePath $Destination -Append -Encoding ascii
        }

        $FileCount++
    }

    Write-Verbose "$FileCount file(s) processed"
}
</pre>
    
    <p>
      The first five lines take care of the parameter binding. This script only needed two parameters. $Pattern is the path to the input files, including wildcards. $Destination is the full path to the file to concatenate the source files into. The optional &#8220;-verbose&#8221; parameter is supporting for displaying some text as the files are being processed. This is a standard Powershell parameter, that&#8217;s why it&#8217;s not included in the parameter list for this command.
    </p>
    
    <pre class="brush:ps">
    Get-ChildItem -path $Pattern | ForEach-Object {
</pre>
    
    <p>
      We are using <a href="http://technet.microsoft.com/en-us/library/hh849800.aspx">Get-ChildItem</a> to get all of the files that match $Pattern and then call <a href="http://technet.microsoft.com/en-us/library/hh849731.aspx">ForEach-Object</a> to iterate through that list.
    </p>
    
    <pre class="brush:ps">
        if ($FileCount -eq 0) {
            # For the file, just write it out as ASCII
            Get-Content $_.FullName | out-file -FilePath $Destination -Encoding ascii
        }
</pre>
    
    <p>
      For the first file, we just need to read it in and output it back out to the destination files. Powershell will handle the line endings and we will force it to ASCII. The $_ variable is a placeholder variable. When you are using a Foreach-Object loop, the $_ represents the current item of the loop. When you get use Get-ChildItem for a file or folder, .FileName is a property of the item or array of items being returned.
    </p>
    
    <pre class="brush:ps">
        else {
            # For each additional file, skip the header line and append as ASCII to the destination
            Get-Content $_.FullName | select -skip 1 | out-file -FilePath $Destination -Append -Encoding ascii
        }
</pre>
    
    <p>
      For each additional file, we read the file in, select every line after the first line, and finally append it as ASCII to the destination file.
    </p>
    
    <p>
      The &#8220;Write-Verbose&#8221; lines will only execute when the -verbose parameter is used. So if that script had been saved as c:\scripts\convert-files.psi, you would execute it like this:
    </p>
    
    <pre class="brush:ps">
c:\scripts\convert-files.ps1 -pattern c:\export\*.csv -destination c:\import\all.csv

c:\scripts\convert-files.ps1 -pattern c:\export\*.csv -destination c:\import\all.csv -verbose
</pre>
    
    <p>
      That would concatenate all files that end with &#8220;.csv&#8221; in the c:\export folder and write a single file named c:\import\all.csv. If you add the &#8220;-verbose&#8221; parameter, you will see the names of the files as they are being processed.
    </p>
