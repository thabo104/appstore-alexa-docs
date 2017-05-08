---
title: "\"Continue Watching\" Recommendations"
permalink: fire-tv-recommendations-continue-watching.html
sidebar: firetv
product: Fire TV
toc-style: kramdown
github: true
---

The Fire TV Home screen includes a "Recent" row that shows the apps you recently opened. By default, only app icons appear in the Recent row. In an upcoming release, rather than just showing the app icon, Amazon will enable apps to indicate the actual content the user recently watched, along with a progress bar indicating the remaining time to finish the content.

If the content is an episode in a series (and the user finished the episode), the Recent row can show the next episode. "Continue Watching" recommendations allow users to easily engage with your app by continuing to watch where they left off.

You send Continue Watching recommendations to the Recent row the same way you [normally send recommendations][fire-tv-recommendations-send-recommendations], except that you also use the [`setProgress()`](https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setProgress%28int,%20int%29) method to include details about the user's progress.

{% include note.html content="Continue Watching recommendations are a feature currently in development. Depending on feedback gathered from beta testing, some of the details may change when the feature is officially rolled out. The timeline for rollout is not yet announced." %}

* TOC
{:toc}

## Example of Continue Watching Recommendations

Without sending Continue Watching recommendations, users who were watching a video (for example, "CatVidz") would see the general app icon on the Recent row on Fire TV's home screen.

{% include image.html file="firetv/getting_started/images/firetv-recommendations-continue-watching-app-icon" type="png" alt="Recent row not watched content" max-width="700px" %}

However, if your app sends Continue Watching recommendations, the same users will see a tile representing the content they were watching as well as a progress indicator showing how much time remains to finish the content. Your app logo will appear as an overlay on the content tile. The following screenshot shows an example.

{% include image.html file="firetv/getting_started/images/firetv-recommendations-continue-watching-season-tile" type="png" alt="Recent row showing progress" max-width="700px" %}

Your app can have up to 5 Recent recommendation tiles in the Recent row, assuming users watched 5 separate media items from your app and did not finish them. If a user finishes an episode in a series, you can show the next episode. However, do not show content for more than one episode *in the same series*.

Note that if you want your app icon (instead of a content tile) to appear in the Recent row, just do not send Continue Watching recommendations.

## Requirements for Continue Watching Recommendations

To send content to the Recent row, your media must be integrated into the [Fire TV catalog][integrating-your-catalog-with-fire-tv].

