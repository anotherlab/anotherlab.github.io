---
title:  How to force Visual Studio to update the debug device for a MAUI project
author: anotherlab
classes: wide
toc: true
header:
  image: /assets/images/PressTheButton.jpg
categories: 
  - VisualStudio
  - MAUI
  - Android
  - PowerShell
tags:
  - hacks, XML
---
When I'm writing code for .NET MAUI in Visual Studio, I often use actual devices. I'm working on a app that uses BLE and you really can't test that with an emulator. And I usually test with a wired ADB connection. If you in the middle of working in VS and you unplug your Android device, VS will change the current debugging target from your device to the last used emulator. When you plug your device back in, it does not switch back to your device.

I'll walk awa from my desk and I'll take my phone with me. When I come back, I'll plug the phone, but forget to change the device in Visual Studio back to my phone. I'll make a code change and then start debugging the app. Cue up a [Picard facepalm](https://screenrant.com/star-trek-tng-picard-riker-facepalm-popular-meme-why/) as Visual Studio starts up an Android emulator.

I wanted to short circuit this behavior.

The JetBrains IDEs like Android Studio and Rider will switch back to your device when you plug it back in. This is how it should be. I don't know if this is a design decision by the VS team or just an ommision. I have [reported this to the VS team](https://developercommunity.visualstudio.com/t/Feature-Request:-Remember-Last-Selected/10933798), but that went nowhere.

Visual Studio doesn't provide a keyboard shortcut to quickly select the Android device for debugging. And I didn't want to write a VS extension to go deep under the hood. Maybe someday, just not now. That would have been a little too much [yak shaving](https://www.youtube.com/shorts/eDVsjUxaD6g) for this week.

The setting of the current delected debug device is written to the csproj user file. This file has the same name as the project, but with ".user" tacked on the end.

When my Samsung phone is attached and has been selected as the debug device, the project.csproj.user will look something like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="Current" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <PropertyGroup>
    <IsFirstTimeProjectOpen>False</IsFirstTimeProjectOpen>
    <ActiveDebugFramework>net10.0-android</ActiveDebugFramework>
    <ActiveDebugProfile>Samsung SM-S908U (Android 16.0 - API 36)</ActiveDebugProfile>
    <SelectedPlatformGroup>PhysicalDevice</SelectedPlatformGroup>
    <DefaultDevice>pixel_9_-_api_36</DefaultDevice>
  </PropertyGroup>
  <PropertyGroup Condition="'$(TargetPlatformIdentifier)'=='iOS'">
    <RuntimeIdentifier>iossimulator-x64</RuntimeIdentifier>
    <PlatformTarget>x64</PlatformTarget>
  </PropertyGroup>
  <ItemGroup />
</Project>
```

For the rest of this article, I'm only going to show the property group with the settings that we want work with. And Visual Studio 2026 is open for this project.

```xml
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="Current" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <PropertyGroup>
    <ActiveDebugProfile>Samsung SM-S908U (Android 16.0 - API 36)</ActiveDebugProfile>
    <SelectedPlatformGroup>PhysicalDevice</SelectedPlatformGroup>
  </PropertyGroup>
</Project>
```

When I unplug my phone, after a second or two, the values in the csproj.user change to this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="Current" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <PropertyGroup>
    <ActiveDebugProfile>Pixel 9 - API 36 (Android 16.0 - API 36)</ActiveDebugProfile>
    <SelectedPlatformGroup>Emulator</SelectedPlatformGroup>
  </PropertyGroup>
</Project>
```
The "Pixel 9 - AP^ 36" is the name of the emulator image that I have been using lately.

The value of the `ActiveDebugProfile` element is the device that we want to change. The `SelectedPlatformGroup element` tells us if this real or virtual device.

# Updates are live
I found that if I edited the csproj.user outside of Visual Studio, those changes would be recognized by Visual Studio witbin a second or two.

Cool, I can work with that.

# Hack the .user file
There are any number of ways of making changes to an XML file.  I like PowerShell for this kind of stuff.  I wrote a little script named [update-phone.ps1](https://gist.github.com/anotherlab/57de44266e0b16f1987dd82d4bb5bcc5) and it looks like this 

{% gist 57de44266e0b16f1987dd82d4bb5bcc5 %}

# Break down the script
The first few lines are just the usual parameter stuff, nothing to explain here.

Looking at the next block...  
```powershell
# Locate the .csproj.user file if not specified
if (-not $CsprojUserFile) {
    $foundFile = Get-ChildItem -Path . -Filter *.csproj.user | Select-Object -First 1
    if (-not $foundFile) {
        Write-Error "❌ No .csproj.user file found in the current directory."
        exit 1
    }
    $CsprojUserFile = $foundFile.FullName
}
```
If you don't specify a .csproj.user file, the script will check the current folder and pick the first .csproj.user that it finds.

Next, we resolve the full path to the file that was passed in or located.
```powershell
# Resolve to an absolute, full path
$fullPath = (Resolve-Path -Path $csprojUserFile).Path

# Load XML
$xmlContent = Get-Content -Path $fullPath -Raw
[xml]$xml = $xmlContent
```
PowerShell has a lovely little quirk where if you try to write to a file without a path or using a relative path, it will write to the "home" folder. By getting the full path to the file, you force it to write back to the correct folder.

Then we read the file and cast it to a XML data type.

Going back the original file, the XML is using a namespace and we need to account for it.
```xml
<Project ToolsVersion="Current" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
```
When you query XML with XPath, you need to factor in the namespace, so we'll define it next:

```powershell
# Detect the MSBuild namespace if present
$nsUri = $xml.Project.NamespaceURI
$hasNamespace = -not [string]::IsNullOrWhiteSpace($nsUri)

if ($hasNamespace) {
    $nsMgr = New-Object System.Xml.XmlNamespaceManager($xml.NameTable)
    $nsMgr.AddNamespace("msb", $nsUri)
}
```
This reads in the URL of the namespace, "http://schemas.microsoft.com/developer/msbuild/2003", and names it as "msb".

With the namespace defined, we can search for the  `ActiveDebugProfile` element with a nicely formatted XPath query string that incorporates the namespace.
```powershell
# Find the ActiveDebugProfile element
$node = $xml.SelectSingleNode("//msb:Project/msb:PropertyGroup/msb:ActiveDebugProfile", $nsMgr)
```

If we find that element, we can update it and write it back out.

```powershell
if ($node) {
    # Set the device name
    $node.InnerText = $NewProfileValue

    # Then force it to physical device. If VS is open, it should do this anyways, but just in case.
    $node2 = 
      $xml.SelectSingleNode("//msb:Project/msb:PropertyGroup/msb:SelectedPlatformGroup", $nsMgr)
    if ($node2) {
        $node2.InnerText = "PhysicalDevice"
    }

    # Save back to file with UTF-8 encoding
    $utf8 = New-Object System.Text.UTF8Encoding($false)
    $writer = New-Object System.IO.StreamWriter($fullPath, $false, $utf8)
    $xml.Save($writer)
    $writer.Close()    

    Write-Host "ActiveDebugProfile updated to '$NewProfileValue'" in $csprojUserFile
}
else {
    Write-Host "ActiveDebugProfile element not found in the XML."
}
```
After updating ActiveDebugProfile, we then update `SelectedPlatformGroup`. While testing, updating `SelectedPlatformGroup` wasn't needed. Visual Studio will update it on it's own. So that code could probably be removed.

Then we write it back to the original file. Forcing the UTF-8 encoding was a bit of overkill.  `$xml.Save($fullPatj)` probably would have been sufficient.

# Running the scripts
To run the script you pass in the name of the device and the name of the .csproj file.

If you have a PowerShell session open in the project folder, the following syntax will work:

```powershell
d:\scripts\use-phone.ps1 'Samsung SM-S908U'
```
Or use the full path:
```powershell
d:\scripts\use-phone.ps1 'Samsung SM-S908U' E:\path-to-my-project\MyProject.csproj.user
```
Replace `d:\scripts\` with the path to your copy of the script.


I have a [Stream Deck](https://www.elgato.com/us/en/s/explore-stream-deck) and I have a button mapped to run the script with the device and path. That allows me to just tap that button when I plug the phone in. If you want to easily run PowerShell scripts from a Stream Deck, take a look at the [ScriptDeck plugin](https://marketplace.elgato.com/product/scriptdeck-927e59aa-b42d-4da7-84cc-8c78f4dd7e18). I love the Stream Deck. It's a giant macro pad that is application specific.

I wrote these scripts for PowerShell 7.5, but it should work for most versions.