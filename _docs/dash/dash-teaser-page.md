---
title: DRS Teaser Page
sidebar: dash
permalink: dash-teaser-page.html
product: Dash Replenishment Service
toc-style: kramdown
github: true
---

The Dash Replenishment Service (DRS) Teaser Page is used to educate customers about automatic reordering capabilities for your device and is the first DRS related screen a customer will see during device registration. From this page, customers will have the option to sign up for automatic reordering or decline and return the device setup experience.

A `compositeId` is required to configure your teaser page. Your `compositeId` is an identifier created by Amazon that represents a specific device model, and is appended to your Teaser Page URL. Amazon will provide you with a `compositeId` once you've created a DRS-enabled device using the device wizard.

## Sample Page

The following is a sample Teaser Page. To open this page in your browser [click here](https://drs-web.amazon.com/teaser?compositeId=amzn1.dash.v1.composite.315d909f-e392-4040-8dba-48f8ec170a1c&remindLaterUri=https://developer.amazon.com&loginUri=https://amazon.com&skipUri=https://kindle.amazon.com).

{% include image.html border="true" file="dash/images/teaser-page-1" type="png" %}

Each teaser page has three buttons that can be configured by the client by appending additional information to the URL:

| Additional Information | Description |
|--------|---------|
| `remindLaterUri` | To use “Remind me later”, append `remindLaterUri` to your teaser page URL with a full URL to the desired destination. For example: (https://drs-web.amazon.com/teaser?compositeId=amzn1.dash.v1.composite.315d909f-e392-4040-8dba-48f8ec170a1c&remindLaterUri=https://developer.amazon.com) |
| `loginUri` | To use “Get Started”,  replace `loginUri` to your DRS Teaser Page URL with a full URL to the desired destination. For example: (https://drs-web.amazon.com/teaser?compositeId=amzn1.dash.v1.composite.315d909f-e392-4040-8dba-48f8ec170a1c&remindLaterUri=https://developer.amazon.com&loginUri=https://amazon.com)
| `skipUri` | To use “Skip”, replace `skipUri` to your DRS Teaser Page URL with a full URL to the desired destination. For example: (https://drs-web.amazon.com/teaser?compositeId=amzn1.dash.v1.composite.315d909f-e392-4040-8dba-48f8ec170a1c&remindLaterUri=https://developer.amazon.com&loginUri=https://amazon.com&skipUri=https://kindle.amazon.com) |


{% include note.html content="Amazon will produce this teaser page for you. You need to include the appropriate `CompositeID` for the URL to work." %}

{% include links.html %}
