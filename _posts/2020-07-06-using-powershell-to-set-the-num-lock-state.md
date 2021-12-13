---
id: 3267
title: Using PowerShell to set the Num Lock state
date: 2020-07-06T08:36:18-05:00
author: Chris Miller
excerpt: 'A quick PowerShell script for setting the Num Lock state '
layout: post
guid: http://rajapet.com/?p=3267
permalink: /2020/07/06/using-powershell-to-set-the-num-lock-state/
image: http://rajapet.com/wp-content/uploads/2020/07/keyboard_mono.jpg
categories:
  - Annoyances
  - PowerShell
tags:
  - POSH
  - RDP
---
During these work from home times, on the [darkest timeline](https://tenor.com/EpSG.gif), I spent a lot of my day using my work PC over an RDP connection. For some reason, every time I connected, the Num Lock status would be set to off. Which is silly and annoying.&nbsp;

When you are connected to a remote machine and you press the Num Lock key on your keyboard, it toggles the Num Lock state for both the client and guest machine. Which can get confusing if you are working with apps on both machines and the Num Lock state is different between the machines. Ideally, you want the Num Lock state to be the same on both machines.

For me, the preference was a command-line <span style="font-size: inherit;">option for setting Num Lock. My shell of choice on Windows is </span><a style="font-size: inherit;" href="https://docs.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7">PowerShell</a><span style="font-size: inherit;">, so I decided to write a PowerShell script to set the Num Lock Status. The Num Lock key is a toggle switch, press once to turn on, press again to turn off. The script needed to be able to check the current state to be able to set a specified state correctly.</span>

With a little trial and error, I came up with the following script. I put it on gist to make it easier to grab and make your own:

<div style="tab-size: 8" id="gist104147912" class="gist">
  <div class="gist-file" translate="no">
    <div class="gist-data">
      <div class="js-gist-file-update-container js-task-list-container file-box">
        <div id="file-num-lock-ps1" class="file my-2">
          <div itemprop="text" class="Box-body p-0 blob-wrapper data type-powershell  ">
            <div class="js-check-bidi blob-code-content">
              <template class="js-file-alert-template"> 
              
              <div data-view-component="true" class="flash flash-warn flash-full d-flex flex-items-center">
                <svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-alert"> <path fill-rule="evenodd" d="M8.22 1.754a.25.25 0 00-.44 0L1.698 13.132a.25.25 0 00.22.368h12.164a.25.25 0 00.22-.368L8.22 1.754zm-1.763-.707c.659-1.234 2.427-1.234 3.086 0l6.082 11.378A1.75 1.75 0 0114.082 15H1.918a1.75 1.75 0 01-1.543-2.575L6.457 1.047zM9 11a1 1 0 11-2 0 1 1 0 012 0zm-.25-5.25a.75.75 0 00-1.5 0v2.5a.75.75 0 001.5 0v-2.5z"></path> </svg> <span> This file contains bidirectional Unicode text that may be interpreted or compiled differently than what appears below. To review, open the file in an editor that reveals hidden Unicode characters. <a href="https://github.co/hiddenchars" target="_blank">Learn more about bidirectional Unicode characters</a> </span> 
                
                <div data-view-component="true" class="flash-action">
                  <a href="{{ revealButtonHref }}" data-view-component="true" class="btn-sm btn"> Show hidden characters </a>
                </div>
              </div></template> <template class="js-line-alert-template"> 
              
              <span aria-label="This line has hidden Unicode characters" data-view-component="true" class="bidi-line-alert tooltipped tooltipped-e"> <svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-alert"> <path fill-rule="evenodd" d="M8.22 1.754a.25.25 0 00-.44 0L1.698 13.132a.25.25 0 00.22.368h12.164a.25.25 0 00.22-.368L8.22 1.754zm-1.763-.707c.659-1.234 2.427-1.234 3.086 0l6.082 11.378A1.75 1.75 0 0114.082 15H1.918a1.75 1.75 0 01-1.543-2.575L6.457 1.047zM9 11a1 1 0 11-2 0 1 1 0 012 0zm-.25-5.25a.75.75 0 00-1.5 0v2.5a.75.75 0 001.5 0v-2.5z"></path> </svg> </span></template> 
              
              <table class="highlight tab-size js-file-line-container js-code-nav-container js-tagsearch-file" data-tab-size="8" data-paste-markdown-skip data-tagsearch-lang="PowerShell" data-tagsearch-path="num-lock.ps1">
                <tr>
                  <td id="file-num-lock-ps1-L1" class="blob-num js-line-number js-code-nav-line-number" data-line-number="1">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC1" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-c"><span class="pl-c">#</span> One parameter, to set the Num Lock state to On or Off, with</span>
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L2" class="blob-num js-line-number js-code-nav-line-number" data-line-number="2">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC2" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-c"><span class="pl-c">#</span> On as the default</span>
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L3" class="blob-num js-line-number js-code-nav-line-number" data-line-number="3">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC3" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-k">Param</span>(
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L4" class="blob-num js-line-number js-code-nav-line-number" data-line-number="4">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC4" class="blob-code blob-code-inner js-file-line">
                    [<span class="pl-c1">Parameter</span>(<span class="pl-v">Mandatory</span><span class="pl-k">=</span><span class="pl-c1">$false</span>)]
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L5" class="blob-num js-line-number js-code-nav-line-number" data-line-number="5">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC5" class="blob-code blob-code-inner js-file-line">
                    [<span class="pl-c1">ValidateSet</span>(<span class="pl-s"><span class="pl-pds">"</span>On<span class="pl-pds">"</span></span><span class="pl-k">,</span> <span class="pl-s"><span class="pl-pds">"</span>Off<span class="pl-pds">"</span></span>)]
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L6" class="blob-num js-line-number js-code-nav-line-number" data-line-number="6">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC6" class="blob-code blob-code-inner js-file-line">
                    [<span class="pl-k">String</span>[]] <span class="pl-smi">$onoff</span><span class="pl-k">=</span><span class="pl-s"><span class="pl-pds">'</span>On<span class="pl-pds">'</span></span>
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L7" class="blob-num js-line-number js-code-nav-line-number" data-line-number="7">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC7" class="blob-code blob-code-inner js-file-line">
                    )
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L8" class="blob-num js-line-number js-code-nav-line-number" data-line-number="8">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC8" class="blob-code blob-code-inner js-file-line">
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L9" class="blob-num js-line-number js-code-nav-line-number" data-line-number="9">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC9" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-c"><span class="pl-c">#</span> Get the current state of the Num Lock key</span>
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L10" class="blob-num js-line-number js-code-nav-line-number" data-line-number="10">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC10" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-smi">$CurrentState</span> <span class="pl-k">=</span> [<span class="pl-k">console</span>]::NumberLock
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L11" class="blob-num js-line-number js-code-nav-line-number" data-line-number="11">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC11" class="blob-code blob-code-inner js-file-line">
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L12" class="blob-num js-line-number js-code-nav-line-number" data-line-number="12">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC12" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-c"><span class="pl-c">#</span> the RequestedState, based in the command line param. </span>
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L13" class="blob-num js-line-number js-code-nav-line-number" data-line-number="13">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC13" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-c"><span class="pl-c">#</span> On is true, Off is false</span>
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L14" class="blob-num js-line-number js-code-nav-line-number" data-line-number="14">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC14" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-k">if</span> (<span class="pl-smi">$onoff</span> <span class="pl-k">-eq</span> <span class="pl-s"><span class="pl-pds">'</span>On<span class="pl-pds">'</span></span>) {
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L15" class="blob-num js-line-number js-code-nav-line-number" data-line-number="15">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC15" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-smi">$RequestedState</span> <span class="pl-k">=</span> <span class="pl-c1">$true</span>
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L16" class="blob-num js-line-number js-code-nav-line-number" data-line-number="16">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC16" class="blob-code blob-code-inner js-file-line">
                    }
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L17" class="blob-num js-line-number js-code-nav-line-number" data-line-number="17">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC17" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-k">else</span> {
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L18" class="blob-num js-line-number js-code-nav-line-number" data-line-number="18">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC18" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-smi">$RequestedState</span> <span class="pl-k">=</span> <span class="pl-c1">$false</span>
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L19" class="blob-num js-line-number js-code-nav-line-number" data-line-number="19">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC19" class="blob-code blob-code-inner js-file-line">
                    }
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L20" class="blob-num js-line-number js-code-nav-line-number" data-line-number="20">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC20" class="blob-code blob-code-inner js-file-line">
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L21" class="blob-num js-line-number js-code-nav-line-number" data-line-number="21">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC21" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-c"><span class="pl-c">#</span> If the requested state is the current state, we declare</span>
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L22" class="blob-num js-line-number js-code-nav-line-number" data-line-number="22">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC22" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-c"><span class="pl-c">#</span> victory and go home</span>
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L23" class="blob-num js-line-number js-code-nav-line-number" data-line-number="23">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC23" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-k">if</span> (<span class="pl-smi">$RequestedState</span> <span class="pl-k">-eq</span> <span class="pl-smi">$CurrentState</span>) {
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L24" class="blob-num js-line-number js-code-nav-line-number" data-line-number="24">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC24" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-k">if</span> (<span class="pl-smi">$CurrentState</span> <span class="pl-k">-eq</span> <span class="pl-c1">$false</span>)
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L25" class="blob-num js-line-number js-code-nav-line-number" data-line-number="25">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC25" class="blob-code blob-code-inner js-file-line">
                    {
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L26" class="blob-num js-line-number js-code-nav-line-number" data-line-number="26">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC26" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-c1">Write-Host</span> <span class="pl-s"><span class="pl-pds">'</span>Num Lock is already off<span class="pl-pds">'</span></span>
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L27" class="blob-num js-line-number js-code-nav-line-number" data-line-number="27">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC27" class="blob-code blob-code-inner js-file-line">
                    }
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L28" class="blob-num js-line-number js-code-nav-line-number" data-line-number="28">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC28" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-k">else</span> {
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L29" class="blob-num js-line-number js-code-nav-line-number" data-line-number="29">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC29" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-c1">Write-Host</span> <span class="pl-s"><span class="pl-pds">'</span>Num Lock is already on<span class="pl-pds">'</span></span>
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L30" class="blob-num js-line-number js-code-nav-line-number" data-line-number="30">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC30" class="blob-code blob-code-inner js-file-line">
                    }
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L31" class="blob-num js-line-number js-code-nav-line-number" data-line-number="31">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC31" class="blob-code blob-code-inner js-file-line">
                    }
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L32" class="blob-num js-line-number js-code-nav-line-number" data-line-number="32">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC32" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-k">else</span> {
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L33" class="blob-num js-line-number js-code-nav-line-number" data-line-number="33">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC33" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-k">if</span> (<span class="pl-smi">$CurrentState</span> <span class="pl-k">-eq</span> <span class="pl-c1">$false</span>)
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L34" class="blob-num js-line-number js-code-nav-line-number" data-line-number="34">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC34" class="blob-code blob-code-inner js-file-line">
                    {
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L35" class="blob-num js-line-number js-code-nav-line-number" data-line-number="35">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC35" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-c1">Write-Host</span> <span class="pl-s"><span class="pl-pds">'</span>Num Lock is off, turning on<span class="pl-pds">'</span></span>
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L36" class="blob-num js-line-number js-code-nav-line-number" data-line-number="36">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC36" class="blob-code blob-code-inner js-file-line">
                    }
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L37" class="blob-num js-line-number js-code-nav-line-number" data-line-number="37">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC37" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-k">else</span> {
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L38" class="blob-num js-line-number js-code-nav-line-number" data-line-number="38">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC38" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-c1">Write-Host</span> <span class="pl-s"><span class="pl-pds">'</span>Num lock is on, turning off<span class="pl-pds">'</span></span>
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L39" class="blob-num js-line-number js-code-nav-line-number" data-line-number="39">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC39" class="blob-code blob-code-inner js-file-line">
                    }
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L40" class="blob-num js-line-number js-code-nav-line-number" data-line-number="40">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC40" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-c"><span class="pl-c">#</span> If the requested state is not the current state, then</span>
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L41" class="blob-num js-line-number js-code-nav-line-number" data-line-number="41">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC41" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-c"><span class="pl-c">#</span> we need to do a Num Lock press</span>
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L42" class="blob-num js-line-number js-code-nav-line-number" data-line-number="42">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC42" class="blob-code blob-code-inner js-file-line">
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L43" class="blob-num js-line-number js-code-nav-line-number" data-line-number="43">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC43" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-c"><span class="pl-c">#</span> Create a new instance of the WScript object and send</span>
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L44" class="blob-num js-line-number js-code-nav-line-number" data-line-number="44">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC44" class="blob-code blob-code-inner js-file-line">
                    <span class="pl-c"><span class="pl-c">#</span> the NumLock key press to it</span>
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L45" class="blob-num js-line-number js-code-nav-line-number" data-line-number="45">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC45" class="blob-code blob-code-inner js-file-line">
                    (<span class="pl-c1">New-Object</span> <span class="pl-k">&#8211;</span>ComObject WScript.Shell).SendKeys(<span class="pl-s"><span class="pl-pds">'</span>{NUMLOCK}<span class="pl-pds">'</span></span>)
                  </td>
                </tr>
                
                <tr>
                  <td id="file-num-lock-ps1-L46" class="blob-num js-line-number js-code-nav-line-number" data-line-number="46">
                  </td>
                  
                  <td id="file-num-lock-ps1-LC46" class="blob-code blob-code-inner js-file-line">
                    }
                  </td>
                </tr>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="gist-meta">
      <a href="https://gist.github.com/anotherlab/863fc3f60379c29b2ebb8478859754c8/raw/fb74599d40cf2cf639a753db4f7fba9b38709cb5/num-lock.ps1" style="float:right">view raw</a> <a href="https://gist.github.com/anotherlab/863fc3f60379c29b2ebb8478859754c8#file-num-lock-ps1"> num-lock.ps1 </a> hosted with &#10084; by <a href="https://github.com">GitHub</a>
    </div>
  </div>
