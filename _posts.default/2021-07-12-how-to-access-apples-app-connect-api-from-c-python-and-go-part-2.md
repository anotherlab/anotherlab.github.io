---
title: How to access Apple's App Connect API from C#, Python, and Go. - Part 2
date: 2021-07-12T08:02:52-05:00
categories:
  - Apple
tags:
  - Apple
  - 'C#'
  - Go
  - Python
---
<div class="wp-block-image">
  <figure class="aligncenter size-large is-resized"><img loading="lazy" src="https://i1.wp.com/photos.smugmug.com/Blog/n-zwT5d/2021/i-rMG2ZL4/0/c712e41f/L/Apple%20Lock%20Green-L.jpg?resize=680%2C510&#038;ssl=1" alt="" width="680" height="510"  /></figure>
</div>

In my [previous post](/2021/07/09/how-to-access-apples-app-connect-api-from-c-python-and-go-part-1/), I wrote about a need to query my company&#8217;s membership list from our Apple app store development account. In that post, I used C# to query Apple&#8217;s API. In this installment, we&#8217;ll cover how to accomplish the same task with Python. The [final post](/2021/07/19/how-to-access-apples-app-connect-api-from-c-python-and-go-part-3/) will cover a Go version.

As with the C# version, we&#8217;ll need to create a signed Javascript Web Token (JWT) and then make some API calls. As with the C# version, I have the code in a Github repository. You can clone it from [here](https://github.com/anotherlab/IsUserInApple-python). The code is in a script named [IsUserInApple.py](https://github.com/anotherlab/IsUserInApple-python/blob/main/IsUserInApple.py). You can name your script anything that the OS and Python allows, I&#8217;ll be referring to my script as IsUserInApple.py.

