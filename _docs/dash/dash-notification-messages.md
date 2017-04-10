---
title: Notification Messages (DRS)
sidebar: dash
navtabs: true
permalink: dash-notification-messages.html
toc-style: kramdown
github: true
---

Amazon will send notifications for device changes, order state, subscription status, and more using Amazon's Simple Notification Service (SNS). Amazon SNS allows applications to send time-critical messages to multiple subscribers through a "push" mechanism, eliminating the need to periodically check for updates. For example, the Dash Replenishment Service (DRS) uses SNS to notify you (the device maker) of device deregistrations and event failures; and uses notifications to provide delivery status.

In the following sections, sample notifications are provided for reference.

{% include note.html content="Additional fields may be added to notifications in the future, your service code must be able to handle and ignore unexpected fields." %}

{% include tip.html content="SNS does not always receive messages sequentially. Please keep this in-mind when testing with very tight timing tolerances (30-60 seconds). SNS will send messages in the order they were received, but that does not guarantee that SNS received them in the order they were \"sent.\" The notification time field in the SNS message payload indicates when DRS sent the message." %}

* TOC
{:toc}

## Versioning

DRS uses versioning to incrementally update functionality without directly impacting customers.

{% include note.html content="v2.0 notification messages now include product ASINs." %}

## Order Placed

An order placed notification is sent when DRS receives a Replenish API call and the order generated has not encountered any issues. Upon receipt of this message, the device maker is notified than an order received from the replenish API request will ship if the Amazon customer does not cancel the order within 24 hours.

The following is a sample order placed notification for reference:

<ul id="profileTabs" class="nav nav-tabs">
  <li class="active"><a class="noCrossRef" href="#order-v2" data-toggle="tab">v2.0</a></li>
  <li><a class="noCrossRef" href="#order-v1" data-toggle="tab">v1.0</a></li>  
</ul>
<div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="order-v2">
    <div class="subheading">Version 2.0
    </div>
      <p markdown="block">

```json
{
    "notificationInfo": {
        "notificationType": "OrderPlacedNotification",
        "lwaClientId": "amzn1.application-oa2-client.6b68exxxxxxxxxx9",
        "notificationTime": "2016-12-02T21:09:58.689Z",
        "notificationId": "amzn1.dash.notification.v1.xxxxxxxxxxxxx13",
        "version": "2015-06-05"
    },
    "deviceInfo": {
        "deviceIdentifier": {
            "serialNumber": "mySerialNumber"
        },
        "productIdentifier": {
            "modelId": "myDeviceModel"
        }
    },
    "customerInfo": {
        "directedCustomerId": "amzn1.account.AH54JCXQ7WZKCZOFxxxxxxxx"
        },
    "orderInfo": {
        "instanceId": "amzn1.dash.v2.o.ci45xxxxxxxxxxx",
        "slotId": "myProduct",
        "productInfo": [{
            "quantity": 1.0,
            "unit": "count",
            "asin": "myAsinNumber",
            "estimatedDeliveryDate": "2016-12-09T07:59:59Z"
        }],        
    }
}

...

{
    "MessageAttributes": {
        "version": {
            "type": "String",
            "Value": 2.0
        }
    }
}
```

</p>

  </div>
  <div role="tabpanel" class="tab-pane" id="order-v1">
    <div class="subheading">Version 1.0
    </div>
<p markdown="block">

```json
{
    "notificationInfo": {
        "notificationType": "OrderPlacedNotification",
        "lwaClientId": "amzn1.application-oa2-client.6b68exxxxxxxxxx9",
        "notificationTime": "2015-10-01T20:19:39.959Z",
        "notificationId": "amzn1.dash.notification.v1.xxxxxxxxxxxxx13",
        "version": "2015-06-05"
    },
    "deviceInfo": {
        "deviceIdentifier": {
            "serialNumber": "mySerialNumber"
        }
        ,
        "productIdentifier": {
            "modelId": "myDeviceModel"
        }
    },
    "customerInfo": {
        "directedCustomerId": "amzn1.account.AHxxxxxxxxGA2O5Q"
    },
    "orderInfo": {
        "instanceId": "amzn1.dash.v2.o.ci43xxxxxxxxxx0",
        "slotId": "myProduct",
        "productInfo":[ {
            "quantity": 12.0,
            "unit": "count"
        }],
        "estimatedDeliveryDate": "2015-10-07T06:59:59Z"
        }
    }
}
```

