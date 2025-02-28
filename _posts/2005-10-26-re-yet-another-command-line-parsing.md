---
title: 'RE: Yet another command line parsing system'
date: 2005-10-26T15:31:00-05:00
---
This looks like a logical way to handle command line parameters while still following convention of using an app.config file.

> &#8230;.I used another arguments parser from Code Project, &#8220;[C#/.NET Command Line Arguments Parser](http://www.codeproject.com/csharp/command_line.asp)&#8220;.  
> I like it because it works like the ASP.NET querystring parser &#8211; it handles the parsing (quoted strings, different delimiter styles) and exposes a string dictionary with the results.
> 
> I use a GetSettings accessor that reads the default from the app.config file, but allows overrides via command line. I like this approach because settings are their standard location (app.config), and any config setting can be overriden via command line without an attribute change and a recompile.
> 
> 
> 
> <div>
>   <span>[STAThread]<br /></span><span>private static int </span><span>Main(</span><span>string</span><span>[] args)<br />{<br />    Processor processor1 = </span><span>new </span><span>Processor(args);<br />    </span><span>return </span><span>processor1.Process();<br />}<br /></span>
> </div>
> 
> 
> 
> <div>
>   <span>private </span><span>Arguments arguments;</p> 
>   
>   <p>
>     </span><span>public </span><span>Processor(</span><span>string</span><span>[] args)<br />{<br />    </span><span>this</span><span>.arguments = </span><span>new </span><span>Arguments(args);<br />}</p> 
>     
>     <p>
>       </span><span>public </span><span>Process()<br />{<br />    Console.WriteLine(</span><span>this</span><span>.GetSetting(&#8220;PreventEvil&#8221;));<br />}</p> 
>       
>       <p>
>         </span><span>private string </span><span>GetSetting(</span><span>string </span><span>key)<br />{<br />    </span><span>string </span><span>setting = </span><span>string</span><span>.Empty;<br />    </span><span>if </span><span>(</span><span>this</span><span>.arguments[key] != </span><span>null</span><span>)<br />    {<br />        setting = </span><span>this</span><span>.arguments[key];<br />    }<br />    </span><span>else<br />    </span><span>{<br />        setting = ConfigurationSettings.AppSettings.Get(key);<br />    }<br />    </span><span>if </span><span>(setting == </span><span>null</span><span>)<br />    {<br />        </span><span>return string</span><span>.Empty;<br />    }<br />    </span><span>return </span><span>setting;<br />}<br /></span></div> 
>         
>         <p>
>
>         </p></blockquote> 
>         
>         <p>
>           <i>[via <a title="Yet another command line parsing system" href="http://weblogs.asp.net/jgalloway/archive/2005/10/24/428269.aspx">[JonGalloway.ToString()]</a>]</i>
>         </p>
