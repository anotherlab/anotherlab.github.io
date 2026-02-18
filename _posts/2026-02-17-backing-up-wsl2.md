---
title: "Backing up my main WSL2 Linux session"
author: anotherlab
classes: wide
toc: true
header:
  image: /assets/images/backing-up-wsl2.jpg
categories: 
  - WSL2
  - PowerShell
  - Backups
tags:
  - WSL2
  - Ubuntu
  - PowerShell
  - Backups
  - Linux

---
# Backing up my main Linux session
TL;DR: I wrote a PowerShell script named backup-wsl2.ps1 to backup a Linux distribution.
You can run like this:
```powershell
.\backup-wsl2.ps1 -Destination "C:\Backups"
```
You can grab it from [here](https://gist.github.com/anotherlab/0bfae255f41f87a83e31ec077bf3f606). It's pretty long so I wont display it, but I will do a mini-teardown.

I have a UBuntu session on my main Windows box, running under WSL2. I use it whenever I need to try something vaguely *ix like. I run [redis](https://rajapet.com/2021/10/19/controlling-a-wsl-installation-of-redis-server-from-the-windows-command-line/) on it. And I generate the pages for this blog via [Jekyll](https://rajapet.com/2021/12/15/Migrated-to-jekyll/).

But I don't have a backup for the Ubuntu session. My blog is literally a GitHub repo, but the files needed to run Jekyll are not.

About a year ago, the primary drive on my Windows box abruptly failed. It was a Sumsung 980 Pro 2 TB. That model and size had an issue with the firmware that would brick the drive. Long story short, Samsung replaced the drive under warranty with a 990 Pro and I reinstalled Windows.

I have a [QNap TS-464 NAS](https://www.qnap.com/en-us/product/ts-464) that I use for backing up stuff. All of my files were backed up to it. I like the 464, it does exactly what I need and emails me when it needs something. I named it "swan" because it was a short name that I would remember.

I don't backup OS images. When push comes to shove, I repave with the latest and greatest, then copy the files back down from swan.

I had to reinstall WSl2 and create a new Ubuntu image and then pull my blog files back down off of GitHub. But I had to reinstall Jekyll and get that mess running again.

So now I want to back up my Linux session to swan.

# Steps to back up a WSL Linux session
It's pretty easy. Run the following command

```bash
wsl --export NameOfImage NameOfTarFile
```
If you want to restore from a TAR file, it works like this:

```bash
wsl --import <NewDistroName> <InstallLocation> <Path\to\Backup.tar>
```

## Script all the things
I just needed to create a [PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/overview) script to create the TAR file and copy it to swan.

![Yak Shaving](/assets/images/script-all-the-things.jpg "Yak shaving (again)")

### Getting the Distribution Name
I could have hardcoded the name of the image, but where's the fun in that? There are few ways of querying for the name of the image. My friend [Claude](https://www.anthropic.com/news/claude-sonnet-4-5) suggested the following code:

```powershell
function Get-DefaultWSLDistribution {
    $default = (wsl echo '$WSL_DISTRO_NAME').Trim()

    if (-not $default) {
        throw "No default WSL distribution found."
    }

    return $default
}
```
The way this works is that when you invoke the `wsl`.exe` command, it sets `$WSL_DISTRO_NAME` to the default distribution. It works but there is a delay in wsl being invoked with nothing to do. Ignoring the advice from the AI overlords, I came up with this instead:

```powershell
function Get-DefaultWSLDistributionQuick {
    $results = wsl --list --all 2>$null

    foreach ($p in $results) {
        $line = $p.Trim()
        $len = $line.IndexOf(' (Default)')
        if ($len -ge 0) {
            return $line.Substring(0, $len)
        }
    }

    return $null
}
```

When you run `wsl --list --all`, you'll get (or at least I got) something like this:

```text
Windows Subsystem for Linux Distributions:
Ubuntu-24.04 (Default)
```
There be dragons here, but we'll get to that in a minute.

Right now, I only have a single Linux instance defined. And WSL was good enough to tag it with "(Default)". The `foreach` walks through each line and returns the first session tagged with "(Default)" and then returns the text to the left of " (Default)".

With that, we can use this line to get the name of the Linux distribition to back up.

```powershell
$defaultDistro = Get-DefaultWSLDistributionQuick
```
The $defaultDistro variable will contain the content "Ubuntu-24.04". Here be dragons. Take this variable assignment:
```powershell
$sampleDistro = "Ubuntu-24.04"
```
You would think that $defaultDistro and $sampleDistro have the same values. They don't. The variable $defaultDistro will contain UTF-16 characters and $sampleDistro will have UTF-8 characters. The wsl command will return UTF-16 and will error out unless you use UTF-8. You can see the difference by piping each one into `Format-Hex` like this

```powershell
$sampleDistro | Format-Hex

   Label: String (System.String) <3B9579CC>

          Offset Bytes                                           Ascii
                 00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F
          ------ ----------------------------------------------- -----
0000000000000000 55 62 75 6E 74 75 2D 32 34 2E 30 34             Ubuntu-24.04

$defaultDistro | Format-Hex

   Label: String (System.String) <45133834>

          Offset Bytes                                           Ascii
                 00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F
          ------ ----------------------------------------------- -----
0000000000000000 00 55 00 62 00 75 00 6E 00 74 00 75 00 2D 00 32  U b u n t u - 2
0000000000000010 00 34 00 2E 00 30 00 34 00                       4 . 0 4
```

They look the same on the outside, but not on the inside. The following will do a brute force string replace to drop from UTF-16 to UTF-8

```powershell
$defaultDistro = ($defaultDistro -replace '[\x00-\x1F\x7F-\x9F]', '' -replace '\s+', ' ').Trim()
```
In theory, uses UTF8.GetString would do the conversion, with syntax like this:
```powershell
$rawBytes = [System.Text.Encoding]::Default.GetBytes($defaultDistro)
$defaultDistro = [System.Text.Encoding]::UTF8.GetString($rawBytes)
```
But the null bytes remained, using `-replace` worked for me.

### Getting the TAR Name
Now that we have the distro name all cleaned up, we need the name of the TAR file to be created. First we'll create a function to make the name of the TAR file.

```powershell
function Get-ArchiveFileName {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$DistroName
    )

    # Get current date, formatted as YYYY-MM, and combine with distribution name
    return (Get-Date).ToString("yyyy-MM") + "-" + $DistroName
}
```
Most of the code just validates that we passed in a non-empty value for `$DistroName` and the prepends the year and month. I'm not doing daily backups of the OS image, the data that changes is backed up.

Next, we'll add a function to get a full path for the TAR file.

```powershell
function Get-TarArchivePath {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$ArchiveName
    )
    
    # Get the temp folder path and combine with archive name and .tar extension
    return Join-Path -Path $env:TEMP -ChildPath "$ArchiveName.tar"
}
```
That will take the name, put in the user temp folder, and add the ".tar" extension.

### Generating the TAR file
Now we can add a function to export the distro to a TAR file

```powershell
function Export-WSLDistribution {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$DistributionName,
        
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$ArchiveName
    )
    
    try {
        # Get the full tar path using the existing function
        $tarPath = Get-TarArchivePath -ArchiveName $ArchiveName
        
        Write-Host "Exporting WSL distribution '$DistributionName' to '$tarPath'..."
        
        # Execute wsl --export command
        $result = wsl --export $DistributionName $tarPath 2>&1
        
        if ($LASTEXITCODE -ne 0) {
            throw "WSL export for '$DistributionName' to '$tarPath' failed with exit code $LASTEXITCODE. Error: $result"
        }
        
        if (Test-Path $tarPath) {
            Write-Host "Export completed successfully: $tarPath"
            return $tarPath
        } else {
            throw "Export appeared to succeed but tar file was not created at: $tarPath"
        }
    }
    catch {
        Write-Error "Failed to export WSL distribution '$DistributionName': $($_.Exception.Message)"
        throw
    }
}
```
That code will call `Get-TarArchivePath` to get the full name of the TAR file and then call `wsl --export`. If successful, it will return the name of the TAR file.

### Compressing the TAR Name
The next step is to compress that TAR file. We don't need a big uncompressed file, when a smaller one will do.  We have a function to do that as well.

```powershell
function Compress-WSLBackup {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$TarPath
    )
    
    try {
        # Get the zip path by changing the extension of the tar path to .7z
        $zipPath = [System.IO.Path]::ChangeExtension($TarPath, ".7z")
        
        # Need to use Start-Process to call 7z.exe, and wait for it to finish before checking if the file was created
        start-Process -FilePath "C:\Program Files\7-Zip\7z.exe" -ArgumentList "a", "-t7z", $zipPath, $TarPath -Wait -NoNewWindow
        
        if (Test-Path $zipPath) {
            Write-Host "Compression completed successfully: $zipPath"
            return $zipPath
        } else {
            throw "Compression appeared to succeed but 7-Zip file was not created at: $zipPath"
        }
    }
    catch {
        Write-Error "Failed to compress WSL backup: $($_.Exception.Message)"
        throw
    }
}
```
### Copying the compressed file
If the compression works, the function will return the name of the compressed file. And we'll use that file name to copy the file with the `Copy-Item` command

```powershell
$zipPath = Compress-WSLBackup -TarPath $tarPath

