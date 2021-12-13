---
id: 34
title: How to set the DevExpress ASPxScheduler current time line marker to only appear for the current date
date: 2011-07-13T15:26:00-05:00
layout: post
guid: http://www.rajapet.com/?p=34
permalink: /2011/07/13/how-to-set-devexpress-aspxscheduler/
---
I’ve been using the [DevExpress](http://www.devexpress.com/) [ASPxScheduler](http://www.devexpress.com/Products/NET/Controls/ASP/Scheduler/) with one of our WebForms apps and it’s been a pretty good experience so far. It does pretty much what I need for it to do and I have been able to bend it to do things that I want it to do.

One feature is that it displays a marker on the scheduler to represent the current time.  This is a feature that Outlook does on its calendar and the ASPxScheduler by and large is trying to mirror that experience.  In this case, they behave slightly differently than Outlook.  In Outlook, the time line marker only appears when the calendar time span includes the current date.  If the calendar view does not include the current date, you don’t see that line.

[<img border="0" src="https://i1.wp.com/www.rajapet.net/photos/i-bxbpLgD/0/O/i-bxbpLgD.png?w=680" data-recalc-dims="1" />](http://documentation.devexpress.com/#AspNet/DevExpressWebASPxSchedulerASPxSchedulerOptionsBehavior_ShowTimeMarkertopic "Time line marker documentation")

(Image of the scheduler control showing the time marker taken from the online documentation)

With the ASPxScheduler, if you have [time line marker enabled](http://documentation.devexpress.com/#AspNet/DevExpressWebASPxSchedulerASPxSchedulerOptionsBehavior_ShowTimeMarkertopic), it’s always being displayed, no matter what the date is.  That is a little bit counter intuitive and doesn’t match the Outlook model that DevExpress is trying to following.  As it turns out, it was easy to change that behavior. 

You can use the [VisibleIntervalChanged](http://documentation.devexpress.com/#AspNet/DevExpressWebASPxSchedulerASPxScheduler_VisibleIntervalChangedtopic) event of ASPxScheduler control and make the time line marker behave like Outlook with a single line of code:

<pre>protected void ASPxScheduler1_VisibleIntervalChanged(object sender, EventArgs e)<br />{<br />    ASPxScheduler1.OptionsBehavior.ShowTimeMarker = ASPxScheduler1.ActiveView.GetVisibleIntervals().Interval.Contains(DateTime.UtcNow.Date.AddMinutes(1));<br />}</pre>

We use this event to enable the display of the marker when the current date is being displayed by the control, otherwise disable the marker. The call to [GetVisibleIntervals()](http://documentation.devexpress.com/#AspNet/DevExpressWebASPxSchedulerSchedulerViewBase_GetVisibleIntervalstopic).Interval returns [TimeInterval](http://documentation.devexpress.com/#CoreLibraries/clsDevExpressXtraSchedulerTimeIntervaltopic) object, which is a DevExpress.XtraScheduler class that represents an interval of time for the current scheduler view.  You can use the Contains() method to check if a DateTime or TimeInterval object is contained within the interval.  Internally, the ASPxScheduler uses UTC time, so you want to pass the current date as UTC.  We add 1 minute to the time otherwise the DayView for the previous day will include the current date.

This functionality works for the version of the ASPxScheduler that was current at the time this was written, v2011.1.5.