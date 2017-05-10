---
title: Channel Creator FAQ
permalink: channel-creator-faq.html
sidebar: channelcreator
product: Channel Creator
toc-style: kramdown
github: true
---


Q:  How to adjust the About page in the navigation bar?
: You can't change this page. This page acknowledges the use of YouTube API services and provides links to terms and privacy policies.

Q: Can I charge for my app?
: No, you can't monetize Channel Creator apps. If you need to monetize your app, consider using [Fire App Builder][fire-app-builder-overview].

Q: How do I get the YouTube API key?
: See ["Get the YouTube Developer API Key"][channel-creator-youtube#getdevkey]

Q: Can I modify my app's descriptions, metadata, playlists, and categories *after* ingesting them from YouTube into Channel Creator?
: Your app's content (videos, titles, descriptions, navigation bar sections/categories) will dynamically update (each time the app starts) based on updates to your YouTube channel or MRSS feed. However, to update your app descriptions and metadata (used to promote your app in the Amazon Appstore), which you completed during [the submission process][channel-creator-submit-your-app], you will need to make edits in Channel Creator and submit your app again. The new version will need to be approved. See [Update Your Live App][channel-creator-update-your-live-app] for more details.

Q: Can anyone create an app with my YouTube content?
: Unfortunately, yes. Content creators are asked to verify that they own the content for the app they're submitting. Additionally, during the Appstore submission process, the Appstore ingestion team evaluates apps to determine whether they violate the [Appstore's content policy](https://developer.amazon.com/public/support/submitting-your-app/tech-docs/appstore-content-policy). If the Appstore ingestion team does not fail an app that violates copyright, you can reach out to the Appstore team and submit a request to suppress the app. See the [Contact Us](https://developer.amazon.com/public/support/contact/contact-us) page.

Q: Can we do any kind of A/B testing with our apps?
: No, you can't do A/B testing. But you can [share a preview][channel-creator-create-your-app#previewyourapp] of your app. You can create and save different themes using the [visual editor][channel-creator-create-your-app#styleyourapp]. After getting feedback on one theme, you can update your app to a different theme and share a preview with that theme. But you can't share both simultaneously or let users toggle different themes.

Q: Can I include my own privacy policy?
: You can't add any pages to the navigation bar, but you can include links to your privacy policy in your Appstore descriptions.

Q: Is internationalization supported?
: Yes, see more detail on [localizing your app][channel-creator-localize-your-app]. You can have one app per language per marketplace. Marketplaces where Fire TV is available include United States, Germany, United Kingdom, Japan, Australia, and India.

Q: How can I view metrics around video playback time?
: Metrics are not available for video playback time. If you need more robust metrics, you may be able to get them through your online video host (BrightCove, Ooyala, Kaltura, or thePlatform). Alternatively, you can implement a different app framework such as Fire App Builder that provides various [analytics components][fire-app-builder-interfaces-and-components], or you can use the [Web App Starter Kit for Fire TV][the-web-app-starter-kit-for-fire-tv] and integrate the third-party analytics you want.

Q: How do I change my logo?
: You change the app logo using the [visual editor][channel-creator-create-your-app#styleyourapp]. Click the {% include inline_image.html file="channel-creator-image-upload" type="png" %} in the **Logo** section and upload a 500x500px icon. For the sake of consistency, your the logo inside your app should match the same app logo you upload in the image assets section when you [submit your app][channel-creator-submit-your-app], but this consistency isn't enforced.

Q: When will you integrate with "Watch-n-Shop"?
: Currently, Channel Creator is not integrated with Watch-n-Shop.

Q: I have both YouTube and MRSS content. Which should I choose?
: See the pros and cons in ["YouTube versus Media RSS Feeds"][channel-creator-overview#youtube_vs_mrss].

Q: Can you upload your own font?
: No, currently only two "font themes" are supported: Light and Dark. The current fonts ensure readability of the text in your app and are designed to work well with the other Channel Creator elements.

Q: Why do the thumbnail images in the carousel have black bars surrounding the image?
A: The aspect ratio of the thumbnails should be 16:9, which are standard dimensions for TV content. If black bars appear, the dimensions of your thumbnails are incorrect.

Q: How do I promote my app within the Appstore?
A: See the section ["Increasing Visibility for Your App"][channel-creator-update-your-live-app#increasingvisibility]. Much of the promotion of your app depends on your own marketing efforts. While users may find your app by searching for keywords (from the keywords in your app metadata description), or from other descriptions in the Appstore, Fire TV will likely not feature your app in a highly visible way unless your app gains a larger audience and establishes its widespread appeal.

Question:
- black bars appear when pulled from youtube. need detail on the thumbnail size.
- how does an app get featured?


Can you filter YouTube content? Some content is not syndicated. Some content videos are square and will not look good on TV’s.
Can you load more than 1 MRSS feed.
Liked the MRSS mapping.
Will it pick the highest resolution content?
Do we support DFP (DoubleClick for publishers)?
Can we support monetization through ThePlatform? Bright cove?
Do we support HLS (HTTP live streaming)?
What would be success for adoption? How many users to expect?
How many Fire TV devices are there?
Can I see stats on YouTube?
They have some content that they don't have exclusive rights to. Informed them coming feature of ability to block videos.
Do we create the app once and just update the content?
They want to be able to see stats on how app is performing.
Want to see how leads go towards app downloads
Do we allow promotions?
Can we see stats around content use and app use (ex. like urban airship)
How will app be filtered among other apps in app store?
Can I show a different row as primary per user?
For content rating in app submission how do I rate if I have a beer in the video?
Can I change a theme by category?
Is there a way to schedule theme changes?
Can I link outside of app? Can I link to membership or to buy something?
Will content be personalized? If I look at lots of golf content?
What is looked for in the approval process?
Can I block certain videos?
Question: Can you have a different background themes based on the category?
Would like analytics of videos watched. When will that be available?
Interested in ReYA
Can you find our shows in search? Will produce long form content (22 minute shows). Want to have it show up in our catalog.
Would like analytics for performance of video.

Question: How do i set up multiple apps or playlists
Was confused by the number of options from Amazon between Video Direct, Short Video, Fire TV

{% include links.html %}
