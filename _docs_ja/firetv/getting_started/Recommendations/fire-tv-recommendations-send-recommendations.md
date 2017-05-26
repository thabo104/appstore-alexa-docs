---
title: Send Recommendations that Include Amazon Extras
permalink: fire-tv-recommendations-send-recommendations.html
sidebar: firetv_ja
product: Fire TV
reviewers: Murtaza
toc-style: kramdown
github: true
---

You create recommendations by creating `ContentRecommendation` objects through the `ContentRecommendation.Builder()` class. In addition to the attributes in this class, you can also include Amazon-specific extras to better integrate with Fire TV.

* TOC
{:toc}

## Creating Recommendations

Amazon's recommendations use the standard Android `ContentRecommendation.Builder` API. For full details, see the Android documentation on [Recommending TV Content](https://developer.android.com/training/tv/discovery/recommendations.html) and the [`ContentRecommendation.Builder`](http://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html) class.

In addition what's included in the Android documentation, you can expand the recommendations functionality in your notification objects with [Amazon-specific extras](#amazon-enhancements). These extras help integrate the recommendations into Fire TV in deeper ways.

## Sample Recommendation

Before diving into code examples, let's look at a sample recommendation card. The numbers show several attributes set through the Android API and one attribute set through an Amazon extra.

{% include image.html file="firetv/getting_started/images/firetv_recommendations" type="png" %}

