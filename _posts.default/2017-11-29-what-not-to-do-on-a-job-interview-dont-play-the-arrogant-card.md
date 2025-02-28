---
title: "What not to do on a job interview: Don't play the arrogant card"
date: 2017-11-29
collect_box_size:
  - collect-square
categories:
  - Employment
---
<div style="width: 610px" class="wp-caption alignnone">
  <a href="http://amtec.us.com/creative-commons"><img loading="lazy" class="size-medium" src="https://i0.wp.com/photos.smugmug.com/photos/i-T9TJ6Pr/1/18726755/M/i-T9TJ6Pr-M.png?resize=600%2C352&#038;ssl=1" width="600" height="352"  /></a>
  
  <p class="wp-caption-text">
    <span style="font-size: 8pt;"><em>Original image courtesy of Amtec Staffing</em></span>
  </p>
</div>

A few years back, we were hiring a new ASP.NET developer and did a few rounds of interviews with a set of candidates.  For this position we were experimenting with having the candidate take a programming exam as part of the process. An exam that we ended up abandoning after that round, but more about that later on.

What was the exam?

The exam wasn't a traditional multiple choice or fill in the blank type of exam.  We were checking for that kind of knowledge during the interviews.  This exam was all coding.  The candidate needed to create an ASP.Net app that required the user to login in and display a list of items from a database. The exam consisted of 4 or 5 steps, with each one building on the previous step.  The candidate was given the following

  * A laptop that was using Remote Desktop to connect to a virtual machine. We provided a keyboard and mouse for people who don't like typing on laptops.
  * The virtual machine had Windows with plenty of memory
  * The virtual machine had IIS installed and configured for ASP.NET
  * SQL Server was installed on the virtual machine and had a database with the user store and the list of items to display
  * Full access to the Internet

The steps were roughly as follows

  * Create an ASP.Net web app
  * Connect the app to the SQL Server database
  * Add a login page
  * Validate a user's login credentials from the database
  * Add a page that would display a list
  * Populate the list from the database.  The list needed to include a set of fields.

The candidate was given 2 hours in a quiet room to do the exam.  We made it clear that they could use any resource on the Internet to solve the problems.  If they copied every single line of code, that was fine as long as they could explain what each line did. My career could be a testament to the power of [Stack Overflow](https://stackoverflow.com/users/206/chris-miller), it makes me smarter. After the 2 hours had elapsed, we would regroup and the candidate would walk us through the code and explain how the code worked.

We were not expecting anyone to actually complete all of the steps.  I did the exam in just under two hours.  I had the advantage of having devised the exam, but I had little ASP.NET experience at the time.  We were looking to see how the candidates worked and what their problem solving skills looked like. We wanted to see how the sausage was made.

Getting back to the candidates, we had interviewed this guy who was off the scale in the terms of cockiness.  I don't remember his name, so let's call him &#8220;Sam&#8221;.  During the first interview, he was very sure of himself and said he was a &#8220;superstar&#8221; developer.  He mentioned that he had &#8220;googled&#8221; all of the developers that were part of the interview process and started listing where and what we did on the Internet.  That was a tiny bit creepy.  It's expected to research candidates on the Internet, but a little out of ordinary to have the candidate do the reverse.  The way he did came across as bragging and we all thought it was a bit odd.

When we explained that we would like him to come back and take the programming exam, he told us that he was going to do great on it and was looking forward to taking it. Once again, just a  bit cocky. You want someone that is confident, but he was dialed out way too strong.

So Sam came in a few days later to take the exam.  He was placed in a quiet room and given the instructions and the laptop already connected to the virtual machine.  There was a window into the office so he could be monitored.  After reading the document, he immediately started coding.  After 90 minutes, we sent Jim, our HR Manager, in to see if how he was doing and if he needed anything.

When Jim walked in, Sam just snapped. He told Jim that the exam was BS and that no one could solve it. Sam said that it was a waste of his time and not a proper way of testing his skills.  He said this all in much more colorful language.  After venting all of that, he realized what he had done and regained his composure. He told Jim that he was doing fine and that he didn't need anything.

At the two hour point, we halted the exam.  We then went a conference room with Sam to review his work.  He had not completed the exam and was very subdued as he explained what he had done.  After creating the web app and immediately connecting to the database, Sam decided to get fancy with the login screen.  He ended up spending most of the remaining time on the login screen and adding a lot of clever code.  When the clever code failed to work, he refused to move on and kept trying to get it to work right. We've all been there. You hit a roadblock over something simple that you just can't see. The more you look at at it, the more frustrated you get. It was during that part when Jim had come in.

Towards the end, Sam had realized that he had not done any of the rest of the exam. He stopped fiddling with the login page and started working on the rest of it.  He didn't finish anything, but he had bits of pieces of the remaining steps.  As he walked us through the code that he had written, the cockiness crept back into his voice.  He explained why he took so much time on the login screen, saying he wanted to show off his skills.  We asked why didn't just get it all running and then go back and add the &#8220;wow&#8221; factor.  He looked annoyed for a second and then said in retrospect that would have been a better way to do the test.

Afterwards, we discussed what we thought of Sam.  None of us were comfortable with having him as a co-worker.  While his attitude during our interviews had us concerned, it was the way that he had treated Jim that had tipped the scales against him.  Being able to work with your fellow employees is an absolute requirement. We have all hit roadblocks and faced tight deadlines. We can teach just about anyone with the desire and the ambition to be a good developer, I don't know that is true for teaching an experienced developer how to play well with others. That pretty much ended any chance of being hired by us.

Getting back to the exam, we did drop it after using it on that round of developers.  One guy refused to take it.  He had done some contract work for us in the past, but as part of a group and we did want to see how he did on his own.  He told HR that he was offended that we were asking him to take the exam and that we should just hire him based on the contracting work he had performed for us.  The exam tested more than programming skill. Refusing to take the exam when everyone else had done so was read as not being a team player.

Another developer completely failed the exam.  He had the skills, but his brain just [vapor locked](http://www.onallcylinders.com/2015/08/07/ask-away-with-jeff-smith-understanding-vapor-lock-and-how-you-can-fix-it/) on the exam.  The ability to do the password page had completely left his consciousness.  I knew him from before the exam, I knew he had the skills but something just went wrong for him.  By the rules we had set for this round of interviews, we had to exclude him.  We had one or two others take the exam, no one completed it but they did a good job explaining how they got to where they ended up.  We ended up hiring someone through a different process.

After some discussion, we abandoned the exam.  Seeing code that a developer has written is still valuable to us, but this method wasn't effective.  We now ask candidates to prepare something, either new or something already completed.  We may ask for something based on their resume and ask them to demo the code and explain what they did and why they did it.  We found that the candidate were a lot more comfortable and we learned more about their soft skills as well. Developing applications is a team sport, asking someone to explain why they did a thing a certain way will give you clues for how they would work on your team. You can learn to manage arrogant behavior, I'm an evolving experiment for that. But when you are being interviewed, you can't play the arrogant card and expect it to open doors for you.
