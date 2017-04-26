---
title: Recommendations in Fire App Builder Overview
permalink: fire-app-builder-recommendations-overview.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

You can send recommendations to users about the content in your feed you want them to watch. Recommendations appear on a “Recommended By Your Apps” row on the Fire TV home screen. Because they appear on the Fire TV home screen, recommendations encourage users to engage with your app with minimal effort.

To learn more about recommendations, see the [Recommendations Overview][fire-tv-recommendations-overview] in the Fire TV documentation. Fire App Builder has all the necessary Android code set up to send recommendations. You just have to include the recommendations information in your feed and configure some recipes in Fire App Builder to target your feed's recommendations elements.

* TOC
{:toc}

## Recommended By Your Apps Row

The following screenshot shows the Recommended By Your Apps row on the Fire TV home screen:

{% include image.html  file="firetv/fireappbuilder/images/fireappbuilder-recommendations" type="png" %}

The Recommended By Your Apps row appears below Netflix or HBO Go rows if you have the Netflix or HBO Go apps. Otherwise, this row appears directly below the “Featured Apps & Games” row.

The Recommended By Your Apps row shows all recommendations from apps the user has currently installed (and opened at least once). Some top apps, like Netflix and HBO Go, get their own recommendations row all to themselves. But all other apps share space in the same "Recommended By Your Apps" row.

## Two Types of Recommendations

Fire App Builder has two types of recommendations:

* **Global recommendations**: These recommendations are sent periodically, such as when the app is started. See [Send Global Recommendations](fire-app-builder-global-recommendations) for more details.
* **Related recommendations**: These recommendations are sent when a specific video is watched. See [Send Related Recommendations](fire-app-builder-related-recommendations) for more details.

If your feed does not already contain recommendations information, you will need to add this information to your feed. Each video in your feed must have a unique ID to work with the recommendations.

{% include note.html content="Recommendations aren't the same as \"Related Content.\" Related content appears as cards under the video on the media playback screen and shows other videos in the same category. Recommendations are content IDs that are specifically noted in your feed, regardless of any category grouping." %}

## Recommendations Requirements

Fire TV requires at least 5 recommendations to be sent (from all apps combined) in order for the Recommended By Your Apps row to appear to users. However, Android has a limit of 50 recommendations max that can be sent by an app, so do not exceed 50. (See [Best Practices for Recommendations][fire-tv-recommendations-best-practices#dont-exceed-the-notifications-limit] for more details.)

## Release Dates for the Recommended By Your Apps Row

The "Recommended By Your Apps" row hasn't been rolled out to mainstream users on Fire TV yet. It's only been rolled out to a small group of users but will be rolled out mainstream shortly. You can [activate a feature in Developer Options][fire-tv-recommendations-testing] to test the row before this feature is released. (We promote this feature to developers now so that when it is rolled out, the row will be populated with recommendations apps are already sending.)

## See How Recommendations Works with the Sample LightCast Feed

When you build the sample Fire App Builder app that uses the LightCast feed, recommendations aren't sent because the LightCast feeds don't contain any recommendations info, nor is the default Navigator.json file configured with recommendations recipes.

If you want to see how recommendations works using the sample Fire App Builder app and LightCast feed, we've included a modified feed that contains recommendations information. This feed is hard-coded in a file included with the app. Follow these steps to implement it:

1.  In your app directory, rename **Navigator.json** to something like **Navigator_original.json**. Rename **navigator_with_recommendations.json** to **Navigator.json**.

2.  In your app's **assets > configurations**, open **DataLoadManagerConfig.json** and specify the following:

    ```json
    {
      "data_downloader.impl": "com.amazon.dataloader.datadownloader.BasicFileBasedDataDownloader",
      "is_cache_manager_enabled": true,
      "data_updater.duration": 14400
    }
    ```

3. In the same folder, open **BasicFileBasedDownloaderConfig.json** and specify the following:

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
8.  In Android Studio, click the **Run App** button {% include inline_image.html file="firetv/fireappbuilder/images/fireappbuilder_runappbutton" type="png" %}.

    When the app starts, the following global recommendations are sent to Fire TV:

    * 99605: "Cooking Tips : How to Deep Fry Chicken"
    * 99551: "How to Cook with Herbs"
    * 99570: "Consuming Passions Chips Recipe \| Belgian Style"
    * 99580: "How to Make Mapo Tofu 麻婆豆腐の作り方"
    * 112683: "My Healthy Snacks & Eating Tips"

    These videos are specified in a `globalRecommendations` array in the feed:

    ```json
    "globalRecommendations": [
        "99605",
        "99551",
        "99570",
        "99580",
        "112683"
    ]
    ```

    You can see the recommendations info in the logs in Android Studio. If you click **Android Monitor** at the bottom of the screen and then filter on the word **recommendation**, you'll see logs indicating that recommendations have been built and sent. The logs will look something like this:

    ```
    03-24 18:39:09.365 18717-18757/com.amazon.android.calypso D/RecommendationTable: record updated in database: RecommendationRecord{mContentId='99570', mRecommendationId=4, mType='Global'}
    03-24 18:39:09.368 18717-18757/com.amazon.android.calypso D/RecommendationSender: Built recommendation - Consuming Passions Chips Recipe | Belgian Style
    ```

    The `mType='Global'` indicates that this is a global recommendation.

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

    When you play this video, the related recommendations get sent to the Fire TV home screen:

    * 162269: "Thai Tom Yum Soup Vegan Vegetarian Recipe"
    * 162266: "Thai Green Curry With Chicken"
    * 162265: "Homemade Chicken Pad Thai"
    * 162264: "Thai Peanut Chicken Tenders"

    In the logs, you'll see `mType='Related'` for related recommendations instead of `mType='Global'`.

10.  Press the home button and return to the Fire TV home screen. Refresh the home screen by navigating to **Settings**, wait a few seconds, and then go back to the home screen.

11. Look for a row called "Recommendations Testing Row."

Look to see if any of your recommendations appear in this row. If the recommendations were successful, you should see one of the videos:

{% include image.html file="firetv/fireappbuilder/images/fireappbuilder_samplerectestingrow" type="png" caption="This video is the Consuming Passions Chips Recipe \| Belgian Style." %}

{% include note.html content="If you don't see any videos in the row, most likely the Fire TV home screen needs some more time to refresh and update the recommendations row. Check back later." %}

To watch the video, you can click the video to launch it directly. Or you can click the **menu** button on your remote to launch a context menu in the lower-right corner of Fire TV. The context menu gives you the option to either watch the video or open the app.

All videos have the same priority in the recommendation settings, so their order in the recommendations row will be somewhat random.

Fire App Builder contains a database and creates a record for the recommendation. Fire App Builder retains a watch history for 12 days, but currently there isn't any logic that filters out recommendations for items the user already been watched. If your feed isn't updated with new recommendations, the same recommendations will be sent for items previously watched. Later versions of Fire App Builder might implement more advanced filtering logic.

After you're done trying out recommendations, revert some of the changes you made to the way Fire App Builder loads feeds. In particular, undo step 2 or your web-based feeds won't load properly, or see [Load Your Media Feed][fire-app-builder-load-media-feed] for the proper settings for the data loader files.

{% include links.html %}
