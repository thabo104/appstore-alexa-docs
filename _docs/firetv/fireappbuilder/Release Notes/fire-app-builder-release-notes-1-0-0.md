---
title: "Version 1.0.0 Release Notes"
permalink: fire-app-builder-release-notes-version-1-0-0.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

Version 1.0.0 was released on October 1, 2016.

* TOC
{:toc}

### New Features

The first release includes a fully functional Java-based Android TV app that can parse media feeds and play media.

The app includes more than a dozen components that allow you to quickly add analytics, in-app purchasing, ads, and media player components in your app. You can also customize the look and feel of your app, including the font, images, colors, and layout, by setting values in XML and JSON files.

### Known Issues {#known_issues}

*  *Related Content*. Related content matches (which are based on tags in the feed) will match unlimited content if many items have the same tags. (The content matches should have an item limit.)
*  *In-App Purchasing Component.* With the [In-App Purchasing Component][fire-app-builder-amazon-in-app-purchase-component], purchases made on other devices won't be acknowledged in the app until a user either restarts the app or attempts to play the content. (The app should refresh purchased items when the state goes to the background.)
*  *Splash screen.* Loading the feed initially can take some time on splash screen. (The initial load time should be faster.)


{% include links.html %}
