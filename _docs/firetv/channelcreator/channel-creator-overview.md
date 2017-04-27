---
title: Channel Creator Overview
permalink: channel-creator-overview.html
sidebar: channelcreator
product: Channel Creator
toc-style: kramdown
github: true
---

Channel Creator provides a simple, browser-based interface ([channelcreator.amazon.com](http://channelcreator.amazon.com)) where you can build an HTML5 web app for Fire TV either by entering your Youtube channel and Youtube developer key, or by supplying an MRSS feed.

* TOC
{:toc}

## Overview

Channel Creator automatically builds your app from the media assets and categories in your Youtube channel or MRSS feed. Videos are sorted by your categories, with each category listed in a drop-down menu in the app.

After you configure your feed, you can style the appearance of your app using a visual interface to select colors, fonts, or background images.

When you're finished, you can either download a zip file containing your web app or directly submit your web app into the Amazon Appstore from the Channel Creator site. The downloadable zip file contains HTML, CSS, and JS files along app image assets. Behind the scenes, Channel Creator uses the [Web App Starter Kit for Fire TV](the-web-app-starter-kit-for-fire-tv) as its code base to build the HTML5 web app.

If you choose to download the web app zip file (instead of submitting the app directly to the Amazon Appstore), you can upload it into the Amazon Developer Console yourself using the traditional submission process.

## Requirements

Intended more for content creators rather than developers, Channel Creator doesn't require any coding skills. You need only the following:

* Amazon Developer Account
* YouTube channel or MRSS feed that references videos

{% include tip.html content="Although Channel Creator provides a web-based preview, it's also a good idea to have a Fire TV device (either the stick or box) where you can test out your web app on an actual Fire TV device." %}

## Features and Limitations

See the [Framework Comparison](fire-tv-development-framework-comparison) for a list of features with Channel Creator compared to other app frameworks ([WASK][the-web-app-starter-kit-for-fire-tv] and [Fire App Builder][fire-app-builder-overview]). The apps you create with Channel Creator don't include analytics, in-app purchasing, or other plugins. Google ads from YouTube videos will not appear on videos played on Fire TV. Also, when users view your YouTube videos on Fire TV, the views will not increment the view count of your videos on YouTube.

## Growing Your Audience

Channel Creator helps you maximize your exposure across different platforms. It's intended as an easy way to build a Fire TV app. If you already have video content either on YouTube or a web server, you can grow your audience and reach in a matter of minutes by building and submitting your app.
