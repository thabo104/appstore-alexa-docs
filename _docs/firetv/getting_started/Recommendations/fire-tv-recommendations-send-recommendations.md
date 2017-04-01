---
title: Send Recommendations that Include Amazon Extras
permalink: fire-tv-recommendations-send-recommendations.html
sidebar: firetv
product: Fire TV
reviewers: Murtaza
toc-style: kramdown
github: true
---

You create recommendations by creating `ContentRecommendation` objects through the `ContentRecommendation.Builder()` class. In addition to the attributes in this class, you can also include Amazon-specific extras to better integrate with Fire TV.

* TOC
{:toc}


## Documentation for Creating Recommendations

Amazon's recommendations use the standard Android `ContentRecommendation.Builder` API. For full details, see the Android documentation on [Recommending TV Content](https://developer.android.com/training/tv/discovery/recommendations.html) and the [`ContentRecommendation.Builder`](http://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html) class.

In addition what's included in the Android documentation, you can expand the recommendations functionality in your notification objects with [Amazon-specific extras](#amazon-enhancements). These extras help integrate the recommendations into Fire TV in deeper ways.

## Sample Recommendation

Before diving into code examples, let's look at a sample recommendation card. The numbers show several attributes set through the Android API and one Amazon extra.

{% include image.html file="firetv/getting_started/images/firetv_recommendations" type="png" %}

<div class="number_legend" markdown="span">
{% include inline_image.html file="firetv/getting_started/images/firetv_one" type="png" %} [setTitle][setTitle]. Sets the title for the recommendation. (Android API)<br/>
{% include inline_image.html file="firetv/getting_started/images/firetv_two" type="png" %} [setText][setText]. Sets the description for the recommendation. (Android API)<br/>
{% include inline_image.html file="firetv/getting_started/images/firetv_three" type="png" %} [setContentImage][setContentImage]. Sets the image used for the recommendation. (Android API)<br/>
{% include inline_image.html file="firetv/getting_started/images/firetv_four" type="png" %} Sets an abbreviated name for your app, which is used in the launch menu. This is set by one of the Amazon `extra` fields: `com.amazon.extra.DISPLAY_NAME", "displayName"`.
</div>

For example, if your app has a long name, such as "World Premier Association Videos for Fire TV," this long title will be truncated in the launch menu. Instead of accepting the default truncation, you can specify the shortened name for your app through the Amazon extras (in this case, the `DISPLAY_NAME`).

The following screenshot shows how the AOL On for Fire TV app customized the text in the launch menu using Amazon `extra` fields.

{% include image.html file="firetv/getting_started/images/aolonexample2" type="png" %}

## Code Example for a Recommendation

{% include note.html content="Before creating recommendations, you must add the [Application Recommendation Support Library for TV][1] to the `dependencies` block of your app's **build.gradle** file." %}

The following code shows how to create a `ContentRecommendation` object and `getNotificationObject` that includes Amazon extras:

```java
mNotificationManager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
//Sets an ID for the notification, so it can be updated
int notifyID = int_value;

ContentRecommendation rec = new ContentRecommendation.Builder()
        .setContentImage(myBitmap) // From API 23 this method also accepts Icon as argument.
        .setBackgroundImageUri(myBackgroundImageUri)
        .setContentIntentData(ContentRecommendation.INTENT_TYPE_***, mIntent, mRequestCode, mBundle)
        .setText(mText)
        .setTitle(mTitle)
        .setBadgeIcon(R.drawable.<app_icon>)
        .setGenres(mGenres)
        .setContentTypes(mTypes)
        .setProgress(mMaxLength,mProgress)
        .setMaturityRating(mMaturityRating)//This is optional if com.amazon.extra.MATURITY_RATING is filled.
        .build();

Notification notification = rec.getNotificationObject(mContext);

//The additional Amazon extra values get added as follows:

//Assign a business name for the application which may be shown on the UI
notification.extras.putString("com.amazon.extra.DISPLAY_NAME", mDisplayName);

//Assign a Maturity rating to this recommendation
notification.extras.putString("com.amazon.extra.MATURITY_RATING", mMaturityRating);

//Specifies how recommendations from one app is ordered.
notification.extras.putInt("com.amazon.extra.RANK", mRank);

//Assign a long description to this recommendation
notification.extras.putString("com.amazon.extra.LONG_DESCRIPTION", mLongDescription);

//Assign a last watched time to this recommendation
notification.extras.putLong("com.amazon.extra.LAST_WATCHED_DATETIME", mLastWatchedTime);

//Assign a preview video or image URL of this recommendation
notification.extras.putString("com.amazon.extra.PREVIEW_URL", mPreviewUrl);

mNotificationManager.notify(notifyID, notification);
```

