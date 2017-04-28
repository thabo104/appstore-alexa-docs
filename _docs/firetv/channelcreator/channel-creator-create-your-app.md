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

1.  Create an Amazon developer account through the Developer Portal at [developer.amazon.com/](https://developer.amazon.com/). Click **Sign In**, and then select **I am a new customer.**

    Your Amazon developer account is different from your retail Amazon account (though for the sake of simplicity, use the same username for both). From the Developer Portal, you can view reports about your app.

    {% include note.html content="If you don't have an Amazon developer account, it's okay. You can sign into Channel Creator with your retail Amazon account. When you submit your app, Channel Creator will prompt you to auto-create an Amazon developer account from within Channel Creator. "%}

2.  Go to Channel Creator at [channelcreator.amazon.com/](https://channelstudio.amazon.com/) and sign in with your Amazon developer account.
3.  Click **Create New Channel**.
4.  Select the source for your videos:
    * YouTube
    * Media RSS feed

    For pros and cons between the two options, see [YouTube versus Media RSS Feeds][channel-creator-overview#youtube_vs_mrss].

5.  If you selected **YouTube**, enter your Channel ID in the text box. For details on how to get your channel ID, see [Get Your YouTube Channel ID][channel-creator-youtube#getchannelid].

    Channel Creator attempts to validate the username or channel ID, or the MRSS feed. If successful, you see a green check mark. Skip to step 7.

6.  If you selected **Media RSS**, enter your MRSS feed URL in the text box. See [Sample Media RSS Feed][channel-creator-mrss#samplemrssfeed] for details.

    Channel Creator attempts to validate the MRSS feed. It will auto-map the app elements to the elements in your feed. If the mapping doesn't identify the right element, you can use select the right element from drop-down menus. You can choose how different elements in your RSS feed map to the elements in Channel Creator. If Channel Creator guesses incorrectly at a certain element, you can correct it with the right mapping.

    --> insert screenshot

6.  Click **Create**.

    A preview of your web app appears in the browser. Use the virtual directional pad to play and navigate the videos. This virtual directional pad simulates the same directional pad on a Fire TV remote controller.

    {% include image.html  file="channel-creator-directional-pad" type="png" alt="Virtual directional pad" %}

    {% include note.html content="You can't use your mouse to interact with the web app. You have to click on the virtual directional pad. For example, if you click your mouse on the Latest drop-down menu (the navigation bar), it won't do anything. You must select it by clicking the up arrow on the directional pad followed by the center button. The center button expands or plays what you have selected with the arrow buttons." %}

    In the navigation bar, in addition to any categories, you will see an "About" page. This page is automatically included and required as part of the attribution for using YouTube API services in the app. You cannot remove or customize this page, nor can you add your own pages here.

7.  To modify the appearance of the app, click **Edit**.

8.  In the **Logo** section, click **Choose a file** and upload a 500px x 500px size image for your logo. The logo appears in the upper-right corner of your app. (Note that this image is used only within your app and is not the app logo image used to promote your app within the Fire TV interface.)
9.  Adjust the colors and background images for your app as desired.
10. Click **Preview** to see any changes. You can view the site as this preview link, and you can send the preview link to anyone for review.
11. Click **Finish**.
12. If you selected YouTube as the source, click **Edit** next to **DEVKEY** and enter your YouTube API key.

    For details on how to get your YouTube API key (the dev key), see [Get the YouTube Developer API Key][channel-creator-youtube#getdevkey]. You can use the same key for all channels in your account and for all apps you create within the same account.

13. To block certain videos in your channel from appearing in your app, next to "SOURCE," click **Advanced**. Then enter the video ID in the **Video ID to block** field and click **Block Video**.

    To get the ID for your YouTube video, browse to your video. In the address bar, the ID appears after the `=` sign. For example, if the URL of your video was `https://www.youtube.com/watch?v=byW_xwZ9FM4`, the video ID would be `byW_xwZ9FM4`.

14. To test your app on a Fire TV device, download the Channel Viewer app from the Amazon Appstore. Enter the Channel Viewer Code to view your app.

When you're ready to submit the app directly into the Amazon Appstore, see the instructions in [Submit Your App][channel-creator-submit-your-app].


{% include links.html %}
