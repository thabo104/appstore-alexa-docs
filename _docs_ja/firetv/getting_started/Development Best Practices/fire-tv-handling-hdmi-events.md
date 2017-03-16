---
title: HDMIイベントの処理
permalink: fire-tv-handling-hdmi-events.html
sidebar: firetv
product: Fire TV
toc: false
github: true
---

ユーザーがHDMIケーブルを接続または切断したとき、アプリによってHDMIイベントが以下のガイドラインに沿って処理される必要があります。

* TOC
{:toc}

## HDMIの切断

テレビの電源がオフにされた場合、テレビへの入力が別のHDMIポートに切り替えられた場合、またはHDMIケーブルの接続が物理的に解除された場合のHDMIの切断について推奨される動作は次のとおりです。

*  ビデオを再生するアプリは、テレビの電源がオフになるかHDMIケーブルが切断された場合、再生を一時停止する*必要があります*。テレビの電源がオンになるかHDMIケーブルが接続された後も、ユーザーがリモコンの再生ボタンを明示的に押すまで、再生は一時停止状態のままにする必要があります。*  オーディオだけを再生するアプリは、HDMIが切断された場合でも、Fire TVが光デジタルケーブルに繋がった別のオーディオデバイス (Fire TV第 1 世代のみ)、Bluetooth A2DPヘッドセット、またはゲームコントローラーに繋がったオーディオヘッドセットに接続されていれば、再生を続けることが*可能です*。
 
## アプリにHDMIイベントを認識させる

アプリに接続または切断を認識させるには、HDMIが接続されているかどうかを示すエクストラ ([`EXTRA_AUDIO_PLUG_STATE`][2]) が含まれたインテントのブロードキャストアクション[`ACTION_HDMI_AUDIO_PLUG`][1]をリッスンします。

## その他の接続イベント

光デジタルケーブル (Fire TV第 1 世代のみ)、オーディオヘッドセット、またはBluetooth A2DPヘッドセットがFire TVに接続されている場合は、Android LollipopベースのFire OS 5 以降で接続イベントを認識する確実な方法がありません。 

そのため、この動作を制御するユーザー設定をアプリに用意することをお勧めします。
 
 
[1]: https://developer.android.com/intl/reference/android/media/AudioManager.html#ACTION_HDMI_AUDIO_PLUG
[2]: https://developer.android.com/reference/android/media/AudioManager.html#EXTRA_AUDIO_PLUG_STATE