</p>
  </div>
</div>

### Version Notes

Please note the following changes for **Order Placed** v2.0:

* `asin` information is now included inside `productInfo`  
* `estimatedDeliveryDate` is now inside `productInfo`  
* `MessageAttributes` are used to identify version notification message version  

## Order Cancelled

The order cancelled notification is sent in two scenarios:

1.  When a successfully placed order is manually cancelled by a customer.

2.  When the replenish API request encounters the Amazon Order Resolution Flow and an Amazon customer is unable to resolve the issue within the 72-hours.

The following is a sample order cancelled notification for reference:

```json
{
    "notificationInfo": {
        "notificationType": "OrderCancelledNotification",
        "lwaClientId": "amzn1.application-oa2-client.6b68exxxxxxxxxx9",
        "notificationTime": "2015-10-01T20:20:29.461Z",
        "notificationId": "amzn1.dash.notification.v1.xxxxxxxxxxxxx13",
        "version": "2015-06-05"
    },
    "deviceInfo": {
        "deviceIdentifier": {
            "serialNumber": "mySerialNumber"
        },
        "productIdentifier": {
            "modelId": "myDeviceModel"
        }
    },
    "customerInfo": {
        "directedCustomerId": "amzn1.account.AHxxxxxxxxGA2O5Q"
    },
    "orderInfo": {
        "instanceId": "amzn1.dash.v2.o.ci43xxxxxxxxxx0",
        "slotId": "myProduct"
    }
}
```

## Device Registered

A device registered notification is sent any time a customer successfully completes LWA. The notification is triggered before the customer selects any ASINs.  

The following is a sample device registered notification for reference:

```json
{
    "notificationInfo": {
        "notificationType": "DeviceRegisteredNotification",
        "lwaClientId": "amzn1.application-oa2-client.6b68exxxxxxxxxx9",
        "notificationTime": "2015-10-01T02:23:52.747Z",
        "notificationId": "amzn1.dash.notification.v1.xxxxxxxxxxxxx13",
        "version": "2015-06-05"
    },
    "deviceInfo": {
        "deviceIdentifier": {
            "serialNumber": "mySerialNumber"
        },
        "productIdentifier": {
            "modelId": "myDeviceModel"
        }
    },
    "customerInfo": {
        "directedCustomerId": "amzn1.account.AHxxxxxxxxGA2O5Q"
    }
}
```

## Device Deregistered

A device deregistered notification is sent for many reasons, including:

1.  The device maker calls the Deregistration API.

2.  The Amazon customer goes to Amazon.com and deregisters the device from any Amazon.com management page.

3.  The Amazon customer contacts Amazon customer service, and the customer service agent deregisters the device on the customer’s behalf.

4.  The Amazon customer goes to the Manage Login with Amazon website and removes the relationship with the device maker. This will deregister all customer devices associated with that device maker.

The following is a sample order placed notification for reference:

```json
{
    "notificationInfo": {
        "notificationType": "DeviceDeregisteredNotification",
        "lwaClientId": "amzn1.application-oa2-client.6b68exxxxxxxxxx9",
        "notificationTime": "2015-09-29T18:03:28.669Z",
        "notificationId": "amzn1.dash.notification.v1.xxxxxxxxxxxxx13",
        "version": "2015-06-05"
    },
    "deviceInfo": {
        "deviceIdentifier": {
            "serialNumber": "mySerialNumber"
        },
        "productIdentifier": {
            "modelId": "myDeviceModel"
        }
    },
    "customerInfo": {
        "directedCustomerId": "amzn1.account.AHxxxxxxxxGA2O5Q"
    }
}
```

## Subscription Changed

