---
title: Device Management and Settings
sidebar: dash_ja
permalink: dash-device-management-and-settings.html
product: Dash Replenishment Service
toc-style: kramdown
github: true
---

Amazon customers can manage content and devices on the [Manage your Content and Devices page](http://www.amazon.com/MYCD/) on Amazon. This page allows customers to deregister their DRS-enabled devices at any time, even if originally registered using the device maker’s experience.

When a device is deregistered on Amazon, a [deregistration notification](https://developer.amazon.com/public/solutions/devices/dash-replenishment-service/docs/dash-notification-messages#device-deregistered) will be published to SNS. See the [Notification Messages](https://developer.amazon.com/public/solutions/devices/dash-replenishment-service/docs/dash-notification-messages) for additional information. Once a device is deregistered, subsequent API calls will fail.

If your platform/application is managing customer registrations. You can call the deregister API with a valid access token for the device to deregister it from DRS.

* TOC
{:toc}

## DRS Settings Page

The DRS Settings page (DSP) is where Amazon customers interact with the settings for their DRS-enabled products. This page is available to your app or your web interface using this URL:

```
https://drs-web.amazon.com/settings?access_token=foobar&exitUri=https://amazon.com
```

Customers must be authenticated with Amazon to view this page. If the customer has not recently logged into Amazon.com on the user agent, they will experience a login flow. This should not interrupt your application web view.

## Dash Settings Page Exit Button

The URL parameter `exitURI=` provides your application with a flexible way to provide an exit path back to your website or application from the DSP.  

```
https://drs-web.amazon.com/settings?access_token=foobar&exitUri=https://amazon.com
```

Including the `exitURI=` parameter in the URL will cause the **Exit** button to appear on the Dash Settings Page. Clicking the **Exit** button will link to the URI you provided in the URL parameter. In the URL example above, the **Exit** button will appear and link customers to https://amazon.com. It is required that you provide the scheme for the URI you wish to link to with the “Exit” button.

If you omit the `exitURI=` parameter from the URL then the **Exit** button will not appear. This is useful if you have a custom webview that you'd prefer to use that includes an exit button.

{% include links.html %}
