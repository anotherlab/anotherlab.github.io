---
title: Convert a string to an enumerated (enum) value.
date: 2005-04-07T16:11:00-05:00
---
Another cool tip from Mark Wagner: [Convert a string to an enumerated (enum) value.](http://blogs.crsw.com/mark/archive/2005/04/07/832.aspx)

Using the Enum.Parse method, you can easily convert a string value to an enumerated value. Doing this requires the type of the enum and string value. Adding the true argument will cause the case to be ignored.

Using the following enum for this example:

private enum Aircraft{ Beech, Cessna, Piper}

You can easily convert the string to an enum value like this:

Aircraft air = (Aircraft) Enum.Parse(typeof(Aircraft), &#8220;Cessna&#8221;, true);

Ideally you should wrap a try-catch around the Enum.Parse statement.

I can use with something that I&#8217;m working on now&#8230;
