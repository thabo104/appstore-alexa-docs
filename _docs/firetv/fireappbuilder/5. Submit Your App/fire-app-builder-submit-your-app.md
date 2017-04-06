---
title: Submit Your App to the Appstore
permalink: fire-app-builder-submit-your-app.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

When you've finished building your app and are ready to submit it to the Appstore, you'll need to generate a signed APK, gather image assets, prepare app descriptions, create a developer account, and complete other tasks so that you can easily enter the required information in the Amazon Appstore submission process.

{% include note.html content="More comprehensive information on submitting apps to the Appstore is available in [Getting Started with App Submission](https://developer.amazon.com/public/support/submitting-your-app/tech-docs/appstore-getting-started). The information here is selected and tailored to Fire TV app submission using apps built with Fire App Builder." %}

* TOC
{:toc}

## Configure Your Version Numbers

In your **build.gradle (Module: app)** file (in the **Gradle Scripts** directory), configure the `versionCode` and `versionNumber` as desired:

```java
defaultConfig {
    applicationId "com.amazon.android.acmemedia"
    minSdkVersion 21
    targetSdkVersion 23
    versionCode 1
    versionName "1.0.0"
    testInstrumentationRunner "android.support.test.runner.AndroidJUnitRunner"
    multiDexEnabled true
}
```

The `versionCode` (an integer) provides an internal numbering for your app's version. See [`android:versionCode`](https://developer.android.com/guide/topics/manifest/manifest-element.html#vcode) for more details.

