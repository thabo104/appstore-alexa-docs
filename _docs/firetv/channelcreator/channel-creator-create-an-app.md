---
title: Channel Creator Overview
permalink: channel-creator-create-an-app.html
sidebar: channelcreator
product: Channel Creator
toc-style: kramdown
github: true
---

For more information about Channel Creator, see the [Overview][channel-creator-overview].

To create an app:

1.  Create an Amazon developer account through the Developer Portal at [developer.amazon.com/](https://developer.amazon.com/). Click **Sign In**, and then select **I am a new customer.**

    Your Amazon developer account is different from your retail Amazon account (though for the sake of simplicity, you should use the same username for both). From the Developer Portal, you can manage your app submissions, update descriptions and other metadata about your app, see reports about downloads, and view other details about your app.

    {% include note.html content="The [Channel Creator site](https://channelcreator.amazon.com/) allows you to create and submit your app entirely from its site, but you can also download the zip file Channel Creator produces and submit it through the Developer Portal manually. "%}

2.  Go to Channel Creator at [channelcreator.amazon.com/](https://channelcreator.amazon.com/) and sign in with your Amazon developer account.
3.  Click **Create New Channel**.
4.  Select the source for your videos:
    * YouTube
    * Media RSS feed

    See the following section, [YouTube versus Media RSS Feeds](#youtube_vs_mrss) for pros and cons between the two options.
5.  If you selected **YouTube**, enter your Channel ID in the text box. See [Get Your YouTube Channel ID][channel-creator-youtube#getchannelid] for details.

    Channel Creator attempts to validate the username or channel ID, or the MRSS feed. If successful, you see a green check mark. Skip to step 7.

6.  If you selected **Media RSS**, enter your MRSS feed URL in the text box. See [Sample Media RSS Feed][channel-creator-mrss#samplemrssfeed] for details.

    Channel Creator attempts to validate the MRSS feed. It will auto-map the app elements to the elements in your feed. If the mapping doesn't identify the right element, you can use select the right element from drop-down menus.

6.  Click **Create**.

    A preview of your web app appears in the browser. Use the on-screen controls to play and navigate the videos.

    {% include note.html content="The drop-down selector that lets you choose a different category won't work in the preview. This selector works only on Fire TV devices." %}

7.  To modify the appearance of the app, click **Edit**.

8.  In the **Logo** section, click **Choose a file** and upload a 500px x 500px size image for your logo.
9.  Adjust the colors and background images for your app as desired.

    Note that because the category selector doesn't work in the preview, any changes you make to the Title Bar/Navigation won't be easy to see.
10. Click **Preview** to see any changes. You can view the site as this preview link.
11. Click **Finish**.
12. If you selected YouTube as the source, enter your YouTube Developer key. See [Get the Developer API Key][channel-creator-youtube#getdevkey] for details.
13. To submit the app directly into the Amazon Appstore, click **Submit** and complete the submission details. Alternatively, you can click **Download** to download the app as a zip file. You can then go to the [Developer Portal](https://developer.amazon.com/) and submit the app following the traditional submission process. See [Submitting Apps to the Amazon Appstore](https://developer.amazon.com/public/support/submitting-your-app/tech-docs/submitting-apps-to-amazon-appstore) for details.
