---
title: Customize the recommendations with Amazon extras
permalink: fire-app-builder-amazon-extras.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

Amazon allows you to send extra values with your recommendations. These extras allow you to customize your recommendations to better fit the Fire TV platform. You can read about the Amazon extras in the general Fire TV documentation here: [Send Recommendations that Include Amazon Extras][fire-tv-recommendations-send-recommendations#amazon-enhancements].

Currently, some of the Amazon extras you can send aren't currently used by Fire TV. (They may be used in the future, though.) In other cases, Fire App Builder sends a default value (which you can't change) for the Amazon extra.

* TOC
{:toc}

## Amazon Extras

The following table lists the Amazon extras available.

{% include content/{{site.language}}/fire/amazon-recommendations-enhancements.md scenario="fab" %}

## How to Submit Amazon Extras in Fire App Builder

The following table describes how Fire App Builder handles each tag, how to map Amazon extra elements in your feed to Fire App Builder's content model tags, and any special notes about data types.

<table class="grid">
   <colgroup>
   <col width="30%" />
   <col width="70%" />
   </colgroup>
   <thead>
      <tr>
         <th>Extra name</th>
         <th>How to use in Fire App Builder</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td><code>com.amazon.extra.DISPLAY_NAME</code></td>
         <td>Instead of mapping a <code>DISPLAY_NAME</code> in each feed item, you set this value in your app's <code>strings.xml</code> file. See <a href="#customizeappname">Customizing the App Display Name in Recommendations</a> for details.</td>
      </tr>
      <tr>
         <td><code>com.amazon.extra.MATURITY_RATING</code></td>
         <td>Map to the tag <code>maturityRating</code> in your contents recipe.</td>
      </tr>
      <tr>
           <td><code>com.amazon.extra.RANK</code></td>
           <td>Not available to change. Fire App Builder sends a rank of <code>0</code> (the highest priority) for every content item.</td>
      </tr>
        <tr>
           <td><code>com.amazon.extra.ACTIONS</code></td>
           <td>Fire App Builder sends an empty list and accepts the defaults from Fire TV. By default, Fire TV will use the terms <code>Open</code> and <code>Launch &lt;App Name&gt;</code> in the launch context menu. To customize what Fire App Builder sends, map to the tag <code>actions</code> in your contents recipe.</td>  
        </tr>
      <tr>
         <td><code>com.amazon.extra.LIVE_CONTENT</code></td>
         <td markdown="span">Map this element to the tag <code>live</code> in your contents recipe. Also, note that the value for <code>live</code> must be a Boolean (<code>true</code> or <code>false</code>) rather than an integer of <code>0</code> or <code>1</code> (the Fire TV extras require the integer data type). Fire App Builder will actually convert the Boolean to an integer when sending the recommendation. For more details, see [Configure Live Streams][fire-app-builder-live-stream-configuration]. If your content is live, the "Watch from Beginning" button will be omitted from the media playback screen. </td>
        </tr>
      <tr>
         <td><code>com.amazon.extra.CONTENT_RELEASE_DATE</code></td>
         <td>Map to the tag <code>availableDate</code> in your contents recipe.</td>
      </tr>
      <tr>
         <td><code>com.amazon.extra.CONTENT_CAPTION_AVAILABILITY</code></td>
         <td>Content caption availability will be automatically detected if the content has it. You don't need to map this element in your contents recipe. If your content has closed caption availability, Fire App Builder passes a <code>1</code> when sending the recommendation. If not, it passes <code>0</code>. </td>
      </tr>
      <tr>
         <td><code>com.amazon.extra.IMDB_ID</code></td>
         <td>Map to the tag <code>imdbId</code> in your contents recipe.</td>
      </tr>
      <tr>
         <td><code>com.amazon.extra.CONTENT_START_TIME</code></td>
         <td>Map to the tag <code>startTime</code> in your contents recipe. Only valid for live content.</td>
      </tr>
      <tr>
         <td><code>com.amazon.extra.CONTENT_END_TIME</code></td>
         <td>Map to the tag <code>endTime</code> in your contents recipe. Only valid for live content.</td>
      </tr>
      <tr>
         <td><code>com.amazon.extra.TEXT_EMBEDDED_IMAGE</code></td>
         <td>Not supported</td>
      </tr>
      <tr>
        <td><code>com.amazon.extra.LONG_DESCRIPTION</code></td>
        <td>Fire App Builder passes the regular <code>description</code> to this extra.</td>
        </tr>
      <tr>
        <td><code>com.amazon.extra.LAST_WATCHED_DATETIME</code></td>
        <td>Fire App Builder automatically picks up this value by looking at the records in its database for the content. Fire App Builder stores the last time every content is watched. There's no need to map this value in your contents recipe.</td>
      </tr>
      <tr>
        <td><code>com.amazon.extra.PREVIEW_URL</code></td>
        <td>Map to the tag <code>videoPreviewUrl</code> in your contents recipe.</td>
      </tr>
      <tr>
        <td><code>genres</code></td>
        <td><a href="https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setGenres(java.lang.String[])"><code>genres</code></a> isn't an Amazon extra &mdash; it's part of the regular Android recommendations API. Map this element to the tag <code>genres</code> in your contents recipe. <code>genres</code> should point to an array of strings, not a single string.  For example: <code>"genres": ["COMEDY", "ARTS", "EDUCATION"]</code>. Use the <a href="https://developer.android.com/reference/android/media/tv/TvContract.Programs.Genres.html">standard Android genre terms</a>.</td>
      </tr>
   </tbody>
