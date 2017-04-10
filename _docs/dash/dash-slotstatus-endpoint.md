---
title: SlotStatus Endpoint
sidebar: dash
permalink: dash-slotstatus-endpoint.html
product: Dash Replenishment Service
toc-style: kramdown
github: true
---

When the contents of a slot are consumed, the device must call DRS using the SlotStatus endpoint to report on the current state of the slot.

* TOC
{:toc}

## Path

<pre>
/slotStatus/<span class="endpointParam">{SLOT_ID}</span>
</pre>

## HTTP Method

POST

## Header Parameters

```
Authorization: Bearer (ACCESS_TOKEN)
x-amzn-accept-type: com.amazon.dash.replenishment.DrsSlotStatusResult@1.0
x-amzn-type-version: com.amazon.dash.replenishment.DrsSlotStatusInput@1.0
```

## Versioning

Versioning is used to incrementally update API functionality without directly impacting customers. `x-amzn-type-version` and `x-amzn-accept-type` headers must be sent with each call. The following are supported by the SlotStatus Endpoint:

```
x-amzn-type-version: com.amazon.dash.replenishment.DrsSlotStatusInput@1.0
```

```
x-amzn-accept-type: com.amazon.dash.replenishment.DrsSlotStatusResult@1.0
```

## Request Body Parameters


The following data must be passed in the request body:

<table>
<colgroup>
<col width="30%" />
<col width="50%" />
<col width="20%" />
</colgroup>
  <thead>
    <tr>
      <th>Parameter</th>
      <th>Description</th>
      <th>Type</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>expectedReplenishmentDate</code></td>
      <td>The expected product replenishment date in ISO 8601 format.</td>
      <td>String</td>
    </tr>
    <tr>
      <td><code>remainingQuantityInUnit</code></td>
      <td>Remaining quantity of the container (in the unit of measurement provided during DeviceCapabilitiesGroup creation).</td>
      <td>Integer</td>
    </tr>
    <tr>
      <td><code>originalQuantityInUnit</code></td>
      <td>Total quantity of product the container had when it was full (in the unit of measurement that you provided during DeviceCapabilitiesGroup creation).</td>
      <td>Integer</td>
    </tr>
    <tr>
      <td><code>totalQuantityOnHand</code></td>
      <td>Total quantity of product on hand, but not loaded into the device (if known).</td>
      <td>Integer</td>
    </tr>
    <tr>
      <td><code>lastUseDate</code></td>
      <td>The last time that product was consumed from a given slot in ISO 8601 format.</td>
      <td>String</td>
    </tr>
  </tbody>
</table>

**Sample Request Body**

```json
{
    "expectedReplenishmentDate" : "2015-12-28T10:00:00Z",
    "remainingQuantityInUnit" : 3.5,
    "originalQuantityInUnit" : 10,
    "totalQuantityOnHand" : 20,
    "lastUseDate" : "2015-12-21T10:00:00Z"
}
```

## Response Example

```
HTTP/1.1 200 OK
x-amzn-type-version: com.amazon.dash.replenishment.DrsSlotStatusResult@1.0
```

## Error Responses


<table>
   <colgroup>
      <col width="40%" />
      <col width="60%" />
   </colgroup>
  <thead>
    <tr>
      <th>Error</th>
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
