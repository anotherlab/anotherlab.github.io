---
title: 'Why are there randomly named folders with mpavdlta.vdm files on my C: drive?'
date: 2010-08-23T03:55:00-05:00
---
I was looking for a folder on a PC at home (Vista, 32 bit) when I saw a bunch of folders with oddly formed filenames.  There were 13 of them, with names and dates like this:

<pre>05/15/2010  03:34 AM    

<DIR>
            2f934881647646785dbf842f86e91ec9<br />11/01/2009  03:24 AM    
  
  <DIR>
              3b9e7b6e4c58a68b7e71c5e3<br />11/03/2009  04:18 AM    
    
    <DIR>
                54693b59d80daf1421b7dda39a<br />10/31/2009  03:16 AM    
      
      <DIR>
                  56d6fe71d579ef79995fee64834082<br /></pre>
        
        
        <p>
          They all had files with the name “mpavdlta.vdm” and every time I tried to open the folder with Windows Explorer, i would get the following dialog:
        </p>
        
        
        <p>
          <a href="https://i1.wp.com/lh3.ggpht.com/_natoSxTaPFU/THHxJ-9OeYI/AAAAAAAAAd8/FSsTkSA1ndg/s1600-h/YouDontHaveAccess%5B2%5D.png"><img loading="lazy" alt="You don't currently have permission to access this folder" border="0" height="118" src="https://i2.wp.com/lh5.ggpht.com/_natoSxTaPFU/THHxKLQvsHI/AAAAAAAAAeA/MzgzYAF9Lho/YouDontHaveAccess_thumb.png?resize=244%2C118" title="You don't currently have permission to access this folder" width="244"   /></a> 
        </p>
        
        
        <p>
          I would press the “Continue” button and would have to answer “Continue” to the <a href="http://en.wikipedia.org/wiki/User_Account_Control" title="User Access Control dialog">UAC dialog</a> that would pop up on the screen.
        </p>
        
        
        <p>
          Ok, so what are these files, what are they doing here, and can I remove them?  
        </p>
        
        
        <p>
          After a bit of searching, <a href="http://social.answers.microsoft.com/Forums/en-US/mseupdate/thread/63d01661-fec4-4a0d-a5d4-8daa62ca6718" title="Microsoft Security Essentials - Protect Your PC Forums - Microsoft Security Essentials Forums - Microsoft Security Essentials: Updating Virus and Spyware Definitions - mpasdlta.vdm">I found that they are the AntiSpyware definition files</a> from the <a href="http://www.microsoft.com/security_essentials/">Microsoft Security Essentials</a> antivirus application.  That answered the first question.  More precisely, they are the delta files for the antivirus definitions.  There is also a mpvabase.vdm, which is the base signature file.  The mpavdlta has all of the changes since the last mpvabase was downloaded. Gilham Consulting has a nice <a href="http://www.gilham.org/Blog/Lists/Posts/Post.aspx?List=aab85845-88d2-4091-8088-a6bbce0a4304&#038;ID=457" title="nderstanding Forefront Client Security (FCS) Definition Files - Gilham Consulting">blog post</a> that describes the various AV definition files that come with MSE.
        </p>
        
        
        <p>
          As for how they got there, it appears to be a bug or design flaw with MSE.  The last randomly named folder from MSE was dated 5/26/2010, a good three months ago.  I fired up the the MSE console and it displayed that the virus definitions were current as of 8/21/2010.
        </p>
        
        
        <p>
          <a href="https://i2.wp.com/lh3.ggpht.com/_natoSxTaPFU/THHxKtGXSBI/AAAAAAAAAeE/RAL5Q3HJoBA/s1600-h/mse%5B2%5D.png"><img loading="lazy" alt="mse" border="0" height="172" src="https://i0.wp.com/lh5.ggpht.com/_natoSxTaPFU/THHxK1D8N0I/AAAAAAAAAeI/fAhCB_fEJbc/mse_thumb.png?resize=244%2C172" title="mse" width="244"   /></a> 
        </p>
        
        
        <p>
          My first guess was that situation was causing the vdm files and folders being created all over my C: drive has been addressed.  With Windows Explorer, I went in and was able to delete most, but not all of the folders.  It appears that MSE is still doing the random folder thing.  But I was able to clear out most of them. So it looks like this is bug in the current release.  From the various posts in the MSE forums, it appears that MS is aware of the problem, but nothing official has been posted about a resolution.
        </p>
        
        
        <p>
          I think it’s a bit odd that MSE is storing the AV definition files in this manner.  I’ve been pretty happy with how MSE is protecting my PC from virus attacks.  I wouldn’t call it perfect, but it’s more than good enough for my needs.  It’s a much lighter load on the system than the commercial AV solutions.  I can put up with a few randomly named folders for the protection that it provides, but I would be more comfortable of the files had been shoved in a folder under <a href="http://en.wikipedia.org/wiki/Environment_variable#User_management_variables" title="C:\ProgramData under Vista and Windows 7">%ALLUSERSPROFILE%</a> as a default location.  I’ll file this under <a href="http://southpark.wikia.com/wiki/Officer_Barbrady">“Nothing to see here, move along”</a>.
        </p>