</table>

## How to Include Extras in Your Fire App Builder Recommendations

You include the extras with the item details in your feed (but not inside the `recommendations` tag &mdash; the `recommendations` tag should simply list an array of content IDs). When Fire App Builder builds the related recommendations, any additional information matching the Amazon extras will also be included.

Here's an example of an item in a feed that includes all the extras:

```json
{
     "id": "162270",
     "title": "Thai Recipes - Thai Chicken Noodles Recipe",
     "description": "Thai Recipes - Thai Chicken Noodles Recipe",
     "duration": "355",
     "thumbURL": "http://l2.cdn01.net/_thumbs/0000162/0162270/0162270__015f.jpg",
     "imgURL": "http://l2.cdn01.net\/_thumbs/0000162/0162270/0162270__015f.jpg",
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
     ],
     "maturityRating": "PG",
     "live": true,
     "startTime": 1490393748,
     "endTime": 1490397347,
     "videoPreviewUrl": "http://mywebsite.com/some/url/to/the/video.mp4",
     "imdbId": "tt2417148",
     "genres": ["DRAMA"],
     "actions": [1, 101]
}
```

In your contents recipe, you map these extras in the same way you map your other feed properties. For example:

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
    "genres@genres",
    "actions@actions"
  ]
}
```

On the left of the `@` symbol you put the property's name in your feed; on the right of the `@` symbol you put the value for Fire App Builder's content model. The names to map are listed in the previous table.

## Customizing the App Display Name in Recommendations {#customizeappname}

In the recommendation's display on the Fire TV home screen, Fire TV truncates your app title after 15 characters. This may cause your app name to look odd. For example, "Fire App Builder" gets truncated to "Fire App Builde."

{% include image.html  file="firetv/fireappbuilder/images/fireappbuilder_nocustomtitle" type="png" %}

To set a shorter title for the 15-character recommendation space, you can customize the display name. Here's an example of a customized name:

{% include image.html  file="firetv/fireappbuilder/images/fireappbuilder_customtitle" type="png" %}

**To customize your app name in the recommendation details:**

1.  Open your app's **strings.xml** file (inside **res > values > strings.xml**).

    Note that strings.xml is separated out into multiple files depending on the language you're targeting. For US English, use **strings.xml (en)**.

2.  In this file, add the following element with the app name you want:

    ```xml
    <string name="app_name_short">FireAppBuilder</string>
    ```

When Fire App Builder builds the recommendation, it will use the value included here and pass it as the `com.amazon.extra.DISPLAY_NAME`.

{% include links.html %}
