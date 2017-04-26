---
title: Known Issues (Latest Version)
permalink: fire-app-builder-known-issues.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

The following are known issues in Fire App Builder:

* **In-app purchases tag added to apps**. When you download Fire App Builder, the default configuration includes the [In-App Purchasing component][fire-app-builder-amazon-in-app-purchase-component] by default. As a result, when you submit your app into the Appstore, it will be tagged as containing in-app purchases. If you're not using the In-App Purchasing component, [remove the component][fire-app-builder-load-a-component] as well as the `receiver` elements from the PurchaseComponent's manifest. See [Remove the IAP Component If Unused][fire-app-builder-submit-your-app#commentoutiap] for details.
* **Login with Amazon component**. The [Login with Amazon component][fire-app-builder-login-with-amazon-component] is not working correctly. The issue is currently being investigated.
* **Related content item match list**. Related content matches (which are based on tags in the feed) will match unlimited content if many items have the same tags. (The content matches should have an item limit.)
* **In-App Purchasing component across multiple devices.** With the [In-App Purchasing Component][fire-app-builder-amazon-in-app-purchase-component], purchases made on other devices won't be acknowledged in the app until a user either restarts the app or attempts to play the content. (The app should refresh purchased items when the state goes to the background.)
* **Splash screen loading time.** Loading the feed initially can take some time on splash screen. (The initial load time should be faster.)

{% include links.html %}
