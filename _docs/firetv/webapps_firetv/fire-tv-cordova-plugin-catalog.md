---
title: Cordova plugin for Fire TV Catalog Integration
permalink: fire-tv-cordova-plugin-catalog.html
sidebar: firetv
product: Fire TV
github: true
toc-style: kramdown
last_updated: May 25, 2017
reviewers: Robert Krossa, Mary Galvin, Luca Sale, Juston Western, Travis Ah King
---

The Cordova plugin for Fire TV Catalog Integration makes it possible to integrate your webapp with the Fire TV catalog. You still have to submit your app content to the Fire TV catalog using the [standard submission process for content][integrating-your-catalog-with-fire-tv]. This plugin just adds intents with the Fire TV launcher to indicate that your app has the capability to play video.

{% include note.html content="The Cordova plugin for Fire TV Catalog Integration is currently in beta testing. Details may change before its official release. You can submit feedback about the plugin or this documentation by sending an email to your solutions architect." %}

* TOC
{:toc}

## About Cordova and this Plugin

This Fire TV Catalog plugin is based on Apache Cordova. [Apache Cordova](https://cordova.apache.org/) provides a wrapper that allows you to include native Android functionality in webapps. Using Cordova, you can create an APK file for your web app.

Without this Cordova wrapper and plugin, webapps (such as those developed with [WASK][the-web-app-starter-kit-for-fire-tv]), cannot be integrated with Fire TV Catalog. Catalog integration is required to surface media results from your app when users perform [voice searches or global text searches][implementing-search-fire-tv] on Fire TV.

## Prerequisites &mdash; Add a Cordova project {#prereqs_cordova}

The instructions in the next section, ["Install the Cordova Plugin for Fire TV Catalog Integration"](#installation_instructions), assume that you've already added a Cordova project to your webapp. If you haven't, see [Create an App](https://cordova.apache.org/docs/en/latest/guide/cli/#create-the-app) in the Cordova documentation for details.

To create a Cordova project, you'll need to first [install npm](https://docs.npmjs.com/getting-started/what-is-npm) and the [Cordova command-line tool ](https://cordova.apache.org/docs/en/latest/guide/cli/).

After you install npm and the Cordova command-line tool, you would add Cordova to your webapp project somewhat like this:

```
cordova create hello com.example.hello HelloWorld
```

The command specifies a package name of `hello` for your project. A new directory called "hello" gets created inside your webapp directory. Among other files, the directory includes a config.xml file that lists the available intents that your app can handle.

Additionally, you must add the Android platform for your Cordova project:

```
cordova platform add android
```

Make sure you run the `cordova platform add android` command from your Cordova project directory. (If you get an error that says, \"Error: Current working directory is not a Cordova-based project.\" you're trying to install it in the wrong directory.)

After you've complete these prerequisites, see the following section for details on how to install and configure the plugin.

## Install the Cordova Plugin for Fire TV Catalog Integration {#installation_instructions}

{% include note.html content="If you haven't already added a Cordova project to your webapp, see the previous section, [\"Prerequisites: Add a Cordova project.\"](#prereqs_cordova) The steps that follow assume you have a Cordova project created for your webapp. Creating the Cordova app requires you to have  [npm](https://docs.npmjs.com/getting-started/what-is-npm) and [Cordova command-line tool](https://cordova.apache.org/docs/en/latest/guide/cli/) installed." %}

1.  Install [plugman](https://www.npmjs.com/package/plugman), a package manager for Node, so that it's available globally on your computer:

    ```
    npm install -g plugman
    ```

    {% include tip.html content="Although other plugin managers are available for Apache Cordova projects, plugman is recommended." %}


6.  Install the Cordova plugin for Fire TV Catalog using the following command. Customize the plugin's parameter values:

    ```sh
    plugman install --platform android --project YOUR_CORDOVA_PROJECT/platforms/android --plugin LOCATION_OF_PLUGIN --variable DISPLAY_NAME="Your App's Display Name" --variable PARTNER_ID="Your App's Partner Id" --variable DEFAULT_SIGNEDIN_STATUS="TRUE or FALSE" ;
    ```

    Here's an example with actual parameter values configured:

    ```sh
    plugman install --platform android --project ./platforms/android --plugin ../../CI-Plugin-For-Release --variable DISPLAY_NAME="ACME" --variable PARTNER_ID="acme" --variable DEFAULT_SIGNEDIN_STATUS="TRUE" ;
    ```

    Here's more detail about each parameter:

    <table>
       <colgroup>
          <col width="40%" />
          <col width="60%" />
       </colgroup>
       <thead>
          <tr>
             <th markdown="span">Parameter</th>
             <th markdown="span">Description</th>
          </tr>
       </thead>
       <tbody>
          <tr>
             <td markdown="span"><code>--project YOUR_CORDOVA_PROJECT</code></td>
             <td markdown="span">The file location of your Cordova directory. If you're running the command from your Cordova directory, use "`.`" to indicate the current directory.</td>
          </tr>
          <tr>
             <td markdown="span"><code>--plugin LOCATION_OF_PLUGIN</code></td>
             <td markdown="span">The location of the Cordova Fire TV Catalog plugin directory. This is either the clone URL of a GitHub repo or a local directory. (Note: In the beta, the plugin is available as a zip file that you download locally rather than access from a repo.)</td>
          </tr>
          <tr>
             <td markdown="span"><code>--variable DISPLAY_NAME="Your App's Display Name"</code></td>
             <td markdown="span">The name of your app.</td>
          </tr>
          <tr>
             <td markdown="span"><code>--variable PARTNER_ID="Your App's Partner Id"</code></td>
             <td markdown="span">Your Partner ID (supplied by Amazon) is the same ID that you use for catalog integration in the Partner field of your CDF file. Note that this ID is unique to your app, not to an individual or organization. If you or your organization has multiple Fire TV apps, each app will all have different Partner IDs. (See ["Intent Extras" in Integrating Your App with the Fire TV Home Screen Launcher][launcher-integration#intent_extras] for more information.)</td>
          </tr>
          <tr>
             <td markdown="span"><code>--variable DEFAULT_SIGNEDIN_STATUS="TRUE or FALSE"</code></td>
             <td markdown="span">Modifies the intent that is sent to the app. The app defaults to sending the corresponding intent if `signIn`/`signout` is never called from the webapp. If no sign-in flow is available in your app, set this value to `TRUE`. (See [Integrating Your App with the Fire TV Home Screen Launcher][launcher-integration#intent_extras] for more information.)</td>
          </tr>
       </tbody>
    </table>

7.  Edit your main activity to accept deep linking.

    If you have not customized your Cordova project, your main activity is most likely named `MainActivity.java` and is under `CORDOVA_PROJECT/platforms/android/PKG/`, where `PKG` refers to the package name (such as `src/com/example/hello`).

    If you have customized your Cordova project, but you do not know the main launch activity, you can find it by identifying the activity in the Android manifest (`platforms/android/AndroidManifest.xml`) that has the intent-filter:

    ```java
    <intent-filter android:label="@string/launcher_name">
       	<action android:name="android.intent.action.MAIN" />
       	<category android:name="android.intent.category.LAUNCHER" />
    </intent-filter>
    ```

    In your main activity (e.g., `MainActivity.java`), before the line that launches the default url (which probably looks like `loadUrl(launchUrl);`), add the following code:

    ```java
    if (this.appView == null || TextUtils.isEmpty(this.appView.getUrl())) {
     	// determine if the application was launched from a different application (such as the launcher app) and contains additional data needing to be passed to the web page
           Uri launchIntentData = getIntent().getData();
    //or if your ID is not in URI form:
    // String launchIntentData = getIntent().getStringExtra(‘DATA_EXTRA_NAME’);
    	String newUrl = launchUrl;
           if (launchIntentData != null && getIntent().getAction().equals(Intent.ACTION_VIEW)) {
             newUrl = createDeepLinkUrl(launchIntentData);
           }

           Log.d(TAG, "Loading webview with url : " + launchUrl);
           loadUrl(launchUrl);
     } else {
           Log.d(TAG, "Webview is already loaded with url : " + this.appView.getUrl());
    }
    ```

8.  Write the function for `createDeepLinkUrl(String launchData)`.

    Your `createDeepLinkUrl` function will be unique to your webapp structure and catalog data, but here is an example `createDeepLinkUrl` function for you to use as a basis for your own:

    ```java
    private String createDeepLinkURLFromVevoLaunchData(Uri launchData) {
         // get the last segment (formatted in this case: Video('SOMEID')), and pull out the ID
         String[] videoIDSegments = launchData.getLastPathSegment().split("'");

         // if it's in the expected format, we should have 3 parts with the second being the ID
         if (videoIDSegments.length == 3) {
           String videoID = videoIDSegments[1];
           if (!TextUtils.isEmpty(videoID)) {
             // use the uri builder to properly append the new video path
             Uri.Builder builder = Uri.parse(this.launchUrl).buildUpon();
             builder.appendEncodedPath("watch/" + videoID);
             return builder.build().toString();
           }
         }

         // if we didn't get a valid video ID or don't understand the format, return original URL
         return this.launchUrl;
     }
    ```

8.  After you have made the proper modifications to the `MainActivity.java` file, your app should be ready to build. Build it using this command:

    ```
    cordova build android
    ```

9.  To change your signedIn/signedOut status, in the `onDeviceReady` handler of your app, save the result of `cordova.require('com.amazon.cordova.plugins.launcher')`. (For example: `this.launcherPlugin = cordova.require('com.amazon.cordova.plugins.launcher');`.)

    The `launcherPlugin` object has two functions:

    * `isSignedIn(successCallback(status), errorCallback)`
    * `setSignedInStatus(status, successCallback, errorCallback)`

    [WASK][the-web-app-starter-kit-for-fire-tv] is intended to work with Amazon’s customized version of Cordova (and not vanilla Cordova), so the listener is `onAmazonPlatformReady`. The [onDeviceReady](https://cordova.apache.org/docs/en/latest/cordova/events/events.html#deviceready) event tells the webapp that Cordova is finished executing and that it is okay to start executing Cordova-related code, such as setting the `signedIn` status.

{% include links.html %}
