---
title: There was a problem sending the command to the program
date: 2010-09-20T17:26:00-05:00
---
I hate error messages like that. It’s both detailed and vague at the same. What command was being sent and what was the problem? Let me back up a few steps. A family member bought a new PC running Windows 7, for his home office. He works from home and accesses his work email account through Internet Explorer.  His email based on [Domino Web Access](http://www-947.ibm.com/support/entry/portal/Overview/Software/Lotus/Lotus_Domino_Web_Access), which I’m assuming is the web bit for Lotus Notes email.

When ever he was sent a document like an Excel file or Word file as an email attachment, he was unable to open the file.  He would double-click on the icon for the file, and Domino web page would spit out “There was a problem sending the command to the program”.  He has Office 2007 installed and we verified that it was working just fine.

If he tried to save the file from Domino, he would get prompted for a folder to store the file and he would try to save it is his documents folder. It went through the motions of saving the file.  No error messages, but the file wasn’t there. I repeat, there was no error message. I took a peek at the file system and found the file in an odd location. All the files that he had been trying to launch were in “c:\users\hisname\AppData\Local\Temp\Low\Domino Web Access\80\”. The “Low” part of the folder name tells us that Internet Explorer was redirected by Windows.

Starting with Vista, IE 7 runs with “low” privileges. The temporary files, cookies, and history folders are now in “low privilege” folders. Access to protected locations (root folder, documents, “my programs”, etc) is redirected by the operating system to the %LocalAppData%\Temp\Low folder. The folder virtualization that Vista/Win7 uses is pretty transparent the application. Unless the application checks for the file after it writes it (or knows about folder virtualization), it will not know that the file is in a different location. That explains why the files were not in the right location, but we still needed to figure out why they couldn’t be launched by the browser.

After a bit of searching, I figured out the problem. He just needed to add the webmail server site as a “Trusted Site” in the Internet Explorer security options. With Windows 7, he needed to do the following steps in Internet Explorer 8:

  1. From “Tools” menu, select “Internet Options”.
  2. On the “Security” tab, click “Trusted site” in the “Select a zone to view or change security settings.” panel.
  3. Click the “Sites” button.
  4. Under the “Add this website to the zone:”, enter the URL for the web mail site and click the “Add” button.
  5. If the URL starts with HTTP instead of HTTPS, make sure that the “Require server verification (https:) for all sites in this zone.” check box is cleared.
  6. Press the “Close” button.
  7. Press the “OK” button.

That will tell Internet Explorer that it’s safe to launch binary applications from the web mail application. It’s sounds annoying, but it’s just Microsoft trying to keep rogue web sites from running nasty programs.