<div class="number_legend" markdown="span">
{% include inline_image.html file="firetv/getting_started/images/firetv_one" type="png" %} [setTitle](http://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setTitle%28java.lang.String%29). Sets the title for the recommendation. (Android API)<br/>
{% include inline_image.html file="firetv/getting_started/images/firetv_two" type="png" %} [setText](http://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setText%28java.lang.String%29). Sets the description for the recommendation. (Android API)<br/>
{% include inline_image.html file="firetv/getting_started/images/firetv_three" type="png" %} [setContentImage](http://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setContentImage%28android.graphics.Bitmap%29). Sets the image used for the recommendation. (Android API)<br/>
{% include inline_image.html file="firetv/getting_started/images/firetv_four" type="png" %} Sets an abbreviated name for your app, which is used in the launch menu. This is set by one of the [Amazon extra fields](#amazon-enhancements): `com.amazon.extra.DISPLAY_NAME", "displayName"`.
</div>

For example, if your app has a long name, such as "World Premier Association Videos for Fire TV," this long title will be truncated in the launch menu. Instead of accepting the default truncation, you can specify the shortened name for your app through the Amazon extras (in this case, the `DISPLAY_NAME`).

The following screenshot shows how the AOL On app customized the text in the launch menu using Amazon `extra` fields.

{% include image.html file="firetv/getting_started/images/aolonexample2" type="png" %}

## Code Example for a Recommendation

{% include note.html content="Before creating recommendations, you must add the [Application Recommendation Support Library for TV](https://developer.android.com/topic/libraries/support-library/packages.html#recommendation) to the `dependencies` block of your app's **build.gradle** file." %}

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
        .setMaturityRating(mMaturityRating) // This method won't have any influence on ratings on Fire TV. Use the com.amazon.extra.MATURITY_RATING setting instead.
        .setRunningTime(contentLength)
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

The Amazon extras are added to the notification object. The values passed to the methods and extras (such as `mText` or `mContext` are assumed to be set elsewhere in the code. (For the sake of space, this part of the code isn't shown.) More information for using the Android recommendations API and Amazon extras are provided in the following sections.

## Recommended Attributes for Android API code {#androidrecommendations}

Follow these guidelines when using the [ContentRecommendation.Builder](https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html) from the Android API. These guidelines will help your recommendations align with the look and feel of Fire TV.

{% include note.html content="Because the descriptions of these standard Android API methods are from the Android documentation, they're set off in italics to distinguish them from any additional notes we have added." %}

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
         <td><code><a href="http://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setTitle(java.lang.String)">setTitle</a>(java.lang.String)</code></td>
         <td><i>Sets the content title for the recommendation.</i><p>The length limit is 125 characters. Additional text is truncated.</p></td>
         <td>Yes</td>
      </tr>
      <tr>
         <td><code><a href="http://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setText(java.lang.String)">setText</a>(java.lang.String)</code></td>
         <td><i>Sets the description text for the recommendation.</i><p>The length limit is 125 characters. Additional text is truncated.</p></td>
         <td>Yes</td>
      </tr>
      <tr>
         <td><code><a href="http://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setContentImage%28android.graphics.Bitmap%29">setContentImage</a>(<a href="http://developer.android.com/reference/android/graphics/Bitmap.html">Bitmap image</a>)</code></td>
         <td><i>Sets the recommendation image.</i><p>Use the following specifications for the large icon image:
            <ul>
               <li>Dimensions: 336px wide x 189px tall</li>
               <li>Aspect ratio: 16:9 </li>
               <li>Title: Embedded within image</li>
               <li>Transparency: No transparency</li>
            </ul>
            <p>Recommendations without images either won't be displayed or will receive a default placeholder instead. Images with an aspect ratio other than 16:9 will be letterboxed. (Letterboxing means black bars will appear along the sides or top to compensate for the empty space.) Images larger than the specified dimensions will be scaled down to fit the space, preserving the 16:9 aspect ratio.</p></p>
         </td>
         <td>Yes</td>
      </tr>
      <tr>
         <td><code><a href="http://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setContentIntentData%28int,%20android.content.Intent,%20int,%20android.os.Bundle%29">setContentIntentData</a>(int intentType, <a href="http://developer.android.com/reference/android/content/Intent.html">Intent</a> intent, int requestCode, <a href="http://developer.android.com/reference/android/os/Bundle.html">Bundle options</a>)</code></td>
         <td><i>Sets the data for the Intent that will be issued when the user clicks on the recommendation. The Intent data fields provided correspond to the fields passed into the PendingIntent factory methods, when creating a new PendingIntent. The actual <a href="http://developer.android.com/reference/android/app/PendingIntent.html"><code>PendingIntent</code></a> object will only be created at the time a recommendation is posted to the Home Screen.</i>
         </td>
         <td>Yes</td>
      </tr>
      <tr>
         <td><code><a href="https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setBadgeIcon(int)">setBadgeIcon</a>(int iconResourceId)</code></td>
         <td><i>Sets the resource ID for the recommendation badging icon. The resource id represents the icon resource in the source application package. If not set, or an invalid resource ID is specified, the application icon retrieved from its package will be used by default.</i>
         </td>
         <td>Yes</td>
         </tr>
      <tr>
         <td><code><a href="https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setGenres(java.lang.String[])">setGenres</a>(String[] <a href="https://developer.android.com/reference/android/media/tv/TvContract.Programs.Genres.html">genres</a>)</code> </td>
         <td><i>Sets the content genres for the recommendation. These genres may be used for content ranking. Genres are open ended String tags. Some examples: 'comedy', 'action', 'dance', 'electronica', 'racing', etc."</i><p>Use the standard Android genres.</p></td>
         <td>No</td>
      </tr>
      <tr>
         <td><code><a href="https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setContentTypes(java.lang.String[])">setContentTypes</a>(String[] types)</code> </td>
         <td><i>Sets the content types associated with the content recommendation. The first tag entry will be considered the primary type for the content and will be used for ranking purposes. Other secondary type tags may be provided, if applicable, and may be used for filtering purposes.</i><p>Only standard Android <a href="https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.html#CONTENT_TYPE_APP">content recommendation categories</a> are allowed.</p></td>
         <td>No</td>
      </tr>
      <tr>
         <td><code><a href="https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setProgress(int, int)">setProgress</a>(int max, int progress)</code> </td>
         <td><i>Sets the progress information for the content pointed to by the recommendation.</i><p>The progress amount for the content must be in the range (0 - max). The unit is seconds.</p></td>
         <td>No</td>
      </tr>
      <tr>
         <td><code><a href="https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setBackgroundImageUri%28java.lang.String%29">setBackgroundImageUri</a>(String imageUri)</code> </td>
         <td><i>Sets the Content URI that will be used to retrieve the background image for the recommendation.</i><p>A 960px wide x 540px tall image (aspect ratio 16:9) is required. <b>Note: Recommendations with an aspect ratio other than 16:9 will be dropped. Larger images will be scaled down to fit the space, but note that the image size cannot be taller than 1080px or wider than 1920px.</b></p></td>
         <td>Yes</td>
      </tr>
      <tr>
         <td><code><a href="https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setRunningTime(long)">setRunningTime</a>(long length)</code> </td>
         <td><i>Sets the running time (when applicable) for the content.</i></td>
         <td>Yes</td>
      </tr>
   </tbody>
</table>

## Amazon Enhancements to Recommendations {#amazon-enhancements}

The following table lists extras that you can add to your notification objects.

{% include content/{{site.language}}/fire/amazon-recommendations-enhancements.md %}

## Configuring the Manifest

To send recommendations when the device boots up, your app must have the `RECEIVE_BOOT_COMPLETED` permission. This permission lets your app receive and handle the broadcast that tells the app  your device was booted.

To receive the broadcast, add the following permission (to your Android Manifest) as a child of the `<manifest>` element:

```xml
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
```

The initial launch point for supporting recommendations is to create a subclass of `BroadcastReceiver`. In the manifest, register the receiver as handling the `ACTION_BOOT_COMPLETED` intent. When the system first boots up, all applications that are interested will get an initial 'ping' to generate their recommendations. For more details, see this [How to Start an Application at Device Bootup in Android](http://stacktips.com/tutorials/android/how-to-start-an-application-at-device-bootup-in-android) tutorial on Stacktips.com.

For the broadcast to work reliably, make sure your app is not installed on external storage.  Refer to the following for more details about storage locations:

* [Specifying Your App's Installation Location][specifying-installation-location]
* [App install location](http://developer.android.com/guide/topics/data/install-location.html#ShouldNot)
* [android:installLocation manifest attribute](http://developer.android.com/guide/topics/manifest/manifest-element.html#install)

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


{% include links.html %}
