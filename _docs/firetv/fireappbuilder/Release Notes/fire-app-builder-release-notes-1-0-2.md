---
title: Version 1.0.2 Release Notes
permalink: fire-app-builder-release-notes-version-1-0-2.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

Version 1.0.2 was released on April 2, 2017.

* TOC
{:toc}

## New Features

### Recommendations integration

Fire TV recently [announced support for recommendations][fire-tv-recommendations-overview]. With recommendations, you can send recommended videos to a row on the Fire TV home screen called "Recommended By Your Apps." Fire App Builder incorporates the logic to send recommendations by matching recommendations elements in your feed. You can send a list of global recommendations when your app starts, or individual recommendations when a user plays a specific video. For details, see [Recommendations in Fire App Builder Overview][fire-app-builder-recommendations-overview].

### Customization of the app's appearance

You can customize the appearance of the Fire TV by setting values in your app's custom.xml file. In this release, the elements for customization have been both enhanced and simplified. CSS3 is used instead of images for most gradients and backgrounds. Elements are grouped into primary, secondary, and tertiary styles to thematically alter groups of elements at the same time. Additional elements for adjusting the media playback, splash screen, search button, and homepage have been enhanced. For details, see [Customize the Look and Feel of Your App][fire-app-builder-customize-look-and-feel].

### Additional events tracked in analytics

The number of events tracked in analytics has been expanded. For Flurry Analytics, newly tracked elements include logEvent, endTimedEvent, and ad APIs. For Google Analytics, newly tracked events include setAction, setCustomDimension, and setCustomMetric. For Omniture,  trackAction, open, play, stop, and close are now tracked. These additional elements give you more robust data about your app's usage.

### Custom analytics tags

You can customize the tag names that appear in your analytics. Rather than using the pre-packaged analytics names within Fire App Builder, you can choose names that might be friendlier and more meaningful to you. See the "Customize the Tag Names" section the [Crashlytics Component][fire-app-builder-crashlytics-component#customtagnames], [Flurry Analytics Component][fire-app-builder-flurry-analytics-component#customtagnames], or [Omniture Analytics Component][fire-app-builder-omniture-analytics-component#customtagnames] topics. If you're customizing analytics tags in Google, see [Google Analytics Component][fire-app-builder-google-analytics-component].

### Additional feed attributes not used in UI can be tracked

If you have a feed attribute that you want to track through analytics, but this attribute isn't used in any existing Fire App Builder tags, you can still include this attribute in your analytics. See [Track Feed Attributes That Aren't Used in Fire App Builder][fire-app-builder-track-additional-attributes].

### Sample XML feed included

A sample XML feed is included for building out feeds that conform to MRSS standards. If you already use an XML feed for iTunes or another service that standardizes on MRSS, you can easily set up your app by following the pattern shown in the sample app. See [Configure a Media RSS (MRSS) Feed][fire-app-builder-configure-mrss-feed].

### PassThroughLogin component added

Fire App Builder requires you to use at least one authorization component. Previously, if you didn't want to use any authorization component, you used the Facebook Authorization component but just didn't configure any settings. A dummy component called PassThroughLogin has been added. If you don't require any authorization in your app, you can use the PassThroughLogin component instead of Facebook Auth to satisfy the authorization component requirement.

### Show logged-in provider on home screen with AdobePass

When a user logs in to a provider through Adobe Pass, you can show the provider logo on the screen of the app. You do this by supplying an MVPD URL that contains the MVPD (multichannel video programming distributor) along with the MVPD’s logo. See [Show the Content Provider Logo to Users][fire-app-builder-adobe-pass-auth-component#loggedinprovider] in the Adobe Pass Authorization Component topic.


### "Login" button toggles to "Log In" or "Log Out" depending on session

The Logout button is now aware of the user's session. If user is not logged in, the Login button says "Log in." If user is logged in, it says "Log out."

### Recommended Content now called Related Content

Related video content (which uses tags in your feed to surface a group of related videos) appears below each video when users watch media. Previously, this section was called "Recommended Content." To avoid confusion with video titles promoted by recommendations, this section is now called "Related Content." (Note that videos in Recommendations and videos in Related Content are not connected.)

## Bug Fixes

*  **Pausing live content works for more than 1 video.** When users who are watching live content videos pause the video, a button appears that says "Resume." Previously, the Resume button would appear for the most recently watched live content video only. Now the Resume button can appear for any number of live content videos the user may have paused.

* **Crashes show "Service is unavailable" instead of crashing.** If the app fails to load and parse your feed (because an empty data object was served to the parser), instead of just crashing because the feed link returned no data, the app displays a screen that says "Service is unavailable. Please try again later."

* **Old search icon removed from alt home screen**. In the `FullContentBrowseActivity` (the home screen providing a more compressed layout), the wrong search icon was showing up behind the search widget. This old icon has been removed.

* **Videoid in content model now treated as string**. In the content model, the video ID element is now treated as a string rather than an integer. (When you upgrade your app, you may need to uninstall your existing app to just clean your data to refresh for this update.)

Other fixes were also made but are not significant enough to list here.

## Known Issues {#known_issues}

(Note: These are the same known issues from [version 1.0.0][fire-app-builder-release-notes-version-1-0-0].)

*  *Related Content*. Related content matches (which are based on tags in the feed) will match unlimited content if many items have the same tags. (The content matches should have an item limit.)
*  *In-App Purchasing Component.* With the [In-App Purchasing Component][fire-app-builder-amazon-in-app-purchase-component], purchases made on other devices won't be acknowledged in the app until a user either restarts the app or attempts to play the content. (The app should refresh purchased items when the state goes to the background.)
*  *Splash screen.* Loading the feed initially can take some time on splash screen. (The initial load time should be faster.)


{% include links.html %}