Additionally, your app must be whitelisted. To request whitelisting, submit a request through the [Contact Us](https://developer.amazon.com/public/support/contact/contact-us) form and select "Signup and Contract" for the Subject.

## How to Send Continue Watching Recommendations {#howtosend}

You send Continue Watching recommendations the same way you [send recommendations][fire-tv-recommendations-send-recommendations]. However, in addition to the normal recommendation parameters (title, text, content image, etc.), you must also use the [`setProgress`](https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setProgress%28int,%20int%29) method.

Below is a sample Continue Watching recommendation for a TV show episode. The annotations describe the fields visible to users.

{% include image.html  file="firetv/getting_started/images/firetv_continuewatching" type="png" %}

<div class="number_legend">
{% include inline_image.html file="firetv/getting_started/images/firetv_one" type="png" %} <a href="https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setTitle%28java.lang.String%29"><code>setTitle(title)</code></a>. <i>Required</i>. If the recommendation is a movie, include the movie title here. If the recommendation is for a TV show, include the title of the TV show series, not the individual episode.<br/>
{% include inline_image.html file="firetv/getting_started/images/firetv_two" type="png" %} <a class="noCrossRef" href="https://developer.amazon.com/public/solutions/devices/fire-tv/docs/fire-tv-recommendations-send-recommendations#amazon-enhancements"><code>com.amazon.extra.MATURITY_RATING</code></a> (an Amazon extra). <i>Optional</i>. This badge will be drawn according to the specified maturity rating. <br/>
{% include inline_image.html file="firetv/getting_started/images/firetv_three" type="png" %} <a href="https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setText%28java.lang.String%29"><code>setText(text)</code></a>. <i>Required</i>. The description for this recommendation. If the recommendation is a TV show, include the season and episode number. <br/>
{% include inline_image.html file="firetv/getting_started/images/firetv_four" type="png" %} <a href="https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setBackgroundImageUri%28java.lang.String%29"><code>setBackgroundImageUri(imageUrl)</code></a>. <i>Optional</i>. A URL to the background image to show in the details pane. <br/>
{% include inline_image.html file="firetv/getting_started/images/firetv_five" type="png" %} <a href="https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setContentImage%28android.graphics.Bitmap%29"><code>setContentImage(image)</code></a>. <i>Required</i>. The image that will be drawn for the recommendation in the Recent row. The badge icon will appear over this tile, so your app logo should not be included in this image. <br/>
{% include inline_image.html file="firetv/getting_started/images/firetv_six" type="png" %} <a href="https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setBadgeIcon%28int%29"><code>setBadgeIcon(icon)</code></a>. <i>Required</i>. The icon that lets users know which app the recommendation comes from. Use a simple icon with a transparent background to help users identify your app. The icon appears in the bottom-left corner. Maximum height: 52 px. <br/>
{% include inline_image.html file="firetv/getting_started/images/firetv_seven" type="png" %} <a href="https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setProgress%28int,%20int%29"><code>setProgress(duration, progress)</code></a>. <i>Required</i>. The progress specified will be used to draw the progress bar on the recommendation. <br/>
</div>


## When to Send Continue Watching Recommendations

You can send Continue Watching recommendations during three events:

1.  [Device boot](#deviceboot)
2.  [When media is exited (via back button, home button press, etc)](#mediaexited)
3.  [When a TV show episode is completed](#episodecomplete)

### 1. Send Continue Watching Recommendations on Device Boot {#deviceboot}

TV recommendations are treated as [Notification objects](https://developer.android.com/reference/android/app/Notification.html) by the Android framework and are not persisted across reboots. Because of this, applications must re-submit their recommendations upon device boot for them to appear.

If you plan to send recommendations when the device boots up, make sure your application is allowed to receive and handle the broadcast that tells the application that your device has booted. To receive the broadcast, add the following permission as a child of the `<manifest>` element to your Android Manifest:

```xml
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
```

After you add this permission, the initial launch point for supporting recommendations is to create a subclass of `BroadcastReceiver`. In the manifest, you then register the receiver as handling the `ACTION_BOOT_COMPLETED` intent. (For a more detailed tutorial on setting this up, see [How to Start an Application at Device Bootup in Android](http://stacktips.com/tutorials/android/how-to-start-an-application-at-device-bootup-in-android) on Stacktips.com.)

### 2. Send Recommendations When Media is Exited {#mediaexited}

When a user exits the content, send a recommendation that contains the updated progress the user has made.

### 3. Send Recommendations When a TV Show Episode is Completed {#episodecomplete}

When a user finishes a TV show episode, send the next episode in the series as a recommendation. When making a recommendation for a TV show's next episode, set the [`com.amazon.extra.LAST_WATCHED_DATETIME`][fire-tv-recommendations-send-recommendations#amazon-enhancements] extra to have the last time the show was watched.

{% include tip.html content="When recommending the next episode, keep in mind that users don't always watch the credits at the end of an episode (and so never fully finish the episode). It may make sense to recommend the next episode in a TV series when the current episode is close to completion, even if it is not 100% complete." %}

## How to Build a Recent Recommendation

{% include note.html content="Before creating recommendations, you must add the [Application Recommendation Support Library for TV](https://developer.android.com/topic/libraries/support-library/packages.html#recommendation) to the `dependencies` block of your app's **build.gradle** file." %}

The following code sample shows a `ContentRecommendation` API call:

```java
NotificationManager notificationManager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);

ContentRecommendation rec = new ContentRecommendation.Builder()
        .setContentImage(myBitmap)
        .setBackgroundImageUri(myBackgroundImageUri)
        .setContentIntentData(ContentRecommendation.INTENT_TYPE_***, mIntent, mRequestCode, mBundle) // Create a deep link back into the content for users to resume
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
```

For more details about how to create a [PendingIntent](https://developer.android.com/reference/android/app/PendingIntent.html) to deep link into your content, see the Android documentation for the [setContentIntentData()](https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setContentIntentData(int,%20android.content.Intent,%20int,%20android.os.Bundle) method).

## Additional Requirements for Continue Watching Recommendations

The following are additional requirements when sending Continue Watching recommendations.

### Set the "Last Watched Time" Correctly

The Amazon extra [`com.amazon.extra.LAST_WATCHED_DATETIME`][fire-tv-recommendations-send-recommendations#amazon-enhancements] is critical in determining the order of items on the user's Recent row. Always make sure this value corresponds to the time the user *last watched* this particular content.

When making a recommendation for a TV show's next episode in the series, set `com.amazon.extra.LAST_WATCHED_DATETIME` to the last time the show was watched.

### Remove Outdated Recommendations

Remember to remove recommendations when a user completes a movie or a TV show.

{% include tip.html content="Consider *updating* existing recommendations when appropriate. One approach could be to use a hashcode on the TV show series as the notification ID when building a TV show recommendation. This will ensure that you always have one single episode showing for a specific TV series at a time. See [Updating Notifications](https://developer.android.com/training/notify-user/managing.html) in the Android documentation for more information." %}

### Show Exactly One Recommendation per TV Series

Ensure that your app shows just one TV show episode per series. Do not send multiple episodes for the *same series*.

{% unless site.format == "pdf" %}
<style>
.imageContainer img {
  float: left;
  margin: 10px;
}
</style>
<div class="imageContainer">

{% include inline_image.html file="firetv/getting_started/images/firetv-recommendations-continue-watching-season-tile-green-check" type="png" max-width="280px" %}

{% include inline_image.html file="firetv/getting_started/images/firetv-recommendations-continue-watching-two-episodes" type="png"  max-width="280px" %}

</div>

<div style="clear:both; margin-top:15px;"></div>
{% endunless %}

{% if site.format == "pdf" %}
<style>
.imageContainer img {
  float: left;
  margin: 10px;
}
</style>
<div class="imageContainer">

{% include inline_image.html file="firetv/getting_started/images/firetv-recommendations-continue-watching-season-tile-green-check-pdf" type="png"  %}

{% include inline_image.html file="firetv/getting_started/images/firetv-recommendations-continue-watching-two-episodes-pdf" type="png" %}

</div>

<div style="clear:both; margin-top:15px;"></div>
{% endif %}

## Frequently Asked Questions

Q: Do I need to provide any extra assets (background images/screenshots) other than what I already provide for catalog integration?
:  The only assets required are those described in the section [How to Send Continue Watching Recommendations](#howtosend).

Q: If a user has parental controls enabled, will the Continue Watching recommendation still show on the Recent row ?
:  Yes, the content will still appear even if the user has parental controls enabled. However, clicking on the content will show the pin-protect screen for app launches.

Q: Is there a limit to the number of tiles an app can occupy on the Recent row ?
:  A maximum of five recommendations will be shown on the Recent row per app. It is not necessary to send any more recommendations than that.

Q: What happens to the tile in the Recent row if the user has uninstalled the app from the device or if the content is no longer exists within the app?
:  Just like Android notifications, the recommendations will be removed if an app is uninstalled or if the content is removed.

Q: What happens when a user finishes watching a *movie* instead of a TV series? What will be available as a next suggestion? A movie similar to the one he has watched in terms of the genre or cast?
:  No, if the user finishes the movie, the Recent row just shows the app icon, as with other apps the user recently used. Continue Watching recommendations are generally meant for episodic content in a TV series, or to finish watching the same content. To recommended *related content* in the same genre, [send a regular recommendation][fire-tv-recommendations-send-recommendations] instead. Recommendations appear in the [Recommended By Your Apps row][fire-tv-recommendations-overview].


{% include links.html %}
