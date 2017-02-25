---
title: Send Recommendations that Include Amazon Extras
permalink: fire-tv-recommendations-send-recommendations.html
sidebar: firetv
product: Fire TV
reviewers: Murtaza
toc: false
github: true
---

You create recommendations by creating `ContentRecommendation` objects through the `ContentRecommendation.Builder()` class. In addition to the attributes in this class, you can also include Amazon-specific extras to better integrate with Fire TV.

* TOC
{:toc}


## Documentation for Creating Recommendations

Amazon's recommendations use the standard Android `ContentRecommendation.Builder` API. For full details, see the Android documentation on [Recommending TV Content](https://developer.android.com/training/tv/discovery/recommendations.html) and the [`ContentRecommendation.Builder`](http://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html) class.

In addition what's included in the Android documentation, you can expand the recommendations functionality in your notification objects with [Amazon-specific extras](../fire-tv-recommendations-send-recommendations.md#amazon_enhancements). These extras help integrate the recommendations into Fire TV in deeper ways.

The documentation here shows how to include Amazon extra into your recommendations code. See the Android documentation for instructions on creating basic recommendations.

## Sample Recommendation

Before diving into code examples, let's look at a sample recommendation card. The numbers show several attributes set through the Android API and one Amazon extra.

{% include image.html file="firetv/getting_started/images/firetv_recommendations-high-level" type="png" %}

<div class="number_legend" markdown="span">
{% include inline_image.html file="firetv/getting_started/images/firetv_one" type="png" %} [setTitle][setTitle]. Sets the title for the recommendation. (Android API)<br/>
{% include inline_image.html file="firetv/getting_started/images/firetv_two" type="png" %} [setText][setText]. Sets the description for the recommendation. (Android API)<br/>
{% include inline_image.html file="firetv/getting_started/images/firetv_three" type="png" %} [setContentImage][setContentImage]. Sets the image used for the recommendation. (Android API)<br/>
{% include inline_image.html file="firetv/getting_started/images/firetv_four" type="png" %} Sets an abbreviated name for your app, which is used in the launch menu. This is set by one of the Amazon `extra` fields: `com.amazon.extra.DISPLAY_NAME", "displayName"`.
</div>

For example, if your app has a long name, such as "World Premier Association Videos," this long title will be truncated in the launch menu. Instead of accepting the default truncation, you can specify the shortened name for your app through the Amazon extras (in this case, the `DISPLAY_NAME`).

## Code Example for a Recommendation

{% include note.html content="Before creating recommendations, you must add the [Application Recommendation Support Library for TV][1] to the `dependencies` block of your app's **build.gradle** file." %}

The following code shows how to create a `ContentRecommendation` object and `getNotificationObject` that includes Amazon extras:

```java
mNotificationManager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
//Sets an ID for the notification, so it can be updated
int notifyID = int_value;

ContentRecommendation rec = new ContentRecommendation.Builder()
        .setContentImage(myBitmap)//From API 23 this method also accepts Icon as argument.
        .setBackgroundImageUri(myBackgroundImageUri)
        .setContentIntentData(ContentRecommendation.INTENT_TYPE_..., mIntent, mRequestCode, mBundle)
        .setText(mText)
        .setTitle(mTitle)
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
notification.extras.putstring("com.amazon.extra.MATURITY_RATING", mMaturityRating);

//Specifies how recommendations from one app is ordered.
notification.extras.putInt("com.amazon.extra.RANK", mRank);

//Assign a long description to this recommendation
notification.extras.putString("com.amazon.extra.LONG_DESCRIPTION", mLongDescription);

//Assign a recommendation type to this recommendation
notification.extras.putString("com.amazon.extra.RECOMMENDATION_TYPE", mRecommendationType);

//Assign a last watched time to this recommendation
notification.extras.putLong("com.amazon.extra.LAST_WATCHED_DATETIME", mLastWatchedTime);

//Assign a preview video or image URL of this recommendation
notification.extras.putString("com.amazon.extra.PREVIEW_URL", mPreviewUrl);

mNotificationManager.notify(notifyID, notification);
```

The Amazon extras are added to the notification object. More information for using the Android recommendations API and Amazon extras are provided in the following sections.

{% comment %} where are each of these variables defined? Where is LONG_DESCRIPTION in the table of Amazon extras? Also missing from the table: RECOMMENDATION_TYPE,LAST_WATCHED_DATETIME, and PREVIEW_URL.  need to add ACTIONS in the code example and others that aren't included in the table.. {% endcomment %}

## Recommended Attributes for Android API code {#androidrecommendations}

