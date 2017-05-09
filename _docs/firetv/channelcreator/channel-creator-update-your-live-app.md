---
title: Update Your Live App (Channel Creator)
permalink: channel-creator-update-your-live-app.html
sidebar: channelcreator
product: Channel Creator
toc-style: kramdown
github: true
---

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


## Delete Your App

{% include links.html %}
