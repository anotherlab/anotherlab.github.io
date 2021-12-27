---
title: Planning for Wi-Fi
date: 2018-08-03
categories:
  - Uncategorized
---
After 20 years in our existing home, we are getting ready to move to a new home. The new house is still being built and I had CAT6 run to the places where I thought it would matter. Time to plan for Wi-Fi. The new house is a single floor design, with a decent sized basement. Once again, Fios will be our ISP. The [ONT](https://www.verizon.com/support/residential/homephone/service-equipment/ont) will be installed in the basement and at some point, I will build (or hire someone to build) an office in the basement. The plan is to have the Fios router in the basement and run the CAT6 cables to the router. I need the [Fios router](https://www.verizon.com/home/accessories/fios-quantum-gateway/) because cable boxes need it there in order to get their channel guides. The current plan is use a Mesh router setup on the main floor to provide the Wi-Fi. As a router, the Fios router is fine, but for Wi-Fi it&#8217;s pretty much &#8220;meh&#8221;. 

  <img loading="lazy" class="size-medium" src="https://i2.wp.com/photos.smugmug.com/photos/i-3J83drS/0/38776266/Th/i-3J83drS-Th.jpg?resize=150%2C150&#038;ssl=1" width="150" height="150"  />

The Mesh router that I like right now is 

[Eero Pro](https://eero.com/shop/pro-wifi-system) package. You get three Eero routers that work together to provide a true mesh network. The user just sees a single SSID and the device connects to the Eero device that has the best signal. It&#8217;s a tri-band system, using three radios. You have your standard 2.4 and 5 Ghz radios that handle the typical alphabet of 802.11 Wi-Fi channels. And one more 5 Ghz radio that works as a back channel for the Eero devices to talk to each other. 

<figure>
  <img loading="lazy" class="size-medium" src="https://i2.wp.com/photos.smugmug.com/photos/i-z6mhmn2/0/a0ebfc49/S/i-z6mhmn2-S.jpg?resize=400%2C229&#038;ssl=1" width="400" height="229"  />
<figcaption>Eero Pro</figcaption></figure>

With the Eero Pro, one of the routers is defined as the master and the other two are the satellites. If you only have the master wired to the modem (or other ISP provided device), the other two units connect to the master over the back channel. The Pro system can use a wired connection for the back channel. Wired beats wireless for speed and dealing with pesky things like walls. 

<figure><img loading="lazy" class="size-medium" src="https://i0.wp.com/photos.smugmug.com/photos/i-rDRtBVW/0/9693233c/M/i-rDRtBVW-M.jpg?resize=600%2C389&#038;ssl=1" width="600" height="389"  /><figcaption>I like to go fast</figcaption></figure>
I haven&#8217;t decided if I want to run the Eero units as Access Points (AP) or let one be a full router and have a double NATed home network. It will work either way, but running in AP mode will port forwarding simpler. I have a QNAP NAS server and it&#8217;s useful to be able to remote access it from the outside. With a single NAT, it can more or less configure the router to forward the right ports. When you have it double NATed it gets complicated. So why Eero?  It&#8217;s certainly not the cheapest option. There were several things that I looked for a mesh system. 

  * Performance I wanted the biggest bang for the buck for Wi-Fi. I want stuff to work and I want to take advantage that I had the house wired for Ethernet.
  * Appearance I don&#8217;t want hardware with an ungodly number of antennas or something mounted to the ceiling like a smoke alarm on steroids.
  * Support Ideally, you shouldn&#8217;t have to worry about support. But this is the Achilles Heel for the big players in the consumer space. In the reviews that appear in the usual places, the Eero devices usually come out on top or near the top for performance. In the reviews that I have seen, the 

[Netgear Orbi](https://www.netgear.com/orbi/) devices tend to be the fastest. But your mileage may vary. The Orbi devices tended to be bigger and their support, well, didn&#8217;t get rated as high as the Eero devices. 

<figure><img loading="lazy" class="size-medium" src="https://i1.wp.com/photos.smugmug.com/photos/i-CfHG6PQ/0/9558db8e/S/i-CfHG6PQ-S.png?resize=300%2C300&#038;ssl=1" width="300" height="300"  /><figcaption>The Netgear Orbi</figcaption></figure>
The Orbi was probably my second choice, but I think the Eero will work better for my setup. The Orbi router and satellite do come with a generous number of Ethernet ports. That would be the only thing that I would ding the Eero on. More importantly, frrom what I saw on in the Eero support forum and on Reddit, it looked like people were happy with them. 

<figure><img loading="lazy" class="size-medium" src="https://i1.wp.com/photos.smugmug.com/photos/i-zD7bnGr/0/2efa301c/M/i-zD7bnGr-M.jpg?resize=450%2C450&#038;ssl=1" width="450" height="450"  /><figcaption>It's the Borg, with rabbit ears</figcaption></figure>
Some of my more technically bent friends suggested that I look at the Ubiquiti product line. There are two separate and very different consumer product lines. The Amplifi system is a router in the shape of small cube and two satellites. The satellites are ugly little things with antennas that need to oriented for best reception. The performance didn&#8217;t come anywhere near the Netgear or Eero offerings. 

<figure><img loading="lazy" class="size-medium" src="https://i1.wp.com/photos.smugmug.com/photos/i-mVznhQn/0/43a443dd/S/i-mVznhQn-S.png?resize=371%2C300&#038;ssl=1" width="371" height="300"  /><figcaption>Glowing Frisbee mounted to ceiling</figcaption></figure>
Ubiquiti also has the Unifi line of access points. They are really cool and the management end is very powerful. But I didn&#8217;t want glowing frisbees mounted to my ceiling. And the 

[POE](https://en.wikipedia.org/wiki/Power_over_Ethernet) thing means all new switches to power the APs. They are really good technology, I just didn&#8217;t want to deal with it. So I&#8217;m about a month away from moving in and playing with the Eeros. It will be interesting to see what kind of performance I get out of them.
