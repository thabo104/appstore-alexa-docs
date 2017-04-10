---
title: Replenish Endpoint
sidebar: dash
permalink: dash-replenish-endpoint.html
product: Dash Replenishment Service
toc-style: kramdown
github: true
---

Replenish is the core API used to place an order for a device/slot combination. Calling the Replenish Endpoint will order the ASIN selected by your customer during device registration.

* TOC
{:toc}

## Path

<pre>
/replenish/<span class="endpointParam">{SLOT_ID}</span>
</pre>

## HTTP Method

POST

## Header Parameters

```
Authorization: Bearer (ACCESS_TOKEN)
x-amzn-accept-type: com.amazon.dash.replenishment.DrsReplenishResult@1.0
x-amzn-type-version: com.amazon.dash.replenishment.DrsReplenishInput@1.0
```

## Versioning

Versioning is used to incrementally update API functionality without directly impacting customers. `x-amzn-type-version` and `x-amzn-accept-type` headers must be sent with each call. The following are supported by the Replenish Endpoint:

```
x-amzn-type-version: com.amazon.dash.replenishment.DrsReplenishInput@1.0
```

```
x-amzn-accept-type: com.amazon.dash.replenishment.DrsReplenishResult@1.0
```

## Response Example

```
HTTP/1.1 200 Accepted
x-amzn-type-version: com.amazon.dash.replenishment.DrsReplenishResult@1.0
Content-Type: application/json
{
    "eventInstanceId" : "SOME_EVENT_INSTANCE"
    "detailCode" : "STANDARD_ORDER_PLACED"
}
```

## Response Example Details

A successful response **does not** indicate that a purchase actually occurred.  A successful response indicates that Amazon has accepted the request and performed some processing.  On any accepted order, Amazon will provide:

* `eventInstanceId`: used to map order notifications back to the original purchase event  
* `detailCode`: describes the order result

The following `detailCode` values are used:

<table>
<colgroup>
<col width="30%" />
<col width="50%" />
</colgroup>
  <thead>
    <tr>
      <th>Responses</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>STANDARD_ORDER_PLACED</code></td>
      <td>An order was successfully placed and will be shipped to the customer.</td>
    </tr>
    <tr>
      <td><code>TEST_ORDER_PLACED</code></td>
      <td>An order was successfully placed with the test flag.  All notifications will proceed normally but the customer will not be charged and the item will not ship.</td>
    </tr>
    <tr>
      <td><code>ORDER_INPROGRESS</code></td>
      <td>No order was placed because an order is already in progress.  This value will be returned as long as there is an order still out for delivery to the customer.</td>
    </tr>
  </tbody>
</table>

{% include note.html content="DRS accepts the order and returns a STANDARD_ORDER_PLACED response even if the purchase cannot be immediately processed as a result of either the ASIN state or the customer’s account state. Ordering is an asynchronous workflow and you should plan on using the SNS notifications describe later in the document to understand any state changes. See [Order Resolution Flow][dash-amazon-order-resolution-flow] for more information." %}

## Error Responses


<table>
   <colgroup>
      <col width="40%" />
      <col width="60%" />
   </colgroup>
  <thead>
    <tr>
      <th>Error Response</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>HTTP/1.1 400 Bad Request</td>
      <td>Client Error: An error occurred due to data passed in by the client (e.g. bad token).  Amazon will make a best effort to provide feedback on the nature of the failure in the response body.</td>
    </tr>
    <tr>
      <td>HTTP/1.1 404 Not Found</td>
      <td>Client Error: Attempting to replenish a non-existing slot.</td>
    </tr>
    <tr>
      <td>HTTP/1.1 500</td>
      <td>Internal Server Error: Indicates that an error occurred internally to the server.</td>
    </tr>
  </tbody>
</table>

{% include links.html %}
