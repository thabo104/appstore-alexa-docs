---
title: Customize the Look and Feel of Your App
permalink: fire-app-builder-customize-look-and-feel.html
sidebar: fireappbuilder
product: Fire App Builder
toc-style: kramdown
github: true
---

You can customize much of the app's look and feel through the custom.xml file (located in **res > values**) and navigator.json file (in **app > assets**). You can change colors, fonts, and other properties by updating hex, dp, or other values.

* TOC
{:toc}

## Customize the Homepage Layout

The default home screen layout uses the `ContentBrowseActivity`. This layout is referred to as the "Homepage Browse layout."

{% include image.html file="firetv/fireappbuilder/images/fireappbuilder_home" type="png" alt="Home" caption="<b>Home with the <code>ContentBrowseActivity</code></b>. This view arranges the videos in various channels or groups. When you view a channel, the first video in that channel group appears as the featured background image, with its title and description in the upper-left." %}

You can change the homepage layout to a more compressed view by using the `FullContentBrowseActivity` instead. This alternative homepage layout is referred to as the "Full Browse" homepage layout.

{% include image.html file="firetv/fireappbuilder/images/fireappbuilder_fullbrowse" type="png" alt="Home with FullContentBrowseActivity" caption="<b>Home with <code>FullContentBrowseActivity</code></b>. With this activity, all the videos appear in a more compressed grid, with the channels listed on the left in a sidebar. None of the videos are superimposed as large featured images in the background. The app appears in the upper-right corner." %}

The left sidebar can collapse in when the user is browsing through the video titles. This gives more space and focus to your video content.

To change the homepage to the Full Browse layout:

1.  Open the **Navigator.json** file (located in **app > assets**).
2.  In the `graph` object, locate the `CONTENT_HOME_SCREEN`:

    ```json
    "com.amazon.android.tv.tenfoot.ui.activities.ContentBrowseActivity": {
          "verifyScreenAccess": false,
          "verifyNetworkConnection": true,
          "onAction": "CONTENT_HOME_SCREEN"
        }
    ```

3.  Change `com.amazon.android.tv.tenfoot.ui.activities.ContentBrowseActivity` to `com.amazon.android.tv.tenfoot.ui.activities.FullContentBrowseActivity`.

## Change the Homepage's Visual Elements

The following diagram shows the visual properties you can customize on the homepage's Browse layout (the default):

{% include image.html file="firetv/fireappbuilder/images/firetv_homepage" type="png" %}


<h3 id="changelogo"> {% include inline_image.html file="firetv/getting_started/images/firetv_one" type="png" %} Logo </h3>

The logo appears in the upper-left corner as well as on the splash screen. This is an element you should definitely change as you customize your app. To change the logo:

1.  Inside your app's **assets > res** directory, create a new folder called **drawable**.
2.  Open your **drawable** folder via Finder or Explorer.

    To access your drawable folder, you can either right-click the folder within Android Studio and choose **Reveal in Finder** (on a Mac). Or you can manually browse the source files by going to **Application > app > src > main > res > drawable**. (The Android view in Android Studio doesn't reflect the actual structure of your folders.)

3.  Add your logo image (356px wide x 108px) into this folder.

    The app logo's dimensions should be approximately 356px wide x 108px tall and have a transparent background. Larger images will be scaled down to fit the space (but smaller images won't be scaled up).

    The resizing preserves the image's dimensions without performing any cropping. If your logo is tall and narrow, it may look tiny when fit into a space that is 108px tall because the aspect ratio will be preserved. (Logos that are wide look better in the Fire App Builder layout.)

    Your logo appears as an overlay on top of the app background. A light logo on a dark background will have good contrast.

