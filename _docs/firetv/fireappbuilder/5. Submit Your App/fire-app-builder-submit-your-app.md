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

The settings in your app's build.gradle file will overwrite any similar settings in your app's manifest.

## Target Fire TV Devices in Your App Manifest

In your app's **AndroidManifest.xml** file (in **manifests** folder), you can [theoretically] target Fire TV devices with the `uses-feature` element as follows:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
          package="com.amazon.android.acmemedia">

    <uses-feature android:name="android.hardware.touchscreen" android:required="false" />

    <application
      ...
      />
```

Fire TV devices do not support touchscreens and multi-touch capabilities. In an Android manifest, unlike other features, the touchscreen is assumed to be required unless explicitly stated otherwise. By indicating that the touchscreen feature is not required, your manifest should target Fire TV devices. (See [Targeting Amazon Devices with Your Android Manifest](https://developer.amazon.com/public/support/submitting-your-app/tech-docs/targeting-amazon-devices-with-your-android-manifest#targeting-fire-tv).)

When you upload your APK into the Appstore, the Appstore is supposed detect which devices your APK supports from the manifest. Unfortunately, this feature is not working correctly right now for Fire TV apps, so the initial info will probably indicate the following:

{% include image.html  file="firetv/fireappbuilder/images/fireappbuilder-devicesupport" type="png" alt="Device Support" %}

{% include note.html content="Even though Fire TV device targeting isn't working correctly now, the Appstore team plans to fix this in the future, so it's a best practice to leave this code in your manifest." %}

After uploading your file, click **Edit device support** and make manual adjustments to indicate support for Fire TV. After you click **Edit Device Support**, you'll see a dialog window as follows:

{% include image.html  file="firetv/fireappbuilder/images/fireappbuilder-indicatingfiretvsupport" type="png" alt="Indicating Fire TV device support" %}

Fire App Builder is supported on every Fire TV device. Toggle on support for all of the Fire TV devices.

The names in the submission interface differ from the device names in the documentation.

* Fire TV (2014) = Fire TV Generation 1
* Fire TV (2015) = Fire TV Generation 2
* Fire TV Stick = Fire TV Stick Generation 1
* Fire TV Stick with Alexa Voice Remote = Fire TV Stick Generation 2

For more info about the different features across devices, see the [specifications for Fire TV devices][device-and-platform-specifications].

{% include note.html content="Currently, Fire App Builder works only on Fire TV devices, not on Fire tablets. However, compatibility with Fire tablets is on the long-term roadmap." %}

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

## Generate a Signed APK File {#signedapk}

While you're developing and testing your app, Android Studio builds your APK file in your app's **build > outputs > apk** directory. The file name specified in the **gradle.properties (Project Properties)** file in the **Gradle Scripts** folder.

The APK, named something like **ACME-debug-1.0.0-unaligned.apk**, is automatically signed with a debug keystore and certificate, which is insecure and not accepted by the Appstore but will run on devices via sideloading (or with Android Studio's Run App button) for testing.

To build a release version of your app, you must generate a signed APK file. You can generate a signed APK in a variety of ways, described in [Sign Your App](https://developer.android.com/studio/publish/app-signing.html). For the easiest approach, follow the steps in [Sign your release build](https://developer.android.com/studio/publish/app-signing.html#release-mode). With this approach, you go to **Build > Generate Signed APK ...** and complete the information required by the APK wizard.

{% include image.html  file="firetv/fireappbuilder/images/fireappbuilder-generatesignedapk" type="png" max-width="700px" alt="Generate a signed APK" %}

One of the fields in the APK wizard is the destination folder for the release APK file. By default, Android puts the release build APK in your app's directory. After you build the signed APK, the APK file will be named something like **ACME-release-1.0.0-unaligned.apk**. You can later upload this version of the APK into the Amazon Appstore (on the Binary File(s) tab).

{% include note.html content="When you submit your app, Amazon removes the signature you used to sign your app and re-signs it with an Amazon signature that is unique to you, does not change, and is the same for all apps in your account. You can find the Amazon signature hashes for your account by selecting any application in the developer console and navigating to the Binary File(s) tab. The SHA-1 and MD5 hashes for your account are listed in the Appstore Certificate Hashes section. <br/><br/>Even if you lose the keystore you created to sign your release builds, it won't affect your ability to push out updates to your app because your app's signature is associated with your Amazon developer account." %}

## Gather Image Assets for Your App

You need a variety of image assets (in many different sizes) when you submit your app. These images assets are used to promote your app in both the online Appstore and the device Appstore.

The image assets are described in two sections in [Image Guidelines for App Submission](https://developer.amazon.com/public/support/submitting-your-app/tech-docs/asset-guidelines-for-app-submission). The image submission guidelines describe two sets of images:

* The [General Assets](https://developer.amazon.com/public/support/submitting-your-app/tech-docs/asset-guidelines-for-app-submission#generalassets) section describes image assets required for general Fire apps, display on the web, and older devices.
* The [Fire TV assets](https://developer.amazon.com/public/support/submitting-your-app/tech-docs/asset-guidelines-for-app-submission#firetvassets) section describes images required for the [new user interface for Fire TV](http://phx.corporate-ir.net/phoenix.zhtml?c=176060&p=irol-newsArticle&ID=2206525) that was released in the Fall of 2016.

You need to submit the required images in both of these sections. Gather up the required images now so that you can easily upload them when you're in the Images & Multimedia tab in the submission process.

{% include tip.html content="As you prepare these images, include the dimensions in the file name (e.g., acme_app_logo_114x114.png). This will make it easier to upload the correct images on the Images tab in the submission process." %}

Screenshots are among the required image assets. See [Taking Screenshots on Fire Devices](https://developer.amazon.com/public/support/submitting-your-app/tech-docs/taking-screenshots#firetv) for details on how to

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

**Short description**: A short version of your app description for use on mobile devices. Maximum characters: 1200. When users browse your app on a Fire TV device, this description appears in *one continuous paragraph*. Even if you include paragraph breaks in the description form field, the breaks are stripped out in the Fire TV interface's display. Keep this section readable by making it short (3-5 sentences).

For example, here's the short description in the Fire TV interface:

{% include image.html  file="firetv/fireappbuilder/images/fireappbuilder-appdescription" type="png" alt="Sample short description" %}

If you click the ellipses [**...**], more text appears, but it appears as one long, scrolling paragraph:

{% include image.html  file="firetv/fireappbuilder/images/fireappbuilder-appdescription2ndscreen" type="png" alt="Second screen of short description" %}

This is why your short description should typically be 3-5 sentences. Additionally, if you offer purchasing within your app, Amazon will append the following note at the end of your description:

>PLEASE NOTE: This app contains in-app purchasing, which allow you to buy items within the app using actual money. On Amazon devices, you can configure parental controls from the device Settings menu by selecting Parental Controls.

{% include tip.html content="For tips on writing descriptions, see [Writing an Effective App Description](https://developer.amazon.com/blogs/post/Tx1461GEX9QNBFB/Writing-an-Effective-App-Description-Marketing-Tip-of-the-Day-1.html) on the Amazon Developer Blog." %}

**Long description**: A longer description of your app for use on the Amazon.com website. Maximum characters: 4000. Unlike the Short description, the Long description preserves your paragraph breaks. The Long description is published in the "Product description" section on the Appstore web page for your app. You can view examples of "Product descriptions" on any app in the [Appstore](https://www.amazon.com/mobile-apps/b?ie=UTF8&node=2350149011).

**Product feature bullets**: 3-5 concise app features, each on a new line. These lines (which get formatted as bullet points) appear on your app's Appstore web page in a section called "Product features."

**Keywords**: Search terms used to increase the discoverability of your app. Use a comma or white space to separate your terms. These keywords influence searches on the Amazon.com website as well as searches that use Fire TV's search feature.

Although [voice search][implementing-search-fire-tv#voicesearch] won't target your app unless you add it to the [Fire TV catalog][integrating-your-catalog-with-fire-tv], voice search will look at the keywords here and surface your app if relevant. These keywords can be especially helpful if your app name contains phonetics that speech recognition can't easily parse (for example, "writing" might be interpreted as "riding").

{% include tip.html content="Keep in mind that your app's discoverability often depends on the text you use in your descriptions and keywords. Target words your users will search for." %}

## Create Your Amazon Developer Account

Make sure you have both an [Amazon.com account](https://amazon.com) and an [Amazon Developer Portal](https://developer.amazon.com) account. Create both accounts with the same user name so they can be tied together.

When you create a developer account, if you plan to monetize your app, you'll need to complete some tax identity information and other details.

## Set Your Company Profile Name

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

{% include tip.html content="If you want to let a small group of users beta test your app before releasing it into the Appstore, see [Live App Testing](https://developer.amazon.com/live-app-testing). Live app testing " %}

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

## Submit a New Version of Your App

When you make and test updates to your app, uninstall any other versions of your app from your Fire TV device. If you're testing your app on a device where you've already downloaded and installed your app from the Appstore, the Appstore version will conflict with your local version. (Fire TV won't allow two different apps containing identical package names to be installed on the same device.)

You can uninstall your app by going to **Settings > Applications > Manage Installed Applications**. Select your app, and then select **Uninstall**.

### Update details about your app that don't include updating your APK file

If you only want to update your app description or some other detail, but leave the APK as is, do the following:

1.  Sign in to the [Amazon Developer Console](https://developer.amazon.com/login.html).
2.  On the **Dashboard** tab, scroll down to the **Dashboard** section and click your app.
2.  Make the updates you want on the various tabs. (Click Save before switching tabs.)
3.  Click **Submit**.

### Update your APK file

If you want to submit a new version of your APK file, do the following:

1.  After making the changes to your code in Android Studio, expand your **Gradle Scripts** folder, open **build.gradle (Module: app)**, and update the [android:versionCode](https://developer.android.com/guide/topics/manifest/manifest-element.html#vcode)(required) and `versionName` (optional). (If you upload a binary with the same [android:versionName](https://developer.android.com/guide/topics/manifest/manifest-element.html#vname) as a previous binary, the Appstore will reject it.)

    {% include note.html content="Do not change the package name of your app." %}

2.  [Generate a signed release APK](#signedapk).
3.  Sign in to the [Amazon Developer Console](https://developer.amazon.com/login.html).
4.  On the **Dashboard** tab, scroll down to the **Dashboard** section and click your app.
5.  In the menu directly underneath your app title, click the **Add Upcoming Version** link.

    {% include image.html  file="firetv/fireappbuilder/images/fireappbuilder_add_new_version" type="png" alt="Add Upcoming Version" %}

6.  When prompted about whether you want to create a new version, click **OK**.  
7.  Click the **Binary File(s)** tab.
8.  In the **Binary file** section, click the **X** icon to delete the previous version of the APK file, and then click OK to confirm deletion.

    {% include image.html  file="firetv/fireappbuilder/images/fireappbuilder_removebinary" type="png" alt="Remove binary file" %}

9.  When prompted to "Permanently delete this binary?", click **OK**.
10. Click **Upload Binary** and upload the new version of your APK file.

    Because you're just uploading a new version, the Appstore remembers your previous choices about device support and other details.

11. Click **Save**.
12. Click the **Release Notes** tab, click **Edit**, and then add some information about what's new in the release. Then click **Save**.

    The information you type here will be displayed to users in the Notification Center when users see an update for your app.

    {% include tip.html content="Remember that your app's users might not be developers. Don't type developer jargon about the updates you made. Keep the information readable for a non-technical audience." %}

13. Click **Submit App**.

    Your app is submitted to the Appstore and goes through the same testing and approval process as before.

{% include links.html %}
