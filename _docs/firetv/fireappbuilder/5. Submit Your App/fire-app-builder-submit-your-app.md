---
title: Submit Your App to the Appstore
permalink: fire-app-builder-submit-your-app.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

## Configure Your Manifest


Fire TV devices do not support touchscreens and multi-touch capabilities. In an Android manifest, unlike other features, the touchscreen is assumed to be required unless explicitly stated otherwise. Thus, most binaries that run fine on tablets would be considered incompatible with Fire TV without a manifest change.
To specify that an app does not require a touchscreen, add the following element to your manifest:
<uses-feature android:name="android.hardware.touchscreen" android:required="false" />


## Test Your App

See the [Test Criteria for Amazon Appstore Apps](https://developer.amazon.com/public/support/submitting-your-app/tech-docs/appstore-test-criteria) to see the full list of tests that your app must pass. As long as you haven't modified the core Java files in Fire App Builder in custom ways, your app shouldn't have any issues that would block it from the Appstore. Make sure your videos load from your feed when you select the videos.

You can also use the [App Testing Service](https://developer.amazon.com/app-testing-service) to evaluate your APK file, but this test is cursory only and probably won't tell you much that you wouldn't already know from testing on a Fire TV device.

{% include note.html content="Currently, Fire App Builder works only on Fire TV devices, not on Fire tablets. However, compatibility with Fire tablets is on the long-term roadmap." %}

## Ensure Adherence to Content Policy

Make sure you app conforms to [Amazon's Content Policy requirements](https://developer.amazon.com/public/support/submitting-your-app/tech-docs/appstore-content-policy). For example, your app should not include any of the following:

*  Offensive Content
*  Pornography
*  Violence
*  Illegal Activity
*  Gambling with Real Currency
*  Intellectual Property Infringement
*  Privacy/Publicity Infringement
*  Country-Specific Restrictions

Intellectual property infringement is especially relevant to media apps. Make sure you respect the copyright, trademark, and publicity rights of any third-party content. If you don't own the media in your app, you must secure legal approval from the copyright owner to include the media in your app. The same applies for any graphics or images used in your app logo or splash screen.

## Generate a Signed APK File

https://developer.android.com/studio/publish/app-signing.html

During development and testing, Android Studio builds your APK file in your app's **build > outputs > apk** directory and uses the name specified in the **local.properties (SDK Location)** file in the **Gradle Scripts** folder. The APK, named something like **ACME-debug-1.0.0-unaligned.apk**, is automatically signed with a debug keystore and certificate, which is insecure and not accepted by appstores but will run on devices (via sideloading or with Android Studio's Run App button) for testing.

To build a release version of your app, you must generate a signed APK file. You can generate a signed APK in a variety of ways, described in [Sign Your App](https://developer.android.com/studio/publish/app-signing.html). For example, see [Sign your release build](https://developer.android.com/studio/publish/app-signing.html#release-mode). With this approach, you go to **Build > Generate Signed APK** and complete the information required by the APK wizard.

One of the fields in the APK wizard is the destination folder for the release APK file (by default, it's your app directory). After you build the signed APK, the APK file will be something like **ACME-release-1.0.0-unaligned.apk**. You can then upload this APK store into the Amazon Appstore.

{% include note.html content="It's important to save your keystore .jks file. You will need this if you release updates to your app in the future." %}

Note that when you build your signed APK, you may see an error that says "Error:(49) Error: "terms_of_use_file" is not translated in "de" (German), "en" (English), "en-US" (English: United States), "ja" (Japanese) [MissingTranslation]." You can disregard this error.

## Gather the Image Assets

## Create a Description of your App

## Submit the App

 If you do not have an Amazon developer account, go to the [Amazon Developer Portal](https://developer.amazon.com/login.html), and sign in with the same email address as your Amazon customer account. The portal will guide you through the account creation process.

see [Publishing Android Apps to
the Amazon Appstore][appstore-understanding-submission]. As you prepare your app for publishing, you will need to [take various screenshots](/support/submitting-your-app/tech-docs/04-taking-screenshots) and gather [Fire TV image assets][asset-guidelines-for-app-submission#firetvassets].

## Do Live App Testing

https://developer.amazon.com/live-app-testing

note: remove Get the SDK link from that page
