---
title: Create an SNS Topic
sidebar: dash_ja
permalink: dash-create-an-sns-topic.html
product: Dash Replenishment Service
toc-style: kramdown
github: true
---

 The Dash Replenishment Service (DRS) uses SNS Topics to notify you (the device maker) of changes to device status, order state, subscription status, and more.

 [Amazon's Simple Notification Service (SNS)](https://aws.amazon.com/sns/) is a pub-sub service from AWS that makes it easy to set up, manage, and send messages instantly to applications or users. See [Notification Messages][dash-notification-messages] for a complete listing of supported DRS notifications.

* TOC
{:toc}

## Create an SNS Topic for DRS

1. Log in to the [AWS Console](http://aws.amazon.com/console/).
   {% include image.html max-width="80%" border="true" file="dash/images/sns-1" type="png" url="drs/images/sns-1.png" %}
2. Select **SNS** from **Mobile Services**
   {% include image.html border="true" file="dash/images/sns-2" type="png" url="drs/images/sns-2.png" %}
3. From the left navigation, click **Topics**, then click **Create new topic**.
   {% include image.html border="true" file="dash/images/sns-3" type="png" url="drs/images/sns-3.png" %}
4. Enter a **Topic name** and **Display name**, then click **Create topic**.
   * **Topic Name** - Used to create a permanent unique identifier called an Amazon Resource Name (ARN), which will be used to configure your SNS Notifications.
   {% include note.html content="Choose a friendly Topic Name and Display Name to improve code readability." %}
   {% include image.html file="dash/images/sns-4" type="png" url="drs/images/sns-4.png" %}

## Allow DRS to Publish Messages to Your Topic

1. Click the **ARN** for the topic you've created.
   {% include image.html border="true"  file="dash/images/sns-5" type="png" url="drs/images/sns-5.png" %}
2. Click **Other topic actions** and then click **Edit topic policy**.
   {% include image.html border="true"  file="dash/images/sns-6" type="png" url="drs/images/sns-6.png" %}
3. From **Basic View**, under **Allow these users to publish messages to this topic**, select **Only these AWS user** and enter your AWS Account ID and the DRS AWS Account ID.
   * To access your **AWS Account ID**, go to the [AWS Console](https://console.aws.amazon.com/billing/home?#/account).
   * Enter the following for the **DRS AWS Account ID**: `476877469412`
   {% include image.html border="true"  file="dash/images/sns-7" type="png" url="drs/images/sns-7.png" %}
4. Click **Update policy**.

{% include links.html %}
