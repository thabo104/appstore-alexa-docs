---
title: Dash Replenishment Service
sidebar: dash
permalink: dash-replenishment-service.html
product: Dash Replenishment Service
toc-style: kramdown
github: true
---

Amazon's Dash Replenishment Service (DRS) enables connected devices to order physical goods from Amazon when supplies are running low—like a Brita Water Pitcher that orders more filters.

By using Amazon Dash Replenishment, device makers are able to leverage Amazon's authentication and payment systems, customer service, and fulfillment network—giving their customers access to Amazon's low prices, great selection, and reliable delivery.

* TOC
{:toc}

## DRS Self-Service Portal
The DRS Self-Service Portal will help you create and manage your DRS-connected devices. The device wizard simplifies the provisioning process for DRS and will guide you through creating your device model(s) and configuring your product ASIN lists so that you can begin testing and integrating with Amazon Dash Replenishment Service. [Click here to get started](https://developer.amazon.com/dash-replenishment/index.html).

## Add a Device to EU Marketplaces {#eu-marketplaces}
Amazon Dash Replenishment is available for customers shopping on Amazon.com, Amazon.co.uk and Amazon.de marketplaces.

Developers who want to give their customers the ability to use DRS with amazon.co.uk or amazon.de can enable their devices by creating a device or finding an existing US device in the [DRS self-service device wizard](https://developer.amazon.com/dash-replenishment/index.html).

Once the device is created you will see a link in the wizard to add UK/DE marketplaces in the device summary. Complete the form and submit it. Amazon will provision your device and create a test ASIN list that is supported in each marketplace.

Amazon Dash Replenishment utilizes a single API endpoint for all DRS related requests regardless of which marketplace your end customers prefer to shop in. So once your device is provisioned for the international marketplaces you can begin testing with amazon.co.uk and amazon.de customer accounts.

## Authentication
To access DRS, your product must obtain an LWA access token, which grants your product access to the API on your customer's behalf. There are two methods used to obtain an access token for use with DRS.

* [LWA Web API Method][dash-lwa-web-api]
* [LWA Mobile SDK Method][dash-lwa-mobile-sdk]

## Base URLs  
DRS support two base URLs which all endpoints are built on.

### Service Calls
The following base URL must be used for all service related API calls, for instance replenishing an order or reporting the slot status of a device:  

```
https://dash-replenishment-service-na.amazon.com
```

### Web-related Calls
The following base URL must be used for all web-related calls. Use this URL for customer-facing pages and interactions, such as your settings and teaser pages:  

```
https://drs-web.amazon.com
```

## API Versioning

Amazon is using versioning to incrementally update API functionality without directly impacting customers. It is mandatory to pass in the following headers for every API call: `x-amzn-type-version` and `x-amzn-accept-type`.

* `x-amzn-type-version` – Allows you to control the version of requests sent.
* `x-amzn-accept-type` – Allows you to control the version of the responses you receive.

Supported versions are supplied for each DRS endpoint.

## Versions and Backwards Compatibility

When endpoints have multiple versions available, the syntax for each version is listed in tabs. Although the latest version is the recommended endpoint syntax, you can use the previous versions if you prefer. DRS is always backwards compatible with support for previous versions.

{% include links.html %}
