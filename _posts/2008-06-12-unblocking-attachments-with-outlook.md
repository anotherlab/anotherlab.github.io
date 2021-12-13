---
id: 156
title: Unblocking attachments with Outlook
date: 2008-06-12T19:14:00-05:00
layout: post
guid: http://www.rajapet.com/?p=156
permalink: /2008/06/12/unblocking-attachments-with-outlook/
---
Today, one of the other programmers needed to send me some odd registry entries that were on his machine.  So I asked him to export the registry settings to a .reg file from regedit and then and email me the .reg file.  Outlook blocked the file attachment because the .reg file extension is on the Outlook equivalent of the “No Fly” list.  Outlook has two levels of attachment security, Level 1 and Level 2.  Level 2 attachments will prompt you to save the file to your hard disk.  Level 1 attachments are blocked at the client by Outlook and can not be accessed.  The list of file types classified as Level 1 are listed [here](http://office.microsoft.com/en-us/outlook/HP030850041033.aspx "Attachment file types blocked by Outlook - Outlook - Microsoft Office Online").  It has the usual suspects and this include .reg files.

That’s annoying.  I wanted that .reg file.  Fortunately, you can white-list specific file types in the Level 1 list and allow access to them.  I found the following instructions on the HowTo-Outlook web site at this [page](http://www.howto-outlook.com/faq/blockedattachments.htm).</p> </p> </p> </p> 

  1. Make sure Outlook is closed. 
  2. Open your registry editor by opening the Run command and type regedit (regedt32 for Windows 2000) 
  3. Locate the following key  
    Outlook 2000 [HKEY\_CURRENT\_USER\Software\Microsoft\Office\9.0\Outlook\Security]  
    Outlook 2002 [HKEY\_CURRENT\_USER\Software\Microsoft\Office\10.0\Outlook\Security]  
    Outlook 2003 [HKEY\_CURRENT\_USER\Software\Microsoft\Office\11.0\Outlook\Security]  
    Outlook 2007 [HKEY\_CURRENT\_USER\Software\Microsoft\Office\12.0\Outlook\Security] 
  4. Go to Edit-> New-> String Value and name the value **Level1Remove** (case sensitive!) 
  5. Double-click on the newly created value and enter the extension including the “dot” that you want to open in Outlook. For instance .exe  
    If you need to enter more than one extension you’ll have to type separate them by a semicolon like this; .exe;.bat;.url 
  6. Press OK on the input box and close the registry editor 
  7. When you open Outlook the attachments which hold those extensions aren’t blocked by Outlook anymore. 

In my case, I just used &#8220;.reg&#8221; as the file extension.  To go back to blocking the extensions, just remove or rename the **Level1Remove** string value from that registry key.</p> 

This isn&#8217;t that hard to do, but it&#8217;s a pain to have start and stop Outlook just to get the new settings to take affact.  I can understand why the restart is required, it prevents malicious code from changing the setting without you being aware of some going on with Outlook.