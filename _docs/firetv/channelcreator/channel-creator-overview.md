---
title: Use an MRSS Feed to Configure Channel Creator
permalink: channel-creator-mrss.html
sidebar: channelcreator
product: Channel Creator
toc-style: kramdown
github: true
---

Channel Creator provides a simple, browser-based interface ([channelcreator.amazon.com](http://channelcreator.amazon.com)) where you can build a Fire TV HTML5 web app by entering your Youtube channel and Youtube developer key, or by supplying an MRSS feed.

* TOC
{:toc}

## Overview

Channel Creator automatically builds your app from the media assets and categories in your Youtube channel or MRSS feed. Videos are sorted by your categories, with each category listed in a drop-down menu in the app.

After you configure your feed, you can style the appearance of your app using a visual interface to select colors, fonts, or background images.

When you're finished, you can either download a zip file containing your web app, or directly submit your web app into the Amazon Appstore. The zip file contains HTML, CSS, and JS assets along with images for your app. Behind the scenes, Channel Creator uses the [Web App Starter Kit for Fire TV](the-web-app-starter-kit-for-fire-tv) as its code base.

If you choose to download the web app zip file (instead of submitting the app directly to the Amazon Appstore), you can upload it into the Amazon Developer Console yourself.

## Requirements

Channel creator is intended for content creators rather than developers, so no coding experience is required. You just need some videos for your app. Requirements are as follows:

* Amazon Developer Account
* YouTube channel or MRSS feed that references videos

{% include tip.html content="Although Channel Creator provides a web-based preview, it's also a good idea to have a Fire TV device (either the stick or box) where you can test out your web app on an actual Fire TV device." %}

## Who Channel Creator is For

Channel Creator is intended for content creators who want to maximize their exposure across different platforms. If you already have video content either on YouTube or a web server, you can build an app in a matter of minutes using Channel Creator. With an app on Fire TV, you can grow your audience and reach.

## Features and Limitations

See the [Framework Comparison](fire-tv-development-framework-comparison) for a list of features and limitations with Channel Creator compared to other app frameworks ([WASK][the-web-app-starter-kit-for-fire-tv] and [Fire App Builder][fire-app-builder-overview]). In general, note that the apps you create with Channel Creator don't include analytics, in-app purchasing, or other plugins. The views of your YouTube videos through Fire TV will not increase the view count of your videos on YouTube. You also cannot display ads on your YouTube videos played on your Fire TV app.