{% include tip.html content="For more information on `setContentIntentData()`, see [`ContentRecommendation`](https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.html)." %}

The Amazon extras are added to the notification object. More information for using the Android recommendations API and Amazon extras are provided in the following sections.

{% comment %} where are each of these variables defined? Where is LONG_DESCRIPTION in the table of Amazon extras? Also missing from the table: RECOMMENDATION_TYPE,LAST_WATCHED_DATETIME, and PREVIEW_URL.  need to add ACTIONS in the code example and others that aren't included in the table.. {% endcomment %}

## Recommended Attributes for Android API code {#androidrecommendations}

Follow these guidelines when using the [ContentRecommendation.Builder](https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html) from the Android API. These guidelines will help your recommendations align with the look and feel of Fire TV.

<table class="grid">
   <colgroup>
      <col width="35%" />
      <col width="50%" />
      <col width="15%" />
   </colgroup>
   <thead>
      <tr>
         <th>API</th>
         <th>Description</th>
         <th>Required</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td><a href="http://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setTitle(java.lang.String)"><code>setTitle</code></a>(java.lang.String)</td>
         <td>Sets the content title for the recommendation. The length limit is 125 characters. Additional text is truncated.</td>
         <td>Yes</td>
      </tr>
      <tr>
         <td><a href="http://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setText(java.lang.String)"><code>setText</code></a>(java.lang.String)</td>
         <td>Sets the description text for the recommendation. The length limit is 125 characters. Additional text is truncated.</td>
         <td>Yes</td>
      </tr>
      <tr>
         <td><a href="http://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setContentImage%28android.graphics.Bitmap%29"><code>setContentImage</code></a>(<a href="http://developer.android.com/reference/android/graphics/Bitmap.html">Bitmap image</a>)</td>
         <td>
            Use the following specifications for the large icon image:
            <ul>
               <li>Height: 252px</li>
               <li>Aspect ratio: 16:9 </li>
               <li>Title: Embedded within image</li>
               <li>Transparency: No transparency</li>
            </ul>
            <p>Recommendations without images either won't be displayed or will receive a default placeholder instead. Images with an aspect ratio other than 16:9 will be letterboxed. (Letterboxing means black bars will appear along the sides or top to compensate for the empty space.)</p>
         </td>
         <td>Yes</td>
      </tr>
      <tr>
         <td><a href="http://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setContentIntentData%28int,%20android.content.Intent,%20int,%20android.os.Bundle%29"><code>setContentIntentData</code></a>(int intentType, <a href="http://developer.android.com/reference/android/content/Intent.html">Intent</a> intent, int requestCode, <a href="http://developer.android.com/reference/android/os/Bundle.html">Bundle options</a>)</td>
         <td>
            Sets the data for the Intent that will be issued when the user clicks the recommendation. This pending intent deep links to the recommended content. When launched, the content plays.
            <p>The Intent data fields correspond to the fields passed into the <code>PendingIntent</code> factory methods. The actual <a href="http://developer.android.com/reference/android/app/PendingIntent.html">PendingIntent</a> object will  be created only at the time a recommendation is posted to the Fire TV Home screen.</p>
         </td>
         <td>Yes</td>
      </tr>
      <tr>
         <td><a href="https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setBadgeIcon(int)"><code>setBadgeIcon</code></a>(int iconResourceId)</td>
         <td>
            Sets the resource ID for the recommendation badging icon.
            <p>The resource id represents the icon resource in the source application package. If not set, or an invalid resource ID is specified, the application icon retrieved from its package will be used by default.</p>
         </td>
         <td>Yes</td>
         </tr>
      <tr>
         <td><a href="https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setGenres(java.lang.String[])"><code>setGenres</code></a>(String[] <a href="https://developer.android.com/reference/android/media/tv/TvContract.Programs.Genres.html">genres</a>) </td>
         <td>Sets the content genres for the recommendation. These genres may be used for content ranking. Genres are open ended String tags. Use the standard Android genres.</td>
         <td>No</td>
      </tr>
      <tr>
         <td><a href="https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setContentTypes(java.lang.String[])"><code>setContentTypes</code></a>(String[] types) </td>
         <td>Sets the content types associated with the content recommendation. The first tag entry will be considered the content's priority type and will be used for ranking. Other secondary type tags may be provided, if applicable, and can be used for filtering. Only standard Android <a href="https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.html#CONTENT_TYPE_APP">content recommendation categories</a> are allowed.</td>
         <td>No</td>
      </tr>
      <tr>
         <td><a href="https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html?hl=ja#setProgress(int, int)"><code>setProgress</code></a>(int max, int progress) </td>
         <td>Sets the progress information for the content pointed to by the recommendation. The progress amount for the content must be in the range (0 - max). The unit is seconds.</td>
         <td>No</td>
      </tr>
      <tr>
         <td><a href="https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setBackgroundImageUri%28java.lang.String%29"><code>setBackgroundImageUri</code></a>(String imageUri) </td>
         <td>Sets the Content URI that will be used to retrieve the background image for the recommendation. 1080P / 16:9 image is recommended.</td>
         <td>Yes</td>
      </tr>
   </tbody>
