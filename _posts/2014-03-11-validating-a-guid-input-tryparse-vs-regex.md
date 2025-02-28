---
title: Validating a GUID input, TryParse vs RegEx
date: 2014-03-11T00:03:12-05:00
---
Once again I&#8217;m validating some text inputs, this time I need [to verify that a user has entered a GUID](#fortherecord20141103) in a valid format.  While I can&#8217;t verify that the user has entered the correct [GUID](http://en.wikipedia.org/wiki/Globally_unique_identifier), I can check to make sure that I have the right characters in the string.

The choice is between a method in the .Net Framework for parsing GUID values or using a regular expression. The commonly accepted formats for a GUI are the following

<ul style="list-style-type: disc;">
  <li>
    {0C885DD3-7DD9-484B-9B20-3E6552BCA144}
  </li>
  <li>
    0C885DD3-7DD9-484B-9B20-3E6552BCA144
  </li>
  <li>
    0C885DD37DD9484B9B203E6552BCA144
  </li>
</ul>

You usually see it written as 32 hexadecimal characters, separated by hypens into 5 groups.  There are some other variations, but this is what you see for text representations of GUIDs.

Going via the .Net Framework, we can use the [Guid.TryParse()](http://msdn.microsoft.com/en-us/library/system.guid.tryparse(v=vs.110).aspx) method. This method takes two parameters, the string to parse and an out parameter that gets the parsed GUID.  TryParse() returns true if it can parse the string, false if the string input is not a valid GUID format.  It happily takes GUIDs in all three formats list above.

The regular expression that I found for GUID validation is, as with almost all regular expressions, a hideous mess of seemingly random characters.  A well crafted regular expression should look like line noise from a [300 baud modem](http://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Analogue_modem_-_acoustic_coupler.jpg/800px-Analogue_modem_-_acoustic_coupler.jpg).  This regular expression would validate a GUID:

<pre>^[{]?[0-9a-fA-F]{8}[-]?([0-9a-fA-F]{4}[-]?){3}[0-9a-fA-F]{12}[}]?$</pre>

That&#8217;s not very friendly when you first see it. Lets break it down:

<pre>^$</pre>

The ^ and $ characters match the start and the end of string, everything else takes place with the string to match. We are basically saying, use the entire string input to validate against.

<pre>[{]?</pre>

This says match the &#8220;{&#8221; character and the question mark states that it is optional

<pre>[0-9a-fA-F]{8}[-]?</pre>

This says match 8 characters using all of the digits and the letters from A to F. It&#8217;s case insensitive and there is an optional &#8220;-&#8220;.

<pre>([0-9a-fA-F]{4}[-]?){3}</pre>

This says match 4 characters with an optional hyphen, 3 times in a row.

<pre>[0-9a-fA-F]{12}</pre>

This matches the final block of 12 characters (with optional hyphen)

<pre>[\)|}]?$</pre>

We end with an optional match for &#8220;}&#8221;.

The source for this regular expression [was one submitted](http://www.regexlib.com/REDetails.aspx?regexp_id=672) by Nicolas Berardi on the [RegExLib](http://www.regexlib.com/) site.  There were a few other GUID validation strings on that site, his looked the best. I did change his expression, it was also allowing for &#8220;(&#8221; and &#8220;)&#8221; in addition to the curvy brackets.  I don&#8217;t think that makes the GUID valid, so I removed it. The &#8220;{&#8221; and &#8220;}&#8221; are not part of the [IETF 4122 standard](https://www.ietf.org/rfc/rfc4122.txt "A Universally Unique IDentifier (UUID) URN Namespace"), if you are matching UUIDs, then you may want to take out the part that allows for those characters.

The problem is that it would validate text inputs that shouldn&#8217;t validate.  If your GUID string had a single hyphen, it would pass the regex test, but would fail when used by the .Net Framework.  It was also much slower than the TryParse() code, roughly 25 times slower on average.

For user interaction, the performance hit would be negligible. If you were doing a batch import program and were validating the data, you&#8217;re going to take a performance penalty hit when you use regular expressions.

The following code shows both implementations with some samples to parse:



The last two sample strings should fail the parsing. The last one only is short one character, the one before it has only one hyphen. The TryParse method works correctly for all of the values, the RegEx fails on the one with a single hyphen. You should be able to tweak the expression by testing for 5 hyphens or for no hyphens. Then you would get [this easy to remember version](http://www.regexlib.com/REDetails.aspx?regexp_id=3919):

<pre>^[{|\(]?[0-9a-fA-F]{8}[-]([0-9a-fA-F]{4}[-]){3}[0-9a-fA-F]{12}[\)|}]?|[{|\(]?[0-9a-fA-F]{8}([0-9a-fA-F]{4}){3}[0-9a-fA-F]{12}[\)|}]?$</pre>

For C# code, I&#8217;ll stick with TryParse(). The RegEx version, I&#8217;ll save for Javascript.  If you wanted to validate GUID text entry in a browser, the same expression can be used.  
<a name="fortherecord20141103"></a>



For the record, having the user enter in GUID values is a mind boggling UX failure. In this case, this is for an admin tool where the admin user would be copying and pasting in the GUID value from an email.

In case dotnetfiddler falls down, [the source code is available](https://gist.github.com/anotherlab/9479197#file-regex-validation) on Github Gist.
