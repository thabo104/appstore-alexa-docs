---
title: Test Device Purchases
sidebar: dash_ja
permalink: dash-test-device-purchases.html
product: Dash Replenishment Service
toc-style: kramdown
github: true
---

If you used the `is_test_device:true` flag in your LWA registration event, DRS will treat this as a test device. A replenish API call for a test device will generate a “trial purchase”, which simulates a purchase event, including applicable notifications, without charging the customer’s payment instrument or shipping a consumable.

The Order Placed and Item Shipped SNS notifications will be sent. Trial purchases cannot be canceled and will not appear in the customer’s Amazon.com order history.

### JavaScript Sample Request

```js
var options = new Object();
var scope = ('dash:replenish');
var scope_data = new Object();
scope_data['dash:replenish'] = {"device_model":modelX,"serial":serialY,"is_test_device":true};
options['scope_data'] = scope_data;
options['scope'] = scope;
options['response_type'] = code;
amazon.Login.authorize(options,"https://mysite/redirect_here");
```

{% include links.html %}
