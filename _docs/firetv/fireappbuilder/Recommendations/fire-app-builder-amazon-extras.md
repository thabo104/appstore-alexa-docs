---
title: Customize the recommendations with Amazon extras
permalink: fire-app-builder-amazon-extras.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

## About Amazon extras

Amazon allows you to send extra values with your recommendations. These extras allow you to customize your recommendations to better fit the Fire TV platform. You can read about the Amazon extras in the general Fire TV documentation here: [Send Recommendations that Include Amazon Extras][fire-tv-recommendations-send-recommendations#amazon-enhancements].

Currently, some of the extras you can send aren't used by Fire TV. In other cases, Fire App Builder sends a default value for the extra.

## Fire App Builder Support for Amazon Extras

The following table notes how each Amazon extra tag is used by Fire App Builder.

{% include content/{{site.language}}/fire/amazon_recommendations_enhancements.md scenario="fab" %}

## How to Include Extras in Your Fire App Builder Recommendations

You include the extras with the item details in your feed (but not inside the `recommendations` tag &mdash; the `recommendations` tag should simply list an array of content IDs). When Fire App Builder builds and sends the related recommendations, any additional information matching the Amazon extras will also be sent.

Here's an example of an item in a feed that includes all the extras:

```json
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
     ],
     "maturityRating": "PG",
     "live": "1",
     "startTime": 1490393748,
     "endTime": 1490397347,
     "videoPreviewUrl": "http://mywebsite.com/some/url/to/the/video.mp4",
     "imdbId": "tt2417148",
     "closeCaptionUrls": ["1"],
     "genres": ["DRAMA"]    
}
```

In your contents recipe, you map these extras in the same way you match on other feed properties. For example:

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
    "recommendations@recommendations",
    "maturityRating@maturityRating",
    "live@live",
    "startTime@startTime",
    "endTime@endTime",
    "videoPreviewUrl@videoPreviewUrl",
    "imdbId@imdbId",
    "closeCaptionUrls@closeCaptionUrls",
    "genres@genres",
  ]
}
```

On the left of the `@` symbol you put the property's name in your feed; on the right of the `@` symbol you put the Fire App Builder UI tag.


## Customizing the App Display Name in Recommendations {#customizeappname}

In the recommendation's display, the Fire TV home screen truncates your app title after 15 characters. This may cause your app name to look odd. For example, "Fire App Builder" gets truncated to "Fire App Builde."

{% include image.html  file="firetv/fireappbuilder/images/fireappbuilder_nocustomtitle" type="png" %}

To set a shorter title for the 15-character recommendation space, you can customize the name. Here's an example of a customized name:

{% include image.html  file="firetv/fireappbuilder/images/fireappbuilder_customtitle" type="png" %}


To customize your app name in the recommendation details:

1.  Open your app's **strings.xml** file (inside **res > values > strings.xml**).

    Note that strings.xml is separated out into multiple files depending on the language you're targeting. For US English, use **strings.xml (en)**.

2.  In this file, add the following element with the app name you want:

    ```xml
    <string name="app_display_name">FireAppBuilder</string>
    ```

{% include links.html %}