A subscription changed notification is sent in four scenarios:

*  Whenever a customer completes a new LWA device registration

*  Whenever a customer chooses an ASIN where they did not have a selection before

*  Whenever a customer clears an ASIN selection that was previously filled

*  Whenever a customer toggles the subscription on or off

The following is a sample subscription changed notification for reference:

<ul id="profileTabs" class="nav nav-tabs">
  <li class="active"><a class="noCrossRef" href="#sub-v2" data-toggle="tab">v2.0</a></li>
  <li><a class="noCrossRef" href="#sub-v1" data-toggle="tab">v1.0</a></li>  
</ul>
<div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="sub-v2">
    <div class="subheading">Version 2.0
    </div>
<p markdown="block">

```json
{
    "notificationInfo": {
        "notificationType": "SubscriptionChangedNotification",
        "lwaClientId": "amzn1.application-oa2-client.6b68exxxxxxxxxx9",
        "notificationTime": "2016-12-06T19:33:27.368Z",
        "notificationId": "amzn1.dash.notification.v1.xxxxxxxxxxxxx13",
        "version": "2015-06-05"
    },
    "deviceInfo": {
        "deviceIdentifier": {
            "serialNumber": "MySerialNumber"
        },
        "productIdentifier": {
            "modelId": "myDeviceModel"
        }
    },
    "subscriptionInfo": {
        "slotsSubscriptionStatus": {
            "SlotId1": {
                "subscribed":true,
                "productInfoList": [{
                    "quantity":1.0,
                    "unit": "count",
                    "asin": "myAsinNumber"
                }]
            },
            "SlotId2": {
                "subscribed":false,
                "productInfoList":[{
                  "quantity":1.0,
                  "unit": "count",
                  "asin": "myAsinNumber"
                }]
            }
        }
    },
    "customerInfo": {
        "directedCustomerId": "amzn1.account.AGY3J5MxxxxxxO4WRHHQA"
    }
}

...

{
    "MessageAttributes": {
        "version": {
            "type": "String",
            "Value": 2.0
        }
    }
}
```
</p>

  </div>
  <div role="tabpanel" class="tab-pane" id="sub-v1">
    <div class="subheading">Version 1.0
    </div>
<p markdown="block">

```json
{
    "notificationInfo": {
        "notificationType": "SubscriptionChangedNotification",
        "lwaClientId": "amzn1.application-oa2-client.6b68exxxxxxxxxx9",
        "notificationTime": "2015-09-30T23:27:50.771Z",
        "notificationId": "amzn1.dash.notification.v1.xxxxxxxxxxxxx13",
        "version": "2015-06-05"
    },
    "deviceInfo": {
        "deviceIdentifier": {
            "serialNumber": "mySerialNumber"
        },
        "productIdentifier": {
            "myDeviceModel": "myDeviceModel"
        }
    },
    "subscriptionInfo": {
        "slotsSubscriptionStatus": {
            "myFirstSlot": true,
            "mySecondSlot": true
        }
    },
    "customerInfo": {
        "directedCustomerId": "amzn1.account.AHxxxxxxxxGA2O5Q"
    }
}
```

</p>
  </div>
</div>

### Version Notes
Please note the following changes for **Subscription Changed** v2.0:

* The structure for `slotsSubscriptionStatus` has been modified. Each slot ID now maps to a structure containing a `subscribed` Boolean and `productInfoList` structure (`quantity`, `unit`, and `asin`).

## Item Shipped Notification

An item shipped notification is sent when the replenish API request is successfully received, the order is placed and not cancelled by the customer, and Amazon fulfillment has shipped the item to the customer.

The following is a sample item shipped notification for reference:

<ul id="profileTabs" class="nav nav-tabs">
  <li class="active"><a class="noCrossRef" href="#myitem-v2" data-toggle="tab">v2.0</a></li>
  <li><a class="noCrossRef" href="#myitem-v1" data-toggle="tab">v1.0</a></li>  
</ul>
<div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="myitem-v2">
    <div class="subheading">Version 2.0
    </div>
      <p markdown="block">

