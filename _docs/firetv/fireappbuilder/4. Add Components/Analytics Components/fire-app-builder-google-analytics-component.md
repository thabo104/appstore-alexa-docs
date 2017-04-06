---
title: Google Analytics Component
permalink: fire-app-builder-google-analytics-component.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

The Google Analytics Component allows you to gather analytics from your Android app using Google Analytics. You can learn more about the analytics service by going to [Google Analytics](https://developers.google.com/analytics/).

Configuring the component requires you to set up a google-services.json file that you generate from Google Analytics. You then match up dimensions and metrics indexes between Google Analytics and the component in Fire App Builder. You also need to set up custom reports that contain the dimensions and metrics you want.

To configure the Google Analytics Component, complete each of the following sections.

* TOC
{:toc}

## Step 1. Configure the Google Analytics Component {#step1}

1.  Remove any other analytics components that are loaded in your app (such as Crashlytics, FlurryAnalyticsComponent, OmnitureAnalyticsComponent, or LoggerAnalyticsComponent). See [Remove a Component][fire-app-builder-load-a-component#removeacomponent] for details.

    {% include_relative componentnote_analytics.html %}

2.  Load the Google Analytics component into your app. See [Load a Component in Your App][fire-app-builder-load-a-component] for details about how to load a component into your app.

3.  Click the **Sync Gradle button** {% include inline_image.html file="firetv/fireappbuilder/images/fireappbuilder_syncgradlebutton" type="png" %}.

## Step 2. Set Up the google-services.json File {#step2}

Google Analytics packages all of your analytics settings into a google-services.json file. After you generate and download this file, you will place it in the Google Analytics Component folder.

1.  Sign in to your Google account.
2.  On the Google Analytics site, go to [Add Analytics to Your Android App](https://developers.google.com/analytics/devguides/collection/android/v4/).
3.  In the **Get a configuration file** section, click **Get a Configuration File**.
4.  Enter an **App name** and an **Android package name**.
    *  For the App name, type the name of your app.
    *  For the Android package name, use the package name in the Google Analytics Component's AndroidManifest.xml file: **com.amazon.analytics.google**.
5.  Click **Continue to choose and configure services**.

    Although the screen says "Select which Google services you'd like to add to your app below," only Analytics is available for integration.

6.  Click **Continue to generate configuration files**.
7.  Click **Download google-services.json** and download the JSON file.
8.  Move the google-services.json file into your **GoogleAnalyticsComponent** folder. (If you're in the Android view, switch to the Project view to see this file.)

## Step 3. Set Up Dimensions {#step3}

In this step you will set up dimensions in your app that correspond with dimensions that you set up in Google Analytics.

According to [Google Analytics' documentation](https://support.google.com/analytics/answer/1033861?hl=en), "Dimensions are attributes of your data. For example, the dimension City indicates the city, for example, 'Paris' or 'New York', from which a session originates. The dimension Page indicates the URL of a page that is viewed."

**To set up dimensions:**

1.  In your app, expand **GoogleAnalyticsComponent > assets > configurations** and open the **GoogleCustomDimensionsTags.json** file.

    ```json
    {
      "ATTRIBUTE_PLATFORM": "1",
      "ATTRIBUTE_SEARCH_TERM": "2",
      "ATTRIBUTE_ERROR_MSG": "3",
      "ATTRIBUTE_PLAY_SOURCE": "4",
      "ATTRIBUTE_PURCHASE_RESULT": "5",
      "ATTRIBUTE_PURCHASE_SKU": "6",
      "ATTRIBUTE_TITLE": "7",
      "ATTRIBUTE_SUBTITLE": "8",
      "ATTRIBUTE_VIDEO_TYPE": "9",
      "ATTRIBUTE_PURCHASE_TYPE": "10",
      "ATTRIBUTE_PURCHASE_SOURCE": "11",
      "ATTRIBUTE_APP_NAME": "12",
      "ATTRIBUTE_APP_AUTHENTICATION_SOURCE": "13",
      "ATTRIBUTE_LOGIN_FAILURE_REASON": "14",
      "ATTRIBUTE_LOGOUT_FAILURE_REASON": "15",
      "ATTRIBUTE_AIRDATE": "16",
      "ATTRIBUTE_PUBLISHER_NAME": "17",
      "ATTRIBUTE_APP_AUTHENTICATION_STATUS": "18",
      "ATTRIBUTE_VIDEO_ID": "19",
      "ATTRIBUTE_CONTENT_AVAILABLE": "20",
      "ATTRIBUTE_REQUEST_SOURCE": "21"
    }
    ```
2.  Copy the file's contents and create a similarly named file in your app's **assets > configurations** folder. (Any files in your app will overwrite similar files in the component. This will help you apply updates to Fire App Builder later on.)

    You will be creating dimensions in Google Analytics that correspond with the dimensions and indexes here. (You don't need to do anything with the code here just yet. Just leave the file open to adjust later.)

3.  Sign in to your [Google Analytics Dashboard](https://analytics.google.com/).
4.  Click **Admin** in the lower-left corner.
5.  In the **Property** column (the middle column), click **Custom Definitions > Custom Dimensions**.

    {% include image.html file="firetv/fireappbuilder/images/fireappbuilder_custom_dimensions" type="png" %}

6.  Click the **New Custom Dimension** button.

    {% include warning.html content="You can create only 20 dimensions, so you'll omit one from the above list of dimensions. Also, you cannot edit a dimension after you create it, so be careful here. If you make a mistake and need to change things, you may need to sign in with a different Google account." %}

7.  Type a friendly name for the first dimension. For example, type "Platform" instead of "ATTRIBUTE_PLATFORM".
8.  Leave the **Scope** as **Hit** (the default).
9.  Leave **Active** check box selected.
10. Click **Create**.

    {% include image.html file="firetv/fireappbuilder/images/fireappbuilder_google_dimensions" type="png" %}

11. Click **Done**.
12. Repeat this process until you have created a custom dimension for all of the dimensions you want to track (up to 20).

    {% include note.html content="The names here (for example, \"Platform\") do not need to match up with the names in the `GoogleCustomDimensionsTags.json` file (for example, \"ATTRIBUTE_PLATFORM\"). Google will match up the dimensions based on the index values." %}

13. In the **GoogleCustomDimensionsTags.json** file (inside your app's **assets > configurations** folder), change the index numbers to correspond with the auto-created dimension index numbers (the column is highlighted in yellow in the screenshot below) in your Google Analytics Dashboard.

    {% include image.html file="firetv/fireappbuilder/images/fireappbuilder_index_values" type="png" %}

    (Since you can't customize the index values in Google Analytics, you have to make the index values in the component match up with the index values Google creates.)

    ```json
    {
      "ATTRIBUTE_PLATFORM": "1",
      "ATTRIBUTE_SEARCH_TERM": "2",
      "ATTRIBUTE_ERROR_MSG": "3",
      "ATTRIBUTE_PLAY_SOURCE": "4",
      "ATTRIBUTE_PURCHASE_RESULT": "5",
      "ATTRIBUTE_PURCHASE_SKU": "6",
      "ATTRIBUTE_TITLE": "7",
      "ATTRIBUTE_SUBTITLE": "8",
      "ATTRIBUTE_VIDEO_TYPE": "9",
      "ATTRIBUTE_PURCHASE_TYPE": "10",
      "ATTRIBUTE_PURCHASE_SOURCE": "11",
      "ATTRIBUTE_APP_NAME": "12",
      "ATTRIBUTE_APP_AUTHENTICATION_SOURCE": "13",
      "ATTRIBUTE_LOGIN_FAILURE_REASON": "14",
      "ATTRIBUTE_LOGOUT_FAILURE_REASON": "15",
      "ATTRIBUTE_AIRDATE": "16",
      "ATTRIBUTE_PUBLISHER_NAME": "17",
      "ATTRIBUTE_APP_AUTHENTICATION_STATUS": "18",
      "ATTRIBUTE_VIDEO_ID": "19",
      "ATTRIBUTE_CONTENT_AVAILABLE": "20"
    }
    ```

    Unless you created the dimensions in Google in the exact same order, it's likely that your index values will be somewhat different. Just make sure each dimension you created in Google Analytics (for example, Error Message, 3) corresponds with the dimensions and indexes in your component (for example, `"ATTRIBUTE_ERROR_MSG": "3"`).

## Step 4. Set Up Metric Indexes {#step4}

In this section, you'll do the same thing you did in the previous section but with metric indexes. According to [Google Analytics documentation](https://support.google.com/analytics/answer/1033861?hl=en), "Metrics are quantitative measurements. The metric Sessions is the total number of sessions. The metric Pages/Session is the average number of pages viewed per session."

1.  Expand **GoogleAnalyticsComponent > assets > configurations** and open the **GoogleCustomMetricTags.json** file.

    ```json
    {
      "ATTRIBUTE_AD_SECONDS_WATCHED": "1",
      "ATTRIBUTE_VIDEO_SECONDS_WATCHED": "2",
      "ATTRIBUTE_VIDEO_CURRENT_POSITION": "3",
      "ATTRIBUTE_AD_ID": "4",
      "ATTRIBUTE_VIDEO_DURATION": "11",
      "ATTRIBUTE_EXPIRED_RECOMMENDATIONS_COUNT": "12",
      "ATTRIBUTE_RECOMMENDATION_ID": "13"
    }
    ```

2.  Copy the file's contents and create a similarly named file in your app's **assets > configurations** folder.

    Similar to dimensions, you will be creating metrics in Google Analytics that correspond with the metrics and indexes here. (You don't need to do anything with the code here just yet. Just leave the file open to adjust later.)

3.  Sign in to your [Google Analytics Dashboard](https://analytics.google.com/).
4.  Click **Admin** on the top navigation row.
5.  In the **Property** column (the middle), click **Custom Definitions > Custom Metrics**.
6.  Click the **New Custom Metric** button.

    {% include warning.html content="You can create only 20 metrics. Also, you cannot edit a metric once you create it, so be careful here. If you mess up and need to change things, you may need to sign in with a different Google account." %}

7.  Type a friendly name for the first metric. For example, type "Ad Seconds Watched" instead of "ATTRIBUTE_VIDEO_SECONDS_WATCHED".
8.  Leave the other values (Scope, Formatting Type, Minimum Value, Maximum Value, and Active) at the defaults unless you specifically want to adjust these values.
10. Click **Create**.   
11. Click **Done**.
12. Repeat this process with the other metrics for all the metrics you want to track.

    {% include note.html content="As before, the names here (for example, \"Ad Seconds Watched\") do not need to match up with the names in the `GoogleCustomMetricTags.json` file (for example, \"ATTRIBUTE_VIDEO_SECONDS_WATCHED\"). Google will match up the metrics based on the index values." %}

13. In the `GoogleCustomMetricTags.json` file (inside your app's **assets > configurations** folder), change the metrics index numbers to correspond with the auto-created metric index numbers in your Google Analytics Dashboard.

    (Since you can't customize the index values in Google Analytics, you have to make the index values in the component match up with the index values Google creates.)

## Step 5. Set Up Reports {#step5}

The final step is to create a report based on the dimensions and metrics in the component.

{% include note.html content="Only minimal information for creating custom reports is provided here. For full documentation, see [Custom dimensions & metrics](https://support.google.com/analytics/answer/2709828) in the Google documentation. You will need to choose how you want to match up the dimensions and metrics in your reports based on the information that's important to you." %}

1.  In Google Analytics, click **Customization**.
2.  Click the **New Custom Report** button.
3.  Give your custom report a **Title**.
4.  In the **Dimensions** section, click **+ add dimension**, expand **Custom Dimensions**, and select the dimensions you want.
4.  In the Metrics Groups section, click **+ add metric**, expand **Custom Metrics**, and select the metrics you want.

    {% include image.html file="firetv/fireappbuilder/images/fireappbuilder_googleanalytics_customreport" type="png" %}

5.  Make any other adjustments to your report, and click **Save**.

## Step 6. Verify Everything Is Working {#step6}

You can verify the Google integration by doing the following:

1.  In Android Studio, launch your app.
2.  In Google Analytics, click **Reporting** and then go to **Real-Time > Overview**.

    You should see an active user.

    {% include image.html file="firetv/fireappbuilder/images/fireappbuilder_googleanalytics_activeusers" type="png" %}

{% include links.html %}
