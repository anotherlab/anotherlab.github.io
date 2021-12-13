---
id: 2727
title: Debugging devices without displays or debuggers
date: 2017-05-19T15:56:42-05:00
author: Chris Miller
layout: post
guid: http://rajapet.com/?p=2727
permalink: /2017/05/19/debugging-devices-without-displays-or-debuggers/
collect_box_size:
  - collect-square
categories:
  - Coding
tags:
  - C
  - Debugging
  - Elatec
---
I&#8217;ve been writing firmware for an RFID reader that connects over USB to an Android device.  Our installers will need to upgrade the readers out in the field and they have no way of knowing which firmware has been installed.  The reader, an [Elatec TWN4](https://www.elatec-rfid.com/en/products/multi-technology-rfid-reader/housed/hf-lf-nfc-multi-technology/), has a pretty decent API that you write code for, using the C language.  Their API includes a wonderful function called &#8220;Beep&#8221;.  You pass in the volume, frequency, how to play the tone (in ms), and finally, how long to be quiet after the tone has been played.  So I have been setting the readers to play a few notes on power up.  This allows the installers to know which firmware has been installed.

The original firmware plays the opening notes to [&#8220;Smoke On The Water&#8221;](https://www.youtube.com/watch?v=ikGyZh0VbPQ).  Because anything that can produce at least 4 notes can play it.  The following C code will beep it&#8217;s way through some vintage Deep Purple

<div style="tab-size: 8" id="gist47849712" class="gist">
  <div class="gist-file" translate="no">
    <div class="gist-data">
      <div class="js-gist-file-update-container js-task-list-container file-box">
        <div id="file-smokeonthewater-c" class="file my-2">
          <div itemprop="text" class="Box-body p-0 blob-wrapper data type-c  ">
            <div class="js-check-bidi blob-code-content">
              <template class="js-file-alert-template"></p> 
              
              <div data-view-component="true" class="flash flash-warn flash-full d-flex flex-items-center">
                <svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-alert"> <path fill-rule="evenodd" d="M8.22 1.754a.25.25 0 00-.44 0L1.698 13.132a.25.25 0 00.22.368h12.164a.25.25 0 00.22-.368L8.22 1.754zm-1.763-.707c.659-1.234 2.427-1.234 3.086 0l6.082 11.378A1.75 1.75 0 0114.082 15H1.918a1.75 1.75 0 01-1.543-2.575L6.457 1.047zM9 11a1 1 0 11-2 0 1 1 0 012 0zm-.25-5.25a.75.75 0 00-1.5 0v2.5a.75.75 0 001.5 0v-2.5z"></path> </svg></p> 
                
                <p>
                  <span><br /> This file contains bidirectional Unicode text that may be interpreted or compiled differently than what appears below. To review, open the file in an editor that reveals hidden Unicode characters.<br /> <a href="https://github.co/hiddenchars" target="_blank">Learn more about bidirectional Unicode characters</a><br /> </span>
                </p>
                
                <div data-view-component="true" class="flash-action">
                  <a href="{{ revealButtonHref }}" data-view-component="true" class="btn-sm btn"></p> 
                  
                  <p>
                    Show hidden characters
                  </p>
                  
                  <p>
                    </a> </div> </div> 
                    
                    <p>
                      </template><br /> <template class="js-line-alert-template"><br /> <span aria-label="This line has hidden Unicode characters" data-view-component="true" class="bidi-line-alert tooltipped tooltipped-e"><br /> <svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-alert"> <path fill-rule="evenodd" d="M8.22 1.754a.25.25 0 00-.44 0L1.698 13.132a.25.25 0 00.22.368h12.164a.25.25 0 00.22-.368L8.22 1.754zm-1.763-.707c.659-1.234 2.427-1.234 3.086 0l6.082 11.378A1.75 1.75 0 0114.082 15H1.918a1.75 1.75 0 01-1.543-2.575L6.457 1.047zM9 11a1 1 0 11-2 0 1 1 0 012 0zm-.25-5.25a.75.75 0 00-1.5 0v2.5a.75.75 0 001.5 0v-2.5z"></path> </svg><br /> </span></template>
                    </p>
                    
                    <table class="highlight tab-size js-file-line-container js-code-nav-container js-tagsearch-file" data-tab-size="8" data-paste-markdown-skip data-tagsearch-lang="C" data-tagsearch-path="SmokeOnTheWater.c">
                      <tr>
                        <td id="file-smokeonthewater-c-L1" class="blob-num js-line-number js-code-nav-line-number" data-line-number="1">
                        </td>
                        
                        <td id="file-smokeonthewater-c-LC1" class="blob-code blob-code-inner js-file-line">
                          <span class="pl-k">void</span> <span class="pl-en">Smoke</span>()
                        </td>
                      </tr>
                      
                      <tr>
                        <td id="file-smokeonthewater-c-L2" class="blob-num js-line-number js-code-nav-line-number" data-line-number="2">
                        </td>
                        
                        <td id="file-smokeonthewater-c-LC2" class="blob-code blob-code-inner js-file-line">
                          {
                        </td>
                      </tr>
                      
                      <tr>
                        <td id="file-smokeonthewater-c-L3" class="blob-num js-line-number js-code-nav-line-number" data-line-number="3">
                        </td>
                        
                        <td id="file-smokeonthewater-c-LC3" class="blob-code blob-code-inner js-file-line">
                          <span class="pl-k">int</span> v = <span class="pl-c1">50</span>;
                        </td>
                      </tr>
                      
                      <tr>
                        <td id="file-smokeonthewater-c-L4" class="blob-num js-line-number js-code-nav-line-number" data-line-number="4">
                        </td>
                        
                        <td id="file-smokeonthewater-c-LC4" class="blob-code blob-code-inner js-file-line">
                        </td>
                      </tr>
                      
                      <tr>
                        <td id="file-smokeonthewater-c-L5" class="blob-num js-line-number js-code-nav-line-number" data-line-number="5">
                        </td>
                        
                        <td id="file-smokeonthewater-c-LC5" class="blob-code blob-code-inner js-file-line">
                          <span class="pl-k">int</span> duration = <span class="pl-c1">500</span>;
                        </td>
                      </tr>
                      
                      <tr>
                        <td id="file-smokeonthewater-c-L6" class="blob-num js-line-number js-code-nav-line-number" data-line-number="6">
                        </td>
                        
                        <td id="file-smokeonthewater-c-LC6" class="blob-code blob-code-inner js-file-line">
                        </td>
                      </tr>
                      
                      <tr>
                        <td id="file-smokeonthewater-c-L7" class="blob-num js-line-number js-code-nav-line-number" data-line-number="7">
                        </td>
                        
                        <td id="file-smokeonthewater-c-LC7" class="blob-code blob-code-inner js-file-line">
                          <span class="pl-c1">Beep</span>(v, <span class="pl-c1">2940</span>, duration, <span class="pl-c1">10</span>);
                        </td>
                      </tr>
                      
                      <tr>
                        <td id="file-smokeonthewater-c-L8" class="blob-num js-line-number js-code-nav-line-number" data-line-number="8">
                        </td>
                        
                        <td id="file-smokeonthewater-c-LC8" class="blob-code blob-code-inner js-file-line">
                          <span class="pl-c1">Beep</span>(v, <span class="pl-c1">3490</span>, duration, <span class="pl-c1">10</span>);
                        </td>
                      </tr>
                      
                      <tr>
                        <td id="file-smokeonthewater-c-L9" class="blob-num js-line-number js-code-nav-line-number" data-line-number="9">
                        </td>
                        
                        <td id="file-smokeonthewater-c-LC9" class="blob-code blob-code-inner js-file-line">
                          <span class="pl-c1">Beep</span>(v, <span class="pl-c1">3920</span>, duration * <span class="pl-c1">1.5</span>, <span class="pl-c1">150</span>);
                        </td>
                      </tr>
                      
                      <tr>
                        <td id="file-smokeonthewater-c-L10" class="blob-num js-line-number js-code-nav-line-number" data-line-number="10">
                        </td>
                        
                        <td id="file-smokeonthewater-c-LC10" class="blob-code blob-code-inner js-file-line">
                          <span class="pl-c1">Beep</span>(v, <span class="pl-c1">2940</span>, duration, <span class="pl-c1">10</span>);
                        </td>
                      </tr>
                      
                      <tr>
                        <td id="file-smokeonthewater-c-L11" class="blob-num js-line-number js-code-nav-line-number" data-line-number="11">
                        </td>
                        
                        <td id="file-smokeonthewater-c-LC11" class="blob-code blob-code-inner js-file-line">
                          <span class="pl-c1">Beep</span>(v, <span class="pl-c1">3490</span>, duration, <span class="pl-c1">10</span>);
                        </td>
                      </tr>
                      
                      <tr>
                        <td id="file-smokeonthewater-c-L12" class="blob-num js-line-number js-code-nav-line-number" data-line-number="12">
                        </td>
                        
                        <td id="file-smokeonthewater-c-LC12" class="blob-code blob-code-inner js-file-line">
                          <span class="pl-c1">Beep</span>(v, <span class="pl-c1">4150</span>, duration * <span class="pl-c1">0.5</span>, <span class="pl-c1">10</span>);
                        </td>
                      </tr>
                      
                      <tr>
                        <td id="file-smokeonthewater-c-L13" class="blob-num js-line-number js-code-nav-line-number" data-line-number="13">
                        </td>
                        
                        <td id="file-smokeonthewater-c-LC13" class="blob-code blob-code-inner js-file-line">
                          <span class="pl-c1">Beep</span>(v, <span class="pl-c1">3920</span>, duration * <span class="pl-c1">2</span>, <span class="pl-c1">150</span>);
                        </td>
                      </tr>
                      
                      <tr>
                        <td id="file-smokeonthewater-c-L14" class="blob-num js-line-number js-code-nav-line-number" data-line-number="14">
                        </td>
                        
                        <td id="file-smokeonthewater-c-LC14" class="blob-code blob-code-inner js-file-line">
                          <span class="pl-c1">Beep</span>(v, <span class="pl-c1">2940</span>, duration, <span class="pl-c1">10</span>);
                        </td>
                      </tr>
                      
                      <tr>
                        <td id="file-smokeonthewater-c-L15" class="blob-num js-line-number js-code-nav-line-number" data-line-number="15">
                        </td>
                        
                        <td id="file-smokeonthewater-c-LC15" class="blob-code blob-code-inner js-file-line">
                          <span class="pl-c1">Beep</span>(v, <span class="pl-c1">3490</span>, duration, <span class="pl-c1">10</span>);
                        </td>
                      </tr>
                      
                      <tr>
                        <td id="file-smokeonthewater-c-L16" class="blob-num js-line-number js-code-nav-line-number" data-line-number="16">
                        </td>
                        
                        <td id="file-smokeonthewater-c-LC16" class="blob-code blob-code-inner js-file-line">
                          <span class="pl-c1">Beep</span>(v, <span class="pl-c1">3920</span>, duration * <span class="pl-c1">1.5</span>, <span class="pl-c1">150</span>);
                        </td>
                      </tr>
                      
                      <tr>
                        <td id="file-smokeonthewater-c-L17" class="blob-num js-line-number js-code-nav-line-number" data-line-number="17">
                        </td>
                        
                        <td id="file-smokeonthewater-c-LC17" class="blob-code blob-code-inner js-file-line">
                          <span class="pl-c1">Beep</span>(v, <span class="pl-c1">3490</span>, duration, <span class="pl-c1">10</span>);
                        </td>
                      </tr>
                      
                      <tr>
                        <td id="file-smokeonthewater-c-L18" class="blob-num js-line-number js-code-nav-line-number" data-line-number="18">
                        </td>
                        
                        <td id="file-smokeonthewater-c-LC18" class="blob-code blob-code-inner js-file-line">
                          <span class="pl-c1">Beep</span>(v, <span class="pl-c1">2940</span>, duration * <span class="pl-c1">2.5</span>, <span class="pl-c1">10</span>);
                        </td>
                      </tr>
                      
                      <tr>
                        <td id="file-smokeonthewater-c-L19" class="blob-num js-line-number js-code-nav-line-number" data-line-number="19">
                        </td>
                        
                        <td id="file-smokeonthewater-c-LC19" class="blob-code blob-code-inner js-file-line">
                          }
                        </td>
                      </tr>
                    </table></div></div>
                  </p></div> </div></div> 
                  
                  <div class="gist-meta">
                    <a href="https://gist.github.com/anotherlab/43e59d75423bba23673c834ce1d1f9d1/raw/6baa2d0dd5be304cdeb2885d08a8ef5fbbb93008/SmokeOnTheWater.c" style="float:right">view raw</a><br /> <a href="https://gist.github.com/anotherlab/43e59d75423bba23673c834ce1d1f9d1#file-smokeonthewater-c"><br /> SmokeOnTheWater.c<br /> </a><br /> hosted with &#10084; by <a href="https://github.com">GitHub</a>
                  </div></p></div> </div> 
                  
                  <p>
                    We added some code to the firmware to allow our app to put the reader is a sleep mode.  Our installers will need to upgrade a few devices out in the field, so it was time to change that tune.  By checking a few different sites, we found simplified chord progressions for some recognizable songs.  My choices were restricted to simple note changes, you can&#8217;t generated complicated chords from a device that only knows how to beep.  It does that beep very well, but at the end of the day it&#8217;s only a beep.
                  </p>
                  
                  <p>
                    I needed to play something else to let the installers know that the firmware had been updated.  Something short, something simple, something simple.  One of my musically inclined co-workers worked out the opening notes of <a href="https://www.youtube.com/watch?v=9jK-NcRmVcw">&#8220;The Final Countdown&#8221;</a> by Europe.  That song has a distinctive opening riff.  <a href="https://www.youtube.com/watch?v=wITDyljrWuA">And</a> <a href="https://www.youtube.com/watch?v=vawrp_gMXJs">many</a> <a href="https://www.youtube.com/watch?v=S5AsyuNia5Y">cover</a> <a href="https://www.youtube.com/watch?v=6GRHANmafp0">versions</a>.  <a href="https://www.youtube.com/watch?v=FjeMDvCdrtc">Some</a> <a href="https://www.youtube.com/watch?v=3U36zas52wk">might</a> <a href="https://www.youtube.com/watch?v=W80X2KzRBFE">say</a> <a href="https://www.youtube.com/watch?v=bJJcrRstHBE">too</a> <a href="https://www.youtube.com/watch?v=fdlB_-2pBTo">many</a>,
                  </p>
                  
                  <p>
                    I found a <a href="https://www.audiology.org/sites/default/files/ChasinConversionChart.pdf">note to frequency conversion table</a> and used that to create a set of constants for the notes I needed.  That allowed me to specify the beeps with readable note constants, instead of the frequency values. You can get those constants <a href="https://gist.github.com/anotherlab/180855ddcb4c71a11d7ad4c0c243942b">here</a>.  With the use of those constants, you can play the opening notes of &#8220;The Final Countdown&#8221; with the following code:
                  </p>
                  
                  <div style="tab-size: 8" id="gist47847775" class="gist">
                    <div class="gist-file" translate="no">
                      <div class="gist-data">
                        <div class="js-gist-file-update-container js-task-list-container file-box">
                          <div id="file-finalcountdown-c" class="file my-2">
                            <div itemprop="text" class="Box-body p-0 blob-wrapper data type-c  ">
                              <div class="js-check-bidi blob-code-content">
                                <template class="js-file-alert-template"></p> 
                                
                                <div data-view-component="true" class="flash flash-warn flash-full d-flex flex-items-center">
                                  <svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-alert"> <path fill-rule="evenodd" d="M8.22 1.754a.25.25 0 00-.44 0L1.698 13.132a.25.25 0 00.22.368h12.164a.25.25 0 00.22-.368L8.22 1.754zm-1.763-.707c.659-1.234 2.427-1.234 3.086 0l6.082 11.378A1.75 1.75 0 0114.082 15H1.918a1.75 1.75 0 01-1.543-2.575L6.457 1.047zM9 11a1 1 0 11-2 0 1 1 0 012 0zm-.25-5.25a.75.75 0 00-1.5 0v2.5a.75.75 0 001.5 0v-2.5z"></path> </svg></p> 
                                  
                                  <p>
                                    <span><br /> This file contains bidirectional Unicode text that may be interpreted or compiled differently than what appears below. To review, open the file in an editor that reveals hidden Unicode characters.<br /> <a href="https://github.co/hiddenchars" target="_blank">Learn more about bidirectional Unicode characters</a><br /> </span>
                                  </p>
                                  
                                  <div data-view-component="true" class="flash-action">
                                    <a href="{{ revealButtonHref }}" data-view-component="true" class="btn-sm btn"></p> 
                                    
                                    <p>
                                      Show hidden characters
                                    </p>
                                    
                                    <p>
                                      </a> </div> </div> 
                                      
                                      <p>
                                        </template><br /> <template class="js-line-alert-template"><br /> <span aria-label="This line has hidden Unicode characters" data-view-component="true" class="bidi-line-alert tooltipped tooltipped-e"><br /> <svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-alert"> <path fill-rule="evenodd" d="M8.22 1.754a.25.25 0 00-.44 0L1.698 13.132a.25.25 0 00.22.368h12.164a.25.25 0 00.22-.368L8.22 1.754zm-1.763-.707c.659-1.234 2.427-1.234 3.086 0l6.082 11.378A1.75 1.75 0 0114.082 15H1.918a1.75 1.75 0 01-1.543-2.575L6.457 1.047zM9 11a1 1 0 11-2 0 1 1 0 012 0zm-.25-5.25a.75.75 0 00-1.5 0v2.5a.75.75 0 001.5 0v-2.5z"></path> </svg><br /> </span></template>
                                      </p>
                                      
                                      <table class="highlight tab-size js-file-line-container js-code-nav-container js-tagsearch-file" data-tab-size="8" data-paste-markdown-skip data-tagsearch-lang="C" data-tagsearch-path="FinalCountDown.c">
                                        <tr>
                                          <td id="file-finalcountdown-c-L1" class="blob-num js-line-number js-code-nav-line-number" data-line-number="1">
                                          </td>
                                          
                                          <td id="file-finalcountdown-c-LC1" class="blob-code blob-code-inner js-file-line">
                                            <span class="pl-k">void</span> <span class="pl-en">FinalCountDown</span>(<span class="pl-k">void</span>)
                                          </td>
                                        </tr>
                                        
                                        <tr>
                                          <td id="file-finalcountdown-c-L2" class="blob-num js-line-number js-code-nav-line-number" data-line-number="2">
                                          </td>
                                          
                                          <td id="file-finalcountdown-c-LC2" class="blob-code blob-code-inner js-file-line">
                                            {
                                          </td>
                                        </tr>
                                        
                                        <tr>
                                          <td id="file-finalcountdown-c-L3" class="blob-num js-line-number js-code-nav-line-number" data-line-number="3">
                                          </td>
                                          
                                          <td id="file-finalcountdown-c-LC3" class="blob-code blob-code-inner js-file-line">
                                            <span class="pl-k">int</span> v = <span class="pl-c1">100</span>;
                                          </td>
                                        </tr>
                                        
                                        <tr>
                                          <td id="file-finalcountdown-c-L4" class="blob-num js-line-number js-code-nav-line-number" data-line-number="4">
                                          </td>
                                          
                                          <td id="file-finalcountdown-c-LC4" class="blob-code blob-code-inner js-file-line">
                                            <span class="pl-k">int</span> duration = <span class="pl-c1">125</span>;
                                          </td>
                                        </tr>
                                        
                                        <tr>
                                          <td id="file-finalcountdown-c-L5" class="blob-num js-line-number js-code-nav-line-number" data-line-number="5">
                                          </td>
                                          
                                          <td id="file-finalcountdown-c-LC5" class="blob-code blob-code-inner js-file-line">
                                          </td>
                                        </tr>
                                        
                                        <tr>
                                          <td id="file-finalcountdown-c-L6" class="blob-num js-line-number js-code-nav-line-number" data-line-number="6">
                                          </td>
                                          
                                          <td id="file-finalcountdown-c-LC6" class="blob-code blob-code-inner js-file-line">
                                            <span class="pl-c1">Beep</span>(v, CS5, duration, <span class="pl-c1">10</span>);
                                          </td>
                                        </tr>
                                        
                                        <tr>
                                          <td id="file-finalcountdown-c-L7" class="blob-num js-line-number js-code-nav-line-number" data-line-number="7">
                                          </td>
                                          
                                          <td id="file-finalcountdown-c-LC7" class="blob-code blob-code-inner js-file-line">
                                            <span class="pl-c1">Beep</span>(v, B4, duration, <span class="pl-c1">10</span>);
                                          </td>
                                        </tr>
                                        
                                        <tr>
                                          <td id="file-finalcountdown-c-L8" class="blob-num js-line-number js-code-nav-line-number" data-line-number="8">
                                          </td>
                                          
                                          <td id="file-finalcountdown-c-LC8" class="blob-code blob-code-inner js-file-line">
                                            <span class="pl-c1">Beep</span>(v, CS5, duration*<span class="pl-c1">4</span>, <span class="pl-c1">10</span>);
                                          </td>
                                        </tr>
                                        
                                        <tr>
                                          <td id="file-finalcountdown-c-L9" class="blob-num js-line-number js-code-nav-line-number" data-line-number="9">
                                          </td>
                                          
                                          <td id="file-finalcountdown-c-LC9" class="blob-code blob-code-inner js-file-line">
                                            <span class="pl-c1">Beep</span>(v, FS3, duration*<span class="pl-c1">5</span>, duration*<span class="pl-c1">5</span>);
                                          </td>
                                        </tr>
                                        
                                        <tr>
                                          <td id="file-finalcountdown-c-L10" class="blob-num js-line-number js-code-nav-line-number" data-line-number="10">
                                          </td>
                                          
                                          <td id="file-finalcountdown-c-LC10" class="blob-code blob-code-inner js-file-line">
                                            <span class="pl-c1">Beep</span>(v, D5, duration, <span class="pl-c1">10</span>);
                                          </td>
                                        </tr>
                                        
                                        <tr>
                                          <td id="file-finalcountdown-c-L11" class="blob-num js-line-number js-code-nav-line-number" data-line-number="11">
                                          </td>
                                          
                                          <td id="file-finalcountdown-c-LC11" class="blob-code blob-code-inner js-file-line">
                                            <span class="pl-c1">Beep</span>(v, CS5, duration, <span class="pl-c1">10</span>);
                                          </td>
                                        </tr>
                                        
                                        <tr>
                                          <td id="file-finalcountdown-c-L12" class="blob-num js-line-number js-code-nav-line-number" data-line-number="12">
                                          </td>
                                          
                                          <td id="file-finalcountdown-c-LC12" class="blob-code blob-code-inner js-file-line">
                                            <span class="pl-c1">Beep</span>(v, D5, duration*<span class="pl-c1">2</span>, <span class="pl-c1">10</span>);
                                          </td>
                                        </tr>
                                        
                                        <tr>
                                          <td id="file-finalcountdown-c-L13" class="blob-num js-line-number js-code-nav-line-number" data-line-number="13">
                                          </td>
                                          
                                          <td id="file-finalcountdown-c-LC13" class="blob-code blob-code-inner js-file-line">
                                            <span class="pl-c1">Beep</span>(v, CS5, duration*<span class="pl-c1">2</span>, <span class="pl-c1">10</span>);
                                          </td>
                                        </tr>
                                        
                                        <tr>
                                          <td id="file-finalcountdown-c-L14" class="blob-num js-line-number js-code-nav-line-number" data-line-number="14">
                                          </td>
                                          
                                          <td id="file-finalcountdown-c-LC14" class="blob-code blob-code-inner js-file-line">
                                            <span class="pl-c1">Beep</span>(v, B4, duration*<span class="pl-c1">3</span>, <span class="pl-c1">10</span>);
                                          </td>
                                        </tr>
                                        
                                        <tr>
                                          <td id="file-finalcountdown-c-L15" class="blob-num js-line-number js-code-nav-line-number" data-line-number="15">
                                          </td>
                                          
                                          <td id="file-finalcountdown-c-LC15" class="blob-code blob-code-inner js-file-line">
                                            }
                                          </td>
                                        </tr>
                                      </table></div></div>
                                    </p></div> </div></div> 
                                    
                                    <div class="gist-meta">
                                      <a href="https://gist.github.com/anotherlab/c3e2ebe72020a6df44902434e614687a/raw/6356de0648e0c3a20c518da6ace8588b4e045166/FinalCountDown.c" style="float:right">view raw</a><br /> <a href="https://gist.github.com/anotherlab/c3e2ebe72020a6df44902434e614687a#file-finalcountdown-c"><br /> FinalCountDown.c<br /> </a><br /> hosted with &#10084; by <a href="https://github.com">GitHub</a>
                                    </div></p></div> </div> 
                                    
                                    <p>
                                      When using the constants, the code is much easier to read.  And it becomes much easier to create new song intros. With that in place, the installers can quickly check the firmware version by powering up the RFID reader.  At some point I&#8217;ll refactor the code to just read the values from an array.  The current design is easy to setup and read, I may just stay with what works.
                                    </p>
                                    
                                    <p>
                                      Right now, I need to use Elatec&#8217;s development tools to push the firrmware out via a simple GUI.  If I could get a command line tool for pushing the firmware out, I could add code to the firmware to return the version number from a query sent over USB.  That would allow me to write a simple app or Powershell script to identify a connected reader, query the version, and then push the update out.  If anyone from Elatec ever reads this, a command line firmware updater would be very helpful.
                                    </p>
                                    
                                    <p>
                                      Decades of using development tools like Visual Studio has accustomed me to being able to use a debugger to step through the code.  Writing code where you can&#8217;t visually debug it, requires thinking out side the box.  I can test much of the code by having the reader send back text, but when testing with the device that it will be hooked up to, that would interfere with how they work.  Sometimes you just have to use a different path out of the machine to see what it&#8217;s doing.
                                    </p>
                                    
                                    <p>
                                      &nbsp;
                                    </p>