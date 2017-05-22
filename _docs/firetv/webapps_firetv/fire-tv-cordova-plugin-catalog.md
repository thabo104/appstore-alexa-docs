---
title: Cordova plugin for Fire TV Catalog Integration
permalink: fire-tv-cordova-plugin-catalog.html
sidebar: firetv
product: Fire TV
github: true
toc-style: kramdown
---

You can use the Cordova plugin for Fire TV Catalog Integration to integrate your Fire TV web app with Fire TV catalog. You still have to submit your app's media to the Fire TV catalog using the [standard submission process for content][integrating-your-catalog-with-fire-tv]. This plugin just adds intents with the Fire TV launcher to indicate that your app has the capability to play videos.

{% include note.html content="The Cordova plugin for Fire TV Catalog Integration is currently in beta testing. Details may change before its official release." %}

* TOC
{:toc}

## About Cordova and this Plugin

This Fire TV Catalog plugin is based on Apache Cordova. [Apache Cordova](https://cordova.apache.org/) provides a wrapper that allows you to include native Android functionality in web apps. Without this Cordova wrapper and plugin, web apps (such as those developed with [WASK][the-web-app-starter-kit-for-fire-tv]), could not be integrated with Fire TV Catalog. Catalog integration is required to surface media results from your app when users perform [voice searches or global text searches][implementing-search-fire-tv] on Fire TV.

## Install the Cordova Plugin for Fire TV Catalog Integration

1.  If you don't already have [npm](https://docs.npmjs.com/getting-started/what-is-npm) (Node Package Manager), [install it](https://docs.npmjs.com/getting-started/installing-node) first.
2.  Install [plugman](https://www.npmjs.com/package/plugman) globally:

    ```
    npm install -g plugman
    ```

    {% include tip.html content="Although other plugin managers are available for Apache Cordova projects, [plugman](https://www.npmjs.com/package/plugman) is recommended." %}


3.  Install the [Cordova command-line tool](https://cordova.apache.org/docs/en/latest/guide/cli/):

    ```
    sudo npm install -g cordova
    ```

4.  Add a Cordova project to your web app directory, if you haven't already added Cordova. For example, you might add Cordova using a command such as the following:

    ```
    cordova create hello com.example.hello HelloWorld
    ```

    This command adds Cordova to your web app project. The command indicates the package name for your project (in this example, the package name is `hello`). See [Create an App](https://cordova.apache.org/docs/en/latest/guide/cli/#create-the-app) in the Cordova documentation for details.

5.  Add the Android platform for your Cordova project:

    ```
    cordova platform add android
    ```

    {% include tip.html content="Make sure you run this from your Cordova project directory. (If you get an error that says, \"Error: Current working directory is not a Cordova-based project.\" you're trying to install it in the wrong directory.)" %}

6.  Install the Cordova plugin for Fire TV Catalog. Customize the values (in red):

    <pre>
    plugman install --platform android --project <span class="red">YOUR_CORDOVA_PROJECT</span>/platforms/android --plugin <span class="red">LOCATION_OF_PLUGIN</span> --variable DISPLAY_NAME="<span class="red">Your App's Display Name</span>" --variable PARTNER_ID="<span class="red">Your Apps Partner Id</span>" --variable DEFAULT_SIGNEDIN_STATUS="<span class="red">TRUE/FALSE</span>"
    </pre>

    Here's more detail about each value

    * <span class="red">YOUR_CORDOVA_PROJECT</span>: The file location of your Cordova directory
    * <span class="red">LOCATION_OF_PLUGIN</span>: The location of the Cordova Fire TV Catalog plugin. This is either the clone URL of a GitHub repo or a local directory.
    * <span class="red">Your App's Display Name</span>: The name of your app
    * <span class="red">Your Apps Partner Id</span>: ???
    * <span class="red">TRUE/FALSE</span>: ???

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

8.  You must write the function for `createDeepLinkUrl(String launchData)`. Your `createDeepLinkUrl` function will be unique to your webapp structure and catalog data, but here is an example `createDeepLinkUrl` for you to base yours off of:

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

9.  To change your signedIn/signedOut status, in the `onDeviceReady` handler of your app, save the result of `cordova.require('com.amazon.cordova.plugins.launcher')` (for example, `this.launcherPlugin = cordova.require('com.amazon.cordova.plugins.launcher');`)

The launcher plugin object has two functions:

* `isSignedIn(successCallback(status), errorCallback)`
* `setSignedInStatus(status, successCallback, errorCallback)`

<hr/>


**My questions**

- will devs already have cordova installed? why would they? how familiar will they be with it?
- does step 4 need more detail?
- with step 6, I need more detail about each value. I couldn't run this step. Can you also provide a code sample with actual values? Can I try running it with the plugin code?
- step 9 needs more detail. What does the signedIn/signedOut status do? Where is `onDeviceReady` handler? I couldn't find this in the WASK code.

{% include links.html %}
