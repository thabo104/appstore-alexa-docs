---
title: APIs for HDMI Mode Switch (Fire TV Gen 2 only)
permalink: fire-tv-4k-apis-for-hdmi-mode-switch.html
sidebar: firetv_ja
product: Fire TV
toc-style: kramdown
github: true
---

{% include important.html content="The content on this page applies only for Fire TV Gen 2 devices. For more general information about playing 4K video on Fire TV, see [Playing 4K Ultra HD Videos on Fire TV][fire-tv-4k-ultra-hd]." %}

Fire TV (Gen 2) operates at 1080p at 60 FPS mode even when connected to a 4K UHD TV. To play 4K UHD content, you must switch the TV to 4K UHD display mode. This switch between HDMI display modes (triggered by the app when it needs to play 4K UHD content) is called *HDMI Mode switch*.

* TOC
{:toc}

## APIs for HDMI Mode Switch

Google introduced 4K [`Display.Mode`](https://developer.android.com/about/versions/marshmallow/android-6.0.html#4K-display) APIs in Android Marshmallow. `Display.Mode` allows applications to query physical display sizes and switch to a different HDMI display mode.

Amazon implemented `Display.Mode` APIs in Fire TV (Gen 2) running Fire OS 5 (based on Android L). Apps can use these APIs for the HDMI Mode switch.

Since these APIs are not part of Android API Level 21 (Lollipop) in Android SDK, the apps can use “reflection” to access the APIs.  Alternatively, app developers can use the [4K Extension Library](#amazonextension) developed by Amazon, which wraps these Android APIs via reflection and provides a simple interface for them.

You can also display an optional interstitial developed by Amazon to prepare customers for the HDMI Mode switch. This interstitial is distributed as part of the Amazon Extension Library For 4K.

Fire OS will also provide a `sys.display-size` system property to report the maximum supported resolution of the connected display.

## Steps for Using HDMI Mode Switch {#hdmimodeswitch}

Follow these general steps when using the Android API to initiate an HDMI Mode switch:

1.  **Query supported display modes with `Display.getSupportedModes()`.**

    `Display.getSupportedModes()` returns an array of `Display.Mode` objects. This synchronous API returns the modes (resolution and frame rate) supported by both Fire TV (Gen 2) and the attached display. If the attached display supports 4K UHD, then 4K UHD modes will be included in the list.

    Because frame rate conversion may not provide optimal results, Amazon recommends switching to the actual or closest frame rate of the content to be played (4K at 24fps, 4K at 25fps, or 4K at 30fps).

2.  **Retrieve the current display resolution and frame rate using `Display.getMode()`.**

    `Display.getMode()` returns the current display resolution and refresh rate in a `Display.Mode` object.

3.  **Set the Display mode with the `WindowManager.LayoutParams.preferredDisplayModeId` property.**

    Applications use `WindowManager.LayoutParams.preferredDisplayModeId` property to initiate a mode switch. This allows the application to start up in Full HD (1080p) and then initiate a mode switch to 4K UHD when the user starts playback of 4K UHD content. Note the following:

    *  A mode switch will not be initiated during Activity transitions if both activities prefer the same mode.
    *  System and voice overlays will not initiate a mode switch.
    *  The display switches back to Full HD (1080p) resolution when either the application or activity terminates.
    *  The `Display.Mode` class definition aligns with Android Marshmallow.

4.  **Get notification for when the mode switch negotiation is complete.**

    Through the `onDisplayChanged(int displayId)` method, you can be notified when the mode switch negotiation is complete.

    `DisplayManager.DisplayListener` sends a callback when properties of logical display have changed. This callback will be received once the mode change is complete. Note that the displayed content may not be visible for a few seconds after the callback is received.

## Interface for developers

Applications can use these APIs directly via reflection, or they can use an Amazon provided wrapper (the 4K Extension Library) to access these APIs. The following code sample shows the mode change directly without the extension:

```java
WindowManager.LayoutParams mWindowAttributes = mTargetWindow.getAttributes();
try {
 if (attributeFlagField == null) {
  Class < ? > cLayoutParams = mWindowAttributes.getClass();
  attributeFlagField = cLayoutParams.getDeclaredField(sPreferredDisplayModeIdFieldName);
 }
 //attempt mode switch
 attributeFlagField.setInt(mWindowAttributes, modeId);
 mTargetWindow.setAttributes(mWindowAttributes);
} catch (Exception e) {
 Log.e(TAG, e.getLocalizedMessage());
}
```

The approach using the 4K Extension Library is covered in the next section.

## Amazon 4K Extension Library  {#amazonextension}

HDMI Mode Switch APIs in Fire TV (Gen 2) are not available in Android Lollipop SDK. To use them, you must use reflection. Amazon built the 4K Extension Library (provided in the form of source code) to demonstrate how to use the Android APIs and provide a helper class. 

<a href="https://s3.amazonaws.com/fire-tv-code-samples/4K-SupportLibrary-FireTVGen2-V-1-1.zip"><button class="feedbackButton noCrossRef">Download Amazon 4K Extension</button></a>

The extension ZIP file includes a sample app inside the Test folder called "DisplayModeCheckSample." There's also a Javadoc file, which you can view by expanding the **doc > javadoc** folder and opening the **index.html** file.

To build the app, go to **File > Open** in Android Studio and select the **DisplayModeCheckSample** project. Then click the **Run 'app'** button {% include inline_image.html file="firetv/fireappbuilder/images/fireappbuilder_runappbutton" type="png" %}. When you build the app, you will see a screen such as this:

{% include image.html file="firetv/getting_started/images/displaymode" type="png" %}

When you switch modes, the interstitial appears (on an Ultra HD TV) and the app switches to 4K Ultra HD mode.

Amazon’s 4K Extension Library contains the classes listed in the following sections. In addition, it includes the API for displaying the “Amazon Interstitial” to prepare customers for the HDMI Mode switch on Amazon 4K devices. The following sections describe these classes.

### UHDHelper class

`UHDHelpder` is a convenience class that wraps the 4K UHD capabilities and Mode Switch APIs. It provides the following public methods:
<style>
.classy {
background-color: white;
font-style: normal;
font-family: "Courier";
color: gray;
font-size: 110%;
}
</style>

{: .classy}
setPreferredDisplayModeId(Window targetWindow, int modeId, boolean allowOverlayDisplay)

This method lets you request a specific display mode (resolution and refresh rate). This method initiates a mode switch on the supported devices if the display is not currently set at the requested mode. `UhdHelperListener` is used to notify the application that the mode switch HDMI negotiation is complete.

{: .grid}
<table class="grid">
  <thead>
    <tr>
      <th>Parameters</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>targetWindow</code></td>
      <td>Window to use for setting the display and call parameters.</td>
    </tr>
    <tr>
      <td><code>modeId</code></td>
      <td>The desired mode to switch to. Must be a valid mode supported by the platform.</td>
    </tr>
    <tr>
      <td><code>allowOverlayDisplay</code></td>
      <td>Flag request to allow display overlay on applicable device.</td>
    </tr>
  </tbody>
</table>

Note that mode switch requests might not be successful, and you must verify the mode from `UHDHelperListener#onModeChanged(Display.Mode mode)` or call `getMode()`. You must wait until the mode switch is complete before starting content playback. Also, the mode switch works only with Fire TV (Gen 2)."

{: .classy}
getSupportedModes()

Determines all the supported modes on the connected device.

{: .grid}
<table class="grid">
  <thead>
    <tr>
      <th>Returns</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>An array of Mode objects or NULL if an error occurred.</td>
    </tr>
  </tbody>
</table>

{: .classy}
getMode()

Returns the current mode that the display is set to. This method is also used to determine the success of a mode switch. When a mode switch is in progress, the result of `getMode()` is undefined.

{: .grid}
<table class="grid">
  <thead>
    <tr>
      <th>Returns</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Mode that is currently set on the system or NULL if an error occurred.</td>
    </tr>
  </tbody>
</table>

### UhdHelperListener class

The `UhdHelperListener` class provides the `onModeChanged(Display.Mode mode)` method. This method is used to inform applications when the mode switch HDMI negotiation is complete. It also provides the current mode (which could be the requested mode) if the mode change was successful.

{: .grid}
<table class="grid">
  <thead>
    <tr>
      <th>Parameters</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>mode</code></td>
      <td>The Mode object containing the mode switched to, or NULL if there was a timeout or internal error while changing the mode.</td>
    </tr>
  </tbody>
</table>

### Display.Mode class

The `Display.Mode` class mirrors the [`Display.Mode`](https://developer.android.com/reference/android/view/Display.Mode.html) class in Android Marshmallow. This is used to describe a display mode’s resolution and refresh rate.

## Interstitial During Mode Switch  {#interstitial}

Because the customer experience is interrupted during an HDMI Mode switch, Amazon has built an interstitial that can be optionally displayed to prepare customers before the HDMI Mode switch. The code to trigger this interstitial is available with the Amazon Extension Library For 4K.

To display the interstitial through the extension code, call `setPreferredDisplayModeId(Window_targetWindow, int_modeId boolean_allowOverlayDisplay)` with `allowOverlayDisplay` set to `true`. The overlay will be shown for two seconds prior to the start of the mode switch.

{% include links.html %}
