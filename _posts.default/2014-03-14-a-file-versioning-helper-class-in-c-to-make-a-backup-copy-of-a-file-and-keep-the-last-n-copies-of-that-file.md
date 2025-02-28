---
id: 743
title: 'A file versioning helper class in C# to make a backup copy of a file and keep the last N copies of that file'
date: 2014-03-14T15:36:54-05:00
layout: post
guid: http://www.rajapet.com/?p=743
permalink: /2014/03/14/a-file-versioning-helper-class-in-c-to-make-a-backup-copy-of-a-file-and-keep-the-last-n-copies-of-that-file/
---
[<img loading="lazy" title="Cicero denouncing Cataline" src="http://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Comic_History_of_Rome_Table_10_Cicero_denouncing_Cataline.jpg/640px-Comic_History_of_Rome_Table_10_Cicero_denouncing_Cataline.jpg" alt="Cicero denouncing Cataline" width="640" height="404" />](http://commons.wikimedia.org/wiki/File:Comic_History_of_Rome_Table_10_Cicero_denouncing_Cataline.jpg)

While testing my configuration editor app, one of the QA guys asked if it made a backup copy of the file being edited.  My reply was &#8220;not yet&#8221;.  And I thought about it a bit and decided to implement the backup feature and to [kick it up a notch](http://www.youtube.com/watch?v=XvazQUYG1kE "Bam!").

In prehistoric times, VMS would [automagically](http://en.wikipedia.org/wiki/Versioning_file_system#Files-11_.28RSX-11_and_OpenVMS.29) version your files when you saved them.  When you saved a file, the file system  would append a version number starting at 1.  You could open any version of a file by including the version number.  If you left out the version number, you got the latest version.  This goes back to the days when monitors supported both colors, green and not green.  To clear out older versions, you would periodically need to run the [purge](http://h71000.www7.hp.com/doc/84final/9996/9996pro_159.html "HP OpenVMS Systems Documentation") command.

<div style="width: 650px" class="wp-caption alignnone">
  <a href="http://siarchives.si.edu/collections/siris_arc_308433?back=%2Fcollections%2Fsiris_arc_308433"><img loading="lazy" title="Prehistoric times for web developers" src="http://ids.si.edu/ids/deliveryService?id=http://sirismm.si.edu/SPI/5696_Image_85-725.18.jpg" alt="Prehistoric times for web developers" width="640" height="419" /></a>
  
  <p class="wp-caption-text">
    Prehistoric times for web developers
  </p>
</div>

<span style="line-height: 1.5;">I wanted something close to that in my code, except without having to manually purge the file system.  I wrote a simple static class that takes the name of the file and the number of versions to keep.</span>

<pre class="brush: csharp">public static class FileHelper
{
    /// &lt;summary&gt;
    /// Make a numbered backup copy of the specified files.  Backup files have the name filename.exe.yymmdd##, where yymmdd is the date and ## is a zero justified sequence number starting at 1
    /// &lt;/summary&gt;
    /// &lt;param name="fileName"&gt;Name of the file to backup.&lt;/param&gt;
    /// &lt;param name="maxBackups"&gt;The maximum backups to keep.&lt;/param&gt;
    public static void MakeBackup(string fileName, int maxBackups)
    {
        // Make sure that the file exists, you don&#039;t backup a new file
        if (File.Exists(fileName))
        {
            // First backup copy of the day starts at 1
            int newSequence = 1;

            // Get the list of previous backups of the file, skipping the current file
            var backupFiles = Directory.GetFiles(Path.GetDirectoryName(fileName), Path.GetFileName(fileName) + ".*")
                .ToList()
                .Where(d =&gt; !d.Equals(fileName))
                .OrderBy(d =&gt; d);

            // Get the name of the last backup performed
            var lastBackupFilename = backupFiles.LastOrDefault();

            // If we have at least one previous backup copy
            if (lastBackupFilename != null)
            {
                // Get the last sequence number back taking the last 2 characters and convert them to an int. And add 1 to that number
                if (Int32.TryParse(Path.GetExtension(lastBackupFilename).GetLast(2), out newSequence))
                    newSequence++;

                // If we have more backups than we need to keep
                if (backupFiles.Count() &gt;= maxBackups)
                {
                    // Get a list of the oldest files to delele
                    var expiredFiles = backupFiles.Take(backupFiles.Count() - maxBackups + 1);

                    foreach (var expiredFile in expiredFiles)
                    {
                        File.Delete(expiredFile);
                    }
                }
            }

            // Create the file name for the newest back up file.
            var latestBackup = String.Format("{0}.{1:yyMMdd}{2:00}", fileName, DateTime.Now, newSequence);

            // Copy the current file to the new backup name and overwrite any existing copy
            File.Copy(fileName, latestBackup, true);
        }
    }
}
// String Extension that was used in the code but left out when I first published
public static class StringExtension
{
    public static string GetLast(this string source, int tail_length)
    {
       if(tail_length &gt;= source.Length)
          return source;
       return source.Substring(source.Length - tail_length);
    }
}
</pre>

You would use this method like this:

<pre class="brush: csharp">FileHelper.MakeBackup("web.config", 5);</pre>

The first time you called it, you would get web.config.14031401. The next time would get web.config.14031402. When web.config.14031406 was created, web.config.14031401 would be deleted to keep the number of backups limited to 5.

[Updated August 17th, 2015]  
When I posted this, I left out a string extension methiod that I use to get the last N characters from a string.  That code is now included.