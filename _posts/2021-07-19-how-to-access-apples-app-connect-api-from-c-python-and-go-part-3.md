---
id: 3454
title: 'How to access Apple&#8217;s App Connect API from C#, Python, and Go. &#8211; Part 3'
date: 2021-07-19T08:28:15-05:00
author: Chris Miller
layout: post
guid: https://rajapet.com/?p=3454
permalink: /2021/07/19/how-to-access-apples-app-connect-api-from-c-python-and-go-part-3/
spay_email:
  - ""
categories:
  - Apple
tags:
  - Apple
  - 'C#'
  - Go
  - Python
---
<figure class="wp-block-image size-large"><img src="https://i1.wp.com/photos.smugmug.com/Blog/n-zwT5d/2021/i-MdwkwLM/0/e733f438/L/Apple%20Lock%20Purple-L.jpg?w=680&#038;ssl=1" alt="" data-recalc-dims="1" /></figure> 

In my [first post](https://rajapet.com/2021/07/09/how-to-access-apples-app-connect-api-from-c-python-and-go-part-1/), I wrote about a need to query my company&#8217;s membership list from our Apple app store development account. In that post, I used C# to query Apple&#8217;s API. [Part 2](https://rajapet.com/2021/07/12/how-to-access-apples-app-connect-api-from-c-python-and-go-part-2/) covered the Python version. For our final installment, we&#8217;ll cover how to accomplish the same task with [Go](https://golang.org/).

As with the C# and Python versions, we&#8217;ll need to create a signed Javascript Web Token (JWT) and then make some API calls.&nbsp; I have the code in a Github repository. You can clone it from [here](https://github.com/anotherlab/IsUserInApple-golang). As with the C# project, the code is spread over a couple of modules.&nbsp;

The code should be portable across platforms. I used Go 1.13.2 on Windows. If you don&#8217;t have Go installed, you can grab it from the download page at [golang.org](https://golang.org/dl/). This would be a good place to mention that the only experience that I have with Go is what I learned from writing this applet. I&#8217;m pretty comfortable with C#, but everything that I know about Python and Go came from writing this code.

That disclaimer in place, after you install Go, you can grab the code from the [repository](https://github.com/anotherlab/IsUserInApple-golang) and follow along. As with the other projects, we use a 3rd party library to generate and sign the Javascript Web Token (JWT). When I wrote the code a couple of months ago, I used dgrijalva&#8217;s [jwt-go](https://github.com/dgrijalva/jwt-go) library. It&#8217;s no longer being maintained and it recomends to use a community supported clone of that project, [golang-jwt/jwt](https://github.com/golang-jwt/jwt). While writing this blog post, I updated the code to use the community supported project.

<div>
  <div>
    If you clone the code from my repo, the jwt library should get downloaded when you build the code. If it doesn&#8217;t you can install it the following command
  </div>
</div>

<pre class="wp-block-code"><code>go get github.com/golang-jwt/jwt</code></pre>

Before we run the code, lets take a tour of the code. The entry point is the module [IsUserInApple.go](https://github.com/anotherlab/IsUserInApple-golang/blob/main/AppleStoreApi.go). You can follow along with the code from the repo. It will differ from the C# and Python versions by having named command line parameters. We start with the following code

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: csharp; title: ; notranslate" title="">
package main

import (
	"flag"
	"fmt"
	"os"
	"path/filepath"
)

func main() {
	// Define command line options
	configPtr := flag.String("config", "./IsUserInApple.json", "Configuration file")
	usernamePtr := flag.String("username", "", "Username to find (in quotes)")

	flag.Parse()

	var userName string = *usernamePtr
	var ConfigFileName string = *configPtr
</pre>
</div>

At line 4, we import the [flag](https://pkg.go.dev/flag) module. This module makes it simple to define and read command line parameters. We&#8217;ll define 2 parameters, one for the name of the config file (line 12), the second for the name to match (line 13). For our code, we&#8217;ll define them as string variables. We pass in the name of the command line parameter, default value, and the help text.

After defining the parameters, we call [flag.Parse()](https://pkg.go.dev/flag#Parse) to parse the command line parameters that are being passed in. Lines 17-18 assign the flag values to string variables. This code could probably be written with less code, but it works and it&#8217;s readable. The next bit of code checks to see if a username was passed. If it doesn&#8217;t, it prints the command line help and then quietly dies a good death.

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: csharp; title: ; notranslate" title="">
if len(userName) == 0 {
	fmt.Println("Please specify an email address to match (in quotes)")
	flag.PrintDefaults()
	os.Exit(1)
}
</pre>
</div>

The next few lines check to see if a config file was specified.

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: plain; title: ; notranslate" title="">
if len(ConfigFileName) == 0 {
	ex, err := os.Executable()
	if err != nil {
		panic(err)
	}
	ConfigFileName = filepath.Join(filepath.Dir(ex), "IsUserInApple.json")
}

if _, err := os.Stat(ConfigFileName); os.IsNotExist(err) {
	fmt.Println(err)
	os.Exit(2)
}
</pre>
</div>

At line 1, we see if a file has been specified. It hasn&#8217;t been specified, then we want to look in the folder that code is running from from for a file named IsUserInApple.json.  The [os.Executable()](https://pkg.go.dev/os#Executable) method will return the full path for the running code, or an error message if something went wrong. If that happens, we abandon ship with [panic()](https://gobyexample.com/panic).

If you are new to Go, it&#8217;s a little wierd to see both a return value and error message on the left side of a function call. But you get used to it after a while. And it&#8217;s a very clean way of getting errors back from a method call. After getting the path, we extract the directory and concatenate the name of the config file.  At line 9, we check to see if the file exists or die trying.

At this point we have a filename for the configuration file and we can attempt to read it.

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: plain; title: ; notranslate" title="">
fmt.Println("Looking for " + userName)

config, err := ReadConfig(ConfigFileName)
</pre>
</div>

Time to dive into the ReadConfig() method. That code is in the [AppleJWT.go](https://github.com/anotherlab/IsUserInApple-golang/blob/main/AppleJWT.go) module. It&#8217;s not the cleanest separation of code, but just roll with it. We have a bunch of fun things going on here.&nbsp; First things first are the imports:

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: csharp; title: ; notranslate" title="">
import (
	"crypto/ecdsa"
	"crypto/x509"
	"encoding/json"
	"encoding/pem"
	"fmt"
	"io/ioutil"
	"log"
	"time"

	"github.com/golang-jwt/jwt"
)
</pre>
</div>

The first 8 imports are modules that come with Go. The crypto modules are used for the JWT signing. The encoding modules let us read and parse JSON and PEM data. The last module is the external library that will be pulled directly from Github.

Now we&#8217;ll define an object to contain the JSON data from the config file. This is a pretty simple object:

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: csharp; title: ; notranslate" title="">
type ConfigSettings struct {
	PrivateKeyFile string `json:"PrivateKeyFile"`
	KeyID          string `json:"KeyID"`
	IssuerID       string `json:"IssuerID"`
}
</pre>
</div>

That will map to the JSON format of the config file, which will look like this

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: jscript; title: ; notranslate" title="">
{
    "PrivateKeyFile": "path/to.your/privatekey.p8",
    "KeyID": "ABCDEF1234",
    "IssuerID": "d88b7c23-4c26-48fb-9d62-5649f27a25a2"
}
</pre>
</div>

There are some handy online tools from converting JSON data to Go structs. I have used [JSON-to-Go](https://mholt.github.io/json-to-go/) and [transform.tools](https://transform.tools/json-to-go), they both work pretty well. The JSON-to-Go tool gives you the option of using inline type definitions or separate structs for each type. After that we have the ReadConfig method

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: csharp; title: ; notranslate" title="">
func ReadConfig(ConfigFileName string) (*ConfigSettings, error) {
	file, err := ioutil.ReadFile(ConfigFileName)

	if err != nil {
		return nil, err
	}

	config := new(ConfigSettings)

	err = json.Unmarshal(&#91;]byte(file), &config)

	return config, err
}
</pre>
</div>

Line 1 defines the parameters, the name of the config file, and an error variable. Then we read the file at line 2 with the [ReadFile](https://pkg.go.dev/io/ioutil#ReadFile) method. If it fails, we return the error. At line 8, we create a new instance of the ConfigSettings struct that will contain our settings. Then at line 10, we use the [Unmarshal()](https://pkg.go.dev/encoding/json#Unmarshal) method to parse the JSON data into our ConfigSettings struct.

That brings us back to our main method.&nbsp;

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: csharp; title: ; notranslate" title="">
if err != nil {
	fmt.Println(err)
	os.Exit(3)
}

CheckUserList(config, userName)
</pre>
</div>

Skipping over error checking code, we now have the method that will ties this all together for us. Now we can dive in to CheckUserList() defined in [AppleStoreApi.go](https://github.com/anotherlab/IsUserInApple-golang/blob/main/AppleStoreApi.go). At the top of module, we have some structs defined.

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: csharp; title: ; notranslate" title="">
type AppConnectUsers = struct {
	Data  &#91;]Datum              `json:"data"`
	Links AppConnectUsersLinks `json:"links"`
}

type Datum = struct {
	Type       string     `json:"type"`
	Attributes Attributes `json:"attributes"`
}

type Attributes = struct {
	Username  string   `json:"username"`
	FirstName string   `json:"firstName"`
	LastName  string   `json:"lastName"`
	Roles     &#91;]string `json:"roles"`
}

type AppConnectUsersLinks = struct {
	Self string `json:"self"`
	Next string `json:"next"`
}

type AppConnectErrors struct {
	Errors &#91;]struct {
		Status string `json:"status"`
		Code   string `json:"code"`
		Title  string `json:"title"`
		Detail string `json:"detail"`
	} `json:"errors"`
}
</pre>
</div>

The AppConnectUsers, Datum, Attributes, and AppConnectUsersLinks structs define the JSON data that is returned by the List Users API call. If you look back at [Part 1](https://rajapet.com/2021/07/09/how-to-access-apples-app-connect-api-from-c-python-and-go-part-1/), the JSON document returned by List Users has a lot more in it. We only need to define structs to use the data members that we actually care about. Since this is a read only API call, we can let Unmarshall deserialize only the fields that we will use and it will discard the rest.

We have a second object called AppConnectErrors, with a very different structure. If the API call fails from something happening on Apple&#8217;s end, the API will send back a very different JSON document. The following is an example of the JSON that Apple sends back when the API is not available:

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: jscript; title: ; notranslate" title="">
{
	"errors": &#91;{
		"status": "500",
		"code": "UNEXPECTED_ERROR",
		"title": "An unexpected error occurred.",
		"detail": "An unexpected error occurred on the server side. If this issue continues, contact us at https://developer.apple.com/contact/."
	}]
}
</pre>
</div>

We&#8217;ll cover how to handle that error data later on. The CheckUserList method has a lot going on so we&#8217;ll do this in parts.

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: csharp; title: ; notranslate" title="">
func CheckUserList(config *ConfigSettings, Username string) {
	token, err := CreateAppleJWT(config)
	if err != nil {
		fmt.Println(err)
	}

	client := &http.Client{}

	var nextUrl string = "https://api.appstoreconnect.apple.com/v1/users?limit=100"
</pre>
</div>

The first thing is that we call CreateAppleJWT in AppleJWT.go to create the signed JWT. Now we&#8217;ll jump into that.

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: csharp; title: ; notranslate" title="">
func CreateAppleJWT(settings *ConfigSettings) (string, error) {
	bytes, err := ioutil.ReadFile(settings.PrivateKeyFile)

	if err != nil {
		fmt.Println(err)
	}

	x509Encoded, _ := pem.Decode(bytes)

	parsedKey, err := x509.ParsePKCS8PrivateKey(x509Encoded.Bytes)

	if err != nil {
		log.Fatal(err)
	}

	ecdsaPrivateKey, ok := parsedKey.(*ecdsa.PrivateKey)

	if !ok {
		panic("not ecdsa private key")
	}

	token := jwt.NewWithClaims(jwt.SigningMethodES256, jwt.MapClaims{
		"iss": settings.IssuerID,
		"exp": time.Now().Add(time.Minute * 20).Unix(),
		"aud": "appstoreconnect-v1",
	})

	token.Header&#91;"kid"] = settings.KeyID

	tokenString, err := token.SignedString(ecdsaPrivateKey)

	if err != nil {
		log.Fatal(err)
	}

	return tokenString, nil
}
</pre>
</div>

At line 2, we read the private key file. Lines 8 through 16 parse the PEM data and come out with the private key in a format that we can use for signing. At line 22, we create the token with an expiration timestamp of [20 minutes into the future](https://tenor.com/view/random-weird-reaction-max-headroom-gif-13720275). We set the token header kid field to our KeyID. We sign the token at line 30 with our private key and pass it back. Getting the token signed correctly was the hardest part of writing this code. Getting back to CheckUserList&#8230;

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: csharp; title: ; notranslate" title="">
client := &http.Client{}

var nextUrl string = "https://api.appstoreconnect.apple.com/v1/users?limit=100"

var FoundMatch = false

for {
	req, err := http.NewRequest("GET", nextUrl, nil)
	if err != nil {
		fmt.Print(err.Error())
		os.Exit(3)
	}

	req.Header.Add("Authorization", "Bearer "+token)

	resp, err := client.Do(req)
	if err != nil {
		log.Println("Error on response.\n&#91;ERROR] -", err)
		os.Exit(3)
	}

	defer resp.Body.Close()

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		log.Println("Error while reading the response bytes:", err)
		os.Exit(3)
	}
</pre>
</div>

We start with a new instance of an [http](https://pkg.go.dev/net/http#pkg-overview) Client. We initialize nextUrl with the initial API url. And we set FoundMatch to false. Now we start looping. At line 8, we new up a new request and add our token at line 14. Line 16 is where we call the API and we wait at line 22 to get the response back.

We read the entire body into a byte array at line 24. Now we can start with the parsing. The first thing to do is see if the API returned an error document instead of the list of users.

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: csharp; title: ; notranslate" title="">
var appConnectErrors AppConnectErrors
err = json.Unmarshal(body, &appConnectErrors)
if err != nil {
	log.Println("Error while deserializing the response bytes:", err)
	os.Exit(3)
}

// If there is an error object in the body, print it and exit
if len(appConnectErrors.Errors) &gt; 0 {
	firstError := appConnectErrors.Errors&#91;0]
	log.Println("Status:", firstError.Status)
	log.Println("Error accessing API:", firstError.Detail)
	os.Exit(4)
}
</pre>
</div>

We new up an instance the AppConnectError struct as appConnectErrors. Then we unmarshal the body into appConnectErrors. Next we check the length of the Errors array In appConnectErrors. If the API returns users, the Errors object will not be there and the length will be 0.

If the length of Errors is greater than 0, then &#8220;[Houston, we have a problem](https://tenor.com/4V3j.gif)&#8220;. While Errors is an array and could have more than one error, we don&#8217;t care about anything after the first error. So we get the first (and probably only) error. Then we log the error status, which will be a numeric code, and the full text message. And then we die with an error code of 4.

Otherwise we keep going&#8230;

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: csharp; title: ; notranslate" title="">
var appConnectUsers AppConnectUsers

err = json.Unmarshal(body, &appConnectUsers)
if err != nil {
	log.Println("Error while deserializing the response bytes:", err)
	os.Exit(3)
}

for _, s := range appConnectUsers.Data {
	FoundMatch = strings.EqualFold(s.Attributes.Username, Username)

	if FoundMatch {
		fmt.Printf("Found %s, %s %s, %s\n",
			s.Attributes.Username,
			s.Attributes.FirstName,
			s.Attributes.LastName,
			strings.Join(s.Attributes.Roles, ", "))
		break
	}
}

if FoundMatch {
	break
}

nextUrl = appConnectUsers.Links.Next

if len(nextUrl) == 0 {
	break
}
</pre>
</div>

As with the error struct, we new up a AppConnectUsers struct named appConnectUsers. We unmarshal the JSON data into the struct. At line 9, we iterate through the list of users stored in the Data array. We set FoundMatch at line 10 to true if the username matches. If we have a match, we print that match to the console and use break to exit the for..range loop

Next we break out of the forever loop if we have a match. Otherwise we check to see if we have a next link. If we do, we keep looping, otherwise we are done looping. And we end with an message if we didn&#8217;t have a match.&nbsp;

If you cloned the code from the repo and created your own config file (refer back to [Part 1](https://rajapet.com/2021/07/09/how-to-access-apples-app-connect-api-from-c-python-and-go-part-1/) for that part), you can now compile and run the code. You would compile the applet from your terminal of choice with the following command:

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: plain; gutter: false; title: ; notranslate" title="">
go build .
</pre>
</div>

If you want the smallest executable, build it with the following options:

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: plain; gutter: false; title: ; notranslate" title="">
go build -ldflags="-s -w" .
</pre>
</div>

And then you can compress the resulting executable with a tool like [upx](https://upx.github.io/). You would need to run IsUserInApple with a required command line parameter, the email to look for. If you leave it out, you will get an error message telling you what is needed. Remember that the IsUserInApple.json file needs to be in the same folder as the executable if you don&#8217;t use the second optional command line parameter that will let you specify the name of the config file.

If you are running it with the go command, you would run it as

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: plain; gutter: false; title: ; notranslate" title="">
go run . -username "some.email@company.com"
</pre>
</div>

or

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: plain; gutter: false; title: ; notranslate" title="">
go run . -username "some.email@company.com" -config "IsUserInApple.json"
</pre>
</div>

If you are running it as the compiled executable, you would run it as&nbsp;

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: plain; gutter: false; title: ; notranslate" title="">
IsUserInApple -username "some.email@company.com
</pre>
</div>

You&#8217;ll back something like this:

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: plain; gutter: false; title: ; notranslate" title="">
Looking for some.email@company.com
Found some.email@company.com, Some Email, APP_MANAGER
</pre>
</div>

or&#8230;.

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: plain; gutter: false; title: ; notranslate" title="">
Looking for some.email@company.com
No match for some.email@company.com
</pre>
</div>

On the rare situation that the API is not available and Apple returns an error document, you&#8217;ll see something like this:

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: plain; gutter: false; title: ; notranslate" title="">
Looking for some.email@company.com
2021/07/13 23:26:19 Status: 500
2021/07/13 23:26:19 Error accessing API: An unexpected error occurred on the server side. If this issue continues, contact us at https://developer.apple.com/contact/.
exit status 4
</pre>
</div>

If you run it without&nbsp; the -username parameter or pass is &#8220;-h&#8221; or &#8220;&#8211;help&#8221;, you will get back the usuage help messages

<div class="wp-block-syntaxhighlighter-code ">
  <pre class="brush: plain; gutter: false; title: ; notranslate" title="">
go run .                                                                  
Please specify an email address to match (in quotes)
  -config string
        Configuration file (default "./IsUserInApple.json")
  -username string
        Username to find (in quotes)

go run . -h
Usage of C:\Users\anoth\AppData\Local\Temp\go-build2936985627\b001\exe\IsUserInApple.exe:
  -config string
        Configuration file (default "./IsUserInApple.json")
  -username string
        Username to find (in quotes)
</pre>
</div>

That wraps up this series. You can do more than get the team list from the [App Connect API](https://developer.apple.com/documentation/appstoreconnectapi). For example, if you want to track how many devices have been provisioned, there is a Devices API. Lots of access points for DevOps functionality.