Copy-Item -Path $zipPath -Destination $Destination
```

### Cleanup
The last thing to add is some cleanup code to remove the files out of the temp folder.

```powershell
function Remove-OldWSLBackups {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$DistributionName
    )
    
    try {
        # Get first 2 digits of current year
        $yearPrefix = (Get-Date).Year.ToString().Substring(0, 2)
        
        # Build search patterns for both .tar and .7z files
        $tarPattern = "$yearPrefix*$DistributionName*.tar"
        $zipPattern = "$yearPrefix*$DistributionName*.7z"
        
        Write-Host "Searching for old backups matching patterns: $tarPattern, $zipPattern"
        
        # Get matching files in temp directory for both extensions
        $tarBackups = Get-ChildItem -Path $env:TEMP -Filter $tarPattern -File -ErrorAction SilentlyContinue
        $zipBackups = Get-ChildItem -Path $env:TEMP -Filter $zipPattern -File -ErrorAction SilentlyContinue
        
        # Combine both results
        $oldBackups = @($tarBackups) + @($zipBackups)
        
        if ($oldBackups.Count -eq 0) {
            Write-Host "No old backup files found to delete."
            return
        }
        
        Write-Host "Found $($oldBackups.Count) old backup file(s) to delete:"
        
        foreach ($file in $oldBackups) {
            Write-Host "  Deleting: $($file.FullName)"
            Remove-Item -Path $file.FullName -Force -ErrorAction Stop
            Write-Host "  Successfully deleted: $($file.Name)"
        }
        
        Write-Host "Cleanup completed successfully."
    }
    catch {
        Write-Error "Failed to remove old WSL backups: $($_.Exception.Message)"
        throw
    }
}
```

And we call it with
```powershell
Remove-OldWSLBackups -DistributionName $defaultDistro
```

You can the entire PowerShell script from [here](https://gist.github.com/anotherlab/0bfae255f41f87a83e31ec077bf3f606). It has detailed comments to explain how to use it. It was tested on Windows 11, with PowerShell 7.5.4.  It does require 7-Zip, you can get that from [7-zip.org](https://www.7-zip.org/download.html). At the time this was written, there is a malware site masqurading as the official 7-Zip site.  Only use 7-zip.org. [More info](https://www.malwarebytes.com/blog/threat-intel/2026/02/fake-7-zip-downloads-are-turning-home-pcs-into-proxy-nodes) about that malware.


## Bonus Round: So why 7-ZIP?

### Some background
When you export a WSL image, you get a TAR file. TAR stands for **T**ape **AR**chive and is only of the oldest file archive formats. It's how UNIX systems backed up data to tape. Ubuntu is a Linux distribution. While Linux is not Unix, it is a "Unix-like" operating system and implemented many of the Unix tools from teh dark times.

TAR does not compress the data. Tape was cheaper than memory, it was faster just stream the data to tape without compressing it. And it's a standard format.

What TAR does do is backup Linux file permissions, symlinks, and metadata. You wont get that with Zip, RAR, or 7-Zip. To get the compression, you want to compress the data after the TAR file has been generated.

### Compressing files in PowerShell

I played around with the usual suspects for compression. PowerShell has a [Compress-Archive](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.archive/compress-archive) command that will generate a zip.  For compressing a TAR file, that would look like this

```powershell
$src = "'$ENV:TEMP'\something.tar"
$dest = "'$ENV:TEMP'\something.zip"
Compress-Archive -Path $src -DestinationPath $dest
```

Another way to create ZIP files in PowerShell is making a .NET Framework call.  It's usually a little faster than `Compress-Archive`.

```powershell
Add-Type -Assembly "System.IO.Compression.FileSystem"
[System.IO.Compression.ZipFile]::CreateFromDirectory($src, $dest, 'Fastest', $false)
```

They worked, but there are better alternatives. My file archive tool of choice is [7-Zip](https://www.7-zip.org/). It gives you multiple compression options for the zip file format.  I used the best level of the faster compression settings, `-mx4`.  The better compression settings took so long, I canceled them.

The `-mx4` setting was fast enough and produced smaller. zip files than `Compress-Archive` and `System.IO.Compression.ZipFile`. Not by a large amount, maybe 5% smaller for my stuff.

```powershell
Set-Alias sz "C:\Program Files\7-Zip\7z.exe"
sz a -mx=4 $dest $src
```

I then tried [WinRAR](https://www.win-rar.com/) for both Zip and RAR formats. WinRAR is a great tool, but it's not free.  If you own WinRAR and want to use it

```powershell
set-alias sr "C:\Program Files\WinRAR\Rar.exe"
$dest = "'$ENV:TEMP'\something.rar"
sr a $dest $src
```

Since I'm using 7-ZIP, I decided to use it's best format, the 7Zip format. At this point, as of 22H2 even Windows 11 can natively read 7Zip (in addition to Zip, RAR, TAR, and GZ) files.

```powershell
Set-Alias sz "C:\Program Files\7-Zip\7z.exe"
$dest = "'$ENV:TEMP'\something.7z"
sz a -t7z $dest $src
```
### Comparing the compression options

The 7zip format had much better compression and speed than the Zip and RAR formats. My WSL image is named Ubuntu-24.04 and I ran this on February 17th. This table shows the files, sizes, and compression compared to the TAR file.  I didn't need to set the `-mx` option.

| Name                       | Size (GB) | Percent from Largest |
|----------------------------|----------:|-------------------:|
| 2026-02-Ubuntu-24.04.tar   |      6.23 |           100.00%  |
| 2026-02-Ubuntu-24.04.zip   |      2.15 |            34.57%  |
| 2026-02-Ubuntu-24.04.rar   |      2.07 |            33.20%  |
| 2026-02-Ubuntu-24.04.7z    |      1.51 |            24.21%  |

ZIP and RAR went down to a third of the TAR size and were pretty close. The 7Z file was less a quarter of the original.

The PowerShell to generate that table was pretty simple:

```powershell
# Get the matching files
$files = Get-ChildItem $env:TEMP -File -Filter "2026-*"

# Get the size of the largest file
$maxLength = ($files | Sort-Object Length -Descending | Select-Object -First 1).Length

# Display as a table
$files |
  Sort-Object Length -Descending |
  Select-Object Name,
    @{Name="SizeGB";Expression={[math]::Round($_.Length / 1GB, 2)}},
    @{Name="PercentOfLargest";Expression={
      if ($maxLength -gt 0) {
        "{0:N2}%" -f (($_.Length / $maxLength) * 100)
      }
  }} |
  Format-Table -AutoSize
```

That made the choice of the 7Z format a non-brainer.  Even with today's large drives, saving 4.5 GB is a lot.