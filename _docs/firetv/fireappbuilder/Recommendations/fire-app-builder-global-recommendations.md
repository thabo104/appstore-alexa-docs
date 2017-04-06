---
title: Send Global Recommendations
permalink: fire-app-builder-recommendations-global.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

When your app starts, Fire App Builder reads the list of global recommendations from your media feed and sends them to the "Recommended By Your Apps" row on the Fire TV home screen. This article provides step-by-step instruction for setting up global recommendations.

In summary, you will add a `globalRecommendations` element to your feed. You will then target this `globalRecommendations` element with a new recipe. You then add a section in your Navigator.json file that references the recipe and a data loader.

For more general information about recommendations, see [Recommendations in Fire App Builder][fire-app-builder-recommendations-overview].

* TOC
{:toc}

## Configure Global Recommendations

1.  In your feed, add a single `globalRecommendations` property for the entire feed that points to **an array** of content ID strings. The array of content ID strings should relate to the media you want to recommend.

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

      {% include note.html content="The global recommendations object should not be included in a specific item's details &mdash; there should be just *one* set of global recommendations for the entire feed. Within each item, you can have [related recommendations][fire-app-builder-related-recommendations] that are sent when that specific content is watched. However, in this task, we're configuring *global* recommendations (which are sent when the app starts, not when a specific video plays)." %}

      The global recommendations property can appear anywhere in your feed, and it can use a name other than `globalRecommendations`. But the content should be an array of strings. In the following steps, you'll write a query in a recipe to target this element.

      Note that if you have an MRSS feed that conforms to iTunes specifications, adding custom elements may require more coding, since you'll need to define custom namespaces to use in your XML. (Instructions on adding custom namespaces in XML is beyond the scope of this documentation.)

2.  In your **Navigator.json** file, add a `recommendationRecipes` object after the `globalRecipes` object like this:

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

3.  In your `recommendationRecipes` object, replace the value for the `dataLoader` with a reference to the same data loader file you used within your `globalRecipes` object. For example, `recipes/AcmeDataLoaderRecipe1.json`. (See [Load Your Media Feed][fire-app-builder-load-media-feed] for more details.)
4.  In your `recommendationRecipes` object, replace the value for `dynamicParser` with a reference to a new recipe file that has a custom name. For example, `recipes/AcmeGlobalRecParserRecipe.json`. Then create this file in your app's **assets > recipes** folder.
5.  (Optional) If you want to limit the number of global recommendations your app sends, you can use the `numberOfGlobalRecommendations` property (inside `config`) in Navigator.json to specify a limit, like this:

    ```json
    "config": {
      "showRelatedContent": true,
      "useCategoryAsDefaultRelatedContent": true,
      "searchAlgo": "basic",
      "numberOfGlobalRecommendations": 3,
      "numberOfRelatedRecommendations": 3
    }
    ```

    This number limits the total number of global recommendations your app can send. After this number of recommendations is reached, your app won't send any more global recommendations until the refresh period (every six hours, or every time your app is restarted).

    Note that Fire TV must receive at least 5 recommendations from all apps combined in order to display the Recommended By Your Apps row to users. If you don't specify the number of global recommendations here, 5 is used as the default.

6.  Open the global recommendations parser recipe (for example, AcmeGlobalRecParserRecipe.json) that you created in step 5 and insert the following recipe:

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

    Here are some details about this recipe:

    * The `format` this recipe expects is `json`. (If your feed format is XML, change the value for `format` to from `json` to `xml`.)
    * The `model` this recipe is expecting is a `String`.
    * With `modelType` set to `array`, Fire App Builder expects this recipe to return an array of strings.
    * After the `query` returns a list of strings, the `matchList` parameter will directly match the strings by using `StringKey`. Fire App Builder will map these strings to its model.

    (These settings aren't important as long as your global recommendations query matches an array of strings in JSON format. If this isn't the case, you can adjust the recipe settings accordingly. See [Recipe Configuration Overview][fire-app-builder-set-up-recipes-overview] for details.)

7.  Customize the `query` value to target the global recommendations property in your feed.

    If you're using JSON, your query will use [Jayway JsonPath](https://github.com/jayway/JsonPath) syntax. If your feed is XML, you'll use [XPath expressions](https://www.w3schools.com/xml/xpath_syntax.asp).

    For instructions on creating these queries, see the [query Parameter][fire-app-builder-set-up-recipes-categories#queryparameter] section in the [Set Up the Category Recipe][fire-app-builder-set-up-recipes-categories] topic.

    In the sample `query` shown above, the `$.globalRecommendations[*]` query starts in the root directory, finds the `globalRecommendations` array and selects everything inside of the array. (If you were using XML with the sample XML feed above, your query would be `//globalrecommendations/guid/text()`.) If you want the query to look recursively in every folder for the `globalRecommendations` object, use `$..globalRecommendations[*]`.

8.  To ensure that your query correctly targets the `globalRecommendations` element, test the query in online evaluators:

    * For JSON feeds, test your query with the [Jayway JsonPath Evaluator](https://jsonpath.herokuapp.com/).
    * For XML feeds, test your query with the [XPath evaluator](http://www.freeformatter.com/xpath-tester.html).

    The result from the query should be a list of strings containing IDs for the content. Fire App Builder will use these content IDs when it builds the recommendation.

    If your items contain [Amazon extras][fire-app-builder-amazon-extras] (such as maturity rating), these extras will be sent with the recommendations.

    Global recommendations are sent once during app startup, and also every time the feed is updated when the app is open. The feed's update interval is tied to the value in the **DataLoadManagerConfig.json** file (in your app's **assets > configurations** folder). The property in that file is `data_updater.duration": 14400` (4 hours). There's also alarm set to wake up the device every 12 hours to refresh the recommendations.

## Test Your Global Recommendations

To test your recommendations, see the general instructions in Fire TV documentation: [Test Your Recommendations](fire-tv-recommendations-testing).

Keep in mind that the Recommended By Your Apps row on Fire TV is outside of the control of the Fire App Builder app. However, you can see that your app is building and sending recommendations by looking in the Android Studio logs.

After starting your app, in Android Studio click **Android Monitor** at the bottom of the screen and then filter on the word **recommendation**. You'll see logs indicating that global recommendations have been built and sent. For example:

```
03-24 18:39:09.365 18717-18757/com.amazon.android.calypso D/RecommendationTable: record updated in database: RecommendationRecord{mContentId='99570', mRecommendationId=4, mType='Global'}
03-24 18:39:09.368 18717-18757/com.amazon.android.calypso D/RecommendationSender: Built recommendation - Consuming Passions Chips Recipe | Belgian Style
```

`mType='Global'` indicates that the recommendation sent is a global recommendation.

Note that in your tests, your app will not send more than the limit you set in Navigator.json file. For example, suppose you have the following in Navigator.json:

```
"numberOfGlobalRecommendations": 3
```

But your list of `globalRecommendations` contains 5 content IDs. In this case, only 3 recommendations will be sent.

## Removing Stale Recommendations

If a user clicks a video on the Recommended By Your App row and completely watches the video (not just partially), Fire App Builder marks that video as watched and deletes the recommendation for that item. This history is saved in Fire App Builder's database.

However, when six hours pass and Fire App Builder refreshes, these same global recommendations will again be sent, even if users have already watched the content. To implement more advanced logic, you will need to manage the global recommendations in your feed and regularly adjust them.

{% include links.html %}
