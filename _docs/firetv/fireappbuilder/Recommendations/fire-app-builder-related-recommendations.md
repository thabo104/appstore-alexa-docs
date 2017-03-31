---
title: Send Related Recommendations
permalink: fire-app-builder-related-recommendations.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

Similar to global recommendations, Fire App Builder gets related recommendations from your media feed. Whereas global recommendations are sent when the app starts, related recommendations are sent when a user watches a video that includes recommendations in the media item's details.

For more general information about recommendations, see [Recommendations in Fire App Builder][fire-app-builder-recommendations-overview].

* TOC
{:toc}

## Configure Related Recommendations

1.  In the **Navigator.json** file (in your app's **assets** folder), use the `numberOfRelatedRecommendations` property to specify the max number of related recommendations that your app can send. Place this property in the `config` object:

    ```json
    "config": {
      "showRelatedContent": true,
      "useCategoryAsDefaultRelatedContent": true,
      "searchAlgo": "basic",
      "numberOfGlobalRecommendations": 3,
      "numberOfRelatedRecommendations": 3
    }
    ```

    This number limits the number of related recommendations your app can send. After this number of recommendations is reached, your app won't send any more related recommendations until the refresh period.

    Note that Fire TV must receive at least 5 recommendations from all apps combined in order to display the Recommended By Your Apps row to users. If you don't specify the number of related recommendations here, 5 is used as the default.

2.  In your feed, add a `recommendations` property within each item where you want to send recommendations. The recommendations property should point to a list of content ID strings.

    For example, if your feed is in JSON, a media item containing related recommendations might look like this:

    ```json
    ...

     {
          "id": "162270",
          "title": "Thai Recipes - Thai Chicken Noodles Recipe",
          "description": "Thai Recipes - Thai Chicken Noodles Recipe",
          "duration": "355",
          "thumbURL": "http:\/\/l2.cdn01.net\/_thumbs\/0000162\/0162270\/0162270__015f.jpg",
          "imgURL": "http:\/\/l2.cdn01.net\/_thumbs\/0000162\/0162270\/0162270__015f.jpg",
          "videoURL": "http:\/\/media.cdn01.net\/802E1F\/process\/encoded\/video_1880k\/0000162\/0162270\/D8HFLX0AC.mp4?source=firetv&channel_id=6341",
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
      },

    ...
    ```

    If your feed is XML, it might look like this:

    ```xml
    ...
        <item>
            <title>Sample Title</title>
            <pubDate>Wed, 26 Oct 2016 20:34:22 PDT</pubDate>
            <link>https://example.com/myshow/episodes/110</link>
            <author>Sample Author name</author>
            <category>Technology</category>
            <category>Gadgets</category>
            <recommendations>
              <guid>162269</guid>
              <guid>162266</guid>
              <guid>162265</guid>
              <guid>162264</guid>
            </recommendations>
         </item>
    ...
    ```

    Related recommendations should be included in a specific item's details because each item will have its own recommendations to send. The recommended IDs should be related to the item by theme, genre, episodes, or some other connection.

    The recommendations property can appear anywhere within the items details, and it can use a different name other than `recommendations`. In the following steps, you'll write a query in a recipe to target the values that your recommendations element contains.

    Note that if you have an [MRSS feed][fire-app-builder-configure-mrss-feed] that conforms to iTunes specifications, adding custom elements may require more coding, since you'll need to define custom namespaces to use in your XML. (Instructions on adding custom namespaces in XML is beyond the scope of this documentation.)

3.  In your app's **assets > recipes** folder, open your app's contents recipe file. (You most likely renamed this file when you [set up your contents recipe][fire-app-builder-set-up-recipes-content]. Originally the file was called LightCastContentsRecipe.json.)
4.  In the `matchList` parameter, add a match for the `recommendations` element. For example, the `matchList` parameter might look like this:

    ```json
    {
      "cooker": "DynamicParser",
      "format": "json",
      "model": "com.amazon.android.model.content.Content",
      "translator": "ContentTranslator",
      "modelType": "array",
      "query": "$.items[?(@.categories[0] in [$$par0$$])]",
      "matchList": [
        "title@title",
        "id@id",
        "description@description",
        "videoURL@url",
        "imgURL@cardImageUrl",
        "imgURL@backgroundImageUrl",
        "recommendations@recommendations"
      ]
    }
    ```

    For more details on the `query` parameter here, see the [query Parameter][fire-app-builder-set-up-recipes-content#queryparameter] section in [Set Up the Contents Recipe][fire-app-builder-set-up-recipes-content]. Because you already have a recipe that targets the items in your feed, you just have to match the newly added `recommendations` element within the items. You don't have to define a new query to target the recommendations.

    If you named your recommendations element something else, such as `related_recommendations`, you would match the element like this:

    ```
    related_recommendations@recommendations
    ```

    The left side of the `@` contains the property name in your feed; the right side contains the Fire App Builder UI element.

    In order to build its content model (and app UI), Fire App Builder requires you to map content to these tags: `title`, `id`, `description`, `url`, `cardImageUrl`, and `backgroundImageUrl`. When sending recommendations, Fire App Builder uses some of these basic tags in building the recommendations. These tags correspond with content required by the standard Android recommendations API (see [ContentRecommendation.Builder](https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html)). However, you can send additional information (if desired) to better customize the recommendation for Fire TV.


{% include tip.html content="You can also include addition information in your recommendations ([Amazon extras][fire-tv-recommendations-send-recommendations#amazon-enhancements]) that are specific to Amazon Fire TV." %}

## Test Your Global Recommendations

To test your recommendations, see the general instructions in Fire TV documentation: [Test Your Recommendations](fire-tv-recommendations-testing). With related recommendations, you must partially watch the videos that have related content in order for Fire App Builder to send those recommendation IDs to the Recommended By Your Apps row.

Keep in mind that the Recommended By Your Apps row on Fire TV is outside of the control of the Fire App Builder app. However, you can see that your app is building and sending recommendations by looking in the Android Studio logs.

After starting your app, if you look at the logs in Android Studio (click **Android Monitor** at the bottom of the screen and then filter on the word **recommendation**), you'll see logs indicating that related recommendations have been built and sent. The logs will look something like this:

```
03-24 18:39:09.365 18717-18757/com.amazon.android.calypso D/RecommendationTable: record updated in database: RecommendationRecord{mContentId='99570', mRecommendationId=4, mType='Related'}
03-24 18:39:09.368 18717-18757/com.amazon.android.calypso D/RecommendationSender: Built recommendation - Consuming Passions Chips Recipe | Belgian Style
```

Note that in your tests, your app will not send more than limit you set in Navigator.json file. For example, suppose you have the following:

```
"numberOfRelatedRecommendations": 3
```

With this setting, you won't see any more than 3 recommendations sent.

{% include links.html %}
