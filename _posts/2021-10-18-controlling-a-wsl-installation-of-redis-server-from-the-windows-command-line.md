---
title: Controlling a WSL installation of redis-server from the Windows command line
date: 2021-10-18T23:53:13-05:00
excerpt: Some shortcuts accessing redis-server running under WSL via PowerShell
categories:
  - Coding
  - Linux
tags:
  - linux
  - Powershell
  - redis
  - wsl
---
If you like using [redis](https://redis.io/) for web site caching and you are writing and testing code locally from Windows, you&#8217;ll want to figure out how to run a local instance of redis-server. You have a few options. You can run it from another machine that&#8217;s running something vaguely Linux-like or MacOS. You can run it from a Docker container under Windows. Or you can run it directly from <a href="http://Windows SubSystem (WSL) for Linux" data-wplink-url-error="true">Windows SubSystem (WSL) for Linux</a>.

For the last few years, Windows (10, 11, Server 2019) comes with a compatibility layer that lets you run Linux binary executables. The current version is WSL 2, but I&#8217;m just going to refer to it as WSL. If you don&#8217;t have installed already, just run the following command from an elevated shell (run as administrator)

{% highlight text %}
wsl --install
{% endhighlight %}

<figure> 
<img src="https://i2.wp.com/photos.smugmug.com/Blog/n-zwT5d/2021/i-pTtQzxz/0/0a5988c8/L/02%20-%20wsl-install-L.png" alt="Installing WSl via command line"  /> <figcaption>Installing WSl via command line</figcaption></figure> 

It will install the bits that you need and then ask you to reboot your machine. For more information about installing and configuring WSL, Microsoft has some really good documentation at [Install WSL](https://docs.microsoft.com/en-us/windows/wsl/install).

The default Linux distribution for WSL is Ubuntu. After you reboot, you may see a Ubuntu shell for a while as Windows installs the bits that you need. It will churn for a bit and then ask you for a username and password. That password will be your sudo (user root) password. One that is done, you should see something like this.<figure>

<figure><img src="https://i2.wp.com/photos.smugmug.com/Blog/n-zwT5d/2021/i-43gLWHP/0/54984ae6/L/02%20-%20ubuntu-install-L.png" alt="Final step of installing WSL is configuring the default Linux distribution"  /> <figcaption>Final step of installing WSL is configuring the default Linux distribution</figcaption></figure> 

The next thing to do is to install redis-server. We can install redis vis [apt-get](https://en.wikipedia.org/wiki/APT_(software)), but before we do that, we need to update apt-get and remove some of the new install shininess off.

{% highlight text %}
sudo apt-get update
sudo apt-get upgrade
{% endhighlight %}

After updating apt-get, you&#8217;ll want to upgrade it. Confusing? Sort of. Update is updating the instance of apt-get, upgrade is updating all of the packages that were installed via apt-get. After that has finished, you can install redis-server

{% highlight text %}
sudo apt-get install redis-server
{% endhighlight %}

There will be some churn and finally, it be installed. Out of the box, redis will not be running. My personal preference is to only run redis when I&#8217;m actually using it for development. So I Iike to start and stop it from the command line. Here are commands that you need to know:

{% highlight text %}
sudo service redis-server status
sudo service redis-server start
sudo service redis-server stop
{% endhighlight %}

I&#8217;ll start up redis with the service start command, and it will come back with a message that redis is starting. And you can use the service status command to verify that it&#8217;s running. The acid test is to connect to redis and see if it&#8217;s working. You can use the redis-cli tool to set and get a cache value. You should see something like this.

<figure><img src="https://i2.wp.com/photos.smugmug.com/Blog/n-zwT5d/2021/i-vLhVGKK/0/6aaf4c9d/O/04%20-%20redis-cli.png" alt="Running redis-cli from the Ubuntu shell"  /> <figcaption>Running redis-cli from the Ubuntu shell</figcaption></figure> 

So now redis-server is running. If you close the shell and open up a new one, it will still be running. If you restart WSL or Windows, then it wont be running. Now you can always pop open an Ubuntu shell and start redis-server, but you can do it from a Windows command line

{% highlight text %}
wsl sudo service redis-server status
{% endhighlight %}

<figure><img src="https://i2.wp.com/photos.smugmug.com/Blog/n-zwT5d/2021/i-ffr3dZN/0/71f62819/O/05%20-%20redis-pwsh.png" alt="Running redis commands from PowerShell"  /><figcaption>Running redis commands from PowerShell</figcaption></figure> 

From the screenshot, you can see that WSL passed along the sudo service command to Ubunto. And because I used sudo, I was prompted for the root password. And it returned the same message that I would see from the Ubuntu shell. Since I only have Ubunto installed, that was the default Linux that received the command. If you have multiple distributions installed, you would use &#8220;wsl -d DistributionName&#8221;. You can get the names of the installed distributions with the &#8220;wsl -l&#8221; command. Unlike from the Linux shell, each time I invoke &#8220;sudo&#8221;, I&#8217;m prompted for the password. In the Linux shell, you are prompted just the first time you call sudo in a terminal session.

Having to use the root password over and over again can be tedious on a development box. There is a way around that. You can add a file to the /etc/sudoers.d folder in the Linux distribution and remove the root password requirement for the redis-server service. From the Linux shell do the following

{% highlight text %}
cd /etc/sudoers.d
sudo sh
echo "%sudo ALL=(ALL) NOPASSWD: /usr/sbin/service redis-server *" >> allowed-services
sudo chmod 0440 allowed-services
exit
{% endhighlight %}

<figure><img src="https://i1.wp.com/photos.smugmug.com/Blog/n-zwT5d/2021/i-bdhLSQW/0/003b70be/O/06%20-%20sudoers.png" alt=""  /> </figure> 

The first thing we do is make /etc/sudoers.d the current folder. Then we use &#8220;sudo sh&#8221; to gain root access. You need root access to work with this folder. The echo line basically says that you can invoke sudo with no password for redis-server and writes that setting to a file named allowed-services. The file name allowed-services is arbitrary, I picked it because it made sense to me. There is a file in the sudoers.d folder named README, it will explain what the file name restrictions are.

The chmod 0440 command sets the permissions to read-only for the root account and is required for sudoers.d. This allows us to remove the sudo password requirement for redis-server and only for redis-server. Now we can go back to the Windows shell and run the wsl commands without being prompted.

You can even run the redis-cli tool from powershell&#8230;

<figure>
<img src="https://i2.wp.com/photos.smugmug.com/Blog/n-zwT5d/2021/i-5jWGFRF/0/c4e9ba5e/O/07%20-%20redis-pwsh.png" alt="Redis from PowerShell, no password"  />
<figcaption>Redis from PowerShell, no password</figcaption>
</figure> 

The Windows Subsystem for Linux is one of the hidden gems for developers. And this gem sparkles&#8230;

**Bonus Round!**

Because I&#8217;m lazy, I created shortcuts in my PowerShell profile. I added the following functions:

{% highlight text %}
function redstat {wsl sudo service redis-server status}
function redstart {wsl sudo service redis-server start}
{% endhighlight %}

And now I can just check the redis-server status via &#8220;redstat&#8221;
<figure>
<img src="https://i0.wp.com/photos.smugmug.com/Blog/n-zwT5d/2021/i-MBk5v8J/0/afa5b1b0/O/08-redstat.png" alt="" /> 
</figure>
**Extra Bonus Round!**

If you would like to have redis startup when Windows boots up, you just need a couple of extra steps. You just need to create a batch file that starts up redis.

In your Windows startup folder, create a batch file. If you press Win+R and type shell:startup, that will open up and instance of Windows Explorer in the user startup foider.  From the command line the following will place you into the same folder.
  {% highlight text %}
  cd %APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup
  {% endhighlight %}
Create a batch file in that folder. I used "start redis.cmd", any name that the OS will recgize as a batch file will work. In that file, add the following line:
  {% highlight text %}
  wsl sudo service redis-server start
  {% endhighlight %}

The next time you reboot, redis will be started.