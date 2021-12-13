---
id: 495
title: 'Bug Details: Arithmetic operation resulted in an overflow with Int32.'
date: 2005-04-18T14:14:00-05:00
layout: post
guid: http://www.rajapet.com/?p=495
permalink: /2005/04/18/bug-details-arithmetic-operation/
---
[Bug Details: Arithmetic operation resulted in an overflow with Int32.](http://lab.msdn.microsoft.com/productfeedback/viewfeedback.aspx?feedbackid=76e26e0e-fc16-4a28-b8da-dca88900f2cf)

Here&#8217;s a bug that Microsoft knows about, but has postponed until [&#8220;VNext&#8221;](http://msdn.microsoft.com/vstudio/productinfo/roadmap.aspx#orcas).

This code will blow up in .NET:

<div>
  <span><span><span>public class FDBK23539 </span><br /><span>{</span><br /><span>  public static void Calculate() </span><br /><span>  {</span><br /><span>   checked </span><br /><span>   {</span><br /><span>    int ii = int.MinValue;</span><br /><span>    int a = ii &#8211; ii;</span><br /><span>    int b = ii &#8211; int.MinValue; //Arithmetic operation resulted in an overflow.</span><br /><span>   }</span><br /><span>  }</span><br /><span>  public static int Main(string[] args) </span><br /><span>  {</span><br /><span>   System.Console.WriteLine(System.Environment.Version);</span><br /><span>   Calculate();</span><br /><span>   return 0;</span><br /><span>  }</span><br /><span>}</span><br /></span></span>
</div>

Look at the code in the checked() function:

int ii = Int32.MinValue;  
int a = ii &#8211; ii;  
int b = ii &#8211; Int32.MinValue;

The values of a and b should be the same and an overflow exception should not be thrown for the b operation.

I loved the responses from MS:  
_Because the scenario is corner-case and given where we are in the cycle, I&#8217;m going to track this as an issue for consideration in VNext. We do appreciate the issue, we&#8217;re really just ensuring we&#8217;re looking at critical issues, since we want to get this product to you ASAP._

It&#8217;s too early on a Monday morning to be reading this.