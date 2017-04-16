---
title: Customize the Fire App Builder Sample Project
permalink: fire-app-builder-customize-the-application-project.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

{% include note.html content="If you haven't downloaded and built the \"application\" project, see this topic first: [Download Fire App Builder and Build an App][fire-app-builder-download-and-build]. " %}

The first step in creating your app is to customize the "Application" folder. The Application folder contains the sample app created with Fire App Builder.

* TOC
{:toc}

## Options for Project Customization

You have two options for customizing the Application folder. The option you choose depends on how you want to handle later updates that you might pull from the Github repo:

*  **Option 1: Duplicate the Application folder and its files**: When you run `git pull` to get later updates from the Fire App Builder repo, you won't have to resolve any merge conflicts for potential updates to Application's files. However, if there are updates to the Application folder and its contents, you won't be prompted to merge them into your project. Additionally, if code in other folders requires updates to the Application folder, your project may break without these updates.
*  **Option 2: Directly customize the Application folder and its files**: When you run `git pull` to get later updates from the Fire App Builder repo, you will be prompted with merge conflicts that you'll have to sort through. It will be more tedious to get the updates, and you'll need to be familiar with how to resolve merge conflicts with git repos. However, you will be sure not to miss any updates to the Application folder and its files.

## Copy or Rename the Application Project

Follow these steps regardless of whether you prefer option 1 or option 2.

1.  If you have the Fire App Builder project open in Android Studio, close it by going to **File > Close Project.**
2.  Using Finder (Mac) or your File Explorer (Windows), browse to the directory where you downloaded Fire App Builder. Do one of the following:
     * Duplicate the Application folder (option 1). Then rename the copy (for example, "acmemedia").
     * Directly rename the Application folder (option 2) (for example, "acmemedia").
4.  Inside your customized Application folder ("acmemedia"), delete the **build** folder (which stores the generated app).
5.  In Android Studio, from the Welcome screen that is displayed, click **Open an existing Android Studio project**.
6.  Browse to the directory containing the Application folder, and click the **Refresh** button {% include inline_image.html file="firetv/fireappbuilder/images/fireappbuilder-refreshbutton" type="png" alt="Refresh button" %} to see your new folder.
7.  Select your new customized Application folder ("acmemedia"), and click **OK**.

    {% include image.html file="firetv/fireappbuilder/images/fireappbuilder-clonedproject" type="png" caption="In this example, the customized folder was renamed to \"Application_WTD.\"." alt="Selecting the customized project folder." %}

8.  If prompted about upgrading Gradle plugin settings, click **Don't remind me again for this project.**
9.  If you see a notice about the Application module no longer being imported into the project, click **OK**.

    {% include image.html file="firetv/fireappbuilder/images/fireappbuilder-notimportednotice" type="png" alt="Application module no longer imported" %}

10.  Expand the **Project** pane (but not the Project view) in the upper-left corner to view the files.

## Customize the App Name and Manifest

1.  In your app's folder, expand **res > values > **strings.xml** file and open each of the files. In the `app_name` string, type the name of your app. For example:

    ```xml
    <string name="app_name">ACME Media Productions</string>
    ```

    Note that the AndroidManifest.xml file (inside **app > manifests**) reads the name of the application from the string you just edited. (In Android Manifest, the code referencing the string is `android:label="@string/app_name"`. This is how most of Fire App Builder is set up &mdash; code that you customize is extracted out into XML files so you don't have to directly edit Java.)

    There are multiple strings.xml files here to support different locales for your app. If someone from a German locale opens your app (assuming your app is available in that market), the "strings.xml (de)" file will be used. If someone from Japan opens your app, the "strings.xml (ja)" file will be used, and so on. If no language specific string is found, the app falls back on strings.xml.

2.  If you're [sending recommendations][fire-app-builder-recommendations-overview] and your app name is longer than 15 characters, add a shortened app name in these same strings.xml files using the `app_name_short` property:

    ```xml
     <string name="app_name_short">ACME Media</string>
    ```

3.  Open your app's **AndroidManifest.xml** file (located in **app > manifests**) and update the **com.amazon.android.calypso** package name to a package name that reflects your app's new name. For example, if your app was named "acmemedia," you might change it to the following:

    ```xml
    <manifest xmlns:android="http://schemas.android.com/apk/res/android"
        package="com.amazon.android.acmemedia">
    ```

    {% include note.html content="The package name for apps you submit to the Amazon Appstore must be unique and must remain the same through the life of your app. If you change the package name, the app will not retain any history or association with previously submitted apps. As per requirements with [Android package names](https://developer.android.com/guide/topics/manifest/manifest-element.html), the package name must start with letters." %}

    The sample app in Fire App Builder doesn't have any classes in the `com.amazon.android.calypso` package, but you can add custom classes to overwrite existing Fire App Builder functionality or add to it.

4.  Expand the **Gradle Scripts** folder and open the **build.gradle (Module: app)** file. Update the `applicationId` property to match your package name:

    ```java
    defaultConfig {
    applicationId "com.amazon.android.acmemedia"
    minSdkVersion 21
    targetSdkVersion 23
    versionCode 5
    versionName "1.0.0"
    testInstrumentationRunner "android.support.test.runner.AndroidJUnitRunner"
    multiDexEnabled true
    }
    ```

    {% include note.html content="In this documentation, unless otherwise noted, paths to files are described using the [Android view](https://developer.android.com/studio/projects/index.html#ProjectFiles)." %}

5.  In this same **build.gradle (Module: app)** file, update the `versionCode` and `versionName` values as desired.

    The `versionCode` (an integer) is an internal numbering scheme for your app's version. See [android:versionCode](https://developer.android.com/guide/topics/manifest/manifest-element.html#vcode) in the Android docs for more details.

    The `versionName` (a string) is the version that users see. See [android:versionName](https://developer.android.com/guide/topics/manifest/manifest-element.html#vname) in the Android docs for more details.

    Note that you do not need these elements in your app's manifest. When you upload your APK into the Amazon Appstore, the Appstore will read the information from this "build.gradle (Module: app)" file instead of the AndroidManifest.xml.

5.  Expand the **Gradle Scripts** folder and open the **gradle.properties (Project Properties)** file. Customize the `applicationName` to your app's name. Android Studio uses this name in the APK file.

## Clean and Build the Project

1. Go to **Build > Clean Project** to clean up any artifacts from the previous app. (This process takes several minutes.)
2. Build your new app by clicking the **Run 'app'** button {% include inline_image.html alt="Run 'app' button" file="firetv/fireappbuilder/images/fireappbuilder_runappbutton" type="png" %}.

## Next Steps

Now that you've customized your app folder and files, you can start loading your media feed into the app. See [Load Your Media Feed][fire-app-builder-load-media-feed].

{% include links.html %}
