---
title: Channel Creator Overview
permalink: channel-creator-create-your-app.html
sidebar: channelcreator
product: Channel Creator
toc-style: kramdown
github: true
---

For more information about Channel Creator, see the [Overview][channel-creator-overview]. To create an app, you will need your [YouTube channel ID][channel-creator-youtube#getchannelid] and [API key][channel-creator-youtube#getdevkey], or a valid [media RSS feed][channel-creator-mrss#samplemrssfeed].

* TOC
{:toc}

## Create Your App

1.  (Optional) Create an Amazon developer account through the Developer Portal at [developer.amazon.com/](https://developer.amazon.com/). Click **Sign In**, and then select **I am a new customer.** Follow the on-screen instructions to create an account. (Channel Creator doesn't allow monetization of apps, so you can skip that section in the sign-up.)

    Your Amazon developer account is different from your regular Amazon account, but you should use the same username for both accounts, since they are linked behind the scenes.

    {% include note.html content="If you don't have an Amazon developer account, you can sign into Channel Creator with your regular Amazon account and start creating an app. When you submit your app, Channel Creator will prompt you to auto-create an Amazon developer account from within Channel Creator. "%}

2.  Go to Channel Creator at [channelcreator.amazon.com/](https://channelstudio.amazon.com/) and sign in with your Amazon developer account.
3.  Click **Create New Channel**.
4.  Select the source for your videos:
    * YouTube
    * Media RSS feed

    For more detail about the two options, see ["YouTube versus Media RSS Feeds"][channel-creator-overview#youtube_vs_mrss].

5.  If you selected **YouTube**, enter your YouTube Channel ID (or your YouTube username that has a channel associated with it) in the text box. For details on how to get your channel ID, see ["Get Your YouTube Channel ID"][channel-creator-youtube#getchannelid].

    Channel Creator attempts to validate the channel ID or username. If successful, you'll see a green check mark. Skip ahead to step 7.

6.  If you selected **Media RSS**, enter your MRSS feed URL in the text box. See [Sample Media RSS Feed][channel-creator-mrss#samplemrssfeed] for details.

    Channel Creator attempts to validate the MRSS feed. Channel Creator auto-maps the app elements to the correct elements in your feed. If the mapping doesn't identify the correct element, you can select the correct element from the element drop-down menus.

6.  Click **Create**.

    A preview of your web app appears in the browser. Use the virtual directional pad to play and navigate the videos. This virtual directional pad simulates the same directional pad on a Fire TV remote control.

    {% include image.html  file="firetv/channelcreator/images/channel-creator-directional-pad" type="png" alt="Virtual directional pad" %}

    {% include note.html content="You can't use your mouse to interact with the web app in the Internet browser preview. You have to click on the virtual directional pad. For example, if you use your mouse to click the Latest drop-down menu (the navigation bar), it won't respond. Instead, to select an option from the navigation bar, you must use the directional pad -- clicking the up arrow followed by the center button. The center button expands or plays what you have selected with the arrow buttons." %}

    In the navigation bar, in addition to any categories from your feed items or sections on your YouTube Channel, you will see an "About" page. This About page is automatically included and required as part of the attribution for using YouTube API services in the app. You cannot remove or customize the About page, nor can you add your own custom pages here.

7.  Continue on to the next section, [Style Your App][#styleyourapp].

## Style Your App {#styleyourapp}

1.  If you're continuing from the previous section, click **Edit**. Otherwise, click **Manage Channels** in the upper-right corner and then click **Edit** next to your app.
2.  In the **Logo** section (in the upper-left corner), click **Choose a file** and upload a 500px x 500px size image for your logo.

    The logo appears in the upper-right corner of your app. This image is used only within your app. (It is not the app logo tile that is used to promote your app within the Appstore.)

3.  Adjust the colors and background images for your app as desired using the on-screen controls.

## Share a Preview Link to Your App

After you've finished adjusting your app's appearance, you can get a preview link to share with others (if you so desire).

1.  If you're continuing from the previous section, click **Preview** (in the upper-right corner). Otherwise, click **Manage Channels** in the upper-right corner, and then click **Preview** next to your app.
2.  Copy the URL that appears in your browser's address bar.

You can send the preview link to anyone for review. No login is required to see the preview. The link expires after 90 days.

## Preview Your App on a Fire TV Device

You can also preview your app on a Fire TV device by using a companion app called Channel Viewer.

1.  Click **Manage Channels** in the upper-right corner, and then copy the **Channel Viewer Code** that appears in your app's details.
1.  On your Fire TV device, download and install the Channel Viewer app.
2.  In Channel Viewer, click **Add Channel** and enter your Channel Viewer code to view your app.

## Submit Your App to the Appstore

When you're ready to submit your app to the Appstore, you need to add some image assets and app descriptions. This is necessary to promote your app in the Appstore.

1.  Click **Manage Channels** in the upper-right corner.
2.  If you selected YouTube as the source, next to **API Key**, click **Edit** and enter your YouTube API key.

    For details on how to get your YouTube API key, see [Get the YouTube Developer API Key][channel-creator-youtube#getdevkey]. You can use the same API key for all channels in your account and for all apps you create within the same account.

4.  Click **Submit** next to your app.

    Channel Creator prepares for app submission by automatically creating some of the required image assets.

5.  As prompted, upload the required [image assets][channel-creator-submit-your-app#imageassets] and [descriptions][channel-creator-submit-your-app#appdescriptions] required by the Appstore. See [Submit Your App][channel-creator-submit-your-app] for details.

## Next Steps

When you're ready to submit the app directly into the Amazon Appstore, see the instructions in [Submit Your App][channel-creator-submit-your-app]. As part of the submission process, you will include a variety of image assets and descriptions to promote your app within the Amazon Appstore.


{% include links.html %}