</div>

&nbsp;

I put the comments inline, it should be pretty self-explanatory with the comments. While PowerShell is supported on macOS and Linux now, this is a Windows only script. The [console] ::NumberLock expression returns the following error message:

`OperationStopped: Operation is not supported on this platform.`

Which is odd, [console] is a shortcut for [[system.console](https://docs.microsoft.com/en-us/dotnet/api/system.console?view=netcore-3.1)], a class that is accessible on the macOS Powershell. If you run the following command in a PowerShell on either Windows or macOS, you&#8217;ll get a list of static properties that should be readable from a POSH script.

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: powershell; title: ; notranslate" title="">
&#91;system.console] | Get-Member -Static -MemberType property | Format-Table 
</pre>
</div>

And the NumberLock property is listed, but just not implemented. And that&#8217;s not even the real sticking point. This script creates an instance of a WScript object and uses it&#8217;s SendKeys method to pass in a Num Lock key press.&nbsp;WScript is the [Windows Script Host](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/wscript), a technology that lets scripting languages make Windows API calls.&nbsp;A minor sticking point, I only need this Windows. You can get a list of the special keys that SendKeys can send from [here](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.sendkeys.send?view=netcore-3.1).

That&#8217;s the heavy lifting.&nbsp;Because I am lazy, I don&#8217;t want to type in the name of the script.&nbsp;So I created an alias for it.

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: powershell; title: ; notranslate" title="">
Set-Alias nl d:\scripts\num-lock.ps1
</pre>
</div>

Now I can just run &#8220;nl&#8221; or &#8220;nl On&#8221; or &#8220;nl Off&#8221; to change the Num Lock state. I added the alias to the profile so it&#8217;s always available. Now when I connect to my work PC, I run &#8220;nl&#8221; and all is well.