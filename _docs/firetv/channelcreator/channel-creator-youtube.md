---
title: Use a YouTube Channel to Configure Channel Creator
permalink: channel-creator-youtube.html
sidebar: channelcreator
product: Channel Creator
toc-style: kramdown
github: true
---

You can configure your Channel Creator app using a YouTube channel as the source for your video content. YouTube approach gives you a robust, free platform for hosting and serving your video. You can group your videos into different channels within the same account. Channel Creator will require you to supply a developer API key in order to access the videos.

* TOC
{:toc}

## Get Your YouTube Channel Name

1.  Log into [YouTube](https://www.youtube.com/).
2.  In the upper-left corner, click the 3-bar icon {% include inline_image.html file="channel-creator-hamburger" type="png" %}. Then select **My Channel**.

    {% include image.html  file="channel-creator-my-channel" type="png" alt="My Channel" %}
3.  Copy the ID that appears in the address bar:

    {% include image.html  file="channel-creator-channel-id" type="png" alt="YouTube Channel ID" %}

## Get the Developer API Key

Channel Creator needs an API key in order to access your YouTube videos. To get the API key:

1.  Go to the Google Developer Console at [console.developers.google.com](https://console.developers.google.com).
2.  Log into your Google account, using the same login that you use for your YouTube account.

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

9.  In the left sidebar, click **Library**. A list of APIs you can enable for your project appear.
10. In the **YouTube APIs** section, click **YouTube Data API**.

    {% include image.html file="channel-creator-youtube-data-api" type="png" alt="YouTube Data API" %}

11.  Click **Enable** {% include inline_image.html file="channel-creator-enable" type="png" alt="Enable the API" %}.
