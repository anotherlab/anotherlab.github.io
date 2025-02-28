---
title: Binding an Enum to a DataSource
date: 2011-06-08T17:56:00-05:00
---
I had some code for an ASP.Net Webforms app where I need to present to the user a list of options that were define as Enum.  I want to populate a combobox with the enumerated type values and do it from code automatically.  This is the Enum in question

<pre>enum PrintColorSchema {<br />    Default = 0,<br />    FullColor = 1,<br />    GrayScale = 2,<br />    BlackAndWhite = 3,<br />}</pre>

To make things more interesting, I wanted to exclude the first item in the list, “Default”.  One way to do this would be to manually populate a select list with the values from the Enum.  While that would work for this Enum, I wanted to find a way where I didn’t have to hard code the values.

I added a DropDownList control to the page and in the code behind, I added the following code:

<pre>ColorSchema.DataSource = <br />    Enum.GetValues(typeof(PrintColorSchema))<br />        .Cast&lt;PrintColorSchema>()<br />        .Select(en => new<br />        {<br />            Value = en,<br />            Text = Wordify(en.ToString())<br />        }).Where (en => en.Value != PrintColorSchema.Default);<br /><br />ColorSchema.DataTextField = "Text";<br />ColorSchema.DataValueField = "Value";<br />ColorSchema.DataBind();</pre>

What we are using is a bit of [LINQ](http://msdn.microsoft.com/en-us/library/bb397919.aspx) to convert the Enum to an IEnumerable collection of an anonymous class. That class has two members, Value and Text. Value is set to the enumerated type and Text is set to prettified version of the enumerated type. That function looks like this: 

<pre>public static string Wordify(string pascalCaseString)<br />{<br />    System.Text.RegularExpressions.Regex r = <br />       new System.Text.RegularExpressions.Regex("(?&lt;=[a-z])(?&lt;x>[A-Z])|(?&lt;=.)(?&lt;x>[A-Z])(?=[a-z])");<br />    return r.Replace(pascalCaseString, " ${x}");<br />}&lt;/x>&lt;/x></pre>

The code 

<pre>Enum.GetValues(typeof(PrintColorSchema))</pre>

converts the Enum to an array of constants. The next part 

<pre>.Cast&lt;PrintColorSchema>()</pre>

returns an IEnumerable<printcolorschema> collecttion from the array. The code 

<pre>.Select(en => new<br />{<br />    Value = en,<br />    Text = Wordify(en.ToString())<br />})</pre>

returns a new IEnumerable<> collection of an anonymouse type. That type has the enumeration element as the Value and that element converted to a string as the Text. Since the elements were in [&#8220;PascalCase&#8221;](http://msdn.microsoft.com/en-us/library/x2dbyw72%28v=vs.71%29.aspx "Capitalization Styles"), a simple RegEx function was used to split the text into multiple words, The final Where operator is used to filter out the first item from the list. 

The HTML that gets rendered:

<pre><select id="ColorSchema" name="ColorSchema"> <br />    &lt;option selected value="FullColor">Full Color&lt;/option> <br />    &lt;option value="GrayScale">Gray Scale&lt;/option> <br />    &lt;option value="BlackAndWhite">Black And White&lt;/option><br /></select> </pre>

Which renders like this 

<select name="ColorSchema"><option value="FullColor">Full Color</option><option value="GrayScale">Gray Scale</option><option value="BlackAndWhite">Black And White</option></select>

For this Enum, all the code was overkill, adding three<option> elements to the  <select>control would have been less work.  Where this is handy is when you have Enum types with many elements or when the Enum type changes.  If the Enum type changes, no modification to your code is needed to update the combo box.  One less place in the code to fail.  And that is a good thing.</p> </printcolorschema>
