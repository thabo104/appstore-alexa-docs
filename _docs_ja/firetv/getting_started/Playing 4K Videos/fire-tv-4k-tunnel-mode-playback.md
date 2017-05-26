---
title: Tunnel Mode Playback (Fire TV Edition only )
permalink: fire-tv-4k-tunnel-mode-playback.html
sidebar: firetv_ja
product: Fire TV
toc-style: kramdown
github: true
---

{% include important.html content="The content on this page applies only for Fire TV Edition devices. For more general information about playing 4K video on Fire TV, see [Playing 4K Ultra HD Videos on Fire TV][fire-tv-4k-ultra-hd]." %}

Fire TV Edition's hardware decoder supports playback of 4K @ 60 FPS. To play back 4K @ 60 FPS, the timing requirement of media pipeline is aggressive and the app may not be able to render 4K frames at 16 msec interval due to thread and process scheduling limitations of the kernel. This may result into frame drops and a sub-par movie experience. To get the best out of the hardware, use Tunnel Mode playback.

* TOC
{:toc}

## How to Support Tunnel Mode Playback

The main changes required to support Tunnel Mode playback are as follows:

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

## More details about Tunnel Mode Playback

For more details refer to the Tunnel Mode Playback implementation in Exoplayer 2:
*  [Enable tunneling end-to-end](https://github.com/google/ExoPlayer/commit/f1e3d3f244ff90db6ea53a168c99fb710860e722)
*  [Support tunneling in video renderer](https://github.com/google/ExoPlayer/commit/60a3eda1e02e53b8ef8b977b70da4168695541fa)
*  [Report tunneling support via RendererCapabilities API](https://github.com/google/ExoPlayer/commit/e125ed705e0f9e33f54a6e397a2a443abedff0f7)
*  [Plumbing to enable tunneling on AudioTrack from renderers](https://github.com/google/ExoPlayer/commit/cd42434719bb79017be975d9048797267ee4ec4a)

{% include links.html %}
