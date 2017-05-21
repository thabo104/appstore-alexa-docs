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
    <li>AVC up to 4K @ 30fps</li>
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
*  Initiate a [mode switch][fire-tv-4k-apis-for-hdmi-mode-switch] only if the user enters the playback window or if the next title in the queue requires a different playback resolution / frame rate.

{% include note.html content="Fire TV (Gen 2) switches the display back to Full HD at 60 FPS whenever the activity that switched the display to 4K mode is paused. An activity can be paused in several ways, such as pressing \"BACK\" button, the \"HOME\" button, or programmatically launching another activity on top of it." %}

*HDMI Mode switch*

By default, Fire TV (Gen 2) operates at 1080p at 60 FPS mode even when connected to a 4K UHD TV. Hence, in order to play 4K UHD content, you must switch the TV to 4K UHD display mode. This switching between HDMI display modes is referred to as an *HDMI Mode switch*. The HDMI Mode switch is triggered by the application when it needs to play 4K UHD content. For more details about HDMI Mode switch, see [APIs for HDMI Mode Switch (Fire TV Gen 2 only)][fire-tv-4k-apis-for-hdmi-mode-switch].

*Amazon Extension Library for 4K*

Amazon developed an [Amazon Extension Library for 4K][fire-tv-4k-apis-for-hdmi-mode-switch#amazonextension] that provides high level APIs to trigger this [HDMI Mode switch][fire-tv-4k-apis-for-hdmi-mode-switch] and show a user-friendly overlay message before the TV starts switching the display mode. This overlay message improves the overall customer experience.

{% include note.html content="Fire TV (Gen 2) supports only up to 30 FPS for 4K UHD content. Fire TV Edition supports up to 60 FPS for 4K UHD content." %}

#### Special Notes for Fire TV Edition

Fire TV Edition's hardware decoder supports playback of 4K @ 60 FPS. To play 4K @ 60 FPS, the timing requirement of media pipeline is aggressive and the app may not be able to render 4K frames at 16 msec interval due to thread and process scheduling limitations of the kernel. This may result into frame drops and a sub-par movie experience. To get the best out of the hardware, use Tunnel Mode playback. For details, see [Tunnel Mode Playback][fire-tv-4k-tunnel-mode-playback].

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
   <li>MediaCodec that supports HEVC main10 L5 profile (The output will be in 8-bit Rec 709 color space for both 8-bit and 10-bit* color input.)</li>
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

\* Currently, 10-bit HEVC support on Fire TV Edition has known issue. The issue will be fixed in an upcoming release.

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
      <li>10-bit* Rec709 (HEVC Main10 profile L5) / 8-bit Rec709</li>
      <li>10-bit* Rec2020 (HEVC Main10 profile L5) / 8-bit Rec709</li>
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

\* Currently, 10-bit HEVC support on Fire TV Edition has known issue. The issue will be fixed in an upcoming release.

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
      <td>Varies with the dimensions of the TV. See the following table for details.</td>
      <td>2.1 W</td>
      <td>3.8 Watts</td>
      <td>1.7 Watts</td>
      <td>3.6 Watts</td>
    </tr>
  </tbody>
</table>

{% comment %}
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
      <th>Effective Date</th>
      <th>Screen Size (area A in square inches)</th>
      <th>Maximum TV Standby passive Mode Power Usage (watts)</th>
      <th>Maximum On Mode Power Usage (P in Watts)</th>
      <th>Minimum Power Factor for (P ≥ 100W)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td></td>
      <td>2.1 W</td>
      <td>3.8 Watts</td>
      <td>1.7 Watts</td>
      <td>3.6 Watts</td>
    </tr>
  </tbody>
</table>
 {% endcomment %}

Run the app 10 minutes before measuring the power consumption on the Fire TV Stick. For Fire TV, run the app for at least 30 minutes before taking the power measurement. Your power measurement can continue for 5 minutes.

If the power consumption from your app exceeds the limits in the previous table, Fire TV will throttle the performance of your app. If throttling is not enough, Fire TV will reset the system.

In your code, you can check for the device (whether Fire TV Stick or Fire TV) by looking for the `amazon.hardware.low_power` feature. See [Identifying Amazon Fire TV Devices][identifying-amazon-fire-tv-devices] for more details.


{% include links.html %}
