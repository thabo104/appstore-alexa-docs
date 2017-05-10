---
title: LWA Overview
sidebar: dash_ja
permalink: dash-lwa-overview.html
product: Dash Replenishment Service
toc-style: kramdown
github: true
---

To connect DRS Devices to Amazon's backend services, the user must authorize you to carry actions out on their behalf, and the user must configure their device. There are two popular methods of authorization/configuration of DRS devices: a mobile companion application or a web application. Neither option is enforced. The following sections provide an overview of the steps that you need to implement.

* TOC
{:toc}

## LWA Authorization

The main components in the LWA authorization process include the following:

* DRS device
* Mobile or/and a web applications
* LWA security profile
* LWA backend service
* DRS backend service

Any DRS device created in the [Self Service portal](https://developer.amazon.com/dash-replenishment/index.html) needs to have an LWA Security profile (this may also be referred to as an LWA application in the documentation). The LWA Security profile acts as a bridge between developers and users. You as a developer will need to add your companion applications details in the [Login with Amazon console](https://developer.amazon.com/lwa/sp/overview.html). By adding these details in the LWA console, you allow users to register, set up, and manage their DRS device.

For more information about setting up the LWA Security profile for mobile applications, see [Use LWA Mobile SDK with Android][dash-lwa-mobile-sdk-android] and [Use LWA Mobile SKD with iOS][dash-lwa-mobile-sdk-ios] pages. For more information on setting up web applications, refer to [Using the LWA Web API page][dash-lwa-web-api].

**Before implementing your integration with LWA:**

* Create an LWA security profile.
* Create a DRS device in the Self Service portal with the LWA security profile.
* Add your companion applications details to your LWA security profile.

**LWA authorization steps:**

* Provide a way for users to register a DRS device (companion application).
* Request the login by passing the correct login parameters.
* Request the access and refresh tokens.
* Securely store the access and refresh tokens.
* As requested, call the DRS backend services with the access token.

Since every use case is different, it is up to the developers to design the system that will implement these steps. The following sections provide two examples of system design.

## Mobile Application

A common authorization use case relies on a mobile application to set up and manage a DRS device. The DRS device needs to communicate with the mobile application to exchange information, and the mobile application is used to communicate with the LWA and the DRS backend.

{% include image.html  file="dash/images/drs-lwa-mobile" type="png" alt="LWA integration with mobile applications" %}

1.  The DRS device needs to transfer the Device Model name (this is the model ID of the device
from the [Self Service portal](https://developer.amazon.com/dash-replenishment/index.html)), Device Serial number (unique device serial number), Code challenge (see the [LWA Mobile SDK Overview page][dash-lwa-mobile-sdk] that explains how to create a code challenge), and the method for the code challenge (see the [LWA Mobile SDK Overview][dash-lwa-mobile-sdk] for more details).
2.  Makes a login request with the received parameters.
3.  LWA returns the confirmation parameters to the mobile application (grant type, authorization code, redirect URI, client ID and the code verifier).
4.  Transfers received parameters securely to the DRS Device.
5.  The DRS device sends the request to exchange the received parameters for the refresh and access tokens.
6.  LWA returns the refresh and access tokens, token type, and the expiration time of the access token. The refresh token is used to refresh the access token after expiration and you should securely store it.
7.  At this point, the DRS device can call all the [DRS APIs][dash-replenish-endpoint].

## Web Application

Another common way to register and manage a DRS device is to authorize it through a web application. With this approach, the DRS device can communicate with a web application from the moment when it is
connected to the Internet.

{% include image.html  file="dash/images/drs-lwa-eb" type="png" alt="LWA integration with web applications" %}

1.  The user enters their DRS device information in the web application.
2.  The web application requests login with the device model ID (model ID from the Self Service
portal) and the serial number.
3.  LWA returns the authorization code.
4.  The web application requests the refresh and the access tokens with the authorization code
received from the LWA.
5.  LWA returns the refresh and access tokens if all the parameters are correct.
6.  The DRS device requests a particular action (for example, the replenish action).
7.  The web application calls the DRS APIs.

{% include links.html %}
