---
title: Use a YouTube Channel to Configure Channel Creator
permalink: channel-creator-youtube.html
sidebar: channelcreator
product: Channel Creator
toc-style: kramdown
github: true
---

You can configure your Channel Creator app using a YouTube channel as the source for your video content. YouTube approach gives you a robust, free platform for hosting and serving your video. You can group your videos into different channels within the same account. Channel Creator will require you to supply a developer API key in order to access the videos.

{% include warning.html content="Many of these instructions relate to managing your videos on YouTube. These instructions were last updated on April 27, 2017. If YouTube has changed its interface or workflow, these instructions may be out of date. Always consult YouTube's documentation to get the latest information." %}

* TOC
{:toc}

## Get Your YouTube Channel ID {#getchannelid}

Channel Creator displays all the videos contained within your YouTube channel. You will need your Channel ID to configure Channel Creator. To get your Channel ID:

1.  Log into [YouTube](https://www.youtube.com/).
2.  In the upper-left corner, click the 3-bar icon {% include inline_image.html file="channel-creator-hamburger" type="png" %}. Then select **My Channel**.

    {% include image.html  file="channel-creator-my-channel" type="png" alt="My Channel" %}
3.  Copy the ID that appears in the address bar:

    {% include image.html  file="channel-creator-channel-id" type="png" alt="YouTube Channel ID" %}

You can also view your YouTube Channel ID from your [Advanced Settings page](https://www.youtube.com/account_advanced).

## Get the Developer API Key

Channel Creator needs an API key in order to access your YouTube videos. To get the API key:

1.  Go to the Google Developer Console at [console.developers.google.com](https://console.developers.google.com).
2.  Log into your Google account using the same login that you use for your YouTube account.

    If you don't have any existing projects, you're directed to the Library tab:

    {% include image.html  file="google-developer-console-no-projects" type="png" max-width="600" url="https://console.developers.google.com" caption="Google Developer Console Dashboard" alt="Google Developer Console Dashboard" %}

    If you already have a project, you're directed to the Dashboard tab for the most recent project.

3.  In the upper-left corner, click the **Select a Project** drop-down menu; then click the **+** (plus) button to create a new project. (If you already have an existing project, the drop-down menu will display a project name instead of **Select a Project**.)

    {% include image.html  file="channel-creator-create-project-fresh" type="png" %}

4.  Type a project name, complete any other options presented, and then click **Create**.

    {% include image.html file="channel-creator-new-project" type="png" %}

5.  After the project gets created (it takes a few seconds), you're directed to the **Library** tab.
6.  In the left sidebar, click the **Credentials** tab:

    {% include image.html file="channel-creator-create-credentials-screen" type="png" alt="Create Credentials screen" %}

7.  Click the **Create Credentials** drop-down menu and select **API Key**.

    {% include image.html  file="channel-creator-credentials-api-key" type="png" alt="API key" %}

    (If prompted to name your key, give it a name.)

8.  Copy the API key that appears, and then click **Close**. (You don’t need to restrict your key.)

    {% include image.html  file="channel-creator-credentials-api-key" type="png" alt="API key" %}

    Save your API key in a convenient location, as you will need it when you configure Channel Creator.

9.  In the left sidebar, click **Library**. A list of APIs you can enable for your project appears.
10. In the **YouTube APIs** section, click **YouTube Data API**.

    {% include image.html file="channel-creator-youtube-data-api" type="png" alt="YouTube Data API" %}

11.  Click **Enable** {% include inline_image.html file="channel-creator-enable" type="png" alt="Enable the API" %}.

{% include note.html content="You can use the same API key for each Fire TV app you create, assuming each channel belongs to the same YouTube account." %}

## Configure Your Channel with the Videos You Want

By default, Channel Creator gets the latest 50 videos in reverse chronological order from your channel. If you want all the videos in your channel to appear in your app, great, leave all the videos in your channel as is. On the other hand, if you only want some videos in your channel included in your app, you can create another channel (within your same YouTube account) that includes only the videos you want in your Fire TV app. See [Manage multiple channels](https://support.google.com/youtube/topic/4627509?hl=en&ref_topic=3024173) in Google's documentation for full details on setting up multiple channels. In short, to create additional channels:

1.   From [YouTube](https://www.youtube.com/), click your profile icon in the upper-right corner and select the Youtube settings icon {% include inline_image.html file="gearicon" type="png" %}. Alternatively, go directly to  your [YouTube Account settings](https://www.youtube.com/account) page.
2.  Click **See all my channels or create a new channel.**
3.  Click **+ Create a new channel**.

    If you created your YouTube channel before 2014, you may not see options to create a new channel until you first create a "brand account." Follow the links to create a brand account. (Newer YouTube channels already offer the ability to create multiple channels without first establishing a brand account.) See [Channels migrated to Brand accounts](https://support.google.com/youtube/answer/7278798) for more details.

4.  As desired, customize your channel with art, a description, etc.
5.  Upload the videos you want into this channel. (You can't simply transfer videos from one YouTube channel to another.)

    You can transfer the videos by first downloading your videos from one channel and then uploading them into another channel. To download a video, click your profile icon in the upper-right, select **Creator Studio**, then expand **Video Manager** in the left sidebar. Click the drop-down arrow next to a video and select **Download MP4**. After you transfer videos across channels, delete the videos from the old channel so you don't have duplicate video content across channels.

## Group Videos into Different Playlists

By default, Channel Creator organizes all your videos into a "Latest" category.

{% include image.html  file="channel-creator-latest" type="png" alt="Latest grouping" %}

It will also truncate the names to size with an ellipsis if they are too long to fit in the menu.

If you have different playlist-based "sections" configured in your YouTube channel, Channel Creator will add those sections to the Category filter. This will allow users to select the playlist/section they want.

To group your videos into different playlists in your YouTube channel:

1.  Follow the instructions in YouTube's help to [Create & manage playlists](https://support.google.com/youtube/answer/57792). In short, do the following:
    a.  Click your profile icon in the upper-right corner, and then select **Creator Studio**.
    b.  In the left sidebar, expand **Video Manager** and select **Playlists**.
    c.  To create a new playlist, click **New playlist**. To manage videos in playlists, click **Edit** next to the playlist.
2.  Follow the instructions to [Customize channel layout](https://support.google.com/youtube/answer/3219384). This will enable you to customize your YouTube channel with different sections. The sections can contain specific playlists. In short, do the following:
    a.  In the left sidebar, click **My channel**.
    b.  In the main column below your channel title (not below your profile icon) click the large gear icon {% include inline_image.html file="channel-creator-settings-icon" type="png" %}.
    c.  Move the **Customize the layout of your channel** slider to on and click **Save**.
3.  Follow the instructions to [Organize content with channel sections](https://support.google.com/youtube/answer/3027787?hl=en). In short, after enabling channel layout customization (the previous step), do the following:
    a.  Click **My channel** in the left sidebar.
    b.  Scroll to the bottom of your channel and click **Add a section**.
    c.  In the **Select content** drop-down menu, under **Playlists**, select **Single playlist**.
    d.  In the **Choose a Playlist** menu that appears, select **Enter playlist URL**.
    e.  To find the playlist URL, open another tab and go to **My channel**. In the middle column, click **Playlists**. Select one of your playlists and copy the URL that appears. Paste this into the **Enter playlist URL** text box on the previous tab, and then click **Add** and **Done**.

    Note that only playlists will appear in the category selector. Most other section types (for example, "Recent Activities") will not appear.

## See Updates to Your App

After you make changes to your YouTube channel, your app will automatically reflect the changes, since the app pulls its data dynamically from your YouTube channel each time it loads. However, to see a recent change you made to your YouTube channel in your app, you need to clear your app's cache and data from Fire TV:

1.  On Fire TV, go to **Settings > Applications > Manage Installed Applications** and click your app.
2.  Select **Clear data** (twice) and also **Clear cache**.
3.  Relaunch your app.
