---
title: Update Your Live App (Channel Creator)
permalink: channel-creator-update-your-live-app.html
sidebar: channelcreator
product: Channel Creator
toc-style: kramdown
github: true
---


: Your app's content (videos, titles, descriptions, navigation bar sections/categories) will dynamically update (each time the app starts) based on updates to your YouTube channel or MRSS feed. However, to update your app descriptions and metadata (used to promote your app in the Amazon Appstore), which you completed during [the submission process][channel-creator-submit-your-app], you will need to make edits in Channel Creator and submit your app again. The new version will need to be approved.


- updates go one way. don't update your app from within the Dev Console... if you do, the assets or stuff you update in dev console doesn't propogate back into CC.
- any changes require a resubmission.
- themes are saved on server, can update theme without resubmitting your app
- change your content on youtube and your app will reflect that. you app doesn't pull in the videos or assets. it reads your channel in real time and pulls in the content dynamically. even changes to theme can be updated on the fly.
- don't manage your app from the dev portal. don't cancel it from there. do everythign from CC.
- how do you change existing things

if you just change the style, make changes, then click Save. Then Finish. Then Make Changes Live. No need to resubmit.

## Update the Appearance of Your Live App

You can update the appearance of your app without resubmitting it. The theme files are stored on the Channel Creator site. You can save your changes into different themes.

1.  Click **Manage Channels** in the top navigation bar.
2.  Click **Edit** next to your app.
3.  Make your changes, and then click **Save** if you're done but not entirely finished.
4.  When you're finished with your changes, click **Finish**. You're returned to the Manage Channels view and see a message indicating that you've modified your project and can now make your changes live.

    {% include image.html  file="firetv/channelcreator/images/channel-creator-make-changes-live" type="png" alt="Make your changes live" %}

5.  Click **Make Changes Live** button, and then click the same button on the confirmation dialog box.

Your changes will be live immediately (and viewable when you re-launch your app).

## Update App Metadata

If you have updates to your app name, description, or other details outside of appearance, you'll need to resubmit your app before the changes go live.

1.  Click **Manage Channels** in the top navigation bar.
2.  Click **Edit** next to your app. Channel Creator shows a preview of your app.
3.  Click **Finish**.
4.  Click **Submit**. You see a message that says, "Please wait while we generate assets required for submission to the Amazon Appstore. This should take under a minute. This page will redirect on completion."
5.  Click **Submit Now**, then click **Yes** to confirm.

## See Updates to Your App

After you make changes to your YouTube channel, your app will automatically reflect the changes when you restart your app, since the app pulls its data dynamically from your YouTube channel each time it loads.

If the changes aren't appearing in your app, you can try clearing your app's cache and data:

1.  On Fire TV, go to **Settings > Applications > Manage Installed Applications** and click your app.
2.  Select **Clear data** (twice) and also **Clear cache**.
3.  Relaunch your app.


## Increasing Visibility for Your App

Getting your app into the Appstore is just the first step. For your app to be successful, you'll need to promote your app as much as possible. The [Amazon Developer blog](https://developer.amazon.com/blogs) often publishes tips on marketing. See the following posts:

* [8 Tips for Marketing Your App on the Amazon Appstore](http://dev.amazonappservices.com/rs/070-JMM-398/images/8%20Tips%20for%20Marketing%20your%20App.pdf)
* [Make Money with Promotions That Work: Webinar March 30th](https://developer.amazon.com/blogs/appstore/post/0c0600a6-0bac-4b9c-89bc-69c8a973a748/make-money-with-promotions-that-work-webinar-march-30th) (Register to view it, and you will get a link to the recording in an email. Click the link and sign in to view the recording.)
* [How to Get Featured on Amazon Appstore](https://developer.amazon.com/blogs/appstore/post/03bd237c-9daf-4c48-97ac-933a36b7e095/how-to-get-featured-on-amazon-appstore)
* [App Store Optimization: From Keywords to Reviews](https://developer.amazon.com/blogs/appstore/post/a1110518-e330-4ed6-89f4-c829824097a0/app-store-optimization-from-keywords-to-reviews)
* [Marketing Your App](https://developer.amazon.com/marketing-your-app)
* [Advertise your App](https://developer.amazon.com/advertise-your-app)

{% include tip.html content="If you haven't implemented [recommendations][fire-app-builder-recommendations-overview], be sure to do so. Sending recommendations to the \"Recommended By Your Apps Row\" can get your content on the user's home screen so they are more likely to engage with your app." %}


## Delete Your App

You cannot delete apps from the Appstore. You can only suppress them. This is essentially the same as deleting them, except that you will still see suppressed apps in your Developer Portal Dashboard.

{% include links.html %}
