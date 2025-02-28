---
title: Scrolling a ListView’s EditItemTemplate with some help from jQuery
date: 2011-01-05T19:30:00-05:00
---
I’ve been using ASP.Net’s [ListView](http://msdn.microsoft.com/en-us/library/bb398790.aspx "The ASP.NET ListView control enables you to bind to data items that are returned from a data source and display them. You can display data in pages. You can display items individually, or you can group them.") control and I cam across a little quirk while setting up the editing bits.  I have an [EditItemTemplate](http://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.listview.edititemtemplate.aspx) defined that has some input controls and a couple of nested ListViews.  It’s a nice way of defining a hierarchal editing view.  If you haven’t used a ListView before, [Scott Mitchell](http://www.4guysfromrolla.com/ScottMitchell.shtml) have a [great tutorial](http://www.4guysfromrolla.com/articles/122607-1.aspx "Using ASP.NET 3.5's ListView and DataPager Controls: Displaying Data with the ListView").

My [ItemTemplate](http://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.listview.itemtemplate.aspx "Use the ItemTemplate property to define a custom user interface (UI) to display the data items. The ItemTemplate template is required by the ListView control. It usually contains controls to display the field values of a record. If you want to let users modify the data, you also usually add buttons to the ItemTemplate template that let the user select a record, switch to edit mode, or delete a record.") displays the data for each line of data and has a couple of buttons, one to edit the item, the other to delete it.  When you click the edit button, you get a page refresh and ASP.NET renders the EditItemTemplate with the editing controls and the user can edit the item and save the changes.  
The problem was when you needed to scroll down the page to make the EditItemTemplate visible in the browser.  If the height of the ListView was greater than the visible height of the browser, the user would have to scroll down the page to get to the first input control.  I ended up using a bit of [jQuery](http://jquery.com/ "jQuery is a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development. jQuery is designed to change the way that you write JavaScript.") to scroll the edit area into view for the user.   
This is an edited down version of the EditItemTemplate for a ListView that I’m currently working on:

<pre>&lt;EditItemTemplate><br />    

<div style="padding: 0 0 10px 0;" class="MyEditItemTemplate">
  <br />        <b>Calendar Name:</b><br />        &lt;asp:TextBox ID="txtCalendarName" runat="server" <br />            Text='&lt;%# Bind("CalendarName") %>'>&lt;/asp:TextBox><br />        &lt;asp:ImageButton ID="imgbUpdateCalendar" runat="server" <br />            ToolTip="Update Calendar" AlternateText="Update Calendar" <br />            CommandName="Update" <br />            ImageUrl="~/Images/accept.png" />&nbsp;<br />        &lt;asp:ImageButton ID="imgbCancelUpdate" runat="server" <br />            ToolTip="Cancel" AlternateText="Cancel" <br />            CausesValidation="false" CommandName="Cancel" <br />            ImageUrl="~/Images/cancel.png" /><br />        <br /><br />        
  
  <div style="padding: 5px 0 0 40px;">
    <br />            
    
    <div style="border: 1px black solid">
      <br />                &lt;asp:ListView ID="ListViewChildCalendars" <br />                    runat="server" DataSourceID="odsChildCalendar"<br />                    DataKeyNames="RecordID" <br />                    InsertItemPosition="FirstItem" <br />                    OnItemInserting="ListViewChildCalendars_ItemInserting"><br />                    &lt;LayoutTemplate><br />                        <span class="SubListViewHeader"><strong>Associated Calendars</strong></span><br />                        
      
      <blockquote>
        <br />                            &lt;asp:PlaceHolder runat="server" <br />                            ID="itemPlaceholder">&lt;/asp:PlaceHolder><br />                        
      </blockquote>
      
      <br />                    &lt;/LayoutTemplate><br />                    &lt;ItemSeparatorTemplate><br />                        
      
      <hr />
      
      <br />                    &lt;/ItemSeparatorTemplate><br />                    &lt;ItemTemplate><br />                        &lt;%# Eval("CalendarName") %>&nbsp;<br />                        &lt;asp:ImageButton ID="imgbDeleteCalendar" <br />                            runat="server" <br />                            AlternateText="Remove Calendar from Group" <br />                            ToolTip="Remove Calendar from Group" <br />                            OnClientClick="return DeleteConfirmation('C', this.name);" <br />                            CommandName="Delete" <br />                            ImageUrl="~/Images/delete.png" /><br />                    &lt;/ItemTemplate><br />                    &lt;InsertItemTemplate><br />                        
      
      <div>
        <br />                            <b>Calendar Name: </b><br />                            &lt;asp:DropDownList ID="ddlChildCalendars" <br />                                runat="server" DataSourceID="odsCalendarList"<br />                                DataTextField="CalendarName" <br />                                DataValueField="RecordID"><br />                            &lt;/asp:DropDownList><br />                            &nbsp;<br />                            &lt;asp:ImageButton ID="imgbAddChildCalendar" <br />                                runat="server" <br />                                ToolTip="Associate Calendar with Group" <br />                                AlternateText="Associate Calendar with Group" <br />                                CommandName="Insert" <br />                                ImageUrl="~/Images/accept.png" /><br />                        
      </div>
      
      <br />                    &lt;/InsertItemTemplate><br />                    &lt;EmptyDataTemplate><br />                        <span class="SubListViewHeader"><strong>Associated Calendars</strong></span><br />                        
      
      <blockquote>
        <br />                            This list is empty
      </blockquote>
      
      <br />                    &lt;/EmptyDataTemplate><br />                &lt;/asp:ListView><br />            
    </div>
    
    <br />        
  </div>
  
  <br />        &lt;asp:ImageButton ID="UsedForScrolling" runat="server" <br />            ImageUrl="~/Images/0.gif" CssClass="UsedForScrolling"/><br />    
</div>

<br />    <br /><br />&lt;/EditItemTemplate><br /></pre>

This EditItemTemplate has a nest ListView to associate other items to item currently being edited.  It’s basically a pick list populated from a drop down list.  Since each selection from the list generated a page refresh, it is important to keep the EditItemTemplate displayed on the page.

All of the controls in the EditeItemTemplate are wrapped inside a 

<div>
  , with the CSS class name set to “MyEditItemTemplate”.  Defining a CSS class is great for styling, it also makes it very easy to locate controls using jQuery. Also notice the last control in the template, the ImageButton with the ID of “UsedForScrolling”.  It uses an image of an <a href="http://lh6.ggpht.com/_natoSxTaPFU/TSTG0xf-wyI/AAAAAAAAAf0/6yndaOnuAXY/s1600-h/0%5B2%5D.gif">invisible GIF file</a>.  It’s a 1&#215;1 image, with the single pixel set to the transparent color.  The browser will render it (briefly), but it wont be visible.  You can download the GIF from <a href="http://lh6.ggpht.com/_natoSxTaPFU/TSTG0xf-wyI/AAAAAAAAAf0/6yndaOnuAXY/s1600-h/0%5B2%5D.gif">invisible GIF file</a> link.  I had obtained it from <a href="http://www.maproom.co.uk/invis0.htm">a page</a> by Nick Webb.</p> 
  
  <p>
    You can use the HTML input control instead of an ImageButton, it will not matter too much.  You want to avoid using a control that will render on the screen as a visible item, like a text input control or a check box.  While the code will hide the control after the page has loaded, there would be a flash as the control is rendered, and then removed from the page,  With the invisible GIF, you avoid the brief flash on the page.
  </p>
  
  <p>
    This is how we scroll the edit template so that it’s entirely in view:
  </p>
  
  <p>
  </p>
  
  <ol>
    <li>
      Check for the existence of the invisible button.  It’s only visible when you are editing an item in the ListView.
    </li>
    <li>
      Set the focus to that button.  While it will render as a transparent image, it can still receive the focus.  This will force the browser to scroll the page (if necessary) so that the focused input control is in view.
    </li>
    <li>
      Set the focus to the first input control in the EditItemLayout.
    </li>
    <li>
      Hide the transparent input button.  While you can’t see it, you don’t want the user to be able to select it.
    </li>
  </ol>
  
  <p>
    We implement this with some jQuery code that will do all 4 four steps.  I put the code in a javascript function that I named “ScrollIntoView()” and called that function from the jQuery <a href="http://docs.jquery.com/How_jQuery_Works#Launching_Code_on_Document_Ready" title="Launching Code on Document Ready">ready event</a>.
  </p>
  
  <p>
  </p>
  
  <pre>$(function () {<br />ScrollIntoView();<br />});<br /><br />function ScrollIntoView()<br />{<br />    var TempInputControlForScrolling = $(".UsedForScrolling:input:visible:first");<br />    var FirstEditControl = $(".MyEditItemTemplate input:text:visible:first");<br /><br />if (TempInputControlForScrolling.length)<br />{<br />TempInputControlForScrolling.focus();<br />FirstEditControl.focus();<br />TempInputControlForScrolling.hide();<br />}<br />else {<br />$("input:text:visible:first").focus();<br />}<br />}</pre>
  
  <p>
    The first line in ScrollIntoView() uses a jQuery <a href="http://api.jquery.com/category/selectors/">Selector</a> to match the first visible input control with a CSS class of “UsedForScrolling”.  The next line matches the first visible text input control that is a child of the control with the CSS class of “MyEditItemTemplate”.
  </p>
  
  <p>
    If we found an input control, then the length property of the TempInputControlForScrolling variable will be greater than 0.  If no match had been made, the length will be 0.  With the match, we set the focus to the invisible GIF input button, then set it to the first text edit control, then finally hide the invisible button.  If the .UsedForScrolling selector did not match any controls, which will happen when you are not editing an item in the ListView, then the first text input control on the page will get the focus.
  </p>