```json
{
    "notificationInfo": {
        "notificationType": "ItemShippedNotification",
        "lwaClientId": "amzn1.application-oa2-client.6b68exxxxxxxxxx9",
        "notificationTime": "2016-12-02T01:41:59.936Z",
        "notificationId": "amzn1.dash.notification.v1.xxxxxxxxxxxxx13",
        "version": "2015-06-05"
    },
    "deviceInfo": {
        "deviceIdentifier": {
            "serialNumber": "mySerialNumber"
        },
        "productIdentifier": {
            "modelId": "myDeviceModel"
        }
    },
    "customerInfo": {
        "directedCustomerId": "amzn1.account.AGY3J5MKHWP6I2RHDYPJO4WRHHQA"},
        "orderInfo": {
            "instanceId": "amzn1.dash.v2.o.ci43xxxxxxxxxx0",
            "slotId": "myProduct",
            "productInfo": [{
                "quantity":1.0,
                "unit": "count",
                "asin": "myAsinNumber",
                "estimatedDeliveryDate": "2016-11-16T07:59:59Z"
            }]
        }
    }
}

...

{
    "MessageAttributes": {
        "version": {
            "type": "String",
            "Value": 2.0
        }
    }
}
```

</p>

  </div>
  <div role="tabpanel" class="tab-pane" id="myitem-v1">
    <div class="subheading">Version 1.0</div>
        <p markdown="block">

```json
{
    "notificationInfo": {
        "notificationType": "ItemShippedNotification",
        "lwaClientId": "amzn1.application-oa2-client.6b68exxxxxxxxxx9",
        "notificationTime": "2015-10-01T20:43:28.626Z",
        "notificationId": "amzn1.dash.notification.v1.xxxxxxxxxxxxx13",
        "version": "2015-06-05"
    },
    "deviceInfo": {
        "deviceIdentifier": {
            "serialNumber": "mySerialNumber"
        },
        "productIdentifier": {
            "modelId": "myDeviceModel"
        }
    },
    "customerInfo": {
        "directedCustomerId": "amzn1.account.AHxxxxxxxxGA2O5Q"
    },
    "orderInfo": {
        "instanceId": "amzn1.dash.v2.o.ci43xxxxxxxxxx0",
        "slotId": "myProduct",
        "productInfo": [{
            "quantity": 12.0,
            "unit": "Count"
        }],
        "estimatedDeliveryDate": "2015-10-07T06:59:59Z"
    }
}
```
</p>
</div>
</div>


### Version Notes

Note the following changes for **Item Shipped** v2.0:

* `asin` information is now included inside `productInfo`  
* `estimatedDeliveryDate` is now inside `productInfo`  
* `MessageAttributes` are used to identify version notification message version

## Migrating to v2.0 Notifications

New vendors and associated devices are automatically subscribed to v2.0 notifications during registration. However, new devices registered by existing vendors will receive the highest consumed version of notifications consistent with previously onboarded devices. For example: If you are a vendor with devices subscribed to v1.0 notifications, when you register a new device, it will receive v1.0 notifications.

Follow these instructions to start your migration to v2.0 notifications for **OrderPlacedNotification**, **ItemShippedNotification**, and **SubscriptionChangedNotification**.

1. Use the test model **TestNotifV2ForVendors** and subscribe to the topic **arn:aws:sns:us-east-1:300797413096:TestNotifV2ForVendors**.
2. Create a new test device for this model. Trigger the v2.0 notifications by placing an order or changing the subscription status of the device. Ensure that you parse the response to the specification provided above.  
3. Confirm that you are correctly processing the v2.0 notifications, then create a new post in the [DRS Forum](https://forums.developer.amazon.com/spaces/61/Dash+Replenishment+Service.html) with the following information:
   * **Subject line:** Upgrade SNS Notifications to v2.0
   * Which notifications messages are you upgrading to v2.0?
   * Which device models will use the new notifications?
4. Amazon will notify you when your notifications have been upgraded to v2.0.



{% include links.html %}
