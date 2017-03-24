---
title: Send Related Recommendations
permalink: fire-app-builder-related-recommendations.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

Similar to global recommendations, Fire App Builder gets related recommendations from your media feed. Whereas global recommendations are sent when the app starts, related recommendations are sent when a user watches a video that includes recommendations in the media item's details.

* TOC
{:toc}

## Configure Related Recommendations

1.  In the **Navigator.json** file (in your app's **assets** folder), specify the max number of related recommendations that your app can send through the `numberOfRelatedRecommendations` property. Place this property in the `config` object:

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

    Note that Fire TV must receive at least 5 recommendations from all apps combined in order to display the Recommended By Your Apps row to users. If you don't specify a number of related recommendations here, 5 is used as the default.

2.  In your feed, add a `recommendations` property within each item where you want to send recommendations. The recommendations property should point to a list of content ID strings.

    For example, if your feed is in JSON, a media item containing related recommendations might look like this:

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

    Related recommendations should be included in a specific item's details, since each item will have its own recommendations to send. The recommended IDs should be related to the item by theme, genre, episodes, or some other connection.

    The recommendations property can appear anywhere within the items details, and it can use a different name other than `recommendations`. In the following steps, you'll write a query in a recipe to target the values that your recommendations element contains.

    Note that if you have an [MRSS feed][fire-app-builder-configure-mrss-feed] that conforms to iTunes specifications, adding custom elements may require more coding, since you'll need to define custom namespaces to use in your XML. (Instructions on adding custom namespaces in XML is beyond the scope of this documentation.)

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

    For more details on the `query` parameter here, see the [query Parameter][fire-app-builder-set-up-recipes-content#queryparameter] section in the [Set Up the Contents Recipe][fire-app-builder-set-up-recipes-content]. Since you already have a recipe that targets your items, you just have to match the newly added `recommendations` element within the items. You don't have to define a new query to target your items

    If you named your recommendations element something else, such as `related_recommendations`, you would match the element like this:

    ```
    related_recommendations@recommendations
    ```

    The left side of the `@` contains your feed name; the right side contains the Fire App Builder UI element.

## Sending Amazon Extras in Your Recommendations

Amazon allows you to send extra values with your recommendations. These extras allow you to customize your recommendations to better fit the Fire TV platform. You can read about the Amazon extras here: [Send Recommendations that Include Amazon Extras][fire-tv-recommendations-send-recommendations#amazon-enhancements].

You include the extras in with the item details (not within the recommendations tags). The recommendations simply lists content IDs. When Fire App Builder builds and sends the recommendation, it will include any additional information matching the Amazon extras.

The following table lists the extras you can send. The title, description, thumbnail, etc. aren't mentioned here because they are matched already.

The values for these matching tags are stored in the **Content.java** file (in ContentModel > src > main > java > com > android > model > content). This file maps these tags to the Amazon extras.

<table>
   <colgroup>
      <col width="50%" />
      <col width="50%" />
   </colgroup>
   <thead>
      <tr>
         <th>Fire App Builder Tag</th>
         <th><code>Amazon Extra</code></th>
      </tr>
   </thead>
   <tbody>
   <tr>
      <td><code>maturityRating</code></td>
      <td><code>com.amazon.extra.MATURITY_RATING</code></td>
   </tr>
      <tr>
         <td><code>live</td>
         <td><code>com.amazon.extra.LIVE_CONTENT</td>
      </tr>
      <tr>
         <td><code>startTime</td>
         <td><code>com.amazon.extra.CONTENT_START_TIME</td>
      </tr>
      <tr>
         <td><code>endTime</td>
         <td><code>com.amazon.extra.CONTENT_END_TIME</td>
      </tr>
      <tr>
         <td><code>videoPreviewUrl</td>
         <td><code>com.amazon.extra.PREVIEW_URL</td>
      </tr>
      <tr>
         <td><code>imdbId</td>
         <td><code>com.amazon.extra.IMDB_ID</td>
      </tr>
      <tr>
         <td><code>closeCaptionUrls</td>
         <td><code>com.amazon.extra.CONTENT_CAPTION_AVAILABILITY</td>
      </tr>
      <tr>
         <td><code>videoPreviewUrl</td>
         <td><code>com.amazon.extra.PREVIEW_URL</td>
      </tr>
      <tr>
         <td><code>genres</td>
         <td><code>setGenres</td>
      </tr>
   </tbody>
</table>

In your contents recipe, you would

```
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
    "maturityRating@maturityRating"
    "live@live"
    "startTime@startTime"
    "endTime@endTime"
    "videoPreviewUrl@videoPreviewUrl"
    "imdbId@imdbId"
    "closeCaptionUrls@closeCaptionUrls"
    "videoPreviewUrl@videoPreviewUrl"
    "genres@genres"
  ]
}
```


## Test Your Global Recommendations

To test your recommendations, see the general instructions in Fire TV documentation: [Test Your Recommendations](fire-tv-recommendations-testing). With related recommendations, you must partially watch the videos that have recommended content in order for Fire App Builder to send those recommendation IDs to the Recommended By Your Apps row.
