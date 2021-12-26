---
title: How to access Apple's App Connect API from C#, Python, and Go. - Part 4
date: 2021-09-01T06:56:57-05:00
categories:
  - Apple
tags:
  - Apple
  - C
  - 'C#'
  - Python
---
Welcome to Part 4 of a three part series. Last month, I did a series of posts on how to use Apple&#8217;s App Connect API to query the team membership list using [C#](/2021/07/09/how-to-access-apples-app-connect-api-from-c-python-and-go-part-1/), [Go](/2021/07/19/how-to-access-apples-app-connect-api-from-c-python-and-go-part-3/), and [Python](/2021/07/12/how-to-access-apples-app-connect-api-from-c-python-and-go-part-2/). This was code I was actually using myself and after I wrote it, it stopped working. The API calls were returning an HTTP 401 error. But only on Windows, on the Mac the code worked.

That was an odd one to track down. It turned out to be a bug with how I was generating the expiration timestamp for the JWT payload. Apple documents that you can specify up to 20 minutes into the future for the exp value. Don&#8217;t do the full 20 minutes. That works most of time. Until it doesn&#8217;t. Just set the timeout to 10 minutes into the future and Bob&#8217;s your uncle. 

I went back to the repo&#8217;s and changed the expiration timeout to 10 minutes for the [C#](https://github.com/anotherlab/IsUserinApple-dotnet), [Go](https://github.com/anotherlab/IsUserInApple-golang), and [Python](https://github.com/anotherlab/IsUserInApple-python) repos. The C# code was set to 30 minutes, that should have never worked. If you tried the C# code and wondered why it wasn&#8217;t working, that was my mistake.

While I was updating the code, I changed the Go version so that you could validate multiple user names by placing them in a line delimited file and pass that file in with a &#8220;-userlist&#8221; command line parameter. The code now reads all of the usernames and stores them in an array. It then gets all of the team members and checks to see if any of the user names in the array match the team member list. If you need to validate multiple users, this makes it a one and done task.

The &#8220;-username&#8221; parameter can still be used if you just have one user to check. In that case, it&#8217;s treated as an array with just one item in it. If you use both &#8220;-username&#8221; and &#8220;-userlist&#8221;, the code will use the user list and ignore the user name passed on the command line.

I&#8217;m not sure why the code worked when I originally wrote the posts a couple of months ago. My guess is that Apple used to allow timestamps longer than 20 minutes but made a change that now enforces the expiration to their published specification. Test for edge conditions, but avoid using them.
