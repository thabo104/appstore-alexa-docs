---
title: SubscriptionInfo Endpoint
sidebar: dash_ja
navtabs: true
permalink: dash-getsubscriptioninfo-endpoint.html
product: Dash Replenishment Service
toc-style: kramdown
github: true
---

SubscriptionInfo allows device makers to access the subscription status for specific slots assigned to registered devices.

* TOC
{:toc}

## Path

```
/subscriptionInfo
```

## HTTP Method

GET

## Versioning

Versioning is used to incrementally update API functionality without directly impacting customers. `x-amzn-type-version` and `x-amzn-accept-type` headers must be sent with each call. The following headers are supported by the GetSubscriptionInfo Endpoint:

{% include note.html content="Version 2.0 of the **SubscriptionInfo** API supports product ASINs and quantity. To receive a response with ASIN and quantity data, ensure that you are passing the correct headers." %}

## Header Parameters

<ul id="profileTabs" class="nav nav-tabs">
  <li class="active"><a class="noCrossRef" href="#header-v2" data-toggle="tab">v2.0</a></li>
  <li><a class="noCrossRef" href="#header-v1" data-toggle="tab">v1.0</a></li>
</ul>
<div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="header-v2">
    <div class="subheading">Version 2.0
    </div>
    <p markdown="block">

```
Authorization: Bearer (ACCESS_TOKEN)
x-amzn-accept-type: com.amazon.dash.replenishment.DrsSubscriptionInfoResult@2.0
x-amzn-type-version: com.amazon.dash.replenishment.DrsSubscriptionInfoInput@1.0
```

</p>
</div>
  <div role="tabpanel" class="tab-pane" id="header-v1">
    <div class="subheading">Version 1.0
    </div>
        <p markdown="block">

```
Authorization: Bearer (ACCESS_TOKEN)
x-amzn-accept-type: com.amazon.dash.replenishment.DrsSubscriptionInfoResult@1.0
x-amzn-type-version: com.amazon.dash.replenishment.DrsSubscriptionInfoInput@1.0
```

</p>
</div>
</div>

## Response Example

<ul id="profileTabs" class="nav nav-tabs">
  <li class="active"><a class="noCrossRef" href="#response-v2" data-toggle="tab">v2.0</a></li>
  <li><a class="noCrossRef" href="#response-v1" data-toggle="tab">v1.0</a></li>
</ul>
<div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="response-v2">
    <div class="subheading">Version 2.0
    </div>
<p markdown="block">

```
HTTP/1.1 200 OK
x-amzn-type-version: com.amazon.dash.replenishment.DrsSubscriptionInfoResult@2.0
{
 "slotsSubscriptionStatus": {
   "slot1": {
     "productInfoList": [{
       "asin": "string",
       "quantity": 1,
       "unit": "count"
     }],
     "subscribed": true
   }
 }
}
```

</p>

</div>
  <div role="tabpanel" class="tab-pane" id="response-v1">
    <div class="subheading">Version 1.0
    </div>
<p markdown="block">

```
HTTP/1.1 200 OK
x-amzn-type-version: com.amazon.dash.replenishment.DrsSubscriptionInfoResult@1.0
{
   "slotsSubscriptionStatus": {
     "slot1": true,
     "slot2": false
   }
}
```

</p>
</div>
</div>

## Error Responses

<table>
   <colgroup>
      <col width="40%" />
      <col width="60%" />
   </colgroup>
  <thead>
    <tr>
      <th>Error Responses</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>HTTP/1.1 500 Internal Server Error</td>
      <td>Indicates that an error occurred internally to the server.</td>
    </tr>
    <tr>
      <td>HTTP/1.1 400 Bad Request</td>
      <td>Client Error: An error occurred due to data passed in by the client (e.g. bad token).  Amazon will make a best effort to provide feedback on the nature of the failure in the response body.</td>
    </tr>
  </tbody>
</table>

{% include links.html %}
