---
layout: post
title: "A Toaster NAS? That's Actually Pretty Cool"
description: >-
  Saw a funny image on Facebook of a Toaster NAS, but is it practical?
image:
  path: /assets/images/control_data_6600.jpg
  alt: "Control Data 6600, the speed king of the mid 1960s"
categories: [Hardware, Storage]
tags: [nas, qnap, diy, mini-itx, home-server, backups, retro-computing]
pin: false
comments: true
toc: true
---
No, not this [Nas](https://www.nasirjones.com/). But that Nas is cool too.

## I was on the Facebook the other day...
I saw this image on Facebook ([here](https://www.facebook.com/groups/it.humor.and.memes/posts/24986118957653886/) and repeated), courtesy of [Larry Anda](https://larryanda.au/about/)

![Toaster Nas](/assets/images/toaster-nas.jpg)
_This does look cool_

I don't know if it's actually a 2-bay <abbr title="Network Attached Storage">NAS</abbr> or not. It could just be a couple of drives stuffed into a Kambrook 2-slice toaster. He is a photographer and it's easy to set up.

## What if you actually wanted a Toaster NAS?
You could build your own NAS inside a toaster. It's doable. Probably. You would probably want a mini-ITX motherboard. Something like this:

![Sample mini-ITX motherboard](/assets/images/min-itx-mb.png)
_A sample mini-ITX motherbaord for AMD_

It should fit inside a toaster, but you would probably need a wider toaster. The mini-ITX is a square form factor and the toaster in the image is more of a rectangle. You would need to rip the guts out of the toaster and add ventilation slots in the back and the bottom. Toasters, by definition, are not designed for the airflow needed to keep electronics from overheating. That is less than desirable for anything PC-related.

You don't need a fast CPU. An AMD system with integrated video would be enough for a NAS workload. 8 GB of RAM should be enough. 16 GB if you plan on doing anything above "File Server". 

You will want a big and quiet fan to cool off the drives and motherboard. Then wire up the controls of the toaster to do "things". You would also want to wire drive activity LEDs from the motherboard. Das Blinkenlichts actually have a purpose. When my TS-451+ failed, one of the lights was a very angry red.

To do it right, you would want hot-swappable drive bays where the drives could be slid in and connected to the data and power. You don't want drives rattling around in a toaster. It's just not good for them. My old NAS has little sleds that the drives were screwed into.

![TS-451+ drive sled](/assets/images/ts-451-empty.jpg)
_My previous NAS, a QNAP TS-451+_

With the sleds, the drives slide in and lock into the place. This is the giveaway that this is a joke image. That and mini-ITX size is too wide. Just letting the drives go in the bread slot is going to let a device with high-speed moving parts rest in a cheap metal cage. Noise will ensue. Cables will fall out. It's not a great solution.

NUC-style motherboards are even smaller than mini-ITX, but I think you would probably lose the SATA ports. That defeats the purpose of using large-capacity spinning rust drives for your backups. You could do it with a Raspberry Pi, but I think you would have long-term performance issues

## It's not something I would do but I appreciate the joke
I prefer a turnkey solution for a home NAS. I've been partial to the QNAP 4-bay units. It's part of my [3-2-1 backup strategy](/2026/03/10/backup/). When my [first QNAP](https://www.qnap.com/en-us/product/ts-451+), a TS-451+, had a motherboard failure, I took the drives and slapped them into a [newer model](https://www.qnap.com/en-us/product/ts-464), TS-464, and it was off and running.

![Current NAS](/assets/images/ts-464.jpg)
_My current NAS, a QNAP TS-464-8_

Which is the problem of a toaster NAS. It looks cool, but it's a device with a fixed life span. They do wear out. The motherboard in the TS-451 failed, the data was fine. The first time I booted up the 464 with the drives from the 451, it did take a long time. But you would expect the recovery from a brain transplant to take a while. But it was fine and has been fine.

The other problem is that you need a big ass toaster if you wanted 4 bays. That would take up more space than a commercial 4 bay NAS.  That's a little too much desk space for me to use for a joke.

## About the Cover Image
While a Toaster NAS looks cool, it doesn't have the coolness of old-school computer hardware. This image was of a [Control Data 6600](https://en.wikipedia.org/wiki/CDC_6600). There were no design standards for computers in the early 1960s, they wore their freak flag proudly.

I took this picture at the Living Computers: Museum + Labs in Seattle. Sadly, the LCM+L closed during COVID. I was lucky enough to have visited there a couple of times. They had a lot of cool toys to appreciate and play with.