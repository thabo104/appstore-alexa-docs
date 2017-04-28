---
title: Channel Creator Overview
permalink: channel-creator-overview.html
sidebar: channelcreator
product: Channel Creator
toc-style: kramdown
github: true
---

Channel Creator provides a simple, browser-based interface ([channelcreator.amazon.com](http://channelcreator.amazon.com)) where you can build an HTML5 web app for Fire TV either by entering your Youtube channel and Youtube developer key, or by supplying an MRSS feed.

Channel Creator helps you maximize your exposure across different platforms. It's intended as an easy way to build a Fire TV app. If you already have video content either on YouTube or a web server, you can grow your audience and reach in a matter of minutes by building and submitting your app.

* TOC
{:toc}

## Overview

Channel Creator automatically builds your app from the media assets and categories in your Youtube channel or MRSS feed. Videos are sorted by your categories, with each category listed in a drop-down menu in the app.

After you configure your feed, you can style the appearance of your app using a visual interface to select colors, fonts, or background images.

When you're finished, you can either download a zip file containing your web app or directly submit your web app into the Amazon Appstore from the Channel Creator site. The downloadable zip file contains HTML, CSS, and JS files along app image assets.

Behind the scenes, Channel Creator uses the [Web App Starter Kit for Fire TV](the-web-app-starter-kit-for-fire-tv) (WASK) as its code base to build the HTML5 web app. (Channel Creator is basically a simplified user interface for creating and publishing WASK apps.)

## Requirements to Build an App

Intended more for content creators rather than developers, Channel Creator doesn't require any coding skills. You need only the following:

* [Amazon Developer Account](https://developer.amazon.com)
* [YouTube channel](https://www.youtube.com/create_channel) or [Media RSS feed]((http://www.rssboard.org/media-rss))

{% include tip.html content="Although Channel Creator provides a web-based preview, it's also a good idea to have a Fire TV device (either the stick or box) where you can test out your web app." %}

## Requirements to Submit an App

Additionally, when you submit your app, you will need a variety of image assets.

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

## YouTube versus Media RSS Feeds {#youtube_vs_mrss}

need content...
mrss vs. youtube. brightcove, ooyala. some video hosts may require a specific player. we don’t have all players integrated. just html5. if your vids aren't on youtube but some other site...

## Features and Limitations

See the [Framework Comparison](fire-tv-development-framework-comparison) for a list of features with Channel Creator compared to other app frameworks. Keep in mind that Channel Creator is intended for non-technical users, so more advanced functionality (which is only available by working in code) is limited. If you need more features, consider using one of the other frameworks: [WASK][the-web-app-starter-kit-for-fire-tv] and [Fire App Builder][fire-app-builder-overview].

you may get some analytics through your online video provider.
ads not blocked on youtube vids. 

{% include links.html %}