Follow these guidelines when using the [ContentRecommendation.Builder](https://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html) from the Android API. These guidelines will help your recommendations align with the look and feel of Fire TV.

<table class="grid">
   <colgroup>
      <col width="30%" />
      <col width="50%" />
      <col width="10%" />
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
          <td>No</td>
      </tr>
      <tr>
          <td><a href="http://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setContentImage%28android.graphics.Bitmap%29"><code>setContentImage</code></a>(<a href="http://developer.android.com/reference/android/graphics/Bitmap.html">Bitmap image</a>)</td>
          <td>Use the following specifications for the large icon image:
              <ul>
              <li>Height: 252px</li>
              <li>Aspect ratio: 16:9 </li>
              <li>Title: Embedded within image</li>
              <li>Transparency: No transparency</li>
            </ul>
              <p>Recommendations without images either won't be displayed or will receive a default placeholder instead. Recommendations with an aspect ratio other than 16:9 will be letterboxed. (Letterboxing means black bars will appear along the sides or top to compensate for the empty space.)
</p>
              </td>
          <td>Yes</td>
      </tr>
      <tr>
          <td><a href="http://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setContentIntentData%28int,%20android.content.Intent,%20int,%20android.os.Bundle%29"><code>setContentIntentData</code></a>(int intentType, <a href="http://developer.android.com/reference/android/content/Intent.html">Intent</a> intent, int requestCode, <a href="http://developer.android.com/reference/android/os/Bundle.html">Bundle options</a>)</td>
          <td>Sets the data for the Intent that will be issued when the user clicks the recommendation. This pending intent deep links to the recommended content. When launched, the content plays.
              <p>The Intent data fields correspond to the fields passed into the <code>PendingIntent</code> factory methods. The actual <a href="http://developer.android.com/reference/android/app/PendingIntent.html">PendingIntent</a> object will  be created only at the time a recommendation is posted to the Fire TV Home screen.</p></td>
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
           <td>No</td>
       </tr>
</tbody>
</table>

## Amazon Enhancements to Recommendations {#amazon-enhancements}

The following table lists extras that you can add to your notification objects.

<table class="grid">
   <colgroup>
      <col width="40%" />
      <col width="10%" />
      <col width="50%" />
   </colgroup>
   <thead>
      <tr>
         <th>Extra name</th>
         <th>Data type</th>
         <th>Details</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td><code>com.amazon.extra.DISPLAY_NAME</code></td>
         <td>String</td>
         <td>A shorter app name displayed in the Launch menu (#4 in the earlier screenshot with annotations). The length limit is 15 characters. Additional characters are truncated.</td>
      </tr>
      <tr>
         <td><code>com.amazon.extra.MATURITY_RATING</code></td>
         <td>String</td>
         <td>Used by the Parental Control settings on Fire TV to determine if content playback needs to be behind a PIN. Any recommendation without this extra or without <code>setMaturityRating()</code> will be treated as Mature content and may require a PIN subject to the Parental Control settings on the device.
            <p>Currently, supported values are as follows:</p>
            <ul>
            <li><b>US Marketplace:</b> <code>G</code>, <code>PG</code>, <code>PG13</code>, <code>R</code>, <code>NC17</code>, <code>NR</code>, <code>TVY</code>, <code>TVY7</code>, <code>TVG</code>, <code>TVPG</code>, <code>TV14</code>, <code>TVMA</code></li>
            <li><b>German Marketplace:</b> <code>FSK0</code>, <code>FSK6</code>, <code>FSK12</code>, <code>FSK16</code>, <code>FSK18</code></li>
            <li><b>Great Britain Marketplace:</b> <code>BBFCPG</code>, <code>BBFC12</code>, <code>BBFC18</code>, <code>BBFCU</code></li>
            <li><b>Japan Marketplace:</b> <code>EIRIN_G</code>, <code>EIRIN_PG12</code>, <code>EIRIN_R15</code>, <code>EIRIN_18</code></li>
            </ul>
            </td>
      </tr>
      <tr>
               <td><code>com.amazon.extra.RANK</code></td>
               <td>int</td>
               <td>Specifies the application's preferred ordering of recommendations. Fire TV's selection algorithm selects recommendations with lower rank numbers more often than higher numbers. Note that there is no guarantee for the sort order of recommendations displayed from different apps.</td>
            </tr>
            <tr>
               <td><code>com.amazon.extra.ACTIONS</code></td>
               <td><code>ArrayList&lt;int&gt;</code></td>
               <td>Helps determine the context menu options displayed for each recommendation. Note that two context menu actions are supported, but only the first action is configurable.<p>When users click a recommendation tile or its first context menu option, Fire TV uses the corresponding content intent data passed with recommendation to launch the app.</p>
                <p>Possible values to include are as follows:</p>
                   <ul>
                   <li><code>1</code>: Watch with <code>&lt;App name&gt;</code></li>
                   <li><code>101</code>: Watch</li>
                   <li><code>2</code>: Resume with <code>&lt;App name&gt;</code></li>
                   <li><code>102</code>: Resume</li>
                   <li><code>3</code>: Switch <code>&lt;App name&gt;</code> Profile</li>
                   <li><code>4</code>: Change <code>&lt;App name&gt;</code> Settings</li>
                   <li><code>104</code>: Change Settings</li>
                   <li><code>5</code>: View with <code>&lt;App name&gt;</code></li>
                   <li><code>105</code>: View</li>
                   <li><code>6</code>: Play with <code>&lt;App name&gt;</code></li>
                   <li><code>106</code>: Play</li>
                   <li><code>7</code>: Listen with <code>&lt;App name&gt;</code></li>
                   <li><code>107</code>: Listen</li>
                   </ul>
                   <p>If no value is provided, the default action will be <code>Open</code>.</p>
              </td>
            </tr>
      <tr>
         <td><code>com.amazon.extra.LIVE_CONTENT</code></td>
         <td>int</td>
         <td>Helps determine whether a recommendation is live content and needs to be displayed or hidden based on <code>CONTENT_START_TIME</code> and <code>CONTENT_END_TIME</code>. Supported values are as follows:
             <ul>
             <li><code>0</code>: Not a Live content</li>
             <li><code>1</code>: Live Content</li>
            </ul>
          </td>
      </tr>
      <tr>
         <td><code>com.amazon.extra.CONTENT_RELEASE_DATE</code></td>
         <td>String</td>
         <td>Content release year. Example: 2016, 2015, 1977 etc.{% comment %}why does this matter? does it factor into the selection algorithm?{% endcomment %} </td>
      </tr>
      <tr>
         <td><code>com.amazon.extra.CONTENT_CAPTION_AVAILABILITY</code></td>
         <td>String</td>
         <td>Caption availability of content.
             <ul>
             <li><b>0</b>: Caption not available for content</li>
             <li><b>1</b>: Caption available for content</li>
             </ul>
             </td> {% comment %} why does this matter for recommendations? {% endcomment %}
      </tr>
      <tr>
         <td><code>com.amazon.extra.IMDB_ID</code></td>
         <td>String</td>
         <td>IMDB ID of content.</td>
      </tr>
      <tr>
         <td><code>com.amazon.extra.CONTENT_START_TIME</code></td>
         <td>long</td>
         <td>Start time in milliseconds (EPOCH).{% comment %} start time of what? is this for live content? {% endcomment %}</td>
      </tr>
      <tr>
         <td><code>com.amazon.extra.CONTENT_END_TIME</code></td>
         <td>long</td>
         <td>End time in milliseconds (EPOCH).{% comment %} start time of what? is this for live content? {% endcomment %}</td>
      </tr>
      <tr>
         <td><code>com.amazon.extra.TEXT_EMBEDDED_IMAGE</code></td>
         <td>int</td>
         <td>Whether recommendation image has text embedded on it.
             <ul>
             <li>0: Text not embedded</li>
             <li>1: Text embedded</li>
        </ul>{% comment %} what does FTV do differently depending on this value?{% endcomment %}
        </td>
      </tr>
   </tbody>
</table>

## Configuring the Manifest

To send recommendations when the device boots up, your app must have the `RECEIVE_BOOT_COMPLETED` permission. This permission lets your app receive and handle the broadcast that tells the app  your device was booted.

To receive the broadcast, add the following permission (to your Android Manifest) as a child of the `<manifest>` element:

```xml
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
```

The initial launch point for supporting recommendations is to create a subclass of `BroadcastReceiver`. In the manifest, register the receiver as handling the `ACTION_BOOT_COMPLETED` intent. When the system first boots up, all applications that are interested will get an initial 'ping' to generate their recommendations.

{% comment %} i feel like more information needs to be included here. is there code you have to write? what exactly do you have to do? or is this just a higher level summary of something?{% endcomment %}

For the broadcast to work reliably, make sure your app is not installed on external storage.  Refer to the following for more details about storage locations:

* [Specifying Your App's Installation Location][specifying-installation-location]
* [App install location][2]
* [android:installLocation manifest attribute][3]

## Delete Recommendations

As a best practice, remove recommendations after users watch the recommended content. You can call [cancel()](http://developer.android.com/reference/android/app/NotificationManager.html#cancel%28int%29) for a specific notification ID to delete the recommendation.

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

[setTitle]: [setTitle](http://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setTitle%28java.lang.String%29)
[setText]: [setText](http://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setText%28java.lang.String%29)
[setContentImage]: [setContentImage](http://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.Builder.html#setContentImage%28android.graphics.Bitmap%29)


{% include links.html %}