4.  In your app's **custom.xml** file (inside your app's **res > values** folder), customize the file names within the following elements:

    ```xml
    <drawable name="splash_logo">@drawable/fire_app_builder_white</drawable>

    <drawable name="company_logo">@drawable/fire_app_builder_white2</drawable>
    ```

    The `splash_logo` element determines the logo that appears on the Splash page. The `company_logo` element determines the logo that appears in the upper-left corner of the app.

    You can use the same logo on both screens, or you can vary the two. You don't need to include the file extension in the image file name. Android will automatically detect it.

<h3> {% include inline_image.html file="firetv/getting_started/images/firetv_two" type="png" %} Video title and description </h3>

You can change the color of the video title and description. In your app's **custom.xml** file, update the following element:

```xml
<color name="primary_text">#f4084f</color>
<!-- red Used for the text on the card views and playback progress bar text. -->
```

This element also controls the color of the video title and description on the preview screen (which appears when you click a video but haven't started media playback). It also controls the color of the text on the buttons, such as "Watch Now" and "Resume Playback."

For details on how to change the font itself for these elements, see [Change the Font](#changefont).

<h3> {% include inline_image.html file="firetv/getting_started/images/firetv_three" type="png" %} Category title color </h3>

You can change the color of the category titles. Changing this color also changes the text color in left navigation in Full Browse layout. In your app's **custom.xml** file, update the following element:

```xml
<color name="tertiary_text">#99FFFFFF</color>
```

This element also controls the color of the "Recommended Content" text, which appears below videos on the preview screen and the media playback screen.

<h3> {% include inline_image.html file="firetv/getting_started/images/firetv_four" type="png" %} Card video title color </h3>

You can change the color of the video title on cards. Changing this color also changes the text color on the progress bar during video playback. In your app's **custom.xml** file, update the following element:

```xml
<color name="secondary_text">#FFFFFFFF</color>
```

<h3> {% include inline_image.html file="firetv/getting_started/images/firetv_five" type="png" %} Background color </h3>

You can change the background color of the app. This property affects all screens. In your app's **custom.xml** file, change the following element:

```xml
<color name="background">#22282E</color>
```

<h3> {% include inline_image.html file="firetv/getting_started/images/firetv_six" type="png" %} Gradient width</h3>

You can control the size of the gradient between the background and the preview image. In your app's **custom.xml** file, adjust the dp value for the following element:

```xml
<dimen name="content_image_gradient_size">100dp</dimen>
```

<h3> {% include inline_image.html file="firetv/getting_started/images/firetv_seven" type="png" %} Preview image size</h3>

You can control the size of the preview image in the upper-right corner. In your app's **custom.xml** file, adjust the dp value for the following elements:

```xml
<dimen name="content_image_height">350dp</dimen>
<dimen name="content_image_width">540dp</dimen>
```

<h3> {% include inline_image.html file="firetv/getting_started/images/firetv_eight" type="png" %} Search button icon and search background</h3>

You can change the icon and background of the search button. This button is drawn with two images.

1.  If you haven't already created a drawable folder in your app, inside your app's **assets > res** directory, create a new folder called **drawable**.
2.  Open your **drawable** folder via Finder or Explorer.
3.  Add your images for the search icon and background into this folder.
4.  In your app's **custom.xml** file, update the file names for the following elements:

    ```xml
    <drawable name="search_icon">@drawable/ic_search</drawable>
    <drawable name="search_background">@drawable/bg_gradient_search</drawable>
    ```

To get the exact size and dimensions of these icons, look in the **TVUIComponent > res > drawable** folder for the original two images.

## Change the Visual Properties in the "Full Browse" Homepage Layout

The full browse layout shows a left sidebar navigation. You can customize the color of the sidebar and the category titles that appear there.

{% include image.html file="firetv/fireappbuilder/images/firetv_fullbrowselayout" type="png" %}

<h3> {% include inline_image.html file="firetv/getting_started/images/firetv_one" type="png" %} Sidebar color </h3>

You can change the color of the left navigation bar. In your app's **custom.xml** file, update the following element:

```xml
<color name="browse_headers_bar">#ff69b4</color>
```
<h3> {% include inline_image.html file="firetv/getting_started/images/firetv_two" type="png" %} Category titles and subtitles in sidebar</h3>

You can change the category titles that appear in the sidebar. Both the selected and non-selected category titles receive this color. The selected category titles are bold, and the non-selected category titles are softer and muted.

In your app's **custom.xml** file, updated the following element:

```xml
<color name="tertiary_text">#99FFFFFF</color>
```

Note that for the default homepage layout ("Browse"), this element controls the category title above the videos rows. For the Full Browse layout, it changes the color of the category titles in the left navigation bar.

## Change the Elements on the Playback Screen

You can control the look and feel of the elements on the playback screen.

{% include image.html file="firetv/fireappbuilder/images/firetv_playback" type="png" %}

<h3> {% include inline_image.html file="firetv/getting_started/images/firetv_one" type="png" %} Video title </h3>

You can change the color of the video title on the playback screen. In your app's **custom.xml** file, update the following element:

```xml
<color name="primary_text">#E6FFFFFF</color>
```

This element also controls the color of the video titles and subtitles on the homepage screen.

<h3> {% include inline_image.html file="firetv/getting_started/images/firetv_two" type="png" %} Progress bar color</h3>

The progress bar refers to the sliding marker that indicates where you're at in the timeline of the video. To change its color, in your app's **custom.xml** file, update the following element:

```xml
<color name="progress_bar">#99FFFFFF</color>
```

For example, if you changed this color to red, it would look as follows:

{% include image.html  file="firetv/fireappbuilder/images/fireappbuilder_progressbar1" type="png" %}

<h3> {% include inline_image.html file="firetv/getting_started/images/firetv_three" type="png" %} Color of buffered progress bar</h3>

The buffered progress bar shows how much video has been downloaded. To change its color, in your app's **custom.xml** file, update the following element:

```xml
<color name="playback_buffered_progress">#FF5A5A5A</color>
```

For example, if you changed this color to green, it would look as follows:

{% include image.html  file="firetv/fireappbuilder/images/fireappbuilder_progressbar2" type="png" %}

<h3> {% include inline_image.html file="firetv/getting_started/images/firetv_four" type="png" %} Background color of progress bar</h3>

The progress bar refers to the entire bar where the video loading slider appears. To change its color, in your app's **custom.xml** file, update the following element:

```xml
<color name="playback_background_progress_bar">#FF373737</color>
```

For example, if you changed this color to blue, it would look as follows:

{% include image.html  file="firetv/fireappbuilder/images/fireappbuilder_progressbar3" type="png" %}

<h3> {% include inline_image.html file="firetv/getting_started/images/firetv_five" type="png" %} Recommended Text Color</h3>

You can change the color of the "Recommended Text" title. This element is grouped with other "tertiary_element" colors. Updating this color will also change the color of the category titles on the home screen. To change the color, in your app's **custom.xml** file, update the following element:

```xml
 <color name="tertiary_text">#f2f408</color>
```

## Customize the Splash Screen

By default, the sample app in Fire App Builder shows the following Splash screen:

{% include image.html file="firetv/fireappbuilder/images/firetv_splashscreen" type="png" alt="Splash screen" %}

The following sections describe each element you can customize.

<h3> {% include inline_image.html file="firetv/getting_started/images/firetv_one" type="png" %} Logo </h3>

The logo for your app. The logo is defined by the following element in your app's custom.xml:

```xml
<drawable name="splash_logo">@drawable/fire_app_builder_white</drawable>
```

See the earlier section, [Logo](#changelogo), for details on changing the Splash screen's logo.

<h3> {% include inline_image.html file="firetv/getting_started/images/firetv_two" type="png" %} Loading text </h3>

To update the word "Loading" that appears on the Splash screen, go to **TVUIComponent > res > strings.xml > strings.xml** and update the following element:

```xml
<string name="feed_loading">Loading</string>
```

<h3> {% include inline_image.html file="firetv/getting_started/images/firetv_three" type="png" %} Loading spinner </h3>

You can change the color of the loading spinner that appears on the Splash screen by updating this element in your app's **custom.xml** file:

```xml
<color name="spinner_color">#FFFFFFFF</color>
```

<h3> {% include inline_image.html file="firetv/getting_started/images/firetv_four" type="png" %} Copyright </h3>

To customize the Copyright text on the Splash screen, see the **strings.xml** folder inside your app's **res > values > strings.xml** folder.

```xml
<string name="copyright">Copyright 2016. All Rights Reserved.</string>
```

<h3> {% include inline_image.html file="firetv/getting_started/images/firetv_five" type="png" %} Background color </h3>

To change the background color of the app, update the following element in your app's **custom.xml**:

```xml
<color name="background">#22282E</color>
```

<h3> {% include inline_image.html file="firetv/getting_started/images/firetv_six" type="png" %} Text color </h3>

To change the color of the text on the splash screen, button text, and read-more text on the Content Details screen, update the following element in custom.xml:

```xml
<color name="primary_text">#E6FFFFFF</color>
```

## Change the Font {#changefont}

You can change your app's fonts through the `branding` object in **Navigator.json** (inside **app > assets**):

```json
"branding": {
    "globalTheme": "AppTheme",
    "lightFont" : "Roboto Light",
    "boldFont" : "Roboto Bold",
    "regularFont" : "Roboto Regular"
  }
```

Here's how the fonts are used:

<table>
   <colgroup>
      <col width="30%" />
      <col width="70%" />
   </colgroup>
   <thead>
      <tr>
         <th markdown="span">Property</th>
         <th markdown="span">Where It's Used </th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td markdown="span">`lightFont`</td>
         <td markdown="span">Used in description and body text.</td>
      </tr>
      <tr>
         <td markdown="span">`boldFont`</td>
         <td markdown="span">Used in titles.</td>
      </tr>
      <tr>
         <td markdown="span">`regularFont`</td>
         <td markdown="span">Used in buttons and subtitles.</td>
      </tr>
   </tbody>
</table>

(With the `globalTheme` property, there aren't other values you can select.)

You can assign any valid device or custom font for any of the three font options. For example, you could apply `Roboto Bold` to all three fonts if you want.

You can use any of these device fonts:

* **Amazon Ember fonts**: Amazon Ember, Amazon Ember Bold, Amazon Ember Bold Italic, Amazon Ember Italic, Amazon Ember Light, Amazon Ember Light Italic, Amazon Ember Medium, Amazon Ember Medium Italic, Amazon Ember Thin, Amazon Ember Thin Italic, AndroidClock Regular, AndroidClock-Large Regular
* **Roboto fonts**: Roboto Black, Roboto Black Italic, Roboto Bold, Roboto Bold Italic, Roboto Condensed Bold, Roboto Condensed Bold Italic, Roboto Condensed Italic, Roboto Condensed Light, Roboto Condensed Light Italic, Roboto Condensed Regular, Roboto Italic, Roboto Light, Roboto Light Italic, Roboto Medium, Roboto Medium Italic, Roboto Regular, Roboto Thin, Roboto Thin Italic
* **Verdana fonts**: Verdana, Verdana Bold, Verdana Bold Italic, Verdana Italic
* **Miscelleneous fonts**: Carrois Gothic SC, Clockopia, Code2000, Coming Soon, Cutive Mono, Dancing Script, Dancing Script Bold
Droid Sans Mono, Kindle Symbol, MotoyaLMaru W3 mono, MT Chinese Surrogates, NanumGothic, Source Code Pro Medium

For example, if you wanted to use Amazon Ember fonts, you could customize the `branding` object like this:

```json
  "branding": {
    "globalTheme": "AppTheme",
    "lightFont" : "Amazon Ember",
    "boldFont" : "Amazon Ember Bold",
    "regularFont" : "Amazon Ember"
  }
```

The screens would then look like this:

{% include image.html file="firetv/fireappbuilder/images/fireappbuilder_fontsnewhome" type="png" %}

And this:

{% include image.html file="firetv/fireappbuilder/images/fireappbuilder_fontsnewdetails" type="png" %}

These Amazon Ember fonts will be used in the titles, subtitles, descriptions, body, and buttons.

In addition to using different device fonts, you can also use custom fonts. If you use a custom font, store the font in your app's **assets/fonts** directory. Then provide the path to the font in the `branding` object, such as `fonts/Proxima-Nova-Light.tff` (instead of just entering `Proxima Nova Light`):

```json
  "branding": {
    "globalTheme": "AppTheme",
    "lightFont" : "fonts/Proxima-Nova-Light.tff",
    "boldFont" : "fonts/Proxima-Nova-Light.tff",
    "regularFont" : "fonts/Proxima-Nova-Light.tff"
  }
```

## Customize the Recommended Content Section {#recommendations}

On the Content Details screen, a list of "Recommended Content" appears below the content preview.

{% include image.html file="firetv/fireappbuilder/images/fireappbuilder_reccontent" type="png" alt="Recommended content" %}

You populate this section by matching certain tags in your feed. For more details on configuring Recommended Content, see ["Recommended Content (Through Tags)"][fire-app-builder-set-up-recipes-content#tags] in Set Up the Content Recipe.


## Customize the App Icon

You can change the app icon. This is the image thumbnail that appears in your list of apps on Fire TV.

{% include image.html file="firetv/fireappbuilder/images/fireappbuilder_launchicon" type="png" alt="App icon" %}

To update this file, change the **ic_launcher.svg** files. Switch to the **Project** view, and then look in your app's **src > main > res** folder. There are 4 app icon files, each corresponding to different screen sizes:

* mipmap-hdpi (72x72px)
* mipmap-mdpi (48x48px)
* mipmap-xhdpi (96x96px)
* mipmap-xxhdpi (96x96px)

The app icon has a transparent background. Either replace the source images or update your app's custom.xml file with updated reference to your launcher file:

```xml
<drawable name="app_logo">@mipmap/ic_launcher</drawable>
```

## Update the Terms of Use

The Terms of Use section appears in the footer of the app and links to the terms_of_use.html file (located in **app > assets**).

{% include image.html file="firetv/fireappbuilder/images/fireappbuilder_termsofusefile" type="png" alt="Terms of Use diagram" %}

You can adjust the target for this link in your custom.xml file:

```xml
<string name="terms_of_use_file">terms_of_use.html</string>
```

The Terms of Use file is a sample file that you should edit before distributing your app.  For instance, you might choose to include terms of use, an end user license agreement, privacy notices, and/or other legal notices in this file.

The Terms of Use file also includes notices for open source components that are built in to the sample app by default. These notices are provided as a convenience only. Amazon makes no representations as to their accuracy or completeness and will not be responsible for any inaccuracies or incompleteness.

## Customize the Content Reload Time

You can customize the time it takes for content to reload (content refers to  the videos and other details that your app loads from the media feed). By default the reload time is 14400000 milliseconds, or 4 hours. After this time expires, the Navigator.js file (located in **app > assets > resources**) will reload the recipes and data loader settings.

```xml
<!-- Content Reload time in milliseconds -->

<integer name="time_to_reload_content">14400000</integer>

<!-- End Content Reload time in milliseconds -->
```

## More Extensive Customizations

Although you can dig into the Fire App Builder code and alter the layouts in deeper ways, major revamping of the user interface is not supported through simple edits to XML files (nor is documentation available for more extensive changes). Do not expect to completely change the interface in ways beyond what is described here.

## Next Steps

To use components that leverage authentication, ads, in-app purchasing, or analytics, see [Components Overview][fire-app-builder-interfaces-and-components].

{% include links.html %}
