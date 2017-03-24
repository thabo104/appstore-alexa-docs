---
title: Recommendations Overview (Fire App Builder)
permalink: fire-app-builder-recommendations-overview.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

You can send recommendations to users about the content (movies, shows, etc.) you want them to watch. Recommendations appear on a “Recommended By Your Apps” row on the Fire TV home screen.

* TOC
{:toc}

## Recommendations details

{% include image.html  file="firetv/fireappbuilder/images/fireappbuilder-recommendations" type="png" %}

The “Recommended By Your Apps” row shows all recommendations from apps the user has currently installed (and opened at least once). (Some top apps, like Netflix and HBOGo, get their own recommendations row all to themselves. Other apps share the same recommendations row.)

The “Recommended By Your Apps” row appears below Netflix or HBO Go rows, if you have the Netflix or HBO Go apps. (Otherwise, it appears directly below the “Featured Apps & Games” row.)

Recommendations encourage users to engage with your app. By appearing on the Fire TV home screen, recommendations are visible within the user’s regular view. The recommendation cards entice users back into your app with minimal effort.

To learn more about recommendations, see [Recommendations Overview][fire-tv-recommendations-overview] in the Fire TV documentation. Recommendations in Fire TV use the same [recommendations API](https://developer.android.com/training/tv/discovery/recommendations.html) as other Android applications. However, you can also include extra information in your recommendations that is specific to Amazon Fire TV.

## Two Types of Recommendations

Fire App Builder has everything set up to send recommendations. You just have to include the recommendations information in your feed and configure some recipes in Fire App Builder to target the recommendations information in your feed.

If your feed does not already contain recommendations information, you will need add it. Each video in your feed will need a unique ID to work with the recommendations

Fire App Builder has two types of recommendations:

* **Global recommendations**: Sent when the app is started. See [Send Global Recommendations](fire-app-builder-global-recommendations) for more details.
* **Related recommendations**: Sent when a specific video is watched. See [Send Related Recommendations](fire-app-builder-related-recommendations) for more details.

Note that recommendations aren't the same as "Related Content." Related content appears as cards under the video on the media playback screen. The two aren't related.

## Recommendations Requirements

Fire TV requires at least 5 recommendations to be sent (from all apps combined) in order for the Recommended By Your Apps row to appear. However, Android has a limit of 50 recommendations max that can be sent by an app, so do not exceed 50.

## Release Dates

The "Recommended By Your Apps" row hasn't been rolled out to mainstream users on Fire TV yet. It's still in development. You can activate a feature in Developer Options to test the row before this feature is released.
