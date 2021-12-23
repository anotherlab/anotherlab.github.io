---
layout: post
title:  "A failed MakeValid call in SQL Server"
date:   2021-12-15 10:31:33 -0500
categories: SQL
---
We hit this strange bug in SQL Server about a month ago. A single SQL Statement would just kill the connection. It would kill it 100% in any version of SQL Server from 2016 and up. Let’s start with the SQL Statement.

{% gist a97bf849285c710fcf6e6428b2fd4536 MakeValidCall.sql %}

It’s a lot of data. It came from GPS data collected over a route. Visually the data looks like this.

The goal was to take the data and use MakeValid to clean it up. MakeValid() takes invalid data and attempts to convert it to a valid SQLGeometry instance. For this example, the call to MakeValid() never completes and eventually your connection times out.

The curious thing is if you used SQLGeography instead of SQLGeometry, MakeValid works. Here is some sample code that uses C# with the SQLGeography MakeValid calls on the same data. It executes just fine

{% gist 44a706a3792cf079f1e2512b4695447 MakeValidCall.cs %}

We first posted it to Stack Overflow as a question. That generated some interesting dialog and some really good analysis. I opened a support ticket with Microsoft over the connection failing. It wasn’t so much about MakeValid() not working, but how the failure of the call would kill the connection.

Microsoft Support determined that code in SQLGeometry MakeValid() was running out of memory trying to evaluate all of the points. The code in SQLGeography’s MakeValid is different because <a href="https://docs.microsoft.com/en-us/sql/t-sql/spatial-geography/spatial-types-geography?view=sql-server-ver15" target="_blank">SQLGeography</a> is very different from <a href="SQLGeometry" target="_blank">SQLGeometry</a>.

The SQLGeometry data types and methods work in a flat space. SQLGeography is based on a round-earth coordinate system. In other words, when you work with distances, SQL Geometry is just a flat 2D polygon. It will calculate the same results for coordinates near the equator as they would further away. SQLGeography will factor in the curvature of the earth and it knows that the horizontal distance between two difference latitude values will depend on how far they are away from the equator.

The end result with Microsoft was that this has been logged as a product issue to be looked at some point in the future. Which is fine, we adapted our code to use SQLGeography instead of SQLGeometry.