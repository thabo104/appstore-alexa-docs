---
title: Deregistration Endpoint
sidebar: dash
permalink: dash-deregistration-endpoint.html
product: Dash Replenishment Service
toc-style: kramdown
github: true
---

Deregistration is used to disassociate a device from a customer’s Amazon account. This call will invalidate any LWA access tokens, refresh tokens, and authorization codes associated with the device.

* TOC
{:toc}

## Path

<ul id="profileTabs" class="nav nav-tabs">
  <li class="active"><a class="noCrossRef" href="#item-v2" data-toggle="tab">v2.0</a></li>
  <li><a class="noCrossRef" href="#item-v1" data-toggle="tab">v1.0</a></li>  
</ul>
<div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="item-v2">
    <div class="subheading">Version 2.0
    </div>
<p markdown="block">

<pre class="curl">
/registration
</pre>

</p>

</div>
  <div role="tabpanel" class="tab-pane" id="item-v1">
    <div class="subheading">Version 1.0
    </div>
<p markdown="block">

<pre class="curl">
/deviceModels/<span class="endpointParam">{DEVICE_MODELID}</span>/devices/<span class="endpointParam">{DEVICE_IDENTIFIER}</span>/registration
</pre>

</p>
</div>
</div>

## HTTP Method

DELETE

## Header Parameters

<ul id="profileTabs" class="nav nav-tabs">
  <li class="active"><a class="noCrossRef" href="#headeritem-v2" data-toggle="tab">v2.0</a></li>
  <li><a class="noCrossRef" href="#headeritem-v1" data-toggle="tab">v1.0</a></li>  
</ul>
<div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="headeritem-v2">
    <div class="subheading">Version 2.0
    </div>
<p markdown="block">

```
Authorization: Bearer (ACCESS_TOKEN)
x-amzn-accept-type: com.amazon.dash.replenishment.DrsDeregisterResult@1.0
x-amzn-type-version: com.amazon.dash.replenishment.DrsDeregisterInput@2.0
```

</p>
</div>
  <div role="tabpanel" class="tab-pane" id="headeritem-v1">
    <div class="subheading">Version 1.0
    </div>
<p markdown="block">

```
Authorization: Bearer (ACCESS_TOKEN)
x-amzn-accept-type: com.amazon.dash.replenishment.DrsDeregisterResult@1.0
x-amzn-type-version: com.amazon.dash.replenishment.DrsDeregisterInput@1.0
```

</p>
</div>
</div>


## Versioning

Versioning is used to incrementally update API functionality without directly impacting customers. `x-amzn-type-version` and `x-amzn-accept-type` headers must be sent with each call. The following are supported by the Deregister Endpoint:

<ul id="profileTabs" class="nav nav-tabs">
  <li class="active"><a class="noCrossRef" href="#versionitem-v2" data-toggle="tab">v2.0</a></li>
  <li><a class="noCrossRef" href="#versionitem-v1" data-toggle="tab">v1.0</a></li>  
</ul>
<div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="versionitem-v2">
    <div class="subheading">Version 2.0
    </div>
<p markdown="block">

```
x-amzn-type-version: com.amazon.dash.replenishment.DrsDeregisterInput@2.0
x-amzn-accept-type: com.amazon.dash.replenishment.DrsDeregisterResult@1.0
```

</p>
</div>
<div role="tabpanel" class="tab-pane" id="versionitem-v1">
<div class="subheading">Version 1.0
    </div>
<p markdown="block">

```
x-amzn-type-version: com.amazon.dash.replenishment.DrsDeregisterInput@1.0
x-amzn-accept-type: com.amazon.dash.replenishment.DrsDeregisterResult@1.0
```

</p>
</div>
</div>

## Response Example

```
HTTP/1.1 200 OK
x-amzn-type-version: com.amazon.dash.replenishment.DrsDeregisterResult@1.0
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
      <td>Client error: an error occurred due to data passed in by the client (e.g. bad token).  Amazon will make a best effort to provide feedback on the nature of the failure in the response body.</td>
    </tr>
  </tbody>
</table>

{% include links.html %}
