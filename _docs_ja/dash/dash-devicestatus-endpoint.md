---
title: DeviceStatus Endpoint
sidebar: dash_ja
permalink: dash-devicestatus-endpoint.html
product: Dash Replenishment Service
toc-style: kramdown
github: true
---

Devices must call DRS on a daily cadence to report activity.

* TOC
{:toc}

## Path

```
/deviceStatus
```

## HTTP Method

POST

## Header Parameters

```
x-amzn-accept-type: com.amazon.dash.replenishment.DrsDeviceStatusResult@1.0
x-amzn-type-version: com.amazon.dash.replenishment.DrsDeviceStatusInput@1.0
Authorization: Bearer (ACCESS_TOKEN)
```

## Versioning

Versioning is used to incrementally update API functionality without directly impacting customers. `x-amzn-type-version` and `x-amzn-accept-type` headers must be sent with each call. The following are supported by the DeviceStatus Endpoint:

```
x-amzn-type-version: com.amazon.dash.replenishment.DrsDeviceStatusInput@1.0
```

```
x-amzn-accept-type: com.amazon.dash.replenishment.DrsDeviceStatusResult@1.0
```

## Request Body Parameters

The following data must be passed in the request body:

<table>
<colgroup>
<col width="30%" />
<col width="50%" />
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
      <td><code>mostRecentlyActiveDate</code></td>
      <td>The date and time of the most recent device activity in ISO 8601 format.</td>
      <td>String</td>
    </tr>
  </tbody>
</table>
**Sample Request Body**

```json
{
    "mostRecentlyActiveDate" : "2015-12-21T10:00:00Z"
}
```

## Response Example

```
HTTP/1.1 200 OK
x-amzn-type-version: com.amazon.dash.replenishment.DrsDeviceStatusResult@1.0
```

## Error Responses

<table>
   <colgroup>
      <col width="40%" />
      <col width="60%" />
   </colgroup>
  <thead>
    <tr>
      <th>Errors</th>
      <th>Descriptions</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>HTTP/1.1 500 Internal Server Error</td>
      <td>Indicates that an error occurred internally to the server.</td>
    </tr>
    <tr>
      <td>HTTP/1.1 400 Bad Request</td>
      <td>Client error: an error occurred due to data passed in by the client (e.g. bad token).  Amazon will make a best effort to provide feedback on the nature of the failure in the response body.</td>
    </tr>
  </tbody>
</table>

{% include links.html %}
