---
title: RE:How to determine if the current user is an administrator
date: 2005-11-23T15:10:00-05:00
---
This is pretty cool. A lot of the stuff that I write is low level admin type of utilities. As my coding meter moves further away from the Win32 Delphi to C#, I&#8217;ll need stuff like this more often.

> 
> 
> Following, is the method that I use to determine if a user is an Administrator. Note that in .NET 1.0/1.1 the using construct wrapped around the creation of the WindowsIdentity won&#8217;t compile as its implementation of IDisposable is new for .NET 2.0. Previously you had to rely on the finalizer of the object to run so that the handle of the user token could be freed. 
> 
> 
> 
> <div>
>   <span>        using</span> System;<br /><span>        using</span> System.Security.Principal;<br /><span>        using</span> System.Windows.Forms;</p> 
>   
>   <p>
>     <span>        public</span> <span>static</span> <span>bool</span> IsAdministrator<br />        {<br />            <span>get</span><br />            {<br />                <span>if</span> (SystemInformation.Secure)<br />                {<br />                    <span>using</span> (WindowsIdentity identity = WindowsIdentity.GetCurrent())<br />                    {<br />                        WindowsPrincipal wp = <span>new</span> WindowsPrincipal(identity);
>   </p>
>   
>   <p>
>                             <span>return</span> wp.IsInRole(WindowsBuiltInRole.Administrator);<br />                    }                    <br />                }
>   </p>
>   
>   <p>
>                     <span>return</span> <span>false</span>;<br />            }<br />        }</div> 
>     
>     <p>
>
>     </p>
>     
>     <p>
>       There is also a check to determine if the operating system is secure (ie Windows NT platform) &#8211; the documentation states that the IsInRole method returns no results on Windows 98 and Windows Millennium Edition. I&#8217;m not entirely sure how a method that returns a boolean value can return no results, so it is wrapped in the Secure check just in case an exception is thrown when using it on Windows 9x/ME.
>     </p>
>     
>     <p>
>       from <a title="How to determine if the current user is an administrator" href="http://davidkean.net/archive/2005/11/23/1214.aspx">[Managed from down under]</a>
>     </p></blockquote>
