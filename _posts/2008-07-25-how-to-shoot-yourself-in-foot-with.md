---
title: How to shoot yourself in the foot with regular expressions
date: 2008-07-25T13:50:00-05:00
---
I had some Delphi code that is used a user entered text string as a key. After the user entered in the text, my code would force it to uppercase and strip out any characters outside of A-Z and 0-9. This was for a very specialized task and the following Delphi code did the job.

<pre>function GetStrippedValue(const value: string): string;<br />var<br />i: integer;<br />begin<br />result := '';<br /><br />// strip punctuation out of the name and force to uppercase<br />for i := 1 to length(value) do<br />  if value[i] in ['A'..'Z', 'a'..'z', '0'..'9'] then<br />    result := result + Uppercase(value[i]);<br />end;</pre>



Nothing elegant, and performance wasn’t an issue as it was rarely used. I wrote that code in the spring of 2000 and it hasn’t been touched much since then. I now have a C# application that needs to work with the same data, so I to perform the same functionality using C#. Since C# does not have the set operators that Delphi has, I had to strip out the characters in a different way. I figured that I could use a simple regular expression and match the characters that way. I should have remembered that old quote attributed to [Jamie Zawinski](http://www.jwz.org/):



>Some people, when confronted with a problem, think “I know, I&#8217;ll use regular expressions.”</p> 
> 
> Now they have two problems.</a></blockquote> 
> 
> I had decided to make the expression as simple as possible. I used the following function to accomplish what I had done years earlier in Delphi:
> 
> <pre>private string GetStrippedValue(string value)<br />{<br />  string pattern = @"[^\w]";<br /><br />  string result = Regex.Replace(value.Trim().ToUpper(), pattern, "");<br /><br />  return result;<br />}</pre>
> 
> What I am doing here is to replace any text that matches the Regex expression with an empty string. The “^” caret character negates the expression, in other words replace anything that doesn’t match the “\w” token with an empty string. I had found the “\w” documented to match any non-word character, but I didn’t look too closely to the definition. I was using the <a href="http://www.regular-expressions.info/reference.html" target="_blank">syntax</a> defined at <a href="http://www.regular-expressions.info/" target="_blank">www.regular-expressions.info</a>, where it is documented which matches letters ,digits and whitespace. That turned out to be different from the <a href="http://msdn.microsoft.com/en-us/library/1400241x.aspx" target="_blank">definition</a> used by .NET and <a href="http://docs.python.org/lib/re-syntax.html" target="_blank">Python</a>.
> 
> With .NET, that pattern allows alphanumeric characters, PLUS the ”_” underscore character. A slight, but fatal flaw on my part. I didn’t catch it when I wrote because my sample data didn’t have any underscores in them. I found it today while adapting that code for a new task, where the data can have underscores.
> 
> Einstein put it best, [“Everything should be made as simple as possible, but not simpler.”](http://en.wikiquote.org/wiki/Albert_Einstein). My attempt to write the least amount of code was flawed. What I should have done was to use the following syntax:
> 
> <pre>private string GetStrippedValue(string value)<br />{<br />  string pattern = @"(?i)[^A-Z0-9]";<br /><br />  string result = Regex.Replace(value.Trim().ToUpper(), pattern, "");<br /><br />  return result;<br />}</pre>
> 
> This way, I am explicitly defining the allowable characters and now I’m getting the results that I wanted. Since I am passing in a string that is being forced to uppercase, I don’t need to test for lowercase letters (“a-z”). An alternative version that produces the same results would be:
> 
> <pre>private string GetStrippedValue(string value)<br />{<br />  string pattern = @"[^A-Z0-9]";<br /><br />  string result = Regex.Replace(value.Trim().ToUpper(), pattern, "",System.Text.RegularExpressions.RegexOptions.IgnoreCase);<br /><br />  return result;<br />}</pre>
> 
> I’m not sure if one way is better than the other. The “(?i)” is equivalent to the System.Text.RegularExpressions.RegexOptions.IgnoreCase <a title="MSDN: RegexOptions Enumeration" href="http://msdn.microsoft.com/en-us/library/system.text.regularexpressions.regexoptions.aspx" target="_blank">RegexOption</a>. For this project the performance of the code is not an issue, it only gets called a few times.
> 
> The moral of this story is if you need to use regular expressions, check the syntax for the implementation that you are using.
