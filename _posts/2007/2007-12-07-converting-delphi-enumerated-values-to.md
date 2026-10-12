---
title: Converting Delphi enumerated values to strings
date: 2007-12-07T17:20:00-05:00
---
It&#8217;s pretty easy to converted Delphi enumerated types to string and vice versa, but I can never remember the syntax.  The good thing about having your own blog is being able use it as an off-line cranial storage device.  I [did the same thing a while back](http://anotherlab.rajapet.net/2005/04/convert-string-to-enumerated-enum.html "Convert a string to an enumerated (enum) value") to do the same thing in .NET code.

To convert an enumerated type to a string:

<div>
  <span>uses typinfo; </span>
</div>

<div>
  <span></span><span>function</span><span> MyTypeToString( value: TMyType ): string; </span>
</div>

<div>
  <span></span><span>begin</span><span> </span>
</div>

<div>
  <span>    result :</span><span>=</span><span> GetEnumName(typeInfo(TMyType ), Ord(value)); </span>
</div>

<div>
  <span></span><span>end</span><span>; </span>
</div>

 

To convert a string back to an enumerated type, the following syntax can be used

<div>
  <span>uses typinfo; </span>
</div>

<div>
  <span></span><span>function</span><span> StringToMyType(</span><span>const</span><span> value: string): TMyType </span>
</div>

<div>
  <span></span><span>begin</span><span> </span>
</div>

<div>
  <span>  result :</span><span>=</span><span> TMyStyle(GetEnumValue(Typeinfo(TMyStyle), value); </span>
</div>

<div>
  <span></span><span>end</span><span>;</span>
</div>

 

GetEnumName and GetEnumValue are defined in typinfo, you&#8217;ll need to add that unit to the uses clause of your code.  This functionality is very useful if you ever need to implement your own object serialization routines in Delphi.
