---
title: How to access Apple's App Connect API from C#, Python, and Go. - Part 1
date: 2021-07-09T19:04:41-05:00
categories:
  - Apple
tags:
  - Apple
  - 'C#'
  - Go
  - Python
---
<img loading="lazy" class="aligncenter size-medium" src="https://i0.wp.com/photos.smugmug.com/Blog/n-zwT5d/2021/i-CrcmsQz/0/311d8c2f/L/Apple%20Lock-L.jpg?resize=680%2C510&#038;ssl=1" width="680" height="510"   />

As the [Account Holder](https://developer.apple.com/support/roles/) for my employer&#8217;s Apple App Store account, I get to keep track of who has access to the account. Apple does not do federated logins. Which means no linkage between our Active Directory store and the user accounts associated with the App Store account.

So if someone leaves our company, their Apple Dev account stays active on our team account until we go in and manually remove it. When you have thousands of employees, there&#8217;s no way for a developer like me to know who has left the company. And I shouldn&#8217;t know that, that&#8217;s why we have HR to manage those resources and IT to handle the offboarding.

To make it easier for IT to manage this, I wrote an applet that they could run to see if an employee had an account on on our App Store team. They have a limited API that you can query to get information about your apps and team members. Basically you run that applet and pass in the email address of the employee. It will come back and tell you if that address is a member of the account. 

I had written code in C# that I would run from [LINQpad](https://www.linqpad.net/) to query various App Connect Services in an ad-hoc manner. I made a stand alone version for our IT department and then realized they would need to have the .NET Framework installed. So I decide to port the functionality to Python and Go (aka &#8220;Golang&#8221;). Installing the Python runtime is easy and with Go, I can just create a single executable. I&#8217;m going to split this blog post into 3 parts, each part covering a different language. This will be the C# version. [Part 2](/2021/07/12/how-to-access-apples-app-connect-api-from-c-python-and-go-part-2/) covers Python. The final post in the series, [Part 3](/2021/07/19/how-to-access-apples-app-connect-api-from-c-python-and-go-part-3/), covers a Go implementation..

This version of the applet was written for .NET 5. I wrote and tested the code with Windows 10, but it should compile and run under Linux and MacOS as long as the [.NET 5 SDK](https://dotnet.microsoft.com/download/dotnet/5.0) has been installed. All of the source code can be cloned from [this repository](https://github.com/anotherlab/IsUserinApple-dotnet) on Github.

To query Apple for information about your development account, you need to use their App Store Connect API. It&#8217;s more or less (I&#8217;ve cover that in a bit) documented [here](https://developer.apple.com/app-store-connect/api/).

To authenticate to their API, you&#8217;ll need to generate a signed [JSON Web Token](https://en.wikipedia.org/wiki/JSON_Web_Token) (JWT). You&#8217;ll sign the key with a private key that will be generated on Apple&#8217;s site. They&#8217;ll hold the public key, you&#8217;ll have the private key. This is managed from Apple&#8217;s API portal and you can revoke a private key at any time.

You&#8217;ll need to generate an API key through your App Store Connect account. The JWT needs to be signed with that key or Apple will reject it.

It&#8217;s pretty easy to generate a key. Apple lists the steps here:

  1. Log in to [App Store Connect](https://appstoreconnect.apple.com)
  2. Select **Users and Access**, and then select the **API Keys** tab.
  3. Click **Generate API Key** or the Add (+) button.
  4. Enter a name for the key. 
  5. Under **Access**, select the role for the key.
  6. Click **Generate**.

You&#8217;ll be able to download the API private key once as a .p8 file, Apple does not store your private key. You&#8217;ll want to store it securely. If you lose it, you&#8217;ll have to revoke it and generate a new one.

The API call that we want is [List Users](https://developer.apple.com/documentation/appstoreconnectapi/list_users). List Users will return all of the users along with their associated metadata. By default, it will the first 100 users, you can increase that up to 200 with the limit parameter. If there are more users than can be supplied in the request, the payload will include a link to get the next set of records. You would keep calling the &#8220;next set&#8221; URL until it stops including a &#8220;next set&#8221; URL. 

The JSON shown below is a subset of a fake result set that could be returned by a call to List Users. You get a set of users and the information that we need are fields in the &#8220;attributes&#8221; object, highlighted below:

{% highlight json linenos %}
{
  "data" : [ {
    "type" : "users",
    "id" : "bded051a-7566-4b5f-a7a9-2e461e51eab0",
    "attributes" : {
      "username" : "smithj@fake.com",
      "firstName" : "John",
      "lastName" : "Smith",
      "roles" : [ "APP_MANAGER" ],
      "allAppsVisible" : false,
      "provisioningAllowed" : true
    },
    "relationships" : {
      "visibleApps" : {
        "links" : {
          "self" : "https://api.appstoreconnect.apple.com/v1/users/bded051a-7566-4b5f-a7a9-2e461e51eab0/relationships/visibleApps",
          "related" : "https://api.appstoreconnect.apple.com/v1/users/bded051a-7566-4b5f-a7a9-2e461e51eab0/visibleApps"
        }
      }
    },
    "links" : {
      "self" : "https://api.appstoreconnect.apple.com/v1/users/bded051a-7566-4b5f-a7a9-2e461e51eab0"
    }
  } ],
  "links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/users?limit=50",
    "next" : "https://api.appstoreconnect.apple.com/v1/users?cursor=SomeHideousToken&limit=50"
  },
  "meta" : {
    "paging" : {
      "total" : 150,
      "limit" : 50
    }
  }
}
{% endhighlight %}

For our purposes, we only care about the email address. We walk through the JSON and just add the address to a list. If there is a &#8220;next set&#8221; URL, we call that to get the next set of addresses. Then we can compare those emails with the email addresses of the former employees to see which accounts will need to be removed.

This &#8220;Next&#8221; set URL really isn&#8217;t documented as part of the API call. This caused me a fair amount of angst. The API documentation states that the maximum number of users returned will be 200. We have 150+ on the team and I converned about what would happen when we passed 200 members. I emailed Apple Support and was told that API works and I would get all of the members. But they didn&#8217;t mention how.

I did some searching in Apple&#8217;s forums and the [solution was simple and logical](https://developer.apple.com/forums/thread/652124?answerId=617380022#617380022). In the JSON result set, there is &#8220;links&#8221; object. The links object will have a &#8220;self&#8221; field that contains the URL that was used to make the call. It can have an optional &#8220;next&#8221; field that will contain a URL that will return the next set of data. When you call the API, you will need to check the &#8220;next&#8221; field and call that URL until you no longer receive another &#8220;next&#8221; field in the JSON result set. 

{% highlight json linenos %}
"links" : {
    "self" : "https://api.appstoreconnect.apple.com/v1/users?limit=50",
    "next" : "https://api.appstoreconnect.apple.com/v1/users?cursor=SomeHideousToken&limit=50"
}
{% endhighlight %}

Depending on your needs, you can either parse the data in each set or combine it into one set. It (hint) should documented in a way that would be easier to discover. So getting back to the data, we want the &#8220;username&#8221; from the &#8220;attributes&#8221; object. The name and role data is nice to have, so we&#8217;ll grab it.

{% highlight json linenos %}
"attributes" : {
  "username" : "smithj@fake.com",
  "firstName" : "John",
  "lastName" : "Smith",
  "roles" : [ "APP_MANAGER" ],
  "allAppsVisible" : false,
  "provisioningAllowed" : true
}
{% endhighlight %}

The actual API key data is stored in a separate file that I created named IsUserinApple.json. It will contain the path to your private key file, the key id, and the issuer id for your account. It will look something like this:

{% highlight json linenos %}
{
    "PrivateKeyFile": "path/to.your/privatekey.p8",
    "KeyID": "ABCDEF1234",
    "IssuerID": "d88b7c23-4c26-48fb-9d62-5649f27a25a2"
}
{% endhighlight %}

That file will not be in the repo, you&#8217;ll have to create that one yourself. To get the data, we need to make the API call. We need to pass in a signed JWT. This will be the heaviest lifting for the code. There are three steps:

  1. Create the JWT header
  2. Create the JWT payload
  3. Sign the JWT

For the .NET version, we are going to use a nuget package, [jose-jwt](https://github.com/dvsekhvalnov/jose-jwt), to create and sign the JWT. In the repo for this version of the applet, the code for generated the signed JWT is <a href="https://github.com/anotherlab/IsUserinApple-dotnet/blob/main/AppleJWT.cs" target="_blank" rel="noopener">AppleJWT.cs</a>. The full method is short and we can quickly go over what it does here.

{% highlight csharp linenos %}
/// <summary>
/// Returns a signed JSON Web Token
/// </summary>
/// <param name="keyId">Your private key ID from App Store Connect</param>
/// <param name="issuerID">Your issuer ID from the API Keys page in App Store Connect</param>
/// <param name="privateKey">The private that was generated by Apple, encoded as Base64</param>
/// <returns>Signed JWT</returns>
public string GetToken(string keyId, string issuerID, string privateKey)
{
    // Create the header
    var header = new Dictionary<string, object>()
    {
        {"alg", "ES256"},
        {"kid", keyId},
        {"typ", "JWT"},
    };

    // Create the payload
    var exp = Math.Round((DateTime.UtcNow.AddMinutes(30) - new DateTime(1970, 1, 1, 0, 0, 0)).TotalSeconds, 0);

    var payload = new Dictionary<string, object>()
    {
        {"aud", "appstoreconnect-v1"},
        { "exp", exp },
        { "iss", issuerID }
    };

    // Generate the signing key from the private that has been given to us
    CngKey key = CngKey.Import(Convert.FromBase64String(privateKey), CngKeyBlobFormat.Pkcs8PrivateBlob);
    
    // Generate the signed token
    string token = Jose.JWT.Encode(payload, key, JwsAlgorithm.ES256, header);

    return token;
}
{% endhighlight %}

Lines 11-16 create the header. We set the expiration date at line 19 to 30 minutes into the future with the &#8220;exp&#8221; field. The issuer ID at line 25 comes from your account in App Store Connect. Apple&#8217;s instructions for getting the issuer ID are fairly easy to follow: log in to [App Store Connect](https://appstoreconnect.apple.com/) and: [Select Users and Access](https://appstoreconnect.apple.com/access/users), then Select the [API Keys](https://appstoreconnect.apple.com/access/api) tab. The issuer ID appears near the top of the page. To copy the issuer ID, click Copy next to the ID. The key ID will also come from that page. It will be the key that we described how to create earlier.

  <figure><img src="https://i2.wp.com/photos.smugmug.com/Blog/n-zwT5d/2021/i-4scN9mR/0/8d4a88a7/M/App%20Store%20Connect%20Keys-M.png" alt=""  /><figcaption>The ID values that you will need</figcaption></figure>

The private key will come from the contents of the .p8 file that you downloaded when you created the API key. The .p8 file will have your private key in PEM format. We generate the signing key from the private key at line 29 and then generate a JWT and sign it with that key at line 32.

There is some code in [program.cs](https://github.com/anotherlab/IsUserinApple-dotnet/blob/main/Program.cs) to read the PEM data in the .p8 file and return just the private key needed to sign the JWT. The .p8 file will contain something vaguely like this:

{% highlight plaintext linenos %}
-----BEGIN PRIVATE KEY-----
mfykFJXw6fZBxYR4GYDGKyF27GfFaedt4tvR0jACGwUJxBR2t83wZQZOtoj6PMPC
seSrR0XXVWhEzImSXtLfF8JCyHrvpknEgOzSvqD040LUOvgNrnMvrGQHmPGQwmta
So6GaxJuCk0XxJa2t9mjfu5ERvPCIVwQPgeqcVrroNx2qaXzBteLsyonXOPRxo2w
VnPiPup3
-----END PRIVATE KEY-----
{% endhighlight %}

Our code needs only what exists between the &#8220;BEGIN&#8221; and &#8220;END&#8221; lines. So this code just strips all of that out

{% highlight csharp linenos %}
private string GetPrivateKey(ConfigSettings configSettings)
{
    var certPEM = File.ReadAllText(configSettings.PrivateKeyFile);

    return certPEM
    .Replace("-----BEGIN PRIVATE KEY-----", "")
    .Replace("\n", "")
    .Replace("\r", "")
    .Replace("-----END PRIVATE KEY-----", "");
}
{% endhighlight %}

Now that we have a signed JWT, we can make the API calls. In [AppStoreApi.cs](https://github.com/anotherlab/IsUserinApple-dotnet/blob/main/AppStoreApi.cs), there is a simple wrapper for the List User API call. This unit has a fair amount of code that provides C# models of the JSON data. I used the tools at [app.quicktype.io](https://app.quicktype.io/) to generate the C# models from the JSON data. I wont repeat that code here, it&#8217;s all in repo. But we&#8217;ll review the highlights. We start off with by creating a descendant of [HttpClient](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.httpclient?view=net-5.0&WT.mc_id=DT-MVP-5000200) that will be pass the signed JWT in the headers.

{% highlight csharp linenos %}
public HttpClient client {
    get {
        if (_client == null)
        {
            _client = new HttpClient();    
            _client.DefaultRequestHeaders.Authorization =
                new AuthenticationHeaderValue("Bearer", token);
        }

        return _client;
    }
}
{% endhighlight %}

We&#8217;ll have a public method, FindUser. It will take an email address and return a user object. Or null, if it doesn&#8217;t find a match.

{% highlight csharp linenos %}
public User FindUser(string EmailAddress)
{
    var users = GetAllUsers();

    if (users != null)
    {
        var user = users.Where(s => s.UserName.Equals(EmailAddress, StringComparison.CurrentCultureIgnoreCase)).FirstOrDefault();

        return user;
    }

    return null;
}
{% endhighlight %}

The API call comes in GetAllUsers().

{% highlight csharp linenos %}
public List<User> GetAllUsers()
{
    List<User> users = new List<User>();

    // Find the first 100 users. If there there are more than
    // 100 users, the "Next" property will contain the net URL to call
    var jsonString = GetUsers(100, null).Result;

    if (jsonString == null)
    {
        return null;
    }

    var appConnectUsers = AppConnectUsers.FromJson(jsonString);
    
    users.AddRange(appConnectUsers.Data
        .Select(s => s.Attributes)
        .Select(s => new User() {UserName = s.Username, 
                                    LastName = s.LastName, 
                                    FirstName = s.FirstName, 
                                    Roles = s.Roles.ToList()}) );
    
    while (appConnectUsers.Links.Next != null)
    {
        jsonString = GetUsers(100, appConnectUsers.Links.Next.ToString()).Result;
        appConnectUsers = AppConnectUsers.FromJson(jsonString);
        users.AddRange(appConnectUsers.Data
                .Select(s => s.Attributes)
                .Select(s => new User() { UserName = s.Username, 
                                        LastName = s.LastName, 
                                        FirstName = s.FirstName, 
                                        Roles = s.Roles.ToList() }));
    }

    return users;
}
{% endhighlight %}

GetUsers is the call the App Connect API and will return a JSON result set. The FromJson method is some boilerplate code for deserializing the JSON. Then we use some [LINQ](https://docs.microsoft.com/en-us/dotnet/api/system.linq?view=net-5.0&WT.mc_id=DT-MVP-5000200) code to iterate through the result and pull the fields from the attributes objects. Then we continue to call the API until we no longer have a Links.Next value.

The GetUsers method is pretty straightforward.

{% highlight csharp linenos %}
private async Task<string> GetUsers(int count, string nextUrl)
{
    var url = nextUrl ?? $"https://api.appstoreconnect.apple.com/v1/users?limit={count}";
        
    var result = await client.GetAsync(url);
    
    if (result.StatusCode == System.Net.HttpStatusCode.InternalServerError)
    {
        Console.WriteLine(result.StatusCode.ToString());
        return null;
    }
    else
    {
        var users = result.Content.ReadAsStringAsync();

        return users.Result;
    }
}
{% endhighlight %}

We pass in null for nextUrl for a new search, otherwise it&#8217;s the url for the next set of data. 99.99% of the time you will get a result back. When Apple&#8217;s API is down (and I have seen it happen), you can get a 500 error and this code will catch.

Assuming that you have the [.NET 5 SDK](https://dotnet.microsoft.com/download/dotnet/5.0) installed, you can just grab the code from the repo and then build it. Executing &#8220;dotnet build&#8221; should pull down the required packages and the build the applet. If you are running it with the dotnet command, you would run it as 

{% highlight powershell plain %}
dotnet run -- some.email@company.com
{% endhighlight %}

If that email is a member of the account, the applet wiill come back with something line this:

{% highlight powershell plain %}
Found user: some.email@company.com, Some Email [AppManager, Developer]
{% endhighlight %}

Otherwise something like this:

{% highlight powershell plain %}
User: some.email@company.com not found
{% endhighlight %}

That&#8217;s the core of the code. The rest of the code is some simple stuff for processing the command line parameters and loading the settings. It&#8217;s pretty basic stuff and commented in the repo. Our IT staff now uses a version of this code when they process an employee leaving the company. If that person&#8217;s email shows up, IT passes the email to me and I can remove that user from the account. We may look at ways to have the applet query the results from the App Connect API and then match all of the emails to see if they exist in our Active Directory. In the meantime, this works.

Coming next will be the Python and Go versions of the code.

<hr class="wp-block-separator" />

<p class="has-small-font-size">
  <em>About the image: <br />This image was derived from some open-source images. The image of the wall comes from <a href="https://unsplash.com/@impatrickt">Patrick Tomasso via Unsplash</a>. The Apple lock logo comes from Apple, which retains all rights to its artwork. The people icon was created by <a href="https://thenounproject.com/search/?q=people&i=165313">Monika from the Noun Project</a>.</em>
</p>
