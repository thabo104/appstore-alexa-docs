---
title: Show Your User's Recent Content on Home
permalink: fire-tv-recommendations-recent-row.html
sidebar: firetv
product: Fire TV
toc-style: kramdown
github: true
---


There is a feature that allows you to surface content on the "Recent" row to allow your users to continue watching where they left off. To leverage this feature, you can create a recommendation with a few extra parameters. A maximum of five recommendations will be shown on the Recent row per application, so it is not necessary to send any more than that.

* TOC
{:toc}

## When to Send Recent Recommendations

1.  On device-boot
2.  When media is exited (via back button, home button press, etc)
3.  When a TV show episode is completed


## 1. Send Recent Recommendations on Boot

TV recommendations are treated as Notification objects by the Android framework which are not persisted across reboots. Because of this, applications must re-submit their recommendations upon device boot for them to appear.

If you plan on sending recommendations when the device boots up, you need to make sure your application is allowed to receive & handle the broadcast that tells the application that your device has booted. To be able to receive the broadcast you should add this permission as a child of the `<manifest>` element to your Android Manifest:

```xml
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
```

Once you have done that, the initial launch point for supporting recommendations is to create a subclass of BroadcastReceiver. In the manifest, you then register the receiver as handling the `ACTION_BOOT_COMPLETED` intent.

## 2. Send Recommendations When Media is Exited

When content is exited, a recommendation should be sent which contains the updated progress that the user has made.

## 3. Send Recommendations When a TV Show Episode is Completed

When a TV show episode ends, you will want to send the next episode in the series as a recommendation. When making a recommendation for a TV show's next episode, set the `com.amazon.extra.LAST_WATCHED_DATETIME` extra to have the last time the show was watched.

{% include tip.html content="Be intelligent about recommending the next episode. Consider when the credits begin, etc. It may make sense to recommend the next episode in a TV series when the current one is very close to completion, even if it is not 100% complete." %}

## How to Build a Recent Recommendation

The following code sample shows `ContentRecommendation` API call:

```java
NotificationManager notificationManager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);

ContentRecommendation rec = new ContentRecommendation.Builder()
        .setContentImage(myBitmap) // From API 23 this method also accepts Icon as argument.
        .setBackgroundImageUri(myBackgroundImageUri)
        .setContentIntentData(ContentRecommendation.INTENT_TYPE_***, mIntent, mRequestCode, mBundle)
        .setText(text) // a description of the content. If this is a TV show episode, include the season and episode number in the description
        .setTitle(title)
        .setBadgeIcon(R.drawable.<icon>)
        .setGenres(genres)
        .setContentTypes(types)
        .setProgress(maxProgress, progress)
        .build();

ContentRecommendation rec = recBuilder.build();
Notification notification =  rec.getNotificationObject(context);

// Set the tag to display this recommendation on the Recent row
ArrayList<String> tagList = new ArrayList<String>();
tagList.add("Resume");
notification.extras.putStringArrayList("com.amazon.extra.TAGS", tagList);

notification.extras.putString("com.amazon.extra.MATURITY_RATING", maturityRating);

// the contentId for this catalog integrated content. See DATA_EXTRA_NAME on https://developer.amazon.com/public/solutions/devices/fire-tv/docs/catalog/launcher-integration#intent-extras
notification.extras.putString("com.amazon.extra.CONTENT_ID", contentId);

// Assign a business name for the application which may be shown on the UI. Limited to 15 chars, or the UI will truncate it
notification.extras.putString("com.amazon.extra.DISPLAY_NAME", context.getString(R.string.app_name));

// Assign a last watched time to this recommendation
notification.extras.putLong("com.amazon.extra.LAST_WATCHED_DATETIME", System.currentTimeMillis());

// Specify a notification ID that you can use to update the notification later
int notifyId = title.hashCode();
mNotificationManager.notify(notifyId, notification);

*** Refer documentation for setContentIntentData() here: https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.html
```

Below is a sample recommendation for a TV show episode on the Recent row. The annotations describing the fields that are visible for a user.

