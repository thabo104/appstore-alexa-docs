---
title: Best Practices for Recommendations
permalink: fire-tv-recommendations-best-practices.html
sidebar: firetv
product: Fire TV
reviewers: Murtaza
toc-style: kramdown
github: true
---

The following are best practices for creating recommendations.

* TOC
{:toc}

## Understand the difference between recommendations and notifications

Note the difference between [notifications][notifications-for-amazon-fire-tv] and [recommendations][fire-tv-recommendations-overview]:

*  **Recommendations** try to guide users to guide users to content they might enjoy. The recommendations are based on prior the user's history, new content available, or related content.
*  **Notifications** let users know about updates associated with your app. These updates might include new functionality, new levels, new release versions, changes in the app, or new badges earned.

## Personalize the notifications to the user

Recommendations are most effective when you personalize them based on user profiles. The best recommendations look at your users' interests, profile, and recent activity to come up with the recommendation. Personalizing recommendations leads to greater engagement and interest in your app.

## Delete stale cards

Keep your recommendations relevant by deleting old or stale cards. Additionally, avoid creating new instances of cards that are already stale.

Track what content has been shown and visited before so you can delete it later. For example, if the user finishes watching the recommended content, delete it from the recommendation row.

If you continue to send stale recommendations, users might turn off your recommendations or uninstall your app.

## Don't exceed the notifications limit

Android enforces a [maximum limit of 50 notifications][1] for each package. This limit includes both recommendations and [other notifications][notifications-for-amazon-fire-tv] your app sends.

If you exceed 50 notifications, you may see errors such as the following:

```
W/NotificationManager﹕ notify: id corrupted: sent 51, got back 0.
```

Because of this limit, you should cancel older notifications before sending new notifications (if the number exceeds 50).

## Limit the number of recommendations shown at one time

Avoid sending too many recommendations at once. Consider batching recommendations together in smaller groups of 5 at a time.

## Sending recommendation as a background app

Some apps choose to send recommendations as a background process. Note that the background processes can be killed if the system exceeds the available memory.

Consider using trigger points to send recommendations instead. The trigger points could send recommendations using an `AlarmManager` at repeating intervals. The repeating intervals can be expired using an Android `JobSchedule` or `Sync adapter` task.

## Handling back button events

When users press the **Back** button, your app should self-destroy and return to the recommendations row on the Fire TV home screen. (The return point should be where the application was launched when the user clicked a recommendation.)

## Provide free, friendly content

As a best practice, consider sending free content to the recommendations row. After the user opens your app, then you can push more premium/paid content.

Your app should not harass, hard sell, or recommend inappropriate content. Doing so will result in potential blacklisting of your app.


## Next steps

To learn more, see the following:

* [Recommendations Overview][fire-tv-recommendations-overview]
* [Test Your Recommendations][fire-tv-recommendations-testing]
* [Send Recommendations that Include Amazon Extras][fire-tv-recommendations-send-recommendations]

{% include links.html %}

[1]: https://android.googlesource.com/platform/frameworks/base/+/742a67127366c376fdf188ff99ba30b27d3bf90c/services/java/com/android/server/NotificationManagerService.java#71
