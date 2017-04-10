---
title: Create an LWA Security Profile
sidebar: dash
permalink: dash-create-a-security-profile.html
product: Dash Replenishment Service
toc-style: kramdown
github: true
---

To access Amazon’s Dash Replenishment Service (DRS), your product must obtain a Login with Amazon (LWA) access token, which grants your product access to the API on your customer’s behalf.  

The first step in obtaining an LWA token is to create a security profile for your device. The following instructions walk you through how to do this.  

* TOC
{:toc}

## Create an LWA Security Profile  

The follow instructions walk you through creating an Amazon Security Profile.

1. Login to the [Amazon Developer Portal](https://developer.amazon.com/login.html).
2. Click on the **APPS & SERVICES** tab, then click **Login with Amazon**.

   {% include image.html file="dash/images/security-profile-1" border="true" type="png" url="drs/images/security-profile-1.png" %}

3. Click **Create a New Security Profile**.

   {% include image.html file="dash/images/security-profile-2" border="true" type="png" url="drs/images/security-profile-2.png" %}

4. Enter the following information:
   * **Security Profile Name** - The name of your app
   * **Security Profile Description** - The description of your app
   * **Consent Privacy Notice URL**
   * **Brand Image for Consent Logo**
   {% include image.html file="dash/images/security-profile-3" border="true" type="png" url="drs/images/security-profile-3.png" %}
5. Click **Save**.

## Get Your Security Profile information

After you've created your Amazon Security Profile, follow the steps below to gather the information necessary to complete device registration.  

1. After you click **Save**, you'll be taken to [your list of security profiles](https://developer.amazon.com/lwa/sp/overview.html). Click the gear next to the Security Profile you would like to use and select **Security Profile**.

   {% include image.html file="dash/images/security-profile-4" border="true" type="png" url="drs/images/security-profile-4.png" %}

2. Take note of your Security Profile ID and Client ID.

   {% include image.html file="dash/images/security-profile-5" border="true" type="png" url="drs/images/security-profile-5.png" %}

3. Go to [https://developer.amazon.com/mycid.html](https://developer.amazon.com/mycid.html) and take note of your Vendor ID.

   {% include image.html file="dash/images/security-profile-6" border="true" type="png" url="drs/images/security-profile-6.png" %}

{% include tip.html content="Make note of your Security Profile ID, Client ID, and Vendor ID. You will need these when you register your device." %}

{% include links.html %}