The `versionName` (a string) is the version that users see. See [`android:versionName`](https://developer.android.com/guide/topics/manifest/manifest-element.html#vname) for more details.

## Target Fire TV Devices in Your Manifest

In your app's **AndroidManifest.xml** file (in **manifests** folder), you can target Fire TV devices with the `uses-feature` element as follows:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
          package="com.amazon.android.acmemedia">

    <uses-feature android:name="android.hardware.touchscreen" android:required="false" />

    <application
      ...
      />
```

Fire TV devices do not support touchscreens and multi-touch capabilities. In an Android manifest, unlike other features, the touchscreen is assumed to be required unless explicitly stated otherwise. Thus, most binaries that run fine on tablets would be considered incompatible with Fire TV without a manifest change. (See [Targeting Amazon Devices with Your Android Manifest](https://developer.amazon.com/public/support/submitting-your-app/tech-docs/targeting-amazon-devices-with-your-android-manifest#targeting-fire-tv)) for more details.)

{% include note.html content="Currently, Fire App Builder works only on Fire TV devices, not on Fire tablets. However, compatibility with Fire tablets is on the long-term roadmap." %}

When you upload your APK into the Appstore, the Appstore will indicate which devices your APK supports. Unfortunately, this feature is not working correctly right now, so the initial info will probably indicate the following:

{% include image.html  file="firetv/fireappbuilder/images/fireappbuilder-devicesupport" type="png" alt="Device Support" %}

After uploading your file, you will need to click **Edit device support** and make manual adjustments to indicate support for Fire TV. After you click **Edit Device Support**, you'll see a dialog window as follows:

{% include image.html  file="firetv/fireappbuilder/images/fireappbuilder-indicatingfiretvsupport" type="png" alt="Indicating Fire TV device support" %}

Fire App Builder is supported on every Fire TV device. Toggle on support for all of the Fire TV devices.

The names in the submission interface differ from the device names in the documentation.

* Fire TV (2014) = Fire TV Generation 1
* Fire TV (2015) = Fire TV Generation 2
* Fire TV Stick = Fire TV Stick Generation 1
* Fire TV Stick with Alexa Voice Remote = Fire TV Stick Generation 2

For more info about the different features across devices, see the [specifications for Fire TV devices][device-and-platform-specifications].

## Test Your App

As a best practice, test your app on both Fire TV and Fire TV Stick devices. See the [Test Criteria for Amazon Appstore Apps](https://developer.amazon.com/public/support/submitting-your-app/tech-docs/appstore-test-criteria) to see the full list of tests that your app must pass.

As long as you haven't modified the core Java files in Fire App Builder in custom ways, your app shouldn't have any issues that would block it from the Appstore. Make sure your videos load from your feed when you select the videos.

You can also use the [App Testing Service](https://developer.amazon.com/app-testing-service) to evaluate your APK file, but this test is cursory only and won't tell you much that you wouldn't already know from testing on a Fire TV device.

## Ensure Adherence to Amazon's Content Policy

Make sure you app conforms to [Amazon's Content Policy requirements](https://developer.amazon.com/public/support/submitting-your-app/tech-docs/appstore-content-policy). For example, your app should not include any of the following:

*  Offensive Content
*  Pornography
*  Violence
*  Illegal Activity
*  Gambling with Real Currency
*  Intellectual Property Infringement
*  Privacy/Publicity Infringement
*  Country-Specific Restrictions

Intellectual property infringement is especially relevant to media apps. Make sure you respect the copyright, trademark, and publicity rights of any third-party content. The same applies for any graphics or images used in your app logo or splash screen.

## Generate a Signed APK File

While you're developing and testing your app, Android Studio builds your APK file in your app's **build > outputs > apk** directory. The file name specified in the **gradle.properties (Project Properties)** file in the **Gradle Scripts** folder.

The APK, named something like **ACME-debug-1.0.0-unaligned.apk**, is automatically signed with a debug keystore and certificate, which is insecure and not accepted by the Appstore but will run on devices via sideloading (or with Android Studio's Run App button) for testing.

To build a release version of your app, you must generate a signed APK file. You can generate a signed APK in a variety of ways, described in [Sign Your App](https://developer.android.com/studio/publish/app-signing.html). For the easiest approach, follow the steps in [Sign your release build](https://developer.android.com/studio/publish/app-signing.html#release-mode). With this approach, you go to **Build > Generate Signed APK ...** and complete the information required by the APK wizard.

{% include image.html  file="firetv/fireappbuilder/images/fireappbuilder-generatesignedapk" type="png" max-width="700px" alt="Generate a signed APK" %}

One of the fields in the APK wizard is the destination folder for the release APK file. By default, Android puts the release build APK in your app's directory. After you build the signed APK, the APK file will be named something like **ACME-release-1.0.0-unaligned.apk**. You can later upload this version of the APK into the Amazon Appstore (on the Binary File(s) tab).

Note that when you build your signed APK, you may see an error that says the following:

```
Error:(49) Error: "terms_of_use_file" is not translated in "de" (German), "en" (English), "en-US" (English: United States), "ja" (Japanese) [MissingTranslation]."
```

You can disregard this message. The Terms of Use file is not been translated yet.

{% include note.html content="When you submit your app, Amazon removes the signature you used to sign your app and re-signs it with an Amazon signature that is unique to you, does not change, and is the same for all apps in your account. You can find the Amazon signature hashes for your account by selecting any application in the developer console and navigating to the Binary File(s) tab. The SHA-1 and MD5 hashes for your account are listed in the Appstore Certificate Hashes section. <br/><br/>Even if you lose the keystore you created to sign your release builds, it won't affect your ability to push out updates to your app because your app's signature is associated with your Amazon developer account." %}

## Gather Image Assets of Your App

You need a variety of image assets (in many different sizes) when you submit your app. The image assets are described in two sections in [Image Guidelines for App Submission](https://developer.amazon.com/public/support/submitting-your-app/tech-docs/asset-guidelines-for-app-submission). The image submission guidelines describe two sets of images:

* The [General Assets](https://developer.amazon.com/public/support/submitting-your-app/tech-docs/asset-guidelines-for-app-submission#generalassets) section describes image assets required for general Fire apps, display on the web, and older devices.
* The [Fire TV assets](https://developer.amazon.com/public/support/submitting-your-app/tech-docs/asset-guidelines-for-app-submission#firetvassets) section describes images required for the [new user interface for Fire TV](http://phx.corporate-ir.net/phoenix.zhtml?c=176060&p=irol-newsArticle&ID=2206525) that was released in the Fall of 2016.

You need to submit the required images in both of these sections. Gather up the required images now so that you can easily upload them when you're in the Images & Multimedia tab in the submission process.

{% include tip.html content="As you prepare these images, include the dimensions in the file name (e.g., acme_app_logo_114x114.png). This will make it easier to upload the correct images on the Images tab in the submission process." %}

Screenshots are among the required image assets. See [Taking Screenshots on Fire Devices](https://developer.amazon.com/public/support/submitting-your-app/tech-docs/taking-screenshots#firetv) for details on how to take screenshots of your Fire TV app.

Note that the background image does not merely contain your logo but rather a cinematic scene or image with the character or other element positioned on the right.

## Decide on Your App's Category

When you submit your app, you'll need to decide on the right category within Fire TV. You'll make this selection on the **General Information** tab.

The categories on the **General Information** tab are the same categories that you will find on Fire TV by browsing to **Apps > Categories** on the top navigation bar.

{% include image.html  file="firetv/fireappbuilder/images/fireappbuilder-appcategories" type="png" alt="Categories in Fire TV UI" %}

These same categories also appear in the left sidebar on the Appstore website.

{% include image.html url="https://www.amazon.com/s/ref=lp_2350149011_nr_p_n_feature_sixteen__1?fst=as%3Aoff&rh=n%3A2350149011%2Cp_n_feature_sixteen_browse-bin%3A9842739011&bbn=2350149011&ie=UTF8&qid=1491420063&rnid=9433728011" file="firetv/fireappbuilder/images/fireappbuilder-websitecategories" type="png" alt="Categories on Appstore website" %}

The Appstore website also typically includes the subcategories, but the Fire TV interface does not.

After your app is approved, you can browse to it through this app category on your Fire TV or search for it on the Appstore website.

## Create Descriptions of your App

When you upload your app, you'll be asked to provide several descriptions on the Description tab. You should have these descriptions ready to copy and paste in so that you aren't suddenly typing it off the top of your head during the submission process.

You can edit these descriptions after your app is released, but any changes you make will require you to click Submit to resubmit your app (you won't need to re-upload the APK if you haven't altered it).

The following descriptions are required:

**Short description**: A shorter version of your app description for use on mobile devices. Maximum characters: 1200. When users browse your app on a Fire TV device, this description appears in *one continuous paragraph*. Even if you include paragraph breaks in the description form field, the breaks are stripped out in the Fire TV interface's display. Keep this section readable by making it short (3-5 sentences).

For example, here's the short description in the Fire TV interface:

{% include image.html  file="firetv/fireappbuilder/images/fireappbuilder-appdescription" type="png" alt="Sample short description" %}

If you click the ellipses [**...**], more text appears, but it appears as one long, scrolling paragraph:

{% include image.html  file="firetv/fireappbuilder/images/fireappbuilder-appdescription2ndscreen" type="png" alt="Second screen of short description" %}

Keep readability in mind as you write this description. Additionally, if you offer purchasing within your app, Amazon will append the following note at the end of your description:

>PLEASE NOTE: This app contains in-app purchasing, which allow you to buy items within the app using actual money. On Amazon devices, you can configure parental controls from the device Settings menu by selecting Parental Controls.

{% include tip.html content="For tips on writing descriptions, see [Writing an Effective App Description](https://developer.amazon.com/blogs/post/Tx1461GEX9QNBFB/Writing-an-Effective-App-Description-Marketing-Tip-of-the-Day-1.html) on the Amazon Developer Blog." %}

**Long description**: A description of your app for use on the Amazon.com website. Maximum characters: 4000. Unlike the Short description, the Long description preserves your paragraph breaks. The Long description is published in the "Product description" section on the Appstore web page for your app. You can view examples of "Product descriptions" on any app in the [Appstore](https://www.amazon.com/mobile-apps/b?ie=UTF8&node=2350149011).

**Product feature bullets**: Three to five concise app features, each on a new line. These lines (which get formatted as bullet points) appear on your app's Appstore web page in a section called "Product features."

**Keywords**: Search terms used to increase the discoverability of your app. Use a comma or white space to separate your terms. These keywords influence searches on the Amazon.com website as well as searches that use Fire TV's search feature.

{% include tip.html content="Keep in mind that your app's discoverability often depends on the text you use in your descriptions and keywords. Target words your users will search for." %}

## Create Your Amazon Developer Account

Make sure you have both an [Amazon.com account](https://amazon.com) and an [Amazon Developer Portal](https://developer.amazon.com) account. Create both accounts with the same user name so they can be tied together.

When you create a developer account, if you plan to monetize your app, you'll need to complete some tax identity information and other details.

## Set Your Company Profile

In your developer account, the "Developer name or company name" in your Company Profile (under Settings > [Company Profile](https://developer.amazon.com/settings/profile/detail.html) in the Developer Portal) will appear below your app's name on both your Appstore web page and in the Fire TV user interface.

For example, if a developer named "John Smith" puts "ACME Media" for the *Developer name or company name* in his developer profile, and the app is named "ACME Productions," the app on Amazon's Appstore will appear as follows:

> ACME Productions <br/>
> by ACME Media

In the Fire TV interface, it will appear as follows:

> ACME Productions<br/>
> Developer: ACME Media

## Submit Your App

To submit your app, sign in to your [Developer.amazon.com](https://developer.amazon.com/) account and click **Add a New App**. Select **Android** and then complete the details on each of the tabs:

* General Information
* Availability & Pricing
* Description
* Images & Multimedia
* Content Rating
* Binary File(s)

For details, follow the steps in [Submitting Apps to the Amazon Appstore](https://developer.amazon.com/public/support/submitting-your-app/tech-docs/submitting-apps-to-amazon-appstore).

{% include tip.html content="If you want to let a small group of users beta test your app before releasing it into the Appstore, see [Live App Testing](https://developer.amazon.com/live-app-testing)." %}

## Note About Automatic In-app Purchasing Tag {#iapnote}

Fire App Builder contains a default [In-App Purchasing component][fire-app-builder-amazon-in-app-purchase-component]. Unfortunately, there's not a dummy purchasing component you can substitute in place of IAP. As a result, when you submit your app into the Appstore, it will be tagged as containing in-app purchases.

This in-app purchases tag adds a note on the details about your app saying in-app purchases are offered. It also appends a more detailed note about this at the end of your Short description. Due to the volume of apps processed by the Appstore, the Appstore ingestion team cannot manually remove this tag.

An upcoming Fire App Builder release will add a dummy purchasing component instead of IAP so that this tag is not automatically added to apps.

## After You Submit Your App

After you submit your app, you'll get a confirmation email about the submission. Usually it takes 1-2 days for your app to be approved. If your app does not meet one of Amazon’s acceptance criteria, or if the Appstore testers have a question about your app during the review process, they will notify you by using the email address associated with your account.

When your app is published on the Appstore, you will receive email that your app is live. The email notification won't contain a link to your app, so search for it on the Appstore or within the Fire TV text search. (Note: To include your app within voice search results, you will need to [integrate your app with the Fire TV catalog][fire-app-builder-catalog-integration].)

## Increasing Visibility for Your App

Getting your app into the Appstore is just the first step. For your app to be successful, you'll need to promote your app as much as possible. The [Amazon Developer blog](https://developer.amazon.com/blogs) often publishes tips on marketing. See the following posts:

* [8 Tips for Marketing Your App on the Amazon Appstore](http://dev.amazonappservices.com/rs/070-JMM-398/images/8%20Tips%20for%20Marketing%20your%20App.pdf)
* [Make Money with Promotions That Work: Webinar March 30th](https://developer.amazon.com/blogs/appstore/post/0c0600a6-0bac-4b9c-89bc-69c8a973a748/make-money-with-promotions-that-work-webinar-march-30th) (Register to view it, and you will get a link to the recording in an email. Click the link and sign in to view the recording.)
* [How to Get Featured on Amazon Appstore](https://developer.amazon.com/blogs/appstore/post/03bd237c-9daf-4c48-97ac-933a36b7e095/how-to-get-featured-on-amazon-appstore)
* [App Store Optimization: From Keywords to Reviews](https://developer.amazon.com/blogs/appstore/post/a1110518-e330-4ed6-89f4-c829824097a0/app-store-optimization-from-keywords-to-reviews)
* [Marketing Your App](https://developer.amazon.com/marketing-your-app)
* [Advertise your App](https://developer.amazon.com/advertise-your-app)

{% include tip.html content="If you haven't implemented [recommendations][fire-app-builder-recommendations-overview], be sure to do so. Sending recommendations to the \"Recommended By Your Apps Row\" can get your content on the user's home screen so they are more likely to engage with your app." %}


{% include links.html %}