</table>

## Amazon Enhancements to Recommendations {#amazon-enhancements}

The following table lists extras that you can add to your notification objects.

{% include content/{{site.language}}/fire/amazon-recommendations-enhancements.md scenario="ftv" %}

## Configuring the Manifest

To send recommendations when the device boots up, your app must have the `RECEIVE_BOOT_COMPLETED` permission. This permission lets your app receive and handle the broadcast that tells the app  your device was booted.

To receive the broadcast, add the following permission (to your Android Manifest) as a child of the `<manifest>` element:

```xml
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
```

The initial launch point for supporting recommendations is to create a subclass of `BroadcastReceiver`. In the manifest, register the receiver as handling the `ACTION_BOOT_COMPLETED` intent. When the system first boots up, all applications that are interested will get an initial 'ping' to generate their recommendations.

For the broadcast to work reliably, make sure your app is not installed on external storage.  Refer to the following for more details about storage locations:

* [Specifying Your App's Installation Location][specifying-installation-location]
* [App install location][2]
* [android:installLocation manifest attribute][3]

## Delete Recommendations

As a best practice, delete recommendations after users watch the recommended content. You can call [cancel()](http://developer.android.com/reference/android/app/NotificationManager.html#cancel%28int%29) for a specific notification ID to delete the recommendation.

The following code sample shows how to delete recommendations:

```java
Notification notification = rec.getNotificationObject(mContext);
//Use the same notification id which you used while creating this notification
notification.cancel(notifyID);
```

## Next steps

To learn more, see the following:

* [Recommendations Overview][fire-tv-recommendations-overview]
* [Test Your Recommendations][fire-tv-recommendations-testing]
* [Best Practices for Recommendations][fire-tv-recommendations-send-recommendations]

[1]: https://developer.android.com/topic/libraries/support-library/packages.html#recommendation
[2]: http://developer.android.com/guide/topics/data/install-location.html#ShouldNot
[3]: http://developer.android.com/guide/topics/manifest/manifest-element.html#install

[setTitle]: http://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setTitle%28java.lang.String%29
[setText]: http://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setText%28java.lang.String%29
[setContentImage]: http://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setContentImage%28android.graphics.Bitmap%29


{% include links.html %}
