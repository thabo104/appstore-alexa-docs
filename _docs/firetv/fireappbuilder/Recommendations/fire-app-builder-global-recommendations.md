---
title: Send Global Recommendations
permalink: fire-app-builder-recommendations-global.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

When your app starts, Fire App Builder reads the list of global recommendations from your media feed and sends them to the "Recommended By Your Apps" row on the Fire TV home screen.

For more general information about recommendations, see [Recommendations in Fire App Builder][fire-app-builder-recommendations-overview].

* TOC
{:toc}

## Configure Global Recommendations

1.  In your **Navigator.json** file (in your app's **assets** folder), use the `numberOfGlobalRecommendations` property to specify the max number of related recommendations your app can send. Place this property in the `config` object:

    ```json
    "config": {
      "showRelatedContent": true,
      "useCategoryAsDefaultRelatedContent": true,
      "searchAlgo": "basic",
      "numberOfGlobalRecommendations": 3,
      "numberOfRelatedRecommendations": 3
    }
    ```

    This number limits the total number of global recommendations your app can send. After this number of recommendations is reached, your app won't send any more until the refresh period (every six hours, or every time your app is restarted).

    Note that Fire TV must receive at least 5 recommendations from all apps combined in order to display the Recommended By Your Apps row to users. If you don't specify the number of related recommendations here, 5 is used as the default.

2.  In your **Navigator.json** file, add a `recommendationRecipes` property after the `globalRecipes` block like this:

    ```json
    ...
    "globalRecipes": [
       {
         "categories": {
           "dataLoader": "recipes/LightCastDataLoaderRecipe1.json",
           "dynamicParser": "recipes/LightCastCategoriesRecipe.json"
         },
         "contents": {
           "dataLoader": "recipes/LightCastDataLoaderRecipe1.json",
           "dynamicParser": "recipes/LightCastContentsRecipe.json"
         }
       }
     ],
     "recommendationRecipes": [
       {
         "contents": {
           "dataLoader": "recipes/LightCastDataLoaderRecipe1.json",
           "dynamicParser": "recipes/LightCastGlobalRecParserRecipe.json"
         }
       }
     ],
    ...
    ```

    (Note that in code samples, ellipses `...` indicate that this is an excerpt and the rest of the code is truncated. Do not copy ellipses into your code.)

    The file referenced in the `dynamicParser` property specifies the recipe used to identify and process global recommendations in your feed.

    In place of `LightCastGlobalRecParserRecipe` you can use your own file name (for example, `AcmeGlobalRecParserRecipe.json`). Or you can just customize the existing file.

2.  In your feed, add a single `globalRecommendations` property for the entire feed that points to **an array** of content ID strings. The array of content ID strings should relate to the media you want to recommend.

    For example, if your feed is in JSON, the `globalRecommendations` property might look like this:

    ```json
    {
    "items": [
      {
        "id": "162270",
        "title": "Thai Recipes - Thai Chicken Noodles Recipe",
        "description": "Thai Recipes - Thai Chicken Noodles Recipe",
        "duration": "355",
        "thumbURL": "http:\/\/l2.cdn01.net\/\_thumbs\/0000162\/0162270\/0162270__015f.jpg",
        "imgURL": "http:\/\/l2.cdn01.net\/\_thumbs\/0000162\/0162270\/0162270__015f.jpg",
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

        ],
        "globalRecommendations": [
          "99605",
          "99551",
          "99570",
          "99580",
          "112683"
        ]
      }
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
         <globalrecommendations>
              <guid>99605</guid>
              <guid>99551</guid>
              <guid>99570</guid>
              <guid>99580</guid>
              <guid>112683</guid>
          </globalrecommendations>
      ...
      ```

      The global recommendations object should not be included in a specific item's details &mdash; there is just one set of global recommendations for the entire feed. Within each item, you can have [related recommendations][fire-app-builder-related-recommendations] that are sent when that specific video is watched. However, in this task, we're configuring *global recommendations* (which are sent when the app starts, not when a specific video plays).

      The global recommendations property can appear anywhere in your feed, and it can use a name other than `globalRecommendations`. But the content should be an array of strings. In the following steps, you'll write a query in a recipe to target this element.

      Note that if you have an MRSS feed that conforms to iTunes specifications, adding custom elements may require more coding, since you'll need to define custom namespaces to use in your XML. (Instructions on adding custom namespaces in XML is beyond the scope of this documentation.)

3.  In your app's **assets > recipes** folder, either customize the **LightCastGlobalRecParserRecipe.json** file if you used this same name earlier (in step 2), or create a new file that uses the same name you used earlier (for example, AcmeGlobalRecParserRecipe.json).
4.  Add the following recipe to your **"LightCastGlobalRecParserRecipe.json"** (or "AcmeGlobalRecParserRecipe.json", etc.) file:

    ```json
    {
    "cooker": "DynamicParser",
    "format": "json",
    "model": "java.lang.String",
    "modelType": "array",
    "query": "$.globalRecommendations[*]",
    "matchList": [
      "StringKey@ModelValue"
      ]
    }
    ```

5.  If your feed format is XML, change the value for `format` to from `json` to `xml`.
6.  Customize the `query` value to target the global recommendations property in your feed.

    If you're using JSON, your query will use [Jayway JsonPath](https://github.com/jayway/JsonPath) syntax. If your feed is XML, you'll use [XPath expressions](https://www.w3schools.com/xml/xpath_syntax.asp).

    For instructions on creating these queries, see the [query Parameter][fire-app-builder-set-up-recipes-categories#queryparameter] section in the [Set Up the Category Recipe][fire-app-builder-set-up-recipes-categories] topic.

    To ensure that your query correctly targets the global recommendations element, you can test the query in online evaluators:

    * For JSON feeds, test your query with the [Jayway JsonPath Evaluator](https://jsonpath.herokuapp.com/).
    * For XML feeds, test your query with the [XPath evaluator](http://www.freeformatter.com/xpath-tester.html).

    In the sample `query` shown above, the `$.globalRecommendations[*]` query starts in the root directory, finds the `globalRecommendations` array and selects everything inside of the array. (If you were using XML with the sample XML feed above, your query would be `//globalrecommendations/guid/text()`.)

    As for other parts of the recipe:

    * The `model` this recipe is expecting is a `String`
    * The `modelType` is an array &mdash; Fire App Builder expects this recipe to return an array of strings.
    * After the `query` returns a list of strings, we use the `matchList` parameter to directly match the string key (`StringKey`) to the model's value, which is a string.

    (These other settings aren't important as long as your global recommendations query matches an array of strings, as in this example.)

    After the recipe finishes processing the feed, the app will have a list of content IDs to recommend. Your app will send these recommendations with the global recommendation type.

    If your items contain Amazon extras (such as maturity rating, IMDB ID, or other details), these extras will be sent with the recommendations. See the [Sending Amazon Extras in Your Recommendations][fire-app-builder-related-recommendations#amazon-extras] section in [Send Related Recommendations][fire-app-builder-related-recommendations] for more details.

    Global recommendations are sent once during app startup, and also every time the feed is updated when the app is open. The feed's update interval is tied to the value in the **DataLoadManagerConfig.json** file (in your app's **assets > configurations** folder). The property in that file is `data_updater.duration": 14400`. There's also alarm set to wake up the device every 12 hours to refresh the recommendations.

## Test Your Global Recommendations

To test your recommendations, see the general instructions in Fire TV documentation: [Test Your Recommendations](fire-tv-recommendations-testing).

Keep in mind that the Recommended By Your Apps row on Fire TV is outside of the control of the Fire App Builder app. However, you can see that your app is building and sending recommendations by looking in the Android Studio logs.

After starting your app, if you look at the logs in Android Studio (click **Android Monitor** at the bottom of the screen and then filter on the word **recommendation**), you'll see logs indicating that global recommendations have been built and sent. The logs will look something like this:

```
03-24 18:39:09.365 18717-18757/com.amazon.android.calypso D/RecommendationTable: record updated in database: RecommendationRecord{mContentId='99570', mRecommendationId=4, mType='Global'}
03-24 18:39:09.368 18717-18757/com.amazon.android.calypso D/RecommendationSender: Built recommendation - Consuming Passions Chips Recipe | Belgian Style
```

Note that in your tests, your app will not send more than limit you set in Navigator.json file. For example, suppose you have the following:

```
"numberOfGlobalRecommendations": 3
```

With this setting, you won't see any more than 3 recommendations sent.

## Removing Stale Recommendations

Every six hours, Fire App Builder refreshes and will resend the global recommendations listed in your feed. If a user restarts the app more frequently than once every six hours, Fire App Builder will resend the global recommendations on each app restart.

If a user clicks a video on the Recommended By Your App row and completely watches an entire video (not just partially), Fire App Builder marks that video as watched and deletes the recommendation for that item. This history is saved in Fire App Builder's database.

However, when six hours pass and Fire App Builder refreshes, these same global recommendations will again be sent, even if users have already watched the content. To implement more advanced logic, you will need to manage your global recommendations and regularly adjust them.

{% include links.html %}
