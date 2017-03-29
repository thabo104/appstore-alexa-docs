---
title: Fire TV対応のメディアプレーヤー
permalink: fire-tv-media-players.html
sidebar: firetv
product: Fire TV
toc-style: kramdown
github: true
---

Androidのメディア再生APIおよびメディア暗号化API (MediaCodec`、`MediaCrypto`、`AudioTrack`クラスなど) を使用しているメディアプレーヤーは、いずれもAmazon Fire TVプラットフォームで動作します。無料と有料の推奨プレーヤーの一部を以下に示します。

**無料**:

*  [ExoPlayerのAmazon版](../fire-tv-media-players.md#exoplayer)
*  [Android MediaPlayer](../fire-tv-media-players.md#androidmediaplayer)

**有料**:

*  [VisualOn OnStream MediaPlayer](../fire-tv-media-players.md#visualon)
*  [NexStreaming NexPlayer SDK](../fire-tv-media-players.md#nexplayer)

Amazon Fire TVでサポートされているオーディオ形式とビデオ形式の詳細については、「[Fire TV端末の仕様][device-and-platform-specifications]」を参照してください。

Android L (最新のFire TVでサポート) で利用できる標準のAndroid APIを使用して独自のカスタムメディアプレーヤーを開発することもできます。

* TOC
{:toc}

## ExoPlayerのAmazon版 {#exoplayer}

ExoPlayerは、Androidのメディアアプリ向けにGoogleが開発したオープンソースのメディアプレーヤーです。ExoPlayerの詳細については、以下のリソースを参照してください。

*  [ExoPlayerホームページ](https://developer.android.com/guide/topics/media/exoplayer.html)
*  [GoogleによるExoPlayerのビデオ](https://www.youtube.com/watch?v=6VjF638VObA)
*  [ExoPlayerの開発者ガイド](http://google.github.io/ExoPlayer/guide.html)

Amazonでは、Fire TVに対応したExoPlayerの移植版を用意しています。Fire TV対応アプリにデフォルトのExoPlayerを組み込む代わりに、ExoPlayerのAmazon版を使用してください。ExoPlayerのAmazon版では、ExoPlayerをAmazonデバイスで動作させるための修正、回避策、およびその他のパッチが数多く提供されています。

ExoPlayerの使用方法の詳細については、前述のExoPlayerの標準のリソースを参照してください。

<a href="https://github.com/amzn/exoplayer-amazon-port"><button class="feedbackButton">ExoPlayerのAmazon版のダウンロード</button></a>

## Android MediaPlayer {#androidmediaplayer}

Fire TVでは、オーディオとビデオの再生を処理する[Android MediaPlayer](https://developer.android.com/reference/android/media/MediaPlayer.html)の標準のクラスがサポートされています。このメディアクラスを使用すれば、アプリで基本的なメディア再生を処理できます。ただし、もっと高度なメディアが必要な場合は、ExoPlayerのAmazon版 (または有料メディアプレーヤー) をお勧めします。

## VisualOn OnStream MediaPlayer {#visualon}

[VisualOn OnStream MediaPlayer](http://visualon.com/onstream-mediaplayer)を使用すると、Fire TV対応アプリに暗号化されたメディアの再生機能を組み込むことができます。VisualOn は、HLSを使用するAES 128 ビット暗号化、DASHプロトコルとスムーズストリーミングプロトコルを使用するPlayReady DRM、およびAES 608 と 708 のクローズドキャプションをサポートします。

ExoPlayerとは異なり、Fire TV対応アプリでVisualOn OnStream MediaPlayerを使用するには、VisualOnからライセンスを購入する必要があります。

## NexStreaming NexPlayer SDK {#nexplayer}

[NexStreaming NexPlayer SDK](http://www.nexstreaming.com/index.php)はAmazon Fire TVでサポートされています。VisualOnと同様に、このメディアプレーヤーは、DASH、DRMコンテンツ、Smooth Streaming、HTTPライブストリーミング (HLS) など、一連の強力なメディア再生機能を備えています。

VisualOnと同じく、Fire TV対応アプリでこのプレーヤーを使用するには、ライセンスを購入する必要があります。

{% include links.html %}
