---
id: 122
title: How to log the TIDSmtp component
date: 2008-08-07T20:23:00-05:00
layout: post
guid: http://www.rajapet.com/?p=122
permalink: /2008/08/07/how-to-log-tidsmtp-component/
---
I have some Delphi code that needs to send a quick mail message so I was using the <a href="http://www.indyproject.org/index.en.aspx" target="_blank">Indy</a> 10 <a href="http://www.indyproject.org/docsite/html/frames.html?frmname=topic&#038;frmfile=TIdSMTP.html" target="_blank">TIdSmtp</a> component.  The code was working just fine for a few months, but this week it would fail with an EIdSMTPReplyError exception.  The message property of the exception was a empty string, not terribly useful.  After a bit of googling, I found references to using one of the Indy TIdLogXXXX components.  Sure enough, there is a <a href="http://www.indyproject.org/docsite/html/TIdLogFile.html" target="_blank">TIdLogFile</a> component that will log messages to a file.  That sounded like what I needed, but the help file did not make it clear on how to hook up a TIdLogFile to a TIdSmtp component.

I did some searching and found a <a href="http://ruminatedrumblings.blogspot.com/2008/04/smtp-mail-and-indy-again.html" target="_blank">blog post</a> by Marshall Fryman on his <a href="http://ruminatedrumblings.blogspot.com/" target="_blank">Ruminated Rumblings</a> blog that a great example of how to hook up one of the Indy logging components.  What I needed to do was to create an instance of the TIdSmtp’s <a href="http://www.indyproject.org/docsite/html/TIdIOHandler.html" target="_blank">IOHandler</a> property and assign the TIdLogFile to the <a href="http://www.indyproject.org/docsite/html/TIdIOHandler_Intercept.html" target="_blank">IOHandler.Intercept</a> property.  He also recommended assigning the IOHandler.OnStatus event to TIdLogFile.OnStatus event </p> 

The way my code ended up was something like this:

      try  
        try  
          IdLogFile.Active := true;  
          fsmtp.IOHandler := TIdIOHandler.MakeDefaultIOHandler(fsmtp);  
          fsmtp.IOHandler.Intercept := IdLogFile;  
          fsmtp.IOHandler.OnStatus  := fsmtp.OnStatus;  
          fSMTP.Connect;  
          fSMTP.Send(fMessage);  
        except  
          on e: exception do begin  
            MessageDlg(&#8216;Error sending message: &#8216; + e.Message, mtError, [mbOK], 0);  
          end;  
        end;  
      finally  
        if fSMTP.Connected then  
          fSMTP.Disconnect(true);  
        IdLogFile.Active := false;  
      end;