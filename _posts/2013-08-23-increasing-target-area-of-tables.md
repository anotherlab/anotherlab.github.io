---
id: 7
title: 'Increasing the target area of a table&#8217;s DetailDisclose button with Xamarin.iOS'
date: 2013-08-23T20:04:00-05:00
layout: post
guid: http://www.rajapet.com/?p=7
permalink: /2013/08/23/increasing-target-area-of-tables/
---
Can you make that button bigger? I went slightly under the hood in [Xamarin.iOS](http://xamarin.com/monotouch) to make an accessory button target area larger.

I&#8217;m finishing up an iPad app for our fall release schedule. One of the comments that came up in testing was that it was too hard for some people to hit the [detail disclosure button](https://developer.apple.com/library/ios/documentation/userexperience/conceptual/mobilehig/UIElementGuidelines/UIElementGuidelines.html#//apple_ref/doc/uid/TP40006556-CH13-SW19) in the tables. I was asked to make the button larger.

What we are talking about is the standard blue circle with a white &#8220;>&#8221; in the center. Something like this:

<div>
  <a href="https://i2.wp.com/3.bp.blogspot.com/-WqB3F0hGE5Q/UhemEMh4W_I/AAAAAAAAAIQ/zEGL6Ae8wSc/s1600/DetailDisclosureButton.png" imageanchor="1"><img loading="lazy" border="0" height="320" src="https://i2.wp.com/3.bp.blogspot.com/-WqB3F0hGE5Q/UhemEMh4W_I/AAAAAAAAAIQ/zEGL6Ae8wSc/s320/DetailDisclosureButton.png?resize=222%2C320" width="222"  data-recalc-dims="1" /></a>
</div>

The target area that responds to finger touches is about 44&#215;44 pixels, centered around the button. We wanted to increase that target area to make it easier to reach. My first pass was to create new button that was a larger size. That worked, but it didn&#8217;t look like the standard detail disclosure button (actually, it looked hideous, but that&#8217;s another story). I prefer to use the standard iOS imagery unless I have a good reason not to. If you have spent any amount of time with an iPhone or an iPad, you have seen that button before and you know that touching it will provide you with more details. The more familiar a UI is, the less training the user will need.

> On a side note: If you want to create a custom button and want to use imagery that will scale between Retina and non-Retina displays, take a look at [PaintCode](http://www.paintcodeapp.com/). I was able to take my vector based image and convert it to code and created a button that drew the imagery at runtime at the device resolution. I don&#8217;t often need that tool, but I&#8217;m glad I have it.

I decided to take another approach. Instead of changing the image, I would make the target area around the button wider. The button will look the same, but clicking more of the white area around that button would trigger the button. And it wasn&#8217;t hard to do.

We are going to looking at some Xamarin.iOS C# code. This should also work with Objective-C, just with different syntax.

I started out with a custom table cell

<pre>public class MyCustomCell : UITableViewCell<br />{<br /> public UIButton detailDisclosureButton;<br /><br /> public MyCustomCell (string Action, string Status, NSString identKey) : base (UITableViewCellStyle.Subtitle, identKey)<br /> {<br />  detailDisclosureButton = UIButton.FromType (UIButtonType.DetailDisclosure);<br />  detailDisclosureButton.Frame = new RectangleF (0f, 0f, 120f, 44f);<br />  detailDisclosureButton.ImageEdgeInsets = new UIEdgeInsets (0f, 120f - 44f, 0f, 0f);<br /><br />  AccessoryView = detailDisclosureButton;<br /><br />  UpdateCell (Action, Status);<br /> }<br /><br /> public void UpdateCell(string Action, string Status)<br /> {<br />  TextLabel.Text = Action;<br /><br />  DetailTextLabel.Text = Status;<br /> }<br />}<br /></pre>

The constructor creates a new SubTitle cell. I then add a UIButton of type DetailDisclosure. The button then gets a new Frame that is much wider, 120px, than the default size. That will give the user a wider target to hit. Since the default is to left align the image, we need to shift the image inside the frame. For that we add a new [UIImageEdgeSets](https://developer.apple.com/library/ios/documentation/uikit/reference/UIButton_Class/UIButton/UIButton.html#//apple_ref/occ/instp/UIButton/imageEdgeInsets), to set the margin on the drawing rectangle for the image. By setting the left inset to the new width minus the old width, we align the image to the right side of the frame.

The last thing to do is to set the [AccessoryView](https://developer.apple.com/library/ios/documentation/userexperience/conceptual/tableview_iphone/tableviewstyles/tableviewcharacteristics.html) property of the cell to the new button, that will let the default code draw the button in the right place and we do not need to know how wide the cell is at runtime. What you lose is the [AccessoryButtonTapped](http://docs.xamarin.com/recipes/ios/content_controls/tables/add_a_cell_accessory) event is no longer called, we have to handle that functionality.

The next step would be define the table. I&#8217;m using a [UITableViewSource](http://docs.xamarin.com/guides/ios/user_interface/tables/part_2_-_populating_a_table_with_data) and I override the [GetCell](http://docs.xamarin.com/guides/ios/user_interface/tables/part_3_-_customizing_a_table's_appearance) method to create the custom cell. In addition to creating the custom cell, I needed to assign a TouchUpInside event to the new button as the default accessory behavior will no longer handle that button.

<pre>public class MyCustomTableSource : UITableViewSource<br />{<br /> protected List&lt;mycustomitem> tableItems = new List&lt;mycustomitem>();<br /> protected string cellIdentifier = "myTableCell";<br /><br /> public override UITableViewCell GetCell (UITableView tableView, NSIndexPath indexPath)<br /> {<br />  MyCustomCell cell = (MyCustomCell)(tableView.DequeueReusableCell (cellIdentifier));<br /><br />  var Action = SomeMethodToReturnTitle(tableItems [indexPath.Row]);<br />  var Status = SomeMethodToReturnSubTitle(tableItems [indexPath.Row]);<br /><br />  if (cell == null) {<br />   // Create our custom cell<br />   cell = new MyCustomCell(Action, Status, new NSString (cellIdentifier));<br /><br />   // Set the tag property of the button to the current row.<br />   // If you are doing sections and rows, then I would subclass the UIButton and<br />   // add Section and Row properties to make the code easier to work with<br />   cell.detailDisclosureButton.Tag = indexPath.Row;<br /><br />   // Set the TouchUpInside event to check the button's tag property to figure out<br />   // which row triggered the event.  And then do something<br />   cell.detailDisclosureButton.TouchUpInside += delegate(object sender, EventArgs e) {<br />    EditAction (tableItems[(sender as UIButton).Tag]);<br />   };<br />  }<br />  else {<br />   cell.UpdateCell(Action, Status);<br />  }<br /><br />  return cell;<br /> }<br /><br /> public void EditAction(MyCustomItem thisAction)<br /> {<br />  // Do something here<br /> }<br />}<br />&lt;/mycustomitem>&lt;/mycustomitem></pre>

With GetCell, we create or update an instance of our custom cell. When the cell gets created, I assign the table row to the Tag property of the button. Since we are not using the default code for adding a DetailDisclosure button, we have to handle the touch event. Right after the cell is created, the TouchUpInside event of the custom button gets a new delegate assign to it. I cast the sender as the UIButton and access the Tag property to get the selected row.

My code only had a single section in the table, so I only needed to track the table row. If I had needed to know the current section, I would have created a UIButton descendant and added Section and Row properties. That would make the code a little cleaner. The end result is the user gets the a button with the default look and feel, but with a larger target area.