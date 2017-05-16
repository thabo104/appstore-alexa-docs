---
title: Playing 4K Ultra HD Videos on Fire TV
permalink: fire-tv-4k-ultra-hd.html
sidebar: firetv
product: Fire TV
toc-style: kramdown
github: true
---

Only Amazon Fire TV (Gen 2) and Amazon Fire TV Edition support playback of 4K UHD media. To support 4K playback, you must adhere to the supported output resolutions, DRM systems, and codecs for 4K UHD content.

{% include note.html content="Neither Fire TV <i>Stick</i> devices (Gen 1 or Gen 2) nor Fire TV Gen 1 devices support 4K UHD playback." %}

For details on Fire TV device naming conventions, see [Naming Conventions for Fire TV Devices][getting-started-developing-apps-and-games-for-amazon-fire-tv#firetvnames].

* TOC
{:toc}

## HDMI Mode switch (Fire TV Gen 2 Only)

By default, Fire TV (Gen 2) operates at 1080p at 60 FPS mode even when connected to a 4K UHD TV. Hence, in order to play 4K UHD content, you must switch the TV to 4K UHD display mode. This switching between HDMI display modes is referred to as an *HDMI Mode switch*. The HDMI Mode switch is triggered by the application when it needs to play 4K UHD content.

Amazon developed an [Amazon Extension Library for 4K](#amazonextension) that provides high level APIs to trigger this HDMI Mode switch and show a user-friendly overlay message before the TV starts switching the display mode. This overlay message improves the overall customer experience.

{% include note.html content="Fire TV (Gen 2) supports only up to 30 FPS for 4K UHD content. Fire TV Edition supports up to 60 FPS for 4K UHD content." %}

## Certification and Performance Testing

Apps that support Ultra HD video will be certified by Amazon to ensure they meet the required customer experience. Typically, certification takes a couple of weeks.

When you submit your app, add a note that it is 4K-enabled. Most likely in your app's description, you would already highlight to users that your app offers 4K Ultra HD media playback. But adding a manual note will also let Amazon know to apply 4K performance testing on the app during the certification process.

## 4K Ultra HD Specifications

This section provides information on the following specifications:

* [Resolution and Refresh Rate](#resolutionandrefreshrate)
* [DRM Systems](#drmsystems)
* [Codecs](#codecs)
* [Input/Output Color Formats](#inputoutputcolorformats)
* [Power Consumption](#powerconsumption)
* [Dolby Output Over Optical](#dolbyoutputoveroptical)

### Resolution and Refresh Rate {#resolutionandrefreshrate}

The following output resolutions are supported:

<table class="grid">
<colgroup>
  <col width="40%" />
  <col width="30%" />
  <col width="30%" />
</colgroup>
<thead>
<tr>
  <th>Feature</th>
  <th>Fire TV Edition</th>
  <th>Fire TV (Gen 2)</th>
</tr>
</thead>
<tbody>
<tr>
  <td>Supported output resolutions</td>
  <td><ul>
    <li>4K UHD at 24 FPS</li>
    <li>4K UHD at 25 FPS</li>
    <li>4K UHD at 30 FPS</li>
    <li>Full HD (1080p) up to 60 FPS</li>
    <li>4K UHD at 60fps</li>
  </ul>
  </td>
  <td><ul>
    <li>4K UHD at 24 FPS</li>
    <li>4K UHD at 25 FPS</li>
    <li>4K UHD at 30 FPS</li>
    <li>Full HD (1080p) up to 60 FPS</li>
  </ul>
  </td>
  </tr>
</tbody>
</table>

#### Special Notes for Fire TV Gen 2

Amazon Fire TV (Gen 2) is expected to stay mostly in Full HD (1080p) mode at 60 FPS, even on TVs that support 4K UHD format. Fire TV (Gen 2) switches to 4K UHD mode only for 4K UHD content playback.

The following frame rates are recommended when playing content:

*  For Full HD (1080p) and HD (720p) content, leave the device in **Full HD (1080p) 60 FPS mode** and use frame rate conversion from the content’s native frame rate (as in Fire TV - Gen 1).
*  For 4K UHD content, switch to the nearest 4K UHD mode before starting playback. For example, switch to **4K UHD at 24 FPS** to play 4k UHD content of **24 FPS or 23.97 FPS**, switch to **4K UHD at 25 FPS** to play content of **25 FPS**, and switch to **4K UHD at 30 FPS** to play content of **30 FPS or 29.97 FPS**.
*  Initiate a mode switch only if the user enters the playback window or if the next title in the queue requires a different playback resolution / frame rate.

{% include note.html content="Fire TV (Gen 2) switches the display back to Full HD at 60 FPS whenever the activity that switched the display to 4K mode is paused. An activity can be paused in several ways, such as pressing \"BACK\" button, the \"HOME\" button, or programmatically launching another activity on top of it." %}

#### Special Notes for Fire TV Edition

Fire TV Edition's hardware decoder supports playback of 4K @ 60 FPS. In order to playback 4K @ 60 FPS, the timing requirement of media pipeline is aggressive and the app may not be able to render 4K frames at 16 msec interval due to thread and process scheduling limitations of the kernel.

This may result into frame drops and a sub-par movie experience. To get the best out of the hardware, use Tunnel Mode playback. The main changes required to support Tunnel Mode playback are as follows:

1.  Generate a AudioTrack session ID from AudioManager.

    ```java
    audioSessionId = ((AudioManager)ctx.getSystemService(Context.AUDIO_SERVICE)).generateAudioSessionId();
    ```

2.  Configure Video Decoder for Tunnel mode:

    ```java
    format.setFeatureEnabled(MediaCodecInfo.CodecCapabilities.FEATURE_TunneledPlayback, true);
    ```

3.  Configure Video decoder with the AudioTrack session ID.

    ```java
    format.setInteger(android.media.MediaFormat.KEY_AUDIO_SESSION_ID, audioSessionId);
    ```

4.  Create AudioTrack with the session ID generated from AudioManager & set FLAG_HW_AV_SYNC flag.

    ```java
    AudioAttributes attr = new AudioAttributes.Builder()
     .setLegacyStreamType(AudioManager.STREAM_MUSIC)
     .setFlags(AudioAttributes.FLAG_HW_AV_SYNC)
     .build();
    AudioFormat fmt = new AudioFormat.Builder()
     .setEncoding(targetEncoding)
     .setSampleRate(sampleRate)
     .setChannelMask(channelConfig)
     .build();
    AudioTrack audioTrack = new android.media.AudioTrack(attr, fmt, bufferSize, 575 android.media.AudioTrack.MODE_STREAM, audioSessionId);
    ```

5.  Do not call `dequeueOutputBuffer` and `releaseOutputBuffer` for video decoder.
6.  Insert an 16 byte AV Sync header to the audio data being written to AudioTrack.

    ```java
    private ByteBuffer avSyncHeader = null;
    avSyncHeader = ByteBuffer.allocate(16);
    avSyncHeader.order(ByteOrder.BIG_ENDIAN);
    avSyncHeader.position(0);
    avSyncHeader.order(ByteOrder.BIG_ENDIAN);
    avSyncHeader.putInt(AVSYNC_START_CODE);
    avSyncHeader.putInt(bufferBytesRemaining);
    avSyncHeader.putLong(presentationTimeUs * 1000 );
    avSyncHeader.position(0);
    ```

This header contains a start code, presentation time (in nano secs), and size of data. Write this data before you write the audio data to audio track.

For more details refer to the Tunnel Mode implementation in Exoplayer 2:
*  [Enable tunneling end-to-end](https://github.com/google/ExoPlayer/commit/f1e3d3f244ff90db6ea53a168c99fb710860e722)
*  [Support tunneling in video renderer](https://github.com/google/ExoPlayer/commit/60a3eda1e02e53b8ef8b977b70da4168695541fa)
*  [Report tunneling support via RendererCapabilities API](https://github.com/google/ExoPlayer/commit/e125ed705e0f9e33f54a6e397a2a443abedff0f7)
*  [Plumbing to enable tunneling on AudioTrack from renderers](https://github.com/google/ExoPlayer/commit/cd42434719bb79017be975d9048797267ee4ec4a)

### DRM Systems {#drmsystems}

The following DRM solutions are supported:

<table class="grid">
<colgroup>
<col width="20%" />
<col width="40%" />
<col width="40%" />
</colgroup>
<thead>
<tr>
  <th>Feature</th>
  <th>Fire TV Edition</th>
  <th>Fire TV (Gen 2)</th>
</tr>
</thead>
<tbody>
<tr>
  <td>DRM</td>
  <td><ul>
    <li>Widevine L1/L3 DRM</li>
    <li>PlayReady DRM (2.5 max)</li>
    <li>HDCP 2.2 link to compatible panels</li>
  </ul>
  </td>
  <td><ul>
  <li>Widevine L1/L3 DRM</li>
  <li>PlayReady DRM (2.5 max)</li>
  <li>HDCP 2.2 link to compatible panels</li>
  </ul>
  </td>
  </tr>
</tbody>
</table>

### Codecs {#codecs}

The following codecs are supported:

<table class="grid">
<colgroup>
<col width="20%" />
<col width="40%" />
<col width="40%" />
</colgroup>
<thead>
<tr>
  <th>Feature</th>
  <th>Fire TV Edition</th>
  <th>Fire TV (Gen 2)</th>
</tr>
</thead>
<tbody>
<tr>
  <td>Codecs</td>
  <td><ul>
   <li>MediaCodec that supports HEVC main and high profiles up to L5.1</li>
   <li>MediaCodec that supports HEVC main10 L5 profile (The output will be in 8-bit Rec 709 color space for both 8-bit and 10-bit color input.)</li>
  </ul>
  </td>
  <td><ul>
  <li>MediaCodec that supports HEVC main L5 profile</li>
  <li>MediaCodec that supports HEVC main10 L5 profile (The output will be in 8-bit Rec 709 color space for both 8-bit and 10-bit color input.)</li>
  </ul>
  </td>
  </tr>
</tbody>
</table>

### Input/Output Color Formats {#inputoutputcolorformats}

The following color specs are supported:

<table class="grid">
<colgroup>
  <col width="20%" />
  <col width="40%" />
  <col width="40%" />
</colgroup>
<thead>
<tr>
  <th>Feature</th>
  <th>Fire TV Edition</th>
  <th>Fire TV (Gen 2)</th>
</tr>
</thead>
<tbody>
<tr>
  <td>Input Color Formats / Output Color Formats</td>
  <td>
    <ul>
      <li>8-bit Rec709 (HEVC Main profile L5) / 8-bit Rec709</li>
      <li>10-bit Rec709 (HEVC Main10 profile L5) / 8-bit Rec709</li>
      <li>10-bit Rec2020 (HEVC Main10 profile L5) / 8-bit Rec709</li>
    </ul>
  </td>
  <td>
    <ul>
      <li>8-bit Rec709 (HEVC Main profile L5) / 8-bit Rec709</li>
      <li>10-bit Rec709 (HEVC Main10 profile L5) / 8-bit Rec709</li>
      <li>10-bit Rec2020 (HEVC Main10 profile L5) / 8-bit Rec709</li>
    </ul>
  </td>
  </tr>
</tbody>
</table>

10-bit color input is supported by the codec, but the output does not support 10-bit output.

### Power Consumption {#powerconsumption}

The following table specifies the maximum allowed power consumption for Fire TV devices:

{: .grid}
<table class="grid">
   <colgroup>
      <col width="20%" />
      <col width="20%" />
      <col width="20%" />
      <col width="20%" />
      <col width="20%" />
   </colgroup>
  <thead>
    <tr>
      <th>Fire TV <br/>Edition</th>
      <th>Fire TV Stick <br/>(Gen 2)</th>
      <th>Fire TV <br/>(Gen 2)</th>
      <th>Fire TV Stick <br/>(Gen 1)</th>
      <th>Fire TV <br/>(Gen 1)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>3.8 Watts</td>
      <td>2.1 W</td>
      <td>3.8 Watts</td>
      <td>1.7 Watts</td>
      <td>3.6 Watts</td>
    </tr>
  </tbody>
</table>

Run the app 10 minutes before measuring the power consumption on the Fire TV Stick. For Fire TV, run the app for at least 30 minutes before taking the power measurement. Your power measurement can continue for 5 minutes.

If the power consumption from your app exceeds the limits in the previous table, Fire TV will throttle the performance of your app. If throttling is not enough, Fire TV will reset the system.

In your code, you can check for the device (whether Fire TV Stick or Fire TV) by looking for the `amazon.hardware.low_power` feature. See [Identifying Amazon Fire TV Devices][identifying-amazon-fire-tv-devices] for more details.

### Dolby Output Over Optical (Fire TV Edition only) {#dolbyoutputoveroptical}

By default, the speakers of Fire TV Edition support stereo output only, and hence apps can stream stereo content by default. But when the TV is connected to a sound bar or AVR via Optical audio output or HDMI (based on the Dolby system settings set by the user on Fire TV Edition), an app can choose to stream surround sound in Dolby audio format.

To support this, the app is required to read a Global setting `external_surround_sound_enabled` to decide if surround sound (AC3 and EAC3) is supported or not. If the value is `1`, Dolby audio is supported. If the value is `0`, the app can further use other means (such as [ACTION_HDMI_AUDIO_PLUG](https://developer.android.com/reference/android/media/AudioManager.html#ACTION_HDMI_AUDIO_PLUG intent of AudioManager) to decide if surround sound is supported or not.
Refer to this Exoplayer patch ([ Added support for Surround Sound detection for Optical out](https://github.com/amzn/exoplayer-amazon-port/commit/e000b356e7b5be2bd79dca9152c4556b798112bb) for reference.

## APIs for HDMI Mode Switch (Fire TV Gen 2 only)

Google introduced 4K [`Display.Mode`](https://developer.android.com/about/versions/marshmallow/android-6.0.html#4K-display) APIs in Android Marshmallow. `Display.Mode` allows applications to query physical display sizes and switch to a different HDMI display mode.

Amazon implemented `Display.Mode` APIs in Fire TV (Gen 2) running Fire OS 5 (based on Android L). Apps can use these APIs for the HDMI Mode switch.

Since these APIs are not part of Android API Level 21 (Lollipop) in Android SDK, the apps can use “reflection” to access the APIs.  Alternatively, app developers can use the [4K Extension Library](#amazonextension) developed by Amazon, which wraps these Android APIs via reflection and provides a simple interface for them.

You can also display an optional interstitial developed by Amazon to prepare customers for the HDMI Mode switch. This interstitial is distributed as part of the Amazon Extension Library For 4K.

Fire OS will also provide a `sys.display-size` system property to report the maximum supported resolution of the connected display.

## Steps for Using HDMI Mode Switch (Fire TV Gen 2 only) {#hdmimodeswitch}

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

## Interface for developers (Fire TV Gen 2 only)

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

## Amazon 4K Extension Library (Fire TV Gen 2 only) {#amazonextension}

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

## Interstitial During Mode Switch (Fire TV Gen 2 only) {#interstitial}

Because the customer experience is interrupted during an HDMI Mode switch, Amazon has built an interstitial that can be optionally displayed to prepare customers before the HDMI Mode switch. The code to trigger this interstitial is available with the Amazon Extension Library For 4K.

To display the interstitial through the extension code, call `setPreferredDisplayModeId(Window_targetWindow, int_modeId boolean_allowOverlayDisplay)` with `allowOverlayDisplay` set to `true`. The overlay will be shown for two seconds prior to the start of the mode switch.

{% include links.html %}
