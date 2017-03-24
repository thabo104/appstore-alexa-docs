---
title: Send Global Recommendations
permalink: fire-app-builder-set-up-recipes-content.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

Global recommendations are sent when your app starts. Fire App Builder reads the list of global recommendations from your media feed. Every six hours, Fire App Builder refreshes and will resend the global recommendations.

If a user clicks a video on the Recommended By Your App row and completely watches a video (not just partially), Fire App Builder marks that video as watched and deletes the recommendation for that item. This information is saved in Fire App Builder's database.

However, when six hours pass and Fire App Builder refreshes, these same global recommendations will again be sent, even if users have already watched the content. To implement more advanced logic, you will need to manage your global recommendations and regularly alter them.

* TOC
{:toc}

## Configure Global Recommendations

1.  In your **Navigator.json** file (in your app's **assets** folder), in the `config` object, specify how many global recommendations you want to send through the `numberOfGlobalRecommendations` property:

    ```json
    "config": {
      "showRelatedContent": true,
      "useCategoryAsDefaultRelatedContent": true,
      "searchAlgo": "basic",
      "numberOfGlobalRecommendations": 3,
      "numberOfRelatedRecommendations": 3
    }
    ```

    Fire TV must receive at least 5 recommendations from all apps combined in order to display the Recommended By Your Apps row to users. If you don't specify a number of global recommendations here, 5 is used as the default.

2.  In your **Navigator.json** file, add a `recommendationRecipes` property after the `globalRecipes` block like this:

    ```json
    ...
    "recommendationRecipes": [
        {
          "contents": {
            "dataLoader": "recipes/FileBasedDataLoaderRecipe.json",
            "dynamicParser": "recipes/<App name>GlobalRecParserRecipe.json"
            }
          }
    ],
    ...
    ```

    In place of `<App name>` insert your app's name in there. For example, `AcmeGlobalRecParserRecipe.json`.

2.  In your feed, add a `globalRecommendations` property that points to a list of content ID strings. For example, if your feed is in JSON, it might look like this:

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
    </pre>

    If your feed is XML, it might look like this:

    ```xml
    <rss>
    <channel>
        <item>
            <title>Sample Title</title>
            <pubDate>Wed, 26 Oct 2016 20:34:22 PDT</pubDate>
            <link>https://example.com/myshow/episodes/110</link>
            <author>Sample Author name</author>
            <category>Technology</category>
            <category>Gadgets</category>
            <recommendations>
              <guid>38883</guid>
              <guid>99834</guid>
            </recommendations>
         </item>
         <globalrecommendations>
              <guid>99605</guid>
              <guid>99551</guid>
              <guid>99570</guid>
              <guid>99580</guid>
              <guid>112683</guid>
          </globalrecommendations>
        </channel>
      </rss>
      ```

      Note that the global recommendations should not be included in a specific item's details, since there is just one set of global recommendations for the entire feed. Within each item, you can have recommendations that refer to [related recommendations][fire-app-builder-related-recommendations]. However, in this tutorial, we're just configuring *global recommendations*, so there needs to be one global recommendations property for the whole feed.

      The global recommendations property can appear anywhere in your feed, and it can use a different name than `globalRecommendations`. In the following steps, you'll write a query in a recipe to target the values this element contains.

      Note that if you have an MRSS feed that conforms to iTunes specifications, adding custom elements may require more coding, since you'll need to define custom namespaces to use and target in your XML. (Instructions on adding custom namespaces in XML is beyond the scope of this documentation.)

3.  In your app's **assets > recipes** folder, add a new file called **<App name>GlobalRecParserRecipe.json**, using the same name for `<App name>` that you used earlier in step 2.
4.  Add the following recipe to your **<App name>GlobalRecParserRecipe.json** file:

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

5.  Customize the `query` value to target the global recommendations property in your feed. If you're using JSON, your query will use Jayway JsonPath syntax. If your feed is XML, you'll use XPath expressions.

    For instructions on creating these queries, see the [query Parameter][fire-app-builder-set-up-recipes-categories#queryparameter] section in the [Set Up the Category Recipe][fire-app-builder-set-up-recipes-categories] topic.

    To ensure that your query correctly targets the global recommendations, for JSON feeds, test your query with the [Jayway JsonPath Evaluator](https://jsonpath.herokuapp.com/). For XML feeds, test your query with the [XPath evaluator](http://www.freeformatter.com/xpath-tester.html).

    In this sample query, `$.globalRecommendations[*]` says to find the `globalRecommendations` array and select everything inside of it. The `model` this recipe is expecting is a `String` and the `modelType` is array. So we're expecting this recipe to return an array of strings. Since the query returns a list of strings, we use the `matchList` parameter to directly match the string key to the model's value, which is a string.

    If you were using XML, your query would be `//globalrecommendations/guid/text()`.

    After the recipe finishes running, the app will have the list of content IDs to recommend. These recommendations will be sent with the global recommendation type. Global recommendations are sent once during app startup, and also every time the feed is updated when the app is open. This update interval is tied to the value in the **DataLoadManagerConfig.json** file (in your app's **assets > configurations** folder). The property in that file is `data_updater.duration": 14400`. There's also alarm set to wake up the device every 12 hours to refresh the recommendations.


## Test Your Global Recommendations

To test your recommendations, see the general instructions in Fire TV documentation: [Test Your Recommendations](fire-tv-recommendations-testing).
