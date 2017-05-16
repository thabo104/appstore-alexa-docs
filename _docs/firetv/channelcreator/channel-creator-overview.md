---
title: Channel Creator Overview
permalink: channel-creator-overview.html
sidebar: channelcreator
product: Channel Creator
toc-style: kramdown
github: true
---

Channel Creator provides a simple, browser-based interface ([channelcreator.amazon.com](http://channelcreator.amazon.com)) where you can [build an HTML5 web app for Fire TV][channel-creator-create-your-app] either by entering your [Youtube channel][channel-creator-overview] or by supplying a [Media RSS (MRSS) feed][channel-creator-mrss].

Channel Creator helps you maximize the exposure of your content with the millions Fire TV users. If you already have video content either on YouTube or a web server, you can quickly create and submit an app (in a matter of minutes) using Channel Creator.

* TOC
{:toc}

## Overview

Channel Creator automatically builds your app from the media assets and categories in your Youtube channel or MRSS feed. Videos are sorted by your channel sections or feed item categories, with each section or category listed in a drop-down navigation menu in the app. Here's what the default theme looks like:

{% include image.html  file="firetv/channelcreator/images/channel-creator-sample-app" type="png" max-width="" alt="Default theme for Channel Creator app" %}

After you configure your feed, you can style the appearance of your app using a visual interface to select colors, fonts, or background images you want.

{% include image.html  file="firetv/channelcreator/images/channel-creator-visual-editor" type="png" alt="Visual editor for Channel Creator" %}

When you're finished, you can directly submit your web app into the Amazon Appstore from the Channel Creator site (without even logging into the Amazon Developer Portal). You can likewise make updates to your app directly from the Channel Creator (without having to log into the Developer Portal).

The app dynamically pulls in content from your YouTube channel or feed, so any updates to your content will automatically appear in your app.

Apps you create are available in all markets where Fire TV is available &mdash; United States, Germany, United Kingdom, Japan, Australia, and India.

## Requirements to Build an App

Channel Creator doesn't require any coding skills (it's intended for content creators rather than developers). You need only one of the following:

* [YouTube channel](https://www.youtube.com/create_channel)
* [Media RSS feed](http://www.rssboard.org/media-rss).

You will also need an [Amazon Developer Account](https://developer.amazon.com), but you can get started creating an app in Channel Creator without one. When you submit your app, Channel creator will prompt you to create a developer account from within Channel Creator.

{% include tip.html content="Although Channel Creator provides a preview that you can view in your Internet browser, it's also a good idea to have a Fire TV device (either the stick or box) where you can test out your web app. There's a companion app called Channel Viewer that allows you to view a preview of your app by inputting an app ID." %}

## Requirements to Submit an App

When you submit your app, you will need a variety of [image assets][channel-creator-submit-your-app#imageassets]:

* App icons (various sizes)
* Fire TV background image
* Screenshots

You will also need to supply some [descriptions of your app][image assets][channel-creator-submit-your-app#appdescriptions]:

* Short description
* Long description
* Product feature bullets
* Keywords

These assets are described in [Submit Your App][channel-creator-submit-your-app].

## YouTube versus Media RSS Feeds {#youtube_vs_mrss}

To configure Channel Creator, you can use either a [YouTube channel](https://www.youtube.com/create_channel) or [Media RSS feed](http://www.rssboard.org/media-rss) as a source for your video content.

YouTube provides free online hosting that serves up your video in a stable, robust way. But if your videos aren't on YouTube (perhaps they're with another video host or on your own web server), you can use an MRSS feed instead.

Using an MRSS feed requires you to host your video content outside of YouTube, on your own server or on a supported video host &mdash; BrightCove, Ooyala, Kaltura, or thePlatform. With MRSS, you manage your video descriptions and other details through your feed elements. (Many times the video hosts will provide an MRSS feed output for your content.)

In both cases (either YouTube or MRSS), the resulting app is the same.

## Features and Limitations

See the [Framework Comparison](fire-tv-development-framework-comparison) for a list of Channel Creator features compared to other app frameworks. Keep in mind that Channel Creator is intended for non-technical users, so more advanced functionality (which is often only available by working in code) is limited.

If you need more features, consider using either [Web App Starter Kit for Fire TV (WASK)][the-web-app-starter-kit-for-fire-tv] or [Fire App Builder][fire-app-builder-overview]. Behind the scenes, Channel Creator actually uses the [WASK](the-web-app-starter-kit-for-fire-tv) (WASK) as its code base to build the HTML5 web app.

YouTube ads on your videos (if enabled in your YouTube Channel) aren't blocked by Fire TV. However, the view count of your YouTube videos on Fire TV aren't recorded in YouTube's analytics. The Developer Portal can provide analytics about app downloads (segmented by marketplace or country), but not the number of plays per video.

## Get Started

To get started building your Fire TV app, see [Create Your App][channel-creator-create-your-app].

{% include links.html %}
