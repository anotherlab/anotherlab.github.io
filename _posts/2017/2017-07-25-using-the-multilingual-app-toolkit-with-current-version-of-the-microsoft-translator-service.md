---
title: Using the Multilingual App Toolkit with the Microsoft Translator service from Azure's Cognitive Services
date: 2017-07-25
categories:
  - Localization
---
<div style="width: 609px" class="wp-caption alignnone">
  <img loading="lazy" src="https://i2.wp.com/photos.smugmug.com/photos/i-D66Lc4v/0/e3f9e64e/M/i-D66Lc4v-M.png?resize=599%2C316&#038;ssl=1" alt="" width="599" height="316"  />
  
  <p class="wp-caption-text">
    Image courtesy of M. Adiputra via Wikimedia Commons
  </p>
</div>

The [Multilingual App Toolkit](https://developer.microsoft.com/en-us/windows/develop/multilingual-app-toolkit) (MAT) is a great tool for managing your localization workflow with Visual Studio projects.  One of the features is the ability to machine translate your string resources into another language.  You would not want to ship an application that was machine translated, but it provides a jumping off point for the actual translators that will work on your text.  When it was originally released, MAT included support for the Microsoft Translator service,  It just worked right out of the box.

Back in April (2017), the Microsoft Translator service that was part of [Microsoft Datamarket](https://datamarket.azure.com/home) was retired.  The replacement is part of [Cognitive Services](https://azure.microsoft.com/en-us/services/cognitive-services/) and is hosted in Azure.  The [Multilingual App Toolkit](https://developer.microsoft.com/en-us/windows/develop/multilingual-app-toolkit) (MAT) was using the Microsoft Translator service as the default translation provider for doing machine translations.  If you are using MAT to manage your language resource files and wish to use Microsoft's translation services, you'll need to make some changes.  They are documented [here](https://multilingualapptoolkit.uservoice.com/knowledgebase/articles/1167898), but I'll mirror the text.

Make sure that you have the latest version of MAT installed.  For VS 2017, you'll need 4.0.6810.0 as the minimum version.  For VS 2015 or 2013, you'll need 4.0.180.0 as the minimum version.

Then, you'll need an Azure subscription.  When you use the Translator Text API, you can pick from a number of [pricing plans](https://azure.microsoft.com/en-us/pricing/details/cognitive-services/translator-text-api/).  The free plan lets you translate 2 million characters a month, but does not allow overages.  The next plan charges  $10/month per million characters. And it moves up from there.  For most projects, the free tier should be sufficient

You can sign up for an Azure account at <http://azure.com>.  You'll need a credit card, but you wont be charged unless you go beyond the free plans.

Once you have an Azure account, sign in to the portal and click the **New** button.

Type &#8220;Translation&#8221; into the &#8220;Search the marketplace&#8221; entry field.  Then select the Translator Text API.

Click the **Create** button

Select the free pricing tier and fill out the rest of the fields and then press the create button.

<img src="https://i1.wp.com/photos.smugmug.com/photos/i-LrKS2cS/0/1b236708/XL/i-LrKS2cS-XL.png">

After Azure deploys the service, it will take you to the service page.

Under &#8220;Resource Management&#8221;, click &#8220;Keys&#8221;.  Copy the value for &#8220;Key 1&#8221;.  This will be the authorization key that enables MAT to use the translation services.  Azure defines two keys, Key 1 and Key 2.  They will both work.  If you plan on sharing the service to let other people translate your code, you can revoke the key at a later date.

Open the Credential Manager in Windows.  The easiest way to launch this is to press the Windows key or Start Menu button and then start typing &#8220;Credential&#8221;.  You should see the app in the list of matching items

Select &#8220;Windows Credentials&#8221;

Click &#8220;Add a generic credential&#8221; and then fill in the fields.

For Internet or network address, enter **Multilingual/MicrosoftTranslator**

For User name, enter **Multilingual App Toolkit**

For Password, enter the authorization key that you copied from Azure.

If you copied and pasted the text, make sure that the text does not have trailing spaces at the end.

Click the **OK** button.

<figure><img loading="lazy" src="https://i2.wp.com/photos.smugmug.com/photos/i-D4cGxtT/0/5b7c4039/M/i-D4cGxtT-M.png" alt="" /><figcaption>Entering the Azure key as a generic credential</figcaption></figure>

Once you have added the credentials, the Multilingual App Toolkit editor will now use the translation services from Azure.

 
