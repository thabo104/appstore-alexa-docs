---
title: Send Related Recommendations
permalink: fire-app-builder-related-recommendations.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

Related recommendations are sent when a specific video is watched. Similar to global recommendations, Fire App Builder reads the list of global recommendations from your media feed. Every six hours, Fire App Builder refreshes and will resend any related recommendations based on videos the user is viewing.

If a user clicks a video on the Recommended By Your App row and completely watches a video (not just partially), Fire App Builder marks that video as watched and deletes the recommendation for that item. This information is saved in Fire App Builder's database.

However, when six hours pass and Fire App Builder refreshes, these same related recommendations will again be sent when the user views a video, even if users have already watched the content.

* TOC
{:toc}

## Configure Related Recommendations

1.  In your **Navigator.json** file (in your app's **assets** folder), in the `config` object, specify how many related recommendations you want to send through the `numberOfRelatedRecommendations` property:

    ```json
    "config": {
      "showRelatedContent": true,
      "useCategoryAsDefaultRelatedContent": true,
      "searchAlgo": "basic",
      "numberOfGlobalRecommendations": 3,
      "numberOfRelatedRecommendations": 3
    }
    ```

    Fire TV must receive at least 5 recommendations from all apps combined in order to display the Recommended By Your Apps row to users. If you don't specify a number of related recommendations here, 5 is used as the default.


2.  In your feed, add a `recommendations` property that within each item. The recommendations property should point to a list of content ID strings. For example, if your feed is in JSON, it might look like this:

    ```
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

      Note that the recommendations should be included in a specific item's details, since each item will have its own recommendations to send. Presumably the recommended IDs are related to the item by theme, genre, or episode numbers.

      The recommendations property can appear anywhere within the items details, and it can use a different name than `recommendations`. In the following steps, you'll write a query in a recipe to target the values this recommendations element contains.

      Note that if you have an MRSS feed that conforms to iTunes specifications, adding custom elements may require more coding, since you'll need to define custom namespaces to use and target in your XML. (Instructions on adding custom namespaces in XML is beyond the scope of this documentation.)

3.  In your app's **assets > recipes** folder, open your contents recipe file. (You most likely renamed this file when you [set up your contents recipe][fire-app-builder-set-up-recipes-content]. Originally the file was called LightCastContentsRecipe.json.)
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
        "channel_id@channelId",
        "recommendations@recommendations"
      ]
    }
    ```

    For more details on the `query` parameter here, see the [query Parameter][fire-app-builder-set-up-recipes-content#queryparameter] section in the [Set Up the Contents Recipe][fire-app-builder-set-up-recipes-content]. Since you already have a recipe that targets your items, you just have to match the newly added `recommendations` element within the items.

## Test Your Global Recommendations

To test your recommendations, see the general instructions in Fire TV documentation: [Test Your Recommendations](fire-tv-recommendations-testing). With related recommendations, you must watch the videos that have recommended content in order for Fire App Builder to send those recommendation IDs to the "Recommended By Your Apps" row.
