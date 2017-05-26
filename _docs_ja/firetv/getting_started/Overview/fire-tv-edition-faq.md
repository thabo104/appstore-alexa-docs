---
title: Developing for Amazon Fire TV Edition
sidebar: firetv_ja
product: Fire TV
permalink: fire-tv-edition-faq.html
hippourl: https://developer.amazon.com/public/solutions/devices/fire-tv/docs/fire-tv-edition-faq
last_updated: 05-11-2017
toc-style: kramdown
github: true
---

[Amazon Fire TV Edition](https://www.amazon.com/dp/B06XDC1544), a smart TV with Fire TV built-in to the television hardware, is a new Fire TV device released by Amazon. As you develop apps for Fire TV, here are answers to a few questions you might have about support for Fire TV Edition.

{% include image.html max-width="350px" url="https://www.amazon.com/dp/B06XDC1544" file="firetv/getting_started/images/fire-tv-edition" type="png" alt="Amazon Fire TV Edition" %}

Q: If my app works on other Fire TV devices, will it work on Fire TV Edition?
:  Yes, if your app works on Fire TV or Fire TV Stick (especially Fire TV Stick - Gen 2), it will most likely work on Amazon Fire TV Edition. 99.9% of Fire TV apps are expected to work on Fire TV Edition. For existing apps, Fire TV Edition will automatically be added as a supported device &mdash; you don't need to do anything. If support for Fire TV Edition fails, you will be notified by the Appstore team.

Q: Why would an app fail for Fire TV Edition?
:  If you targeted your code for [specific build models][identifying-amazon-fire-tv-devices], such as `AFTS` (instead of using the wildcard `AFT*`), Fire TV Edition will not be included because its build model is `AFTRS`.

Q: How can I target Fire TV Edition models in my code?
:  To target Fire TV Edition in your code, you can check for `AFT*` in the `android.os.Build.MODEL` combined with the `Build.MANUFACTURER`, which will return `Amazon`. See [Identifying Amazon Fire TV Devices][identifying-amazon-fire-tv-devices] for more details.

Q: How do I target Fire TV Edition in my manifest?
:  Currently, you can't [target *any* Fire TV devices](https://developer.amazon.com/public/support/submitting-your-app/tech-docs/getting-started-with-device-targeting) through your manifest. When you upload your APK into the Appstore submission portal, on the "Binary File(s)" tab, you must indicate support for Amazon Fire TV Edition in the same way that you indicate support for the other Fire TV devices &mdash; by manually moving a slider to indicate support for that device.

Q: What features can I access/leverage on Fire TV Edition that I previously was unable to use on other Fire TV devices?
:  For apps, Fire TV Edition does not give you access to any special new features. The device itself has some new UI elements, such as the ability to toggle between inputs (and see a preview of the input prior to switching), aggregation of live content on a row called "On Now", the option to select over-the-air (antenna) content, the ability to control volume, power, and other TV features using your voice, and a remote with 6 new buttons (power, volume up, volume down, Netflix, Amazon Video, and Amazon Music). However, apps launch and function in the same way as with other Fire TV devices.

Q: Does Fire TV Edition have more horsepower to run more CPU intensive games?
:  In general, Fire TV is geared toward casual games, not graphic intensive/immersive games. Fire TV Edition has a 1.1GHz 64-bit quad-core CPU and with a Mali-T820 graphics processing unit (GPU), with support for OpenGL ES 3.2. It is most comparable to Fire TV (Gen 2).  See the [Fire TV Device Specifications][device-and-platform-specifications] for more detail.

Q: Can I map the new buttons on the Amazon Fire TV Edition remote controller to my game?
:  No, the six new buttons (volume up, volume down, power, Netflix, Amazon Video, and Amazon Music) are owned by the system and not accessible to third-party apps.

Q: Can users launch my app with speech commands, such as "Launch Gizmo app"?
: No. While you *can* use speech to control volume and other TV functions (this is indeed one of the selling points of Fire TV Edition), you can't interact or start third-party apps with speech. If your app is [integrated with the Fire TV Catalog][integrating-your-catalog-with-fire-tv], users can search for your app using [voice search][implementing-search-fire-tv].

Q: How can I test my app on Fire TV Edition?
: For Android apps, you test apps the usual way, [connecting Android Debug Bridge (ADB) to Fire TV](connecting-adb-to-fire-tv-device), then running the app from Android Studio. However, you cannot connect ADB to Fire TV Edition using a USB cable. You must [connect ADB through the wifi network][connecting-adb-to-fire-tv-device#networkconnect]. (Web apps do testing using the [Web App Tester](https://developer.amazon.com/public/solutions/platforms/webapps/docs/tester.html), not with ADB.)

Q: How can I test my app on Amazon Fire TV Edition without a device?
:  Unfortunately, you can't. Emulators don't work reliably for testing apps with Fire TV. And the [App Testing Service (ATS) widget](https://developer.amazon.com/app-testing-service) currently does not evaluate support for Fire TV Edition. However, if you [submit your APK to the Appstore](https://developer.amazon.com/public/support/submitting-your-app/tech-docs/submitting-apps-to-amazon-appstore) and it fails for some reason on Fire TV Edition, the Appstore team will let you know why your app failed. In general, if your app works on a Fire TV device (esp. Fire TV Stick - Gen 2), it will work on Fire TV Edition.

Q: If I have an Amazon Fire TV Edition device, can I plug my Fire TV and Fire TV Stick devices into Fire TV Edition to test support on those devices as well?
:  Yes, you can simply plug in Fire TV or Fire TV Stick and select it as an input on your Fire TV Edition. Then when you run your app from Android Studio, Fire TV Edition will behave like a normal TV running Fire TV or Fire TV Stick.

Q: Where can I view the technical specs for Amazon Fire TV Edition?
:  For detailed technical specs, see the Fire TV Edition tab on the [Fire TV Device Specifications page][device-and-platform-specifications].

{% include links.html %}
