---
id: 2883
title: A Xamarin wrapper for the ACS USB library for Android
date: 2018-07-03T01:19:49-05:00
author: Chris Miller
layout: post
guid: http://rajapet.com/?p=2883
permalink: /2018/07/03/a-xamarin-wrapper-for-the-acs-usb-library-for-android/
categories:
  - Uncategorized
  - Xamarin
---
<div style="width: 310px" class="wp-caption alignnone">
  <a href="https://www.acs.com.hk/en/products/3/acr122u-usb-nfc-reader/"><img loading="lazy" class="size-medium" src="https://i1.wp.com/photos.smugmug.com/photos/i-g4GgjFj/0/fa5e2c6c/S/i-g4GgjFj-S.png?resize=300%2C300&#038;ssl=1" alt="ACS ACR122U USB NFC Reader" width="300" height="300"  /></a>
  
  <p class="wp-caption-text">
    ACS ACR122U USB NFC Reader
  </p>
</div>

A while back, we were using RFID readers made by ACS.  They make a number of decent readers and we used one of the USB models, [ACR1220U](https://www.acs.com.hk/en/products/3/acr122u-usb-nfc-reader/), with our bespoke Android tablet.  To communicate to the reader, ACS provides libraries for Windows and Android.  The Android library comes with a .jar file and some sample (but very limited) code.  The demo showed how to connect to the reader, but didn&#8217;t have that much for getting information from the reader.

The ACS reader follows the SmartCard standards.  Their library provides the low level access to the reader.  It&#8217;s up to the consumer of the library to write the code that actual sends and receives data from the RFID reader.  If you are working with a SmartCard reader, then you&#8217;ll need to know how to create [APDU](https://en.wikipedia.org/wiki/Smart_card_application_protocol_data_unit) packets.  An APDU, application protocol data unit, is the command packet that is sent from the reader to the card, and from the card to the reader.  When you use this reader, your code is responsible for creating and sending the packets.

The logic that I used more or less follows this flow:

  * Reader signals the application that a card has been detected (or no longer detected)
  * Applicate tells the reader to a warm reset of the card
  * Application tells the reader to set the communications protocol for talking to the card
  * Application tells the reader to transmit the APDU command to get the unique identifier (UID) from the card
  * The response from the transmit command will have the UID from the card.

And that&#8217;s just to get the UID from a card.  If you are trying to read a [NDEF](https://gototags.com/nfc/ndef/) packet, then you have a lot more work to do.  NDEF records are stored differently, depending on what kind of card that you are reading.  If you are using RFID data from cards with the built-in NFC support that Android provides for hardware that comes with the device, you are benefiting by the low level code being handled for you.

For the last .5 decade, we&#8217;ve been using Xamarin for our Android coding.  To use the ACS reader, I created a Xamarin wrapper library for their Java library.  It basically takes and embeds the .jar file and provides a nice .NET API to their library.  I then took their sample library and did a more or less straight port from Java to C#.  If you grab that repo from Github, you&#8217;ll get the library and and the demo app.  It was created with Visual Studio on Windows, but should work on the Mac.  Should being the code word for &#8220;I didn&#8217;t do anything that was platform specific, but I didn&#8217;t test it on the Mac.&#8221;

The results of that wrapper/conversion are up on Github.  You can grab it [here](https://github.com/anotherlab/Xamarin-ACS-Smartcard-USB). The .jar file that the library is compiled with is included in the repository. It is part of an API kit that should be downloaded from <a href="https://www.acs.com.hk/en/mobile-support/" rel="nofollow">https://www.acs.com.hk/en/mobile-support/</a>. The API kit includes the API documentation in HTML format.

The library does not have the APDU code to get the data from a RFID card.  I do have that code, but at the moment it&#8217;s part of some code that I can&#8217;t share.  I&#8217;ll pull the APDU code from our business code and post it later.  In the meantime, this is the code from the OnStateChange event that gets assigned to the reader.

<pre class="brush: csharp; title: ; notranslate" title="">public void OnStateChange(int slotNum, int prevState, int currState)
        {
            // If the previous state and the current state are outside the range of allowable
            // values, then assign min/max of the range
            if (prevState &lt; Reader.CardUnknown || prevState &gt; Reader.CardSpecific)
            {
                prevState = Reader.CardSpecific;
            }

            if (currState &lt; Reader.CardUnknown || currState &gt; Reader.CardSpecific)
            {
                currState = Reader.CardUnknown;
            }

            // Create output string
            string outputString = "Slot " + slotNum + ": "
                    + stateStrings[prevState] + " -&gt; "
                    + stateStrings[currState];

            // Log the status change
            LogMsg(outputString);

            // We tapped the card
            if ((prevState == Reader.CardAbsent) && (currState == Reader.CardPresent))
            {
                // We have the right slot - opening the reader generates a spurious StateChange event
                if (slotNum == SlotNumber)
                {
                    // read the card

                    // The APDU (smart card application protocol data unit) byte array to get the UID from the card
                    // Command  | Class | INS | P1 | P2 | Le
                    // Get Data |   FF  | CA  | 00 | 00 | 00
                    var command = new byte[] { 0xFF, 0xCA, 0x00, 0x00, 0x00 };

                    // The byte array to contain the response
                    var response = new byte[300];

                    try
                    {
                        // In order to set the Get Data command to the card, we need to send a warm reset, followed by setting
                        // the communications protocol.
                        var atr = this.Power(slotNum, Reader.CardWarmReset);

                        this.SetProtocol(slotNum, Reader.ProtocolT0 | Reader.ProtocolT1);

                        // Send the command to the reader
                        var responseLength = this.Transmit(slotNum,
                            command, command.Length, response,
                            response.Length);

                        // We appear to be getting all 9 bytes of a 7 byte identifier.  Since 9 would be considered a too
                        // large value of 7, we drop the last 2 bytes

                        if ((responseLength &gt; ForcedIdSize) && (ForcedIdSize &gt; 0))
                        {
                            responseLength = ForcedIdSize;
                        }

                        // If we got a response, process it
                        if (responseLength &gt; 0)
                        {
                            // Convert the byte array to a hex string
                            var s = ByteArrayToString(response, responseLength);

                            // Add the scan to the collection and notify any watchers
                            AddScan(s);

                            // Notify any watchers
                            LogMsg($"UID: {responseLength} {s}");

                        }
                    }
                    catch (Java.Lang.Exception e)
                    {
                        LogMsg(e.Message);
                    }

                }
            }
        }
</pre>

This is probably as a good point as any to menton that we no longer use the ACS readers.  While their documentation is obtuse and technical support is non-existent, they do exactly what they are supposed to do.  Which is fine, but it just didn&#8217;t mesh up with our needs.

Our use case is for scanning student and driver RFID tags for our Android tablet.  We use an external RFID reader so that the students are scanned as they get on the bus.  Our tablets are securely mounted in cradles, which tends to block RFID readers that are built in to the tablets.  We had the following problems with our use of the ACS readers

  1. The ACS readers are NFC only.  RFID covers a multitude of sins.  NFC is just a subset of that.  Our customers may have RFID cards that use different technologies, like HID PROX or EM400.
  2. The steps needed to get a UID were quick, but not fast.  To get the UID. there needs to be several round trip conversations between the table, the reader, and the card.  If a student getting on the bus didn&#8217;t hold the card long enough to the reader, we ended up missing some scans.
  3. The power draw was draining school bus batteries.  The ACS readers are designed to draw power continuously from the USB port.  Because the readers are mounted to the bus, they would be drawing power all the time.  They are radios and there&#8217;s a power cost to run those radios.

These issues turned up during our initial deployment.  We found a better solution with the [Elatec RFID](https://www.elatec-rfid.com/en/products/rfid-readerwriter-with-antenna/multi-frequency/twn4-multitech/) readers, but the ACS readers are a good solution.  The ACS NFC readers are pretty much the industry standard for external FNC readers.  If I was wiring up and external RFID reader that was connected to a device with AC power, an ACS reader would be the first thing I would consider for the project.