{% include image.html  file="firetv/getting_started/images/technical_mock_catvidz" type="png" %}

<div class="number_legend">
{% include inline_image.html file="firetv/getting_started/images/firetv_one" type="png" %} <a href="https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setTitle%28java.lang.String%29"><code>setTitle(title)</code></a>: If the recommendation is a movie, put the movie title here. If the recommendation is for a TV show, put the title of the TV show series, not the individual episode.<br/>
{% include inline_image.html file="firetv/getting_started/images/firetv_two" type="png" %} Amazon extra <a href="https://developer.amazon.com/public/solutions/devices/fire-tv/docs/fire-tv-recommendations-send-recommendations#amazon-enhancements"><code>com.amazon.extra.MATURITY_RATING</code></a>: This badge will be drawn according to the specified maturity rating. <br/>
{% include inline_image.html file="firetv/getting_started/images/firetv_three" type="png" %} <a href="https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setText%28java.lang.String%29"><code>setText(text)</code></a>: The description for this recommendation. If the recommendation is a TV show, be sure to include the season and episode number. <br/>
{% include inline_image.html file="firetv/getting_started/images/firetv_four" type="png" %} <a href="https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setBackgroundImageUri%28java.lang.String%29"><code>setBackgroundImageUri(imageUrl)</code></a>[legend-set-background-image]: A URL to the background image to show in the details pane. <br/>
{% include inline_image.html file="firetv/getting_started/images/firetv_five" type="png" %} <a href="https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setContentImage%28android.graphics.Bitmap%29"><code>setContentImage(image)</code></a>: The image that will be drawn for the recommendation in the row. <br/>
{% include inline_image.html file="firetv/getting_started/images/firetv_six" type="png" %} <a href="https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setBadgeIcon%28int%29"><code>setBadgeIcon(icon)</code></a>: This icon will show in the bottom left corner of the tile to let users know which app this recommendation came from. We recommend a simple icon with a transparent background which will help users identify your app. Maximum height: 52 px.  <br/>
{% include inline_image.html file="firetv/getting_started/images/firetv_seven" type="png" %} <a href="https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setProgress%28int,%20int%29"><code>setProgress(duration, progress)</code></a>: The progress specified will be used to draw the progress bar on the recommendation. <br/>
</div>

## Recent Content: Best Practices

Follow these best practices when sending recent content.

### Set the "Last Watched Time" Correctly

The Amazon extra `com.amazon.extra.LAST_WATCHED_DATETIME` is critical to determine the order of items on the user's Recent row. Always make sure this value corresponds to when the user *last watched* this particular content. When making a recommendation for a TV show's next episode in the series, set `com.amazon.extra.LAST_WATCHED_DATETIME` to the last time the show was watched.

### Remove Outdated Recommendations

Remember to remove recommendations when a user completes a movie or a TV show.

{% include tip.html content="Consider *updating* existing recommendations when appropriate. One approach could be to use a hashcode on the TV show series as the notification id when building a TV show recommendation. This will ensure that you always have one single episode showing for a specific TV series at a time. See [Updating Notifications](https://developer.android.com/training/notify-user/managing.html) for more information." %}

### Show Exactly One Recommendation per TV Series

As mentioned previously, you must ensure that your app shows just one TV show episode per series.

{% include image.html  file="firetv/getting_started/images/mock_duplicate_do_not_catvidz" type="png" max-width="" border=""  url="" caption="<b>DO NOT.</b> Do not send more than one episode per series." alt=" Do not send more than one episode per series." %}

{% include image.html  file="firetv/getting_started/images/catvidz_mock" type="png" max-width="" border=""  url="" caption="<b>DO.</b> Send just one episode per series." alt="DO. Send just one episode per series." %}


## Requirements for Recent Recommendations

Your app must be whitelisted in order to send content to the Recent row. Additionally, your media must be integrated into the [Fire TV catalog][integrating-your-catalog-with-fire-tv].

{% include links.html %}
