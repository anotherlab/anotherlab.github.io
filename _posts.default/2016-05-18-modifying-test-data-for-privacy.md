---
title: Modifying test data for privacy
date: 2016-05-18
---
Sometimes I get actual live data from a client to track down a bug that only happens with their data.  That data will contain student records and we don't like to have live student laying around.   We can use [TDE](https://msdn.microsoft.com/en-us/library/bb934049.aspx) to encrypt the data at rest, but if I'm sharing that data with other developers, I want to scrub identifying details from data set.

For the most part, I just need to replace the first and last names from student table.  I could set both the first and last names to “[Gank](http://www.ganksoft.com/)“, but if every record looks the same, it can be hard to see how the bug manifests itself.  I could set both attributes to the record id value for the record, but I find that hard to look at after a while.

What I end up is writing some sort of reubenizer code.  The reubenizer changes the first and last names to some variation of “Reuben”.

<figure>
<a href="https://en.wikipedia.org/wiki/Dave_Madden"><img loading="lazy" class="" src="https://i0.wp.com/photos.smugmug.com/photos/i-jQWQ4m4/0/Th/i-jQWQ4m4-Th.jpg" /></a>
<figcaption>The Patron Saint of all that is Reuben</figcaption></figure>

Let's create a fake table to represent the student data to modify.

{% highlight sql %}
declare @Student TABLE
(
    RecordID varchar(4),
    FirstName varchar(80),
    LastName varchar(80),
    Gender char(1)
);

-- Push in some fake data
insert into @Student (RecordID, FirstName, LastName, Gender) values (1, 'Joe', 'Smith', 'M');
insert into @Student (RecordID, FirstName, LastName, Gender) values (2, 'Joel', 'Smith', 'M');
insert into @Student (RecordID, FirstName, LastName, Gender) values (3, 'Jane', 'Smith', 'F');
insert into @Student (RecordID, FirstName, LastName, Gender) values (4, 'Linda', 'Tokken', 'F');
insert into @Student (RecordID, FirstName, LastName, Gender) values (5, 'Samantha', 'Queen', 'F');
insert into @Student (RecordID, FirstName, LastName, Gender) values (6, 'Steve', 'Burton', 'M');
insert into @Student (RecordID, FirstName, LastName, Gender) values (7, 'Doug', 'Francis', 'M');
insert into @Student (RecordID, FirstName, LastName, Gender) values (8, 'Linda', 'McLinda', 'F');
insert into @Student (RecordID, FirstName, LastName, Gender) values (9, 'Paul', 'Davis', 'M');
insert into @Student (RecordID, FirstName, LastName, Gender) values (10, 'Ann', 'Davis', 'F');
{% endhighlight %}


Running those statements will generate a result set that looks like this

{% highlight plaintext %}
RecordID FirstName        LastName         Gender
-------- ---------------- ---------------- ------
1        Joe              Smith            M
2        Joel             Smith            M
3        Jane             Smith            F
4        Linda            Tokken           F
5        Samantha         Queen            F
6        Steve            Burton           M
7        Doug             Francis          M
8        Linda            McLinda          F
9        Paul             Davis            M
10       Ann              Davis            F
{% endhighlight %}


The first thing I do is create a table with a set of surname prefixes.  These prefixes will be used with the string “Reuben” to create the new last names

{% highlight sql %}
-- Create a table with some surname prefixes. 
-- We'll pick the prefix from the last digit of the record id of the student.
-- We only do this so we don't have to look at the same name for every row

declare @Reuben TABlE
(
    RecordID varchar(4),
    LastName varchar(16)
);

-- Pick 10 different prefixes
insert into @Reuben (RecordID, LastName) values ('1', 'Mc');
insert into @Reuben (RecordID, LastName) values ('2', 'de ');
insert into @Reuben (RecordID, LastName) values ('3', 'Del');
insert into @Reuben (RecordID, LastName) values ('4', 'St ');
insert into @Reuben (RecordID, LastName) values ('5', 'Van ');
insert into @Reuben (RecordID, LastName) values ('6', 'Le ');
insert into @Reuben (RecordID, LastName) values ('7', 'La');
insert into @Reuben (RecordID, LastName) values ('8', 'Lo');
insert into @Reuben (RecordID, LastName) values ('9', 'O''');
insert into @Reuben (RecordID, LastName) values ('0', '');
{% endhighlight %}


Now it's time to create the update statement to reubenize the names. To get the surname prefix, we'll get the last digit of the record id. That will slice up the students into 10 different sets of last names. There are other ways of doing this, this one is quick and simple. You could do the same thing with the first name, but in this case, I'm just going to use “Reuben” for the boys and “Reubenette” for the girls, and tack on that last digit.

To make the code a little cleaner, I use a [Common Table Expression](https://msdn.microsoft.com/en-us/library/ms190766.aspx) (or CTE) to create a calculated field for the last digit of the record id. If you are not familair with CTE's, they let you build temporary result sets that only exist within the context of the SQL expression that they are in.  I blogged about using a CTE [here](http://www.rajapet.com/2016/02/generating-new-row-numbers-in-sql-based-on-a-starting-value.html) and [there](http://www.rajapet.com/2010/04/suppressing-repeated-column-value-in.html).

That update statement would look something like this

{% highlight sql %}
-- Using a CTE allows us to calculate the last digit just once
WITH cte (recordid, offset) 
     AS (SELECT recordid, 
                RIGHT(Cast(s.recordid AS VARCHAR), 1) AS OffSet 
         FROM   @student s) 
UPDATE s 
SET    s.lastname = Concat(r.lastname, 'Reuben'), 
       s.firstname = CASE s.gender 
                       WHEN 'M' THEN Concat('Reuben-', cte.recordid) 
                       ELSE Concat('Reubenette-', cte.recordid) 
                     END 
FROM   cte 
       JOIN @student s 
         ON cte.recordid = s.recordid 
       JOIN @Reuben r 
         ON r.recordid = cte.offset; 
{% endhighlight %}

After running that update statement, the result set will look like this

{% highlight plaintext %}
RecordID FirstName        LastName         Gender
-------- ---------------- ---------------- ------
1        Reuben-1         McReuben         M
2        Reuben-2         de Reuben        M
3        Reubenette-3     DelReuben        F
4        Reubenette-4     St Reuben        F
5        Reubenette-5     Van Reuben       F
6        Reuben-6         Le Reuben        M
7        Reuben-7         LaReuben         M
8        Reubenette-8     LoReuben         F
9        Reuben-9         O'Reuben         M
10       Reubenette-10    Reuben           F
{% endhighlight %}


The records are no longer recognizable and are distinct enough to allow me to debug the problem. This doesn't work for every kind of data element, but it allows me to work with and share live data with out displaying any personal identification.
