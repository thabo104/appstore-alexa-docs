---
title: Recommendations in Fire App Builder Overview
permalink: fire-app-builder-recommendations-overview.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

You can send recommendations to users about the content in your feed you want them to watch. Recommendations appear on a “Recommended By Your Apps” row on the Fire TV home screen.

* TOC
{:toc}

## Recommendations details

The following screenshot shows the Recommended By Your Apps row:

{% include image.html  file="firetv/fireappbuilder/images/fireappbuilder-recommendations" type="png" %}

The Recommended By Your Apps row appears below Netflix or HBO Go rows, if you have the Netflix or HBO Go apps. Otherwise, this row appears directly below the “Featured Apps & Games” row.

The Recommended By Your Apps row shows all recommendations from apps the user has currently installed (and opened at least once). Some top apps, like Netflix and HBO Go, get their own recommendations row all to themselves. But all other apps share space in the same recommendations row.

Recommendations encourage users to engage with your app. By appearing on the Fire TV home screen, recommendations are visible within the user’s regular view. The recommendation cards entice users back into your app with minimal effort.

To learn more about recommendations, see [Recommendations Overview][fire-tv-recommendations-overview] in the Fire TV documentation. Recommendations in Fire TV use the standard Android [recommendations API](https://developer.android.com/training/tv/discovery/recommendations.html). However, you can also include addition information in your recommendations ([Amazon extras][fire-tv-recommendations-send-recommendations#amazon-enhancements]) that are specific to Amazon Fire TV.

## Two Types of Recommendations

Fire App Builder has everything set up to send recommendations. You just have to include the recommendations information in your feed and configure some recipes in Fire App Builder to target the recommendations information in your feed.

If your feed does not already contain recommendations information, you will need add it. Each video in your feed will need a unique ID to work with the recommendations

Fire App Builder has two types of recommendations:

* **Global recommendations**: Sent when the app is started. See [Send Global Recommendations](fire-app-builder-global-recommendations) for more details.
* **Related recommendations**: Sent when a specific video is watched. See [Send Related Recommendations](fire-app-builder-related-recommendations) for more details.

Note that recommendations aren't the same as "Related Content." Related content appears as cards under the video on the media playback screen. The two aren't related.

## Recommendations Requirements

Fire TV requires at least 5 recommendations to be sent (from all apps combined) in order for the Recommended By Your Apps row to appear. However, Android has a limit of 50 recommendations max that can be sent by an app, so do not exceed 50.

Android's 50 notifications limit
Android enforces a limit of maximum of 50 notifications for each package. This includes recommendations and any other notifications the app intends to use. More info is here: https://android.googlesource.com/platform/frameworks/base/+/742a67127366c376fdf188ff99ba30b27d3bf90c/services/java/com/android/server/NotificationManagerService.java#71. So please make sure to cancel older notifications before sending new notifications (if the number exceeds 50). Else you may see log errors such as : W/NotificationManager﹕ notify: id corrupted: sent 51, got back 0.

## Release Dates

The "Recommended By Your Apps" row hasn't been rolled out to mainstream users on Fire TV yet. It's still in development. You can activate a feature in Developer Options to test the row before this feature is released.

## Try Out Recommendations

When you build the sample Fire App Builder app that uses the LightCast feed, recommendations aren't sent because the LightCast feeds don't contain any recommendations info, nor is the default Navigator.json file configured with any recommendations recipes.

If you want to try out recommendations on the sample Fire App Builder app using the LightCast feed, we've included a modified feed that contains recommendations information. This feed is hard-coded in a file packaged with the app; we've also placed it online. Follow these steps to implement it:

1.  In your app directory, rename **Navigator.json** to something like **Navigator_original.json**. Rename **navigator_with_recommendations.json** to **Navigator.json**.

2.  In your app's **assets > configurations**, open **DataLoadManagerConfig.json** and specify the following:

    ```json
    {
      "data_downloader.impl": "com.amazon.dataloader.datadownloader.BasicFileBasedDataDownloader",
      "is_cache_manager_enabled": true,
      "data_updater.duration": 14400
    }
    ```

3. Open **BasicFileBasedDownloaderConfig.json** and specify the following:

    ```json
    {
      "data_file_path": "sample_feed_with_recommendations.json"
    }
    ```
4.  On your Fire TV, activate the Developer Tools Menu using either of the following options:

    *   [Amazon Remote Control][amazon-fire-tv-remote-input]: On the directional pad, press and hold the **center** and **down** together for 5 seconds. Then press the remote's **Menu** button.
    *   [Amazon Game Controller][amazon-fire-game-controller-input]: Press and hold **A** and **Y** buttons together for 5 seconds. Then press the controller's **menu** button.

5.  Slide the **Developer Options** to **On**. Then slide the **Developer Row** to **On**:

    {% include image.html file="firetv/getting_started/images/devoptionsdeveloperrow" type="png" max-width="350px" %}

6.  Select the **Shared Recommendation Developer Row** package.

    {% include image.html file="firetv/getting_started/images/selectpackage" type="png" max-width="500px" %}

7.  Restart your Fire TV by going go to **Settings > Device > Restart**.
8.  In Android Studio, click the **Run App** button {% include inline_image.html file="fireappbuilder_runappbutton" type="png" %}.

    When the app starts, the following global recommendations are sent to Fire TV:

    ```json
    "globalRecommendations": [
        "99605",
        "99551",
        "99570",
        "99580",
        "112683"
    ]
    ```

    These videos are as follows:

    * 99605: "Cooking Tips : How to Deep Fry Chicken"
    * 99551: "How to Cook with Herbs"
    * 99570: "Consuming Passions Chips Recipe | Belgian Style"
    * 99580: "How to Make Mapo Tofu 麻婆豆腐の作り方"
    * 112683: "My Healthy Snacks & Eating Tips"

9.  In the app, browse to the first video, **Thai Recipes - Thai Chicken Noodles Recipe** and play it for several minutes. This video has related recommendations included in its details:

    ```json
    {
        "id": "162270",
        "title": "Thai Recipes - Thai Chicken Noodles Recipe",
        "description": "Thai Recipes - Thai Chicken Noodles Recipe",
        "duration": "355",
        "thumbURL": "http://l2.cdn01.net/_thumbs/0000162/0162270/0162270__015f.jpg",
        "imgURL": "http://l2.cdn01.net/_thumbs/0000162/0162270/0162270__015f.jpg",
        "videoURL": "http://media.cdn01.net/802E1F/process/encoded/video_1880k/0000162/0162270/D8HFLX0AC.mp4?source=firetv&channel_id=6341",
        "categories": [
        "International Cuisine"
        ],
        "channel_id": "6341",
        "recommendations": [
        "162269",
        "162266",
        "162265",
        "162264"
        ]
    }
    ```

    When you play this video, the related recommendations get sent to Fire TV:

    * 162269: "Thai Tom Yum Soup Vegan Vegetarian Recipe"
    * 162266: "Thai Green Curry With Chicken"
    * 162265: "Homemade Chicken Pad Thai"
    * 162264: "Thai Peanut Chicken Tenders"

10.  Press the home button and return to the Fire TV home screen. Refresh the home screen by navigating to **Settings**, wait a few seconds, and then go back to the home screen.

11. Look for a row called "Recommendations Testing Row." This row will appear below Netflix or HBO Go rows, if you have the Netflix or HBO Go apps. (Otherwise, it appears directly below the "Featured Apps & Games" row.)

Look to see if any of your recommendations appear in this row. If the recommendations were successful, you should see one of the videos:

{% include image.html file="firetv/getting_started/images/recommendationrowappears" type="png" %}

If you don't see any videos, most likely the Fire TV home screen needs some more time to refresh and update the recommendations row. Check back later.

If you look at the logs in Android Studio (click **Android Monitor** at the bottom of the screen and then filter on the word **recommendation**), you'll logs indicating that recommendations have been built and sent.

```
03-23 17:56:02.324 23356-23425/com.amazon.android.calypso D/RecommendationTable: read record: RecommendationRecord{mContentId='99605', mRecommendationId=1, mType='Global'}
03-23 17:56:02.326 23356-23425/com.amazon.android.calypso D/RecommendationTable: read record: RecommendationRecord{mContentId='99551', mRecommendationId=2, mType='Global'}
03-23 17:56:02.327 23356-23425/com.amazon.android.calypso D/RecommendationTable: read record: RecommendationRecord{mContentId='99570', mRecommendationId=3, mType='Global'}
03-23 17:56:02.328 23356-23425/com.amazon.android.calypso D/RecommendationTable: read record: RecommendationRecord{mContentId='99605', mRecommendationId=1, mType='Global'}
03-23 17:56:02.328 23356-23425/com.amazon.android.calypso D/RecommendationTable: read record: RecommendationRecord{mContentId='99551', mRecommendationId=2, mType='Global'}
03-23 17:56:02.328 23356-23425/com.amazon.android.calypso D/RecommendationTable: read record: RecommendationRecord{mContentId='99570', mRecommendationId=3, mType='Global'}
03-23 17:56:02.337 23356-23425/com.amazon.android.calypso D/RecommendationTable: record updated in database: RecommendationRecord{mContentId='99605', mRecommendationId=1, mType='Global'}
03-23 17:56:02.338 23356-23425/com.amazon.android.calypso D/RecommendationSender: Built recommendation - Cooking Tips : How to Deep Fry Chicken
03-23 17:56:03.301 23356-23425/com.amazon.android.calypso E/RecommendationSender: Unable to build recommendation
03-23 17:56:03.334 23356-23425/com.amazon.android.calypso D/RecommendationTable: record updated in database: RecommendationRecord{mContentId='99551', mRecommendationId=2, mType='Global'}
03-23 17:56:03.335 23356-23425/com.amazon.android.calypso D/RecommendationSender: Built recommendation - How to Cook with Herbs
03-23 17:56:03.346 23356-23425/com.amazon.android.calypso E/RecommendationSender: Unable to build recommendation
03-23 17:56:03.367 23356-23425/com.amazon.android.calypso D/RecommendationTable: record updated in database: RecommendationRecord{mContentId='99570', mRecommendationId=3, mType='Global'}
03-23 17:56:03.371 23356-23425/com.amazon.android.calypso D/RecommendationSender: Built recommendation - Consuming Passions Chips Recipe | Belgian Style
03-23 17:56:03.388 23356-23425/com.amazon.android.calypso E/RecommendationSender: Unable to build recommendation
03-23 17:56:03.399 23356-23356/com.amazon.android.calypso D/RecommendationManager: Done sending global recommendations
```

The database creates a record for the recommendation. If a user watches this the video containing this content ID and completely finishes watching the video, a delete request will be sent for that recommendation to remove it from the recommendation row. However, after the app refreshes in 6 hours, this history is no longer retained.

After you're done trying out recommendations, revert some of the changes you made to the way Fire App Builder loads feeds. Either undo the steps above, or see [Load Your Media Feed][fire-app-builder-load-media-feed] for the proper settings for the data loader files.
