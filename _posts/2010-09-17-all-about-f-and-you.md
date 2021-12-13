---
id: 49
title: 'All about “F# and You”'
date: 2010-09-17T14:18:00-05:00
layout: post
guid: http://www.rajapet.com/?p=49
permalink: /2010/09/17/all-about-f-and-you/
---
Last night at our monthly Tech Valley .NET User Group ([TVUG](http://tvug.net/)) meeting, we had [Rick Minerich](http://richardminerich.com/) come in and do a presentation on [F#](http://research.microsoft.com/en-us/um/cambridge/projects/fsharp/).  It was a [very good presentation](http://tvug.net/blogs/tvug_news_and_events/archive/2010/09/10/september-meeting-f.aspx).  Rick was enthusiastic and knows F# cold.  One of the cool things that he showed in his presentation were examples in both F# and [C#](http://msdn.microsoft.com/en-us/vcsharp/default.aspx).  It looked like you could replace every 5-10 lines of C# code with F# code.

F# isn’t for everyone, but if you are doing serious number crunching and want to process data in parallel, then you seriously want to look at using F#.  It’s a full fledged member of Visual Studio 2010, it’s not just something bolted on to the architecture.

With F#, asynchronous programming is much simpler.  This useful for performing operations that require asynchronous I/O.  A common example would be collecting data from multiple, non-related web pages.  With F#’s asynchronous workflows, you define a set of operations to be performed in parallel.  The [following example from MSDN](http://msdn.microsoft.com/en-us/library/dd233250.aspx) shows one way that you can implement this.

<pre>open System.Net<br />open Microsoft.FSharp.Control.WebExtensions<br /><br />let urlList = [ "Microsoft.com", "http://www.microsoft.com/"<br />                "MSDN", "http://msdn.microsoft.com/"<br />                "Bing", "http://www.bing.com"<br />              ]<br /><br />let fetchAsync(name, url:string) =<br />    async { <br />        try<br />            let uri = new System.Uri(url)<br />            let webClient = new WebClient()<br />            let! html = webClient.AsyncDownloadString(uri)<br />            printfn "Read %d characters for %s" html.Length name<br />        with<br />            | ex -> printfn "%s" (ex.Message);<br />    }<br /><br />let runAll() =<br />    urlList<br />    |> Seq.map fetchAsync<br />    |> Async.Parallel <br />    |> Async.RunSynchronously<br />    |> ignore<br /><br />runAll()<br /></pre>



This code will process each URL in urlList in parallel, and will wait until each sequence has been processed before continuing.  The wait state management and thread housekeeping are handled by F#, the programmer doesn’t have to worry about that at all.



If you want to know more about F#, Rick is a great source.  In addition to his web site, you can find him on Twitter as [@Rickasaurus](http://twitter.com/rickasaurus).