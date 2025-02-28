---
title: Converting enums and Camel case text to words
date: 2014-02-26T14:39:01-05:00
---
I have [enums](http://msdn.microsoft.com/en-us/library/sbbt4032.aspx) that I want to display on a form and I wanted to make them look a little better on the screen.  The constants defined in the enumerator list are defined using [Camel case.](http://msdn.microsoft.com/en-us/library/x2dbyw72(v=vs.71).aspx "Capitalization Styles")  Like &#8220;firstName&#8221; or  &#8220;mobileNumber&#8221;.  Most of the values could be displayed by converting the Camel cased string to words.

Using some bits and pieces from [Stack Overflow](http://stackoverflow.com/), I wrote a string extension class to do the conversion.  The first thing it does is to convert the enum to a string, then force the first letter to uppcase case, then finally split the text into words, with each uppercase letter designating a new word.

<pre class="brush: csharp">public static class StringHelper
{
    public static string FirstCharToUpper(this string input)
    {
        if (String.IsNullOrEmpty(input))
            return input;

        return input.First().ToString().ToUpper() + String.Join("", input.Skip(1));
    }

    public static string CamelCaseToWords(this string input)
    {
        return Regex.Replace(input.FirstCharToUpper(), "([a-z](?=[A-Z])|[A-Z](?=[A-Z][a-z]))", "$1 ");
    }
}</pre>

I posted an example on [DotNetFiddle](http://dotnetfiddle.net ".NET sandbox for developers to quickly try out code and share code snippets."), which is basically the C#/VB.Net/F# equivalent of [JSFiddle](http://jsfiddle.net/), a great tool for quickly trying out some code.  The sharing feature is nice.  I can embed a runnable copy of code (as shown below) or I can work with another developer using their [TogetherJS](https://togetherjs.com/ "TogetherJS is a free, open source JavaScript library by Mozilla that adds collaboration features and tools to your website. By adding TogetherJS to your site, your users can help each other out on a website in real time!") integration.



The cool thing about the sample code above is that you can edit it in-place and try some other values.  Replace &#8220;thisIsCamelCase&#8221; with &#8220;MooseAndSquirrel&#8221; and you should see the results immediately.
