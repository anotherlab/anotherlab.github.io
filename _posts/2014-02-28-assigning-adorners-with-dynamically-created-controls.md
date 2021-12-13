---
id: 676
title: Assigning adorners with dynamically created controls
date: 2014-02-28T13:02:43-05:00
layout: post
guid: http://www.rajapet.com/?p=676
permalink: /2014/02/28/assigning-adorners-with-dynamically-created-controls/
---
I was trying to add an [adorner](http://msdn.microsoft.com/en-us/library/ms743737(v=vs.110).aspx) to the WPF TextBox to add a cue banner.  I was creating the controls at runtime and I am relatively clueless with WPF.  I wanted my text boxes to show a grayed out text prompt in the edit fields when they are empty.  In HTML5, that would be the [placeholder](http://www.w3schools.com/tags/att_input_placeholder.asp) attribute.  In Win32, it&#8217;s called a [cue banner](http://msdn.microsoft.com/en-us/library/windows/desktop/bb761639(v=vs.85).aspx).

While Win32 (since XP) supports the cue banner for text input controls (single line input only, everybody else can go away), WPF has no built-in support for the cue banner.  There are a few ways to add this behavior.  I read [one suggestion](http://stackoverflow.com/a/7433840/206) that described how to a style to the control, with triggers to handle the showing and hiding of the cue banner.

That looked a little messy to me and would be specific to a single type of control.  I found an [article](http://www.ageektrapped.com/blog/the-missing-net-4-cue-banner-in-wpf-i-mean-watermark-in-wpf/) by Jason Kemp that described how to implement a cue banner as an adorner to the control.  He provides a service class with a static  method to assign a cue banner object to a control.  That object could be a string, an image, a form, it doesn&#8217;t matter.  That method wraps up the code to assign an adorner to the destination object.

I was adding TextBox contols to a grid using the following code

<pre class="brush: csharp">var tb = new TextBox { Margin = new Thickness(8.0, 0.0, 4.0, 4.0) };

  tb.SetValue(Grid.ColumnProperty, 1);
  tb.SetValue(Grid.RowProperty, i);

  grid.Children.Add(tb);
  CueBannerService.SetCueBanner(tb, SomeCueValue);</pre>

The call to SetCueBanner was throwing an exception trying to add the adorner to the control. To add an adorner in code you follow the following pattern:

<pre class="brush: csharp">AdornerLayer layer = AdornerLayer.GetAdornerLayer(control);
  // code here for creating a new adorner
  layer.Add(newAdorner);</pre>

This code was blowing up because [GetAdornerLayer](http://msdn.microsoft.com/en-us/library/system.windows.documents.adornerlayer.getadornerlayer(v=vs.110).aspx) was returning null.  Because I was building up the controls dynamically, I missing the [AdornerLayer](http://msdn.microsoft.com/en-us/library/system.windows.documents.adornerlayer(v=vs.110).aspx) that GetAdornerLayer is trying to get a hold of.  The cue banner adorner needs an AdornerLayer to render the controls on to.

The solution was to create an instance of <AdornerDecorator> and assign the TextBox to it, then add the decorator to the grid in the same manner as I had added the TextBox

<pre class="brush: csharp">var decorator = new AdornerDecorator();

  var tb = new TextBox { Margin = new Thickness(8.0, 0.0, 4.0, 4.0) };

  decorator.SetValue(Grid.ColumnProperty, 1);
  decorator.SetValue(Grid.RowProperty, i);

  decorator.Child = tb;

  grid.Children.Add(decorator);
  CueBannerService.SetCueBanner(tb, SomeCueValue);</pre>

Once I did that, everything fell into place.