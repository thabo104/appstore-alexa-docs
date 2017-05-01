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

{% include note.html content="For the best experience, use [Chrome](https://www.google.com/chrome/) when interacting with Channel Creator." %}

1.  (Optional) Create an Amazon developer account through the Developer Portal at [developer.amazon.com/](https://developer.amazon.com/). Click **Sign In**, and then select **I am a new customer.** Follow the on-screen instructions to create an app. Channel Creator doesn't allow monetization of apps, so you can skip that section in the sign-up.

    Your Amazon developer account is different from your retail Amazon account (though for simplicity, use the same username for both).

    {% include note.html content="If you don't have an Amazon developer account, you can sign into Channel Creator with your retail Amazon account and start creating an app. When you submit your app, Channel Creator will prompt you to auto-create an Amazon developer account from within Channel Creator. "%}

2.  Go to Channel Creator at [channelcreator.amazon.com/](https://channelstudio.amazon.com/) and sign in with your Amazon developer account.
3.  Click **Create New Channel**.
4.  Select the source for your videos:
    * YouTube
    * Media RSS feed

5.  If you selected **YouTube**, enter your YouTube Channel ID (or your YouTube username that has a channel associated with it) in the text box. For details on how to get your channel ID, see [Get Your YouTube Channel ID][channel-creator-youtube#getchannelid].

    Channel Creator attempts to validate the channel ID or username. If successful, you see a green check mark. Skip to step 7.

6.  If you selected **Media RSS**, enter your MRSS feed URL in the text box. See [Sample Media RSS Feed][channel-creator-mrss#samplemrssfeed] for details.

    Channel Creator attempts to validate the MRSS feed. Channel Creator auto-maps the Fire TV app's elements to the elements in your MRSS feed. If the mapping doesn't identify the right element, you can use select the right element from the element drop-down menus. You can choose how different elements in your RSS feed map to the elements in Channel Creator.

6.  Click **Create**.

    A preview of your web app appears in the browser. Use the virtual directional pad to play and navigate the videos. This virtual directional pad simulates the same directional pad on a Fire TV remote controller.

    {% include image.html  file="channel-creator-directional-pad" type="png" alt="Virtual directional pad" %}

    {% include note.html content="You can't use your mouse to interact with the web app. You have to click on the virtual directional pad. For example, if you click your mouse on the Latest drop-down menu (the navigation bar), it won't respond. You select options in the navigation bar by clicking the up arrow on the directional pad followed by the center button. The center button expands or plays what you have selected with the arrow buttons." %}

    In the navigation bar, in addition to any categories, you will see an "About" page. This page is automatically included and required as part of the attribution for using YouTube API services in the app. You cannot remove or customize the About page, nor can you add your own pages here.

7.  To modify the appearance of the app, click **Edit**.

8.  In the **Logo** section, click **Choose a file** and upload a 500px x 500px size image for your logo. The logo appears in the upper-right corner of your app. (Note that this image is used only within your app and is not the app logo image used to promote your app within the Appstore.)
9.  Adjust the colors and background images for your app as desired using the on-screen controls.
10. To get a dedicated link to your app prior to submission, click **Preview**. You can send the preview link to anyone for review. (The link expires after 90 days.)
11. Click **Finish**.
12. If you selected YouTube as the source, click **Edit** next to **API Key** and enter your YouTube API key.

    For details on how to get your YouTube API key, see [Get the YouTube Developer API Key][channel-creator-youtube#getdevkey]. You can use the same API key for all channels in your account and for all apps you create within the same account.

13. To block certain videos in your channel from appearing in your app, next to "Source," click **Advanced**. Then enter the video ID in the **Video ID to block** field and click **Block Video**.

    To get the ID for a YouTube video, browse to the video. In the address bar, the ID appears after the `=` sign. For example, if the URL of your video was `https://www.youtube.com/watch?v=byW_xwZ9FM4`, the video ID would be `byW_xwZ9FM4`.

14. To test your app on a Fire TV device, download the Channel Viewer app from the Amazon Appstore. After opening the app, click **Add Channel** and enter the Channel Viewer Code for your app to view your app on Fire TV.

## Next Steps

When you're ready to submit the app directly into the Amazon Appstore, see the instructions in [Submit Your App][channel-creator-submit-your-app]. As part of the submission process, you will include a variety of image assets and descriptions to promote your app within the Amazon Appstore.




{% include links.html %}
