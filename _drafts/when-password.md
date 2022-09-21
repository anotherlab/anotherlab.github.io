---
title:  Checking for AD password expiration from PowerShell
categories: 
  - Pluralsight
  - VisualStudio
  - Xamarin
tags: 
  - Xamarin
  - Maui
---
If you work for a company that has a password expiration policy, you can get the password expiration date from Active Directory by using PowerShell.

https://learn.microsoft.com/en-us/powershell/module/activedirectory/?view=windowsserver2022-ps

If you are running Windows 10 or 11, you'll need to install the Active Directory Module. By default, it's not installed.  The quick way to check is to run the Get-Module command

Get-Module -name ActiveDirectory

If it's installed, you'll see something like this

Otherwise, you'll need to install the correct Remote Server Administration Tools (RSAT) package for your OS.

From an elevated Powershell, run one of the following

Windows 7, 8.1, and 10 (up to 1803)
Enable-WindowsOptionalFeature -Online -FeatureName RSATClient-Roles-AD-Powershell

Windows 10 (starting with 1809)
Add-WindowsCapability –online –Name “Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0”

Windows 11
Get-WindowsCapability -Name Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0 -Online | Add-WindowsCapability -Online

You should need to reboot after running the command.

For Windows, you'll need import the Active Directory module into the session that you want to use it in
import-module ActiveDirectory

For newer versions of Windows, the ActiveDirectory module will be automatically imported.

Now that we have AD installed, getting the password expiration date is the easy part

function when-password {
  Get-ADUser -Identity $([System.Environment]::UserName) -Properties msDS-UserPasswordExpiryTimeComputed | select Name, @{label="Password Expiration Date";expression={[DateTime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}} 
}

If we break this down:

Get-ADUser will return one or more AD users
https://learn.microsoft.com/en-us/powershell/module/activedirectory/get-aduser?view=windowsserver2022-ps

passing in "-Identity $([System.Environment]::UserName)" says to return all of the users that match the username of the current session.

-Properties msDS-UserPasswordExpiryTimeComputed Adds the msDS-UserPasswordExpiryTimeComputed property to the set of properties returned
https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-adts/f9e9b7e2-c7ac-4db6-ba38-71d9696981e9
The timestamp is stored as a MS-DOS format
https://learn.microsoft.com/en-us/windows/win32/sysinfo/ms-dos-date-and-time

| select Name, @{label="Password Expiration Date";expression={[DateTime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}}
We use the pipe | operator to return just the name and the expiration date.  We use an expression to convert the MS-DOS timestamp to a readable format.