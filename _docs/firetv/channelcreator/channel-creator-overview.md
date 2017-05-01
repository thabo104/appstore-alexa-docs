---
title: Channel Creator Overview
permalink: channel-creator-overview.html
sidebar: channelcreator
product: Channel Creator
toc-style: kramdown
github: true
---

Channel Creator provides a simple, browser-based interface ([channelcreator.amazon.com](http://channelcreator.amazon.com)) where you can build an HTML5 web app for Fire TV either by entering your Youtube channel or by supplying a Media RSS feed.

Channel Creator helps you maximize your exposure with the millions of users who have Fire TV. If you already have video content either on YouTube or a web server, you can grow your audience and reach in a matter of minutes by building and submitting your app.

* TOC
{:toc}

## Overview

Channel Creator automatically builds your app from the media assets and categories in your Youtube channel or MRSS feed. Videos are sorted by your categories, with each category listed in a drop-down menu in the app. Here's what the default theme looks like:

{% include image.html  file="channel-creator-sample-app" type="png" max-width="" alt="Default theme for Channel Creator app" %}

After you configure your feed, you can style the appearance of your app using a visual interface to select colors, fonts, or background images.

{% include image.html  file="channel-creator-visual-editor" type="png" alt="Visual editor for Channel Creator" %}

When you're finished, you can directly submit your web app into the Amazon Appstore from the Channel Creator site. You can likewise make updates directly from the Channel Creator (without having to log into the Developer Portal).

Behind the scenes, Channel Creator uses the [Web App Starter Kit for Fire TV](the-web-app-starter-kit-for-fire-tv) (WASK) as its code base to build the HTML5 web app.

## Requirements to Build an App

Intended more for content creators rather than developers, Channel Creator doesn't require any coding skills. You need only a [YouTube channel](https://www.youtube.com/create_channel) or [Media RSS feed]((http://www.rssboard.org/media-rss)).

You also need an [Amazon Developer Account](https://developer.amazon.com), but you can get started creating an app in Channel Creator without one. When you submit, Channel creator will prompt you to auto-create a developer account.

{% include tip.html content="Although Channel Creator provides a web-based preview, it's also a good idea to have a Fire TV device (either the stick or box) where you can test out your web app." %}

## Requirements to Submit an App

When you submit your app, you will need a variety of image assets.

**Images**

* App icons (various sizes)
* Fire TV background image
* Screenshots

You will also need to supply some description text.

**Descriptions**

* Category and subcategory
* Short description
* Long description
* Product feature bullets
* Keywords

These assets are described in [Submit Your App][channel-creator-submit-your-app].

## YouTube versus Media RSS Feeds {#youtube_vs_mrss}

When you configure Channel Creator, you can use either a YouTube channel or Media RSS (MRSS) feed as a source for your video content. YouTube provides a robust, free host for video content that works well. But if your videos aren't on YouTube (perhaps they're with another video host such as BrightCove, Ooyala, Kaltura, thePlatform, or on your own web server, you can use an MRSS feed instead).

Using an MRSS feed requires you to put more effort into hosting for your video content, but in some scenarios that additional control may be an option you need.

## Features and Limitations

See the [Framework Comparison](fire-tv-development-framework-comparison) for a list of features with Channel Creator compared to other app frameworks. Keep in mind that Channel Creator is intended for non-technical users, so more advanced functionality (which is often only available by working in code) is limited.

If you need more features, consider using one of the other frameworks: [WASK][the-web-app-starter-kit-for-fire-tv] and [Fire App Builder][fire-app-builder-overview].

YouTube ads on your videos (if enabled in your YouTube Channel) aren't blocked by Fire TV. However, the view count of your YouTube videos on Fire TV aren't recorded in YouTube's analytics.

Apps you create are available in all markets where Fire TV is available &mdash; United States, Germany, United Kingdom, Japan, Australia, and India. 

## Get Started

To get started building your Fire TV app, see [Create Your App][channel-creator-create-your-app].

{% include links.html %}
