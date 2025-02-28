---
title: Saving and restoring a forms location on
date: 2005-12-12T16:32:00-05:00
---
[Raghavendra Prabhu](http://blogs.msdn.com/rprabhu/default.aspx) has the [start of some code](http://blogs.msdn.com/rprabhu/archive/2005/11/28/497792.aspx) to save/restore a form’s position.  This requires the [Application Settings](http://msdn2.microsoft.com/library/0zszyc6e(en-us,VS.80).aspx) feature in 2.0, so this is mostly theoretical for me.

 private void Form1_FormClosing(object sender, FormClosingEventArgs e)  
{  
     Properties.Settings.Default.MyState = this.WindowState;

<blockquote dir="ltr">
  <blockquote dir="ltr">
    <p>
      if (this.WindowState == FormWindowState.Normal)<br />{<br />   Properties.Settings.Default.MySize = this.Size;<br />   Properties.Settings.Default.MyLoc = this.Location;<br />}<br />else<br />{<br />   Properties.Settings.Default.MySize = this.RestoreBounds.Size;<br />   Properties.Settings.Default.MyLoc = this.RestoreBounds.Location;<br />}
    </p></p> 
    
    <p>
      Properties.Settings.Default.Save();
    </p>
  </blockquote>
  
  <p>
    }
  </p>
  
  <p>
    private void Form1_Load(object sender, EventArgs e)<br />{
  </p>
  
  <blockquote dir="ltr">
    <p>
      this.Size = Properties.Settings.Default.MySize;<br />this.Location = Properties.Settings.Default.MyLoc;<br />this.WindowState = Properties.Settings.Default.MyState;
    </p>
  </blockquote>
  
  <p>
    }
  </p>
</blockquote>

As noted in the comments to his post, this code doesn’t take handle conditions like multiple instances running (each additonal app should offset it’s location) or if the resultion changed and the app is not off the screen.  But it’s a start.  
via [[jfo&#8217;s coding]](http://blogs.msdn.com/jfoscoding/archive/2005/12/09/502285.aspx "Saving/Restoring form's last known location and position")
