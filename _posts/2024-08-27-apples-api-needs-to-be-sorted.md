---
title:  Apple needs to sort out their API
date:   2024-08-27
author: anotherlab
summary: Apple changed the how the AppConnect API worked with paged results
largeimage: /assets/steam-punk-scientist.jpg
categories:
  - Apple
tags:
  - Apple
  - 'C#'
---
{:refdef: style="text-align: center;"}
![Who broke the API?](/assets/steam-punk-scientist.jpg)
{: refdef}

I have some code that uses Apple's [AppConnect API](https://developer.apple.com/documentation/appstoreconnectapi) to query App store related things. I wrote a C# script that I run from [LINQPad](https://www.linqpad.net/) that gives me a weekly status update for the account. We link provisioned devices to the registered users in the account by their name. By querying the device list and referencing it wiht the user list, I quickly identify when someome provisions a new device without identifying who has that device.

Why do I need to do that? Apple only allows 100 devices per type to be provisioned as a developer device. 100 iPhones, 100 iPads, etc.  You need to provision a device with Apple to run development code on it. When you a have bigger team, 100 is a hard limit to manage.  We only allow a developer to provision one device type. Matching the name to the user is how we manage it.

I ran the script this morning and it reported devices that were fine as being invalid. Like my boss's iPad. I knew his user account was still valid, so something broke in my script. I ran the script again and his device was fine. Ran it again and it was a problem again. That's weird.

I tore apart my script and the code that retrieves the user list uses the List Users endpoint, documented [here](https://developer.apple.com/documentation/appstoreconnectapi/list_users).

I have the following code to call the API and get the set of users

{% highlight csharp linenos %}
public async Task<string> GetUsers(string token, int count, string nextUrl)
{
  var client = new HttpClient();

  client.DefaultRequestHeaders.Authorization =
    new AuthenticationHeaderValue("Bearer", token);

  var url = nextUrl ?? $"https://api.appstoreconnect.apple.com/v1/users?limit={count}";
    
  var result = await client.GetAsync(url);
  
  if (result.StatusCode == System.Net.HttpStatusCode.InternalServerError)
  {
    result.Dump();
    return null;
  }
  else
  {
    var users = result.Content.ReadAsStringAsync();

    return users.Result;
  }
}
{% endhighlight %}

Let's take a closer look at the following line

{% highlight csharp %}
var url = nextUrl ?? $"https://api.appstoreconnect.apple.com/v1/users?limit={count}";
{% endhighlight %}

The users api call will return a set of records, based on the value of of the limit parameter. The maximum number of rows that can be returned is 200. I set the value of count to 100. We have 160 users. The first we call it, we pass in null for nextUrl. 

In the JSON data that is returned, we have an object containing the set of users and a Links.Next property. If there are more users, Links.Next will be set to a URI that will return the next set of users. So our call to get all of the users would like this:

{% highlight csharp linenos %}
private List<User> GetUserList(string token)
{
  List<User> users = new List<User>();
  
  int RequestSize = 100;

  var jsonString = GetUsers(token, RequestSize, null).Result;

  if (jsonString == null)
  {
    return users;
  }

  var appConnectUsers = AppConnectUsers.FromJson(jsonString);
  
  users.AddRange(appConnectUsers.Data
    .Select(s => s.Attributes)
    .Select(s => new User() {
      UserName = s.Username, LastName = s.LastName, FirstName = s.FirstName, Roles = s.Roles.ToList() 
    }));

  while (appConnectUsers.Links.Next != null)
  {
    jsonString = GetUsers(token, RequestSize, appConnectUsers.Links.Next.ToString()).Result;
    appConnectUsers = AppConnectUsers.FromJson(jsonString);

    users.AddRange(appConnectUsers.Data
      .Select(s => s.Attributes)
      .Select(s => new User() { 
        UserName = s.Username, LastName = s.LastName, FirstName = s.FirstName, Roles = s.Roles.ToList() 
      }));
  }

  return users;
}
{% endhighlight %}

The Links.Next property has the value that we use for nextUrl. We use a while loop to keep requesting more data until Links.Next comes back as null. While I could have set the request size to 200 and retrieved all of the users in one shot, at some point we'll have more than 200 and it was better to work out the "paging" now.

When I called GetUserList and dumped out the users returned, I saw a problem. I would always get 160 users. Each and every time.  But there would be duplicates for some users and others would be missing. And it was non-deterministic. Each time I ran it, I would get different results.

One of the query parameters to the list users command is sort. My boss suggested that they probably added sorting and give that a shot. He was wrong about sort being added to the API, but if I sorted by username, I would get all 160 users.  All I needed to do was to change the URL to this:

{% highlight csharp %}
var url = nextUrl ?? $"https://api.appstoreconnect.apple.com/v1/users?limit={count}&sort=username";
{% endhighlight %}

And that solved the problem. All of users came back as expected. No duplicates and none were missing. Apple's documentation for their API has a show API changes widget. The sort command was not new and it was not listed as a requirement. This was just one of those times when you have to keeping poking the code with a sharp stick to see what falls out.