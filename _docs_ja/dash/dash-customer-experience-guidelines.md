---
title: Dash Replenishment Service CX Guidelines
sidebar: dash_ja
permalink: dash-customer-experience-guidelines.html
product: Dash Replenishment Service
toc-style: kramdown
github: true
---

This section provides guidelines for device makers at each touch-point in a typical device life cycle with the goal of ensuring a great automatic reordering customer experience.

* TOC
{:toc}

## Device Purchase

To raise awareness for the automatic reordering capabilities on your device, you must describe its compatibility with DRS on your product's detail page on Amazon as well as your website(s). You should also consider providing a physical insert in the device packaging or having a sticker on your device that directs customers to subscribe to DRS.

## Service Registration

Your customers must be presented with the option to register their device with DRS and subscribe to DRS during device setup. This must occur before the device is ready for its intended use (e.g., prior to the completion of a tutorial, prior to the completion of any “your device is ready for use” message).

Registration and subscription are presented to customers using webviews, with Amazon managing the page content. Amazon will display the following screens:

* **Teaser Page** – An explanation of DRS and its benefits with a call to action to register. Your customers have the option to sign up for automatic reordering or decline and return to the device’s setup experience.
* **Login with Amazon (LWA)** – The customer is asked to enter their Amazon credentials and authorize Amazon to share data with device makers about DRS order details and status.
* **ASIN Selection** – The customer selects the specific ASIN (or ASINs) the device will reorder from a list of eligible ASINs.
* **Detail Confirmation** – The customer will confirm their ASIN selection(s), payment method, and shipping address.

If your customer abandons the device setup flow prior to completing registration and subscription, the registration and subscription flow must be presented when the customer returns to the device setup flow.

If you send a **Welcome** email the first time a customer configures a device for use, the email should include a call to action encouraging subscription to DRS.

## Ongoing Usage

On your product display page (PDP), you should prominently present customers with options to subscribe to DRS and manage settings (i.e., the Amazon Dash Replenishment ingress point is at most 0-1 taps from the PDP). This ingress point will launch the DRS Settings Page (DSP) in a webview.

   The DSP is managed by Amazon and provides the following information:  
   * A customer’s subscription status with an option to subscribe/unsubscribe.  
   * ASIN details (name, price, etc.) with an option to select an alternative ASIN (if applicable).  
   * Shipping and billing details with an option to modify.  
   * Past orders from this device.  

If a device is not registered, Amazon will display the registration and subscription flow as described above when the DSP webview is invoked.

Amazon offers customers the ability to deregister their devices from their Amazon account. When this happens, Amazon communicates the change in status to you using Amazon SNS notifications.

If you provide customers with an option to take actions that may stop or interfere with automatic replenishment, you must notify Amazon of these occurrences with the appropriate API call. For example, you must notify Amazon if a customer deletes, removes, or disassociates a device from their customer account.

## Reordering and Inventory Management

In order to optimize the reorder and delivery experience, relevant information will be exchanged between Amazon and device makers to ensure that orders are delivered on time and as expected.

At a minimum, your device must send Amazon a daily status message with consumption information (e.g., a message that amounts to “8oz consumed since last message”), how much of a consumable remains (e.g., “32oz of inventory remaining”), and the expected date the consumable will expire/run-out (e.g., “0% remaining inventory expected on 3/11/15”). See [SlotStatus Endpoint][dash-slotstatus-endpoint] for additional details.

Your device must place an order at least seven calendar days ahead of the required customer delivery date. This ensures on-time delivery and allows Amazon to provide customers with an option to cancel an order if desired.

Once an item is shipped, Amazon provides you with the expected delivery date and quantity details (e.g., “40 oz to be delivered on 3/11/15”).

If your customer cancels an order placed by the device, the you will receive a notification. You should have an experience where the customer is notified that the cancellation was recorded, and that the device will reorder again in 5 days.

If your customer cancels the second order, you will receive a notification. Your experience should be reactive to this second cancellation and notify the customer that no further reordering will take place until the quantity of consumables has been returned to 100%.

## Notifications and Emails

For DRS related customer communication, Amazon uses its existing email infrastructure for a consistent customer experience. Customers receive emails when an order has been placed, when it has shipped, or when important changes are made to their DRS subscription settings (e.g., subscribing to the service). To avoid duplication, you should not communicate DRS order/status events to customers.

## Consumable Delivery

If you also manufacture the consumables associated with your device, you should make a single increment of refill available for order through DRS. This removes the customer’s need to stock-pile items in their home. In the event that a single increment of a refill is not practical, you should offer a refill pack that lasts up to a month.

## Manage Your Content and Devices (MYCD)

Customers can access information for their connected devices through [Manage Your Content and Devices](https://www.amazon.com/mn/dcw/myx.html). Specifically, your customers can:

* Deregister a device from DRS
* Manage DRS settings (e.g., turn off automatic replenishment, modify selected products, modify payment/shipping details)
* View a device’s identification number

## Customer Service

Amazon will provide customer service support for any DRS order-related inquiries (e.g., tracking shipments, payment questions, etc.).

You are responsible for any other customer service inquiries, including topics such as device setup, Wi-Fi connectivity, connectivity to your services outside the scope of DRS, product hardware defects, etc.

In the event that a customer contacts you with a DRS order-related inquiry, you must take the following actions to connect a customer with Amazon:

* **Email**: Send the customer an email with the following link to Amazon’s self-service [Contact Us page](http://www.amazon.com/gp/help/contact-us/general-questions.html).

* **Phone**: The device maker’s customer service agent will transfer the call to an Amazon customer service agent. Amazon will provide the device maker with details on how to transfer calls to an Amazon customer service agent prior to a device maker making automatic replenishment commercially available for their device.

{% include links.html %}