I wrote the code using Python 3, version 3.9.2. Unless you are running Windows, the odds are that you have Python 3 installed. If not, you can get it from the good people at [python.org](https://www.python.org/downloads/). This code should work on any platform that supports Python 3. It should also work (potentially with some changes) with Python 2, but I haven&#8217;t tested that. 

This script will use a couple of libraries that you will need to install. To make the HTTPS web requests, we&#8217;ll be using the [Requests](https://docs.python-requests.org/en/master/) library. It [does exactly what it says on the tin](https://youtu.be/OkGaq9xiQZY), &#8220;Requests is an elegant and simple HTTP library for Python, built for human beings&#8221;. It makes the code for calling Apple&#8217; API simple and easy to follow.

The other library is [Authlib](https://docs.authlib.org/en/stable/), a library for working with OAuth and OpenID Connect. It has everything we need to [create and sign our JWT](https://docs.authlib.org/en/stable/jose/jwt.html). While we need to install all of Authlib, we&#8217;ll only being using the jwt module. To install the libraries, you just need to run the pip command like this:


{% highlight powershell %}
pip install requests authlib
{% endhighlight %}

If you are not familar with pip. it&#8217;s the package manager for Python and will be installed when you install Python. If you already have Python installed, then you already have pip installed.

In the folder that you will have the Python script, you will need a configuration file. It performs the same function as the IsUserInApple.json file did in the C# code. It will contain the path to your private key file, the key id, and the issuer id for your account. Please refer back to [Part 1](/2021/07/09/how-to-access-apples-app-connect-api-from-c-python-and-go-part-1/) for how to define these values. Instead of using JSON, I used a simple key/value file and it&#8217;s named IsUserInApple.config. It should use the following format:

{% highlight ini linenos %}
[settings]
private_key = c:/scripts/AuthKey.p8
KEY_ID = ABCDEF1234
ISSUER_ID = d88b7c23-4c26-48fb-9d62-5649f27a25a2
{% endhighlight %}

Now we can go through the code. I&#8217;m going to jump around a bit, you may want to have [the script](https://github.com/anotherlab/IsUserInApple-python/blob/main/IsUserInApple.py) open in another window. After some comments, we start with the following lines:

{% highlight python %}
import requests, time, json, sys, tempfile, os, configparser
from authlib.jose import jwt
{% endhighlight %}

The first line imports the libraries that we&#8217;ll need. The requests library was the 3rd party library that we installed via pip, the rest are libraries included with Python. The next line imports the jwt model from the authlib.jose library. The &#8220;jose&#8221; part of the library name is an acronym for **J**avascript **O**bject **S**igning and **E**ncryption.

The next part of the code are the methods we&#8217;ll define and use to call the API. We&#8217;ll dive into them in a bit. For now, we&#8217;ll jump down to the bottom of the script. We start with

{% highlight python linenos %}
if len(sys.argv) > 1:
    config = configparser.ConfigParser()
    try:
        configPath = os.path.dirname(os.path.abspath(__file__)) + "/IsUserInApple.config"
        config.read(configPath)
    except Exception as e :
        print(str(e))
{% endhighlight %}

Line 1 is saying &#8220;if we have at least one command line parameter after the name of the script&#8230;&#8221;. The next line creates an instance of the [ConfigParser](https://docs.python.org/3/library/configparser.html) class, which will allow us to easily read contents from the IsUserInApple.config configuation file. Starting at line 3, we&#8217;ll use a try/except block to read the config file. We want to read the config file from the same folder as the script. To get that folder name, we call the [abspath](https://docs.python.org/3/library/os.path.html?highlight=abspath#os.path.abspath) method on the \_\_file\_\_ variable. The \_\_file\_\_variable is a &#8220;[dunder](https://www.geeksforgeeks.org/dunder-magic-methods-python/)&#8221; variable in Python and represents the name of the currently running module. [A list of dunder variables](https://docs.python.org/3/reference/datamodel.html#special-method-names) can be found in the Python Docs. The [dirname](https://docs.python.org/3/library/os.path.html#os.path.dirname) method will return the folder part of the file name and then we concatenate that with the name of the config file. And at line 5, we read the config file.

Next, we read the settings into variables with the following code. It&#8217;s pretty much self explanatory.

{% highlight python linenos %}
try:
    private_key = config['settings']['private_key']    
    KEY_ID = config['settings']['KEY_ID']    
    ISSUER_ID = config['settings']['ISSUER_ID']    
except Exception as e :
    print(str(e))
{% endhighlight %}

Next, we have the following code:

{% highlight python linenos %}
if not os.path.isfile(private_key):
    sys.exit("Error missing private key file for JWT")

UserEmail = sys.argv[1].lower()

print('Looking for a match on ' + UserEmail)

token = getToken(KEY_ID, ISSUER_ID, private_key)
{% endhighlight %}

First we check to see if the value provided for private_key is actually a file. Then we set UserEmail to the command line parameter (while converting it to lowercase) and echo that back to the shell. The last line is where we call our getToken method in the script to generate the signed JWT. Now, we&#8217;ll jump to that getToken method.

{% highlight python linenos %}
def getToken(KEY_ID, ISSUER_ID, PATH_TO_KEY):
    EXPIRATION_TIME = int(round(time.time() + (20.0 * 60.0))) # 20 minutes timestamp

    with open(PATH_TO_KEY, 'r') as f:
        PRIVATE_KEY = f.read()

    header = {
        "alg": "ES256",
        "kid": KEY_ID,
        "typ": "JWT"
    }

    payload = {
        "iss": ISSUER_ID,
        "exp": EXPIRATION_TIME,
        "aud": "appstoreconnect-v1"
    }

    # Create and return the JWT
    return jwt.encode(header, payload, PRIVATE_KEY)
{% endhighlight %}

Line 1 defines the name of the method and the parameter names. [No big whoop](https://tenor.com/EVNQ.gif). Line 2 generates the expiration time, [20 minutes into the future](https://youtu.be/8Y7McIX_m-I). At line 4, we read in the private key file. The jwt module [groks](https://efangelist.wordpress.com/2014/07/29/why-smart-young-people-grok-the-word-grok-do-you-grok-grok/) the PEM format, we don&#8217;t have to clean it up like [we did in the C# code](https://github.com/anotherlab/IsUserinApple-dotnet/blob/main/Program.cs#L79). Then line 7 creates the header and line 13 creates the payload. This is nearly identical to the code from the C# version. At line 20, we create and sign the JWT and return to the code that called it. It follows the same logic as the code in the GetToken method from [AppleJWT.cs](https://github.com/anotherlab/IsUserinApple-dotnet/blob/main/AppleJWT.cs). Jumping back to where we called getTokem, we have the following line:

{% highlight python %}
members = getAllUsers(token)
{% endhighlight %}

Now we&#8217;ll dive into the getAllUsers method.

{% highlight python linenos %}
def getAllUsers(token):
    JWT = 'Bearer ' + token.decode()
    URL = 'https://api.appstoreconnect.apple.com/v1/users?limit=100'
    HEAD = {'Authorization': JWT}

    teamMembers = []

    nextURL = URL
    keepGoing = True

    while keepGoing:
        r = requests.get(nextURL, params={}, headers=HEAD)

        y = r.json()

        if 'errors' in y:
            errorCode = y['errors'][0]
            print('Apple returned an HTTP ' + errorCode['status'] + ' code')
            print(errorCode['detail'])
            sys.exit('whoops')

        for i in y['data']:
            teamMembers.append({'username':i['attributes']['username'].lower(), 'roles': ','.join(i['attributes']['roles'])})

        if 'next' in y['links']:
            nextURL = y['links']['next']
        else:
             keepGoing = False

    return teamMembers
{% endhighlight %}

Line 1 defines the method name and parameters. Lines 2-4 sets the [bearer (token) authorization](https://swagger.io/docs/specification/authentication/bearer-authentication/) and the inital URL to call. The next few lines just initialize a few variables and the fun begins at line 11 where we&#8217;ll loop until we are done. At line 12, we use the requests library to make a HTTPS get call. Line 14 assigns the JSON results to our Y variable. The next block of code checks the JSON document for &#8220;errors&#8221;. If Apple&#8217;s API falls down, it will fall down this way.

If there are no errors, we just walk through the &#8220;data&#8221; member of JSON document and add the username and roles for each user to the teamMembers array. When we append the username, we convert it to lowercase. That was we don&#8217;t have to worry about case when we match on the email address. Then we check the see if the &#8220;links&#8221; member of the document has a field named &#8220;next&#8221;. If it does, we use that as the new URL and keep looping. When we don&#8217;t have a &#8220;next&#8221; url, we return the teamMembers array to caller. That takes us back to the bottom of our script again.

{% highlight python linenos %}
    for i in members:
        if i['username'] == UserEmail:
            HasMatch = True
            print('Match on ' + i['username'] + ', Roles: ' + i['roles'])

    if HasMatch == False:
        print('No match')

else:
    sys.exit("Error: Please specify an email address")
{% endhighlight %}

Now we just iterate through the members array and see if the user name matches. We report back on whether we foiund it or not. The last lines are the error message that would be reported if you ran the script without a email address to match on.

That&#8217;s basically all there is to this script. This version doesn&#8217;t deserialize the JSON data into objects, it just parses it as is. It&#8217;s a trade off. Doing it this way uses less code, but you lose some of the discoverability of having the data in object form.

To run it, you would just do something like:

{% highlight powershell %}
python IsUserInApple.py some.email@company.com
{% endhighlight %}

You&#8217;ll either the following if that use is a member of the account:

{% highlight plaintext %}
Looking for a match on some.email@company.com
Match on some.email@company.com, Roles: ADMIN,ACCOUNT_HOLDER
{% endhighlight %}

Or the following if that email doesn&#8217;t provide a match

{% highlight plaintext %}
Looking for a match on some.email@company.com
No match
{% endhighlight %}

Coming up next will be the Go version of this script.

<hr class="wp-block-separator" />

<p class="has-small-font-size">
  <em data-rich-text-format-boundary="true">About the image: <br data-rich-text-line-break="true" />This image was derived from some open-source images. The image of the wall comes from <a href="https://unsplash.com/@impatrickt">Patrick Tomasso via Unsplash</a>. The Apple lock logo comes from Apple, which retains all rights to its artwork. The people icon was created by <a href="https://thenounproject.com/search/?q=people&i=165313">Monika from the Noun Project</a>.</em>
</p>
