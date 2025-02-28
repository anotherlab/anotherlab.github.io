param (
    [Parameter(Mandatory = $true)][string]$localPath
    )

# Imported tags that we need to filter out
$bad = @("id", "guid", "permalink", "layout", "collect_box_size")

# Get all of the matching file names
$MatchingFileNames = (Get-ChildItem $localPath -File) | sort-Object Name

$UpdatedFileCount = 0

$fileCounter = 0
$totalFiles = $MatchingFileNames.Count

foreach($MatchingFileName in $MatchingFileNames)
{
    $fileCounter++
    $percentComplete = [math]::Floor(($fileCounter / $totalFiles) * 100)
    Write-Progress -Activity "Processing files" -PercentComplete $percentComplete

    # read the data in
    $file_data = Get-Content $MatchingFileName

    # Simple check to make sure we start with a front matter file
    $IsFrontMatter = $file_data[0] -like "---"

    if ($IsFrontMatter -eq $True)
    {
        # read the file
        $new_data = New-Object System.Collections.Generic.List[System.Object]

        # get the line count
        $lineCount = $file_data.Length

        # Write-Host ('Reading ' + $MatchingFileName.FullName )

        $CurentLine = 0
        $FMCount = 0
        $writefile = $False

        # while not at the end of the file
        while ($CurentLine -lt $lineCount)
        {
            # curent line
            $ThisLine = $file_data[$CurentLine]

            # while still in the Front Matter blokc
            if ($CurentLine -gt 0 -and $FMCount -eq 0)
            {
                # Are we still in Front Matter?
                if ($file_data[$CurentLine] -like "---")
                {
                    $FMCount++
                }

                # Still in Front Matter?
                if ($FMCount -eq 0)
                {
                    # Read each line and look for invalid tokens
                    $allow = $true
                    foreach($token in $bad)
                    {
                        if ($ThisLine -match ("^" + $token))
                        {
                            $allow = $False
                            $writefile = $True

                            # then skip over any settings after each token that are for that token
                            while ($file_data[$CurentLine+1] -match ("^  - "))
                            {
                                $CurentLine++
                            }
                        }
                    }

                    # Only include the allowed Front Matter tokens
                    if ($allow -eq $True)
                    {
                        $new_data.Add($ThisLine)
                    }
                }
                # otherwise just include the line
                else {
                    $new_data.Add($ThisLine)
                }
            }
            # No longer on front matter, add the line
            else
            {
                $new_data.Add($ThisLine)
            }
            $CurentLine++

        }

        if ($writefile -eq $true)
        {
            $UpdatedFileCount++
            # $srtFilename = [io.path]::ChangeExtension($MatchingFileName.FullName, '.md1')
            # Write-Host ('Updating ' + $MatchingFileName )
            # Out-File -FilePath $srtFilename -InputObject $file_data
            Out-File -FilePath $MatchingFileName -InputObject $new_data
        }

    }

}

write-host $UpdatedFileCount " files updated out of " $MatchingFileNames.Count
