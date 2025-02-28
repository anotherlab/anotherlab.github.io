---
title: Using console jQuery to scrape lists from Apple's developer portal
date: 2017-03-16
categories:
  - Annoyances
  - Apple
  - Javascript
  - jQuery
---
<a data-flickr-embed="true"  href="https://www.flickr.com/photos/sdfriend/4330975151/in/photolist-7AHo2n-5tBuY2-5nG9d6-6Cu6n2-7T7QyJ-nD838F-7MyVgs-pzHMvF-7ysfhx-9b3ShZ-7MyWku-pt1PC3-qSaNvv-JuyvL-mX572e-sFXPqw-fHoVpn-RxGQmA-3RHmqY-77JVVD-EJZUa-a7JZpq-pozp7V-8K6ixq-aE2eAY-89tkSQ-ehKgsz-6FDYaR-6EXDzC-4SEsTq-aE2eQu-9w4UWt-m28vsm-4mEXi1-6gtnrL-5TNHYc-6Ebjgh-4Etf7H-5XMUDS-sqw1z-5NB7fm-6Vwq72-sajUjG-4meALm-5pUpzM-43q6v9-7Nn6La-6vR16J-y2jVx-Mg8u" title="Scrape"><img loading="lazy" src="https://i2.wp.com/c1.staticflickr.com/5/4049/4330975151_b96ab89fc1_z.jpg?resize=640%2C426&#038;ssl=1" width="640" height="426" alt="Scrape"  /></a>  
I needed to grab the lists of registered devices and developers from our company's Apple Developer portal. Unless I'm being particularly obtuse (an outcome that I never rule out), Apple does not provide any means of exporting the lists.

_2021 Update_  
Before you read any further, since I first wrote this post, Apple changed the way they render the pages and none of the following will work correctly. I wrote [some code](/2021/07/09/how-to-access-apples-app-connect-api-from-c-python-and-go-part-1/) to show to use Apple's App Store Connect API to query the data for users.

Apple only allows 100 devices of each type (iPhone, iPad, iWhatever) to be registered as development devices. No matter how many iOS developers that you have at your company, 100 is the limit. And if you remove a device from that list, it still counts towards that total.  Once a year, you can reset the list and carry over the devices that you still need and drop off the ones that are not needed.  To make this easier to manage, I wanted to get a list of the devices and their ids and have the developers pick the ones that they still need.

So I wanted to export that list.  And Apple doesn't let you export that list.  You can see it on the screen and work with the items in the list, but no export.  I figured that I wasn't the only person dealing with that limitation so I did a quick search on Stack Overflow and found [this little gem](http://stackoverflow.com/a/29426740/206).

{% highlight javascript %}
var ids = ["Device ID"];
var names = ["Device Name"];
$("td[aria-describedby=grid-table_name]").each(function(){
    names.push($(this).html());
});
$("td[aria-describedby=grid-table_deviceNumber]").each(function(){
    ids.push($(this).html());
});

var output = "";
for (var index = 0; index < ids.length; index++) {
    output += ids[index] + "\t" + names[index] + "\n";
}
console.log(output);</pre>
{% endhighlight %}

To use that code, you would go to the list of devices in the browser. Then open up the developer tools for that browser. For example, in Chrome you would press F12 to open up the developer tools. Staying with the Chrome example, you would click on the Console tab in the developer tools and paste that Javascript code in and then press the Enter key. The code would execute within the domain of the page and generate a two column list of device ids and names.

To understand what that code does, you need to look at how the data is rendered on the page. The device list is stored in a HTML table, with each row looking like this

{% highlight xml linenos %}
    <td role="gridcell" style="text-align:center;display:none;width: 34px;" aria-describedby="grid-table_cb">
        <input role="checkbox" type="checkbox" id="jqg_grid-table_1" class="cbox" name="jqg_grid-table_1">
    </td>
    <td role="gridcell" style="" class="ui-ellipsis bold" title="iPad" aria-describedby="grid-table_name">iPad</td>
    <td role="gridcell" style="display:none;" class="ui-ellipsis" title="c" aria-describedby="grid-table_status">c</td>
    <td role="gridcell" style="" class="ui-ellipsis" title="twletpb659m0ju078namuy8xnv2j0fzt1kytanfz" aria-describedby="grid-table_deviceNumber">twletpb659m0ju078namuy8xnv2j0fzt1kytanfz</td>
</tr>
{% endhighlight %}

Looking at the highlighted lines 6 and 9, we can see the device name and device id as the text of table cell tag. Each cell has a [aria-describedby](https://www.w3.org/TR/wai-aria/states_and_properties#aria-describedby) attribute to identity the type of value being stored. We can search on the values of the attributes to locate the data that we want. Going back to the javascript, look at the following lines:

{% highlight javascript %}
var names = ["Device Name"];
$("td[aria-describedby=grid-table_name]").each(function(){
    names.push($(this).html());
});
{% endhighlight %}

The first line declares a Javascript array with an initial array element of &#8220;Device Name&#8221;. The next line performs a jQuery select for all of the <td/> elements that have attribute of aria-describedby with the value grid-table_name. The next part of the statement iterates over the list of matching <td/> elements and uses the jQuery html() to get the text value of the cell and add it to the array. We then can then do the same technique to get the device id and then build a list as a string and finally dump it to the browser's console.

I also needed to the email addresses of all of our registered developers. The email addresses were not in a table, but part of a list. Each email address is wrapped inside a section element like this

{% highlight xml linenos %}
<section class="col-100 ng-scope">
  <p ng-bind="::person.fullName" class="ng-binding">First Last</p>
  <a class="smaller ng-binding" 
    ng-bind="::person.email" 
    ng-href="mailto:first.last@yourcompany.com" 
    href="mailto:first.last@yourcompany.com">
    first.last@yourcompany.com
  </a>
</section>
{% endhighlight %}

I just needed the text part from the <a/> element. Getting the email addresses was a simpler version of the code to get the devices. I just a jQuery select on the ng-bind attribute and matched on the value &#8220;::person.email&#8221;. That ended up being a single line of code to run in the browser's developer console

{% highlight javascript %}
$('a[ng-bind="::person.email"]').each(function(){
  console.log($(this).text())
  });
{% endhighlight %}

And that's how you can screen scrape data from a web page that doesn't provide any support for exporting the data.

Bonus round  
The aria-describedby attribute is a commonly used accessibility element used to describe the element that the tag is part of. The &#8220;aria&#8221; part of the attribute name is an acronym for [Accessible Rich Internet Applications](https://www.w3.org/TR/wai-aria/). Among other things, it was designed to allow assisted reading devices help parse a page for users with visual difficulties. It's a good technology to use on your web pages.
