---
title:  Track Feed Attributes That Aren't Used in Fire App Builder
permalink: fire-app-builder-track-additional-attributes.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

If you have a feed attribute that you want to track through analytics, but this attribute isn't used in any existing Fire App Builder tags, you can add this attribute by following the steps below.

To add the attribute:

1.  In your app's **assets > configuration** folder, open **AttributeToExtraMap.json** and customize it with the attribute you want to track.

    This file contains an unnamed JSON object as follows:

    ```json
    {
      "ATTRIBUTE_PUBLISHER_NAME": "channelId"
    }
    ```

    This is a sample. Suppose you had an Channel ID attribute (which is not used in Fire App Builder's UI) in your feed, and you wanted this element to be tracked in analytics. On the left (for the key), give the attribute the name you want to see in analytics (for example, `ATTRIBUTE_PUBLISHER_NAME`). On the right (for the value), type an arbitrary name for the element. (For the arbitrary name, you could use the same name that appears in your feed.)

2.  In your Contents recipe (in your app's **assets > recipes** folder), for the `matchList` parameter, add the attribute and map it to the arbitrary value you used in the AttributeToExtraMap.json file.

    For example, the sample Lightcast feeds have a `channel_id` attribute that appears within each feed item:

    ```
    {
      "id": "170310",
      "title": "White Witch of Rose Hall's Grave - Montego Bay, Jamaica",
      "description": "White Witch of Rose Hall's Grave - Resting place of Annie Palmer - at Rose Hall's Great House in Montego Bay, Jamaica",
      "duration": "42",
      "thumbURL": "http:\/\/l2.cdn01.net\/_thumbs\/0000170\/0170310\/0170310__013f.jpg",
      "imgURL": "http:\/\/l2.cdn01.net\/_thumbs\/0000170\/0170310\/0170310__013f.jpg",
      "videoURL": "http:\/\/media.cdn01.net\/802E1F\/process\/encoded\/video_640k\/0000170\/0170310\/B8HGFX0IC.mp4?source=firetv&channel_id=13671",
      "categories": [
        "Jamaican Attractions"
      ],
      "channel_id": "13671"
    }
    ```

    The Channel ID isn't used in the Fire App Builder UI, but you might want to see the channel ID with the item in the analytics.

    In the LightCastContentsRecipe.json file, the `channel_id` attribute from the feed is mapped to `channelId` as follows:

    ```json
      "matchList": [
        "title@title",
        "id@id",
        "description@description",
        "videoURL@url",
        "imgURL@cardImageUrl",
        "imgURL@backgroundImageUrl",
        "channel_id@channelId"
      ]
    ```

    (See [Set Up the Content Recipe][fire-app-builder-set-up-recipes-content]) for more details on matching and mapping elements in your feed.)

    Now the `channel_id` will be included in the analytics, even though this element isn't mapped to any UI element. Because of the naming within the AttributeToExtraMap.json file, the analytics will show the name `AttributeToExtraMap` for this `channel_id` attribute.

    {% include links.html %}
