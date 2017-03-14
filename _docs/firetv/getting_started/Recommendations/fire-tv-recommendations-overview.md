---
title: Recommendations Overview
permalink: fire-tv-recommendations-overview.html
sidebar: firetv
product: Fire TV
reviewers: Murtaza
toc-style: kramdown
github: true
---

{% include note.html content="Recommendations from 3rd-party apps is a feature in development and only supported by Fire TV Gen 2 and Fire TV Stick Gen 2 devices. The recommendations functionality will roll out to all devices in a future release. You can prepare for the release by incorporating recommendations into your app now." %}

You can send recommendations to users about the content (movies, shows, music, games) you want them to watch. Recommendations appear on a "Recommended By Your Apps" row on the Fire TV home screen.

Recommendations encourage users to engage with your app. By appearing on the Fire TV home screen, recommendations are visible within the user's regular view. The recommendation cards entice users back into your app with minimal effort.

For more information about recommendations, see [Recommending TV Content](https://developer.android.com/training/tv/discovery/recommendations.html) in the Android documentation. The [Android TV Leanback Support Library app](https://github.com/googlesamples/androidtv-Leanback) also contains sample code for sending recommendations.

* TOC
{:toc}

## Where Recommendations Appear

On the Fire TV home screen, the "Recommended By Your Apps" row shows all recommendations from apps the user has currently installed (and opened at least once).

All recommendations from third-party apps appear as visually attractive cards in this row. You control the look and appearance of the recommendation cards.

{% include image.html file="firetv/getting_started/images/recommendations-demo-screen" type="png" %}

Recommendations are sorted by a selection algorithm provided by Fire TV. The row refreshes regularly.

## How the Recommendations Row Works

If you select a recommendation and then click the **Menu** button on your remote, a launch menu appears in the lower-right corner. The menu shows different viewing options.

{% include image.html file="firetv/getting_started/images/recommendations-watchnow" type="png" %}
The text shown in the launch menu &mdash; \"Open\" &mdash; might differ across recommendations. Depending on the string set by the app, a recommendation can show any of the following strings:

*  Watch
*  Resume
*  Switch Profile
*  Change Settings
*  View
*  Play
*  Listen
*  Open

If a user selects "Open TED TV" instead of "Watch," the TED TV app will launch (instead of the selected content). Selecting this option is the same as launching an app the normal way on Fire TV.

Additionally, you can control your app's name in this launch menu by setting the value for `DISPLAY_NAME`, which is an [Amazon extra][fire-tv-recommendations-send-recommendations#amazon-enhancements] in your recommendation.

## Recommendations Attributes

The following image shows the various attributes of the recommendations row.

{% include image.html file="firetv/getting_started/images/firetv_recommendations" type="png" %}

The attributes are as follows:

<div class="number_legend">

{% include inline_image.html file="firetv/getting_started/images/firetv_one" type="png" %} Title of recommendation provided by the app <br/>
{% include inline_image.html file="firetv/getting_started/images/firetv_two" type="png" %} Name of the app that sent the recommendation <br/>
{% include inline_image.html file="firetv/getting_started/images/firetv_three" type="png" %} Description of the recommendation provided by the app <br/>
{% include inline_image.html file="firetv/getting_started/images/firetv_four" type="png" %} Image of the recommendation provided by the app <br/>
{% include inline_image.html file="firetv/getting_started/images/firetv_five" type="png" %} Operations available for the recommended media. (Press the <b>Menu</b> button on Fire TV remote to bring up this menu.) <br/>
</div>


## Requirements for Recommendations to Appear

The following two requirements must be met for recommendations to appear:

* There must be at least 5 recommendations in total sent from all apps.
* The user can't have any viewing restrictions set under Settings > Preferences > Parental Controls.

Note that Android limits the number of notifications to 50. This limit includes both [standard notifications][notifications-for-amazon-fire-tv] and recommendations combined.

## What to Recommend

Recommendations should show content that is **relevant** to the user. For example, recommendations might present the following:

* New episodes for shows the user watched earlier
* Similar shows related to the user's viewing history
* Encouragement to resume watching a show the user didn't finish

You will need to create the logic that determines which recommendations are shown to which users.

Make sure the content you recommend is appropriate for the audience. See [Best Practices for Recommendations][fire-tv-recommendations-best-practices] for more details.

## Send Recommendations

You can send recommendations by following the approach described in the Android documentation. See these Android topics:

* [Recommending TV Content][2]
* [ContentRecommendation][3]

In general, you build a service that looks at your app's content and suggests recommendations. You send the recommendations as notification objects, tagged with a [recommendation category][1] and configured with the values you want. You also register the service with your app's manifest.

When you define the recommendations, you set the foreground and background image, color, app icon, title, subtitle, and more. See [Recommendation Row][5] in Google's Android TV for more design and UX details with recommendations.

You can group your recommendations using the [NotificationCompat.Builder.setGroup()][4] method.

For more details on creating recommendations, see [Send Recommendations that Include Amazon Extras][fire-tv-recommendations-send-recommendations].

## Amazon's Extensions to Android Recommendations

Amazon [extends the Android recommendations API][fire-tv-recommendations-send-recommendations#amazon-enhancements] to provide deeper integration with Fire TV. Note that using Amazon's extras is optional. If you don't use the extras, your recommendations will still work on Fire TV. However, you will lose out on some FireTV-specific features.

The Amazon extensions won't affect the display of your recommendations on other Android TV platforms.

## Questions

Can I view metrics to see clicks on recommendations from the Fire TV home screen?
:  You can add an extra to the pending intent. This will allow you to capture the origin of where the link was clicked.

Can users turn recommendations off?
:  No. Although users can turn notifications off for specific apps, they cannot turn recommendations off.

For more background reading on recommendations, see [Android TV Recommendations: What's in it for my app or game?][6] from NVIDIA.

## Next steps

To learn more, see the following:

* [Test Your Recommendations][fire-tv-recommendations-testing]
* [Send Recommendations that Include Amazon Extras][fire-tv-recommendations-send-recommendations]
* [Best Practices for Recommendations][fire-tv-recommendations-send-recommendations]


[1]: https://developer.android.com/reference/android/app/Notification.html#CATEGORY_RECOMMENDATION
[2]: https://developer.android.com/training/tv/discovery/recommendations.html
[3]: http://developer.android.com/reference/android/support/app/recommendation/ContentRecommendation.html
[4]: https://developer.android.com/reference/android/support/v4/app/NotificationCompat.Builder.html#setGroup(java.lang.String)
[5]: https://www.google.com/design/spec-tv/system-overview/recommendation-row.html
[6]: https://developer.nvidia.com/content/android-tv-recommendations

{% include links.html %}
