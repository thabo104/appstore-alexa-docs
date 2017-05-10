---
title: Dash Replenishment Service Glossary
sidebar: dash_ja
permalink: dash-glossary.html
product: Dash Replenishment Service
toc-style: kramdown
github: true
---

This section defines common terms used throughout the Amazon Dash Replenishment Service (DRS) documentation.

## Common Terms

Amazon Standard Identification Number (ASIN)
: Amazon’s unique retail catalog identifier for products.

Amazon SNS
: The [AWS Simple Notification Service](http://aws.amazon.com/sns) that makes it easy to set up, operate, and send notifications from the cloud.

compositeId
: An identifier created by Amazon used to represent a specific device model. You will be provided with a `CompositeId` after you've created a DRS-enabled device.

Customer
: The end user of a device, who has an Amazon account.

Dash Replenishment Service (DRS)
: The service that powers Amazon Dash Replenishment and allows connected device makers to place orders from Amazon on behalf of their customers. For clarity, customer facing communications should use “Amazon Dash Replenishment”.

Deregistration
: The act of disassociating a device from a customer’s Amazon account.

Device
: A hardware item that the customer can purchase, register, deregister, or manage as a single entity. It is possible for a device to have multiple consumable products that are reordered through Amazon Dash Replenishment.

Device Maker
: A manufacturer of a device that integrates with DRS.

DRS Settings Page (DSP)
: A page available to customers on Amazon, and within a device’s companion website or app, where customers can view and modify their Amazon Dash Replenishment settings, including automatic reordering status and the ASINs that will be automatically reordered.

Login with Amazon (LWA)
: The system that allows customers to log into their Amazon account from non-Amazon websites and devices. A device, or its companion website or app, receives a token from LWA that allows it to place Amazon orders.

Manage Your Content and Devices (MYCD)
: [MYCD]((www.amazon.com/mycd)) is an Amazon page that enables customers to manage device settings.  

Primary Device Page (PDP)
: The first page in a device’s companion website or app that provides details and/or status on the customer’s device. The PDP is often the first screen displayed in the companion website or app.

Registration
: The act of associating a device with an Amazon customer account using a unique device identifier. Amazon will maintain the authoritative DRS Device Registration status (registered or unregistered) and communicate that status to the device maker.

Subscribe
: The action a customer takes to authorize a device to place orders for specific ASINs from Amazon. A successful DRS Device Registration is a requirement for subscription – a device must be registered and subscribed to successfully place an order. Amazon maintains the authoritative DRS subscription status (subscribed or unsubscribed) and communicates the status to device makers using Amazon SNS notifications.

Unsubscribe
: The action a customer takes to revoke authorization for a device to place orders from Amazon.

Webview
: An HTML container presented to customers within a device’s companion website or app through which Amazon delivers DRS setup and settings content.

{% include links.html %}
