---
title: 開発者ツールのオプション
permalink: fire-tv-system-xray-developer-tools.html
sidebar: firetv
product: Fire TV
reviewers: Dongjun Huang (primary), Andy Halverson (SA)
wikipage: https://wiki.labcollab.net/confluence/display/DEVTECH/DevTech+System+X-Ray
toc-style: kramdown
github: true
---

開発者ツールメニューには、リアルタイムのメトリックなど、アプリに関する各種情報が得られるオプションが豊富に用意されています。これらの情報は、トラブルシューティング、開発、テストで活用することができます。

* TOC
{:toc}

## 開発者ツールメニューを起動する

{% include content/{{site.language}}/fire/firetv-enabledevtools.md %}

以下のスクリーンショットは開発者ツールメニューのオプションを示しています。

{% include image.html file="firetv/getting_started/images/xray-devtooloptions" type="png" max-width="500px" %}

これらのツールの中には、第 1 世代のFire TV端末では利用できないものがあります。ただし、今後のリリースで第 1 世代の端末にも同じ開発者ツールメニューのオプションが実装される予定です。例外として、Fire TV Stick第 1 世代では、詳細オプション (マルチメディアオーバーレイ) は今後も利用できるようになる予定はありません。


## System X-Ray

System X-Rayは、リアルタイムのシステムメトリック情報を収集し、画面の上部にオーバーレイとして表示します。オンにすると、オーバーレイが常に画面に表示されるようになります。 

{% include image.html file="firetv/getting_started/images/firetv_xrayall" type="png" %}

System X-Rayのオーバーレイには、以下に関する詳細情報が表示されます。

*  ディスプレイ
*  CPU
*  メモリ
*  ネットワーク

System X-Rayの詳細については、「[Fire TVのSystem X-Rayオーバーレイ][fire-tv-system-xray]」を参照してください。

## 詳細オプション

Android MediaCodec APIが使用されている場合、詳細オプションをオンにするとマルチメディア情報を表示できます。このオプションをオンにしてメディアを再生すると、追加のパネルが右側に表示されます (パネル名の [MUL] はマルチメディアを表しています)。

{% include image.html file="firetv/getting_started/images/systemxray-multimedia" type="png" %}

{% include note.html content="詳細オプションは、Fire TV Stick第 1 世代では使用できません (システムリソースの制限のため)。今後のアップデートを適用しても、Fire TV Stick第 1 世代のデバイスでマルチメディアオーバーレイを表示できるようにはなりません。" %}

マルチメディアのパネルに表示される情報は、[AUDIO] と [VIDEO] の 2 つのセクションに分かれています。

**AUDIO**:

* Codec
* Hardware Accelerated
* Input Bitrate
* Secure

**VIDEO**: 

* Codec
* Hardware Accelerated
* Input Bitrate
* Secure
* Frames Dropped
* Resolution
* Frame Rate

## スナップショット

スナップショットは、`adb`コマンドでリアルタイムのメトリック情報をすべて収集できる機能です。次のコマンドを入力すると、メトリック情報がコマンドラインに表示されます。 

```
adb shell dumpsys activity service com.amazon.ssm/.OverlayService
```

このコマンドが正しく機能するには、System X-Rayが実行中である必要があります。

以下に出力例を示します。

```
SERVICE com.amazon.ssm/.OverlayService 3dde6680 pid=10820
  Client:
    [com.amazon.ssm.timestamp]: [2017-02-07 15:11:53]
    [com.amazon.ssm.display.resolution]: [1080]
    [com.amazon.ssm.display.refreshrate]: [60]
    [com.amazon.ssm.display.hdcpversion]: [1.0]
    [com.amazon.ssm.cpu.core0]: [30]
    [com.amazon.ssm.cpu.core1]: [29]
    [com.amazon.ssm.cpu.core2]: [0]
    [com.amazon.ssm.cpu.core3]: [0]
    [com.amazon.ssm.memory.appname]: [tv.twitch.android.viewer]
    [com.amazon.ssm.memory.appmemory]: [56.8 MB]
    [com.amazon.ssm.memory.activememory]: [1.3 GB]
    [com.amazon.ssm.memory.availablememory]: [231.3 MB]
    [com.amazon.ssm.network.rssi]: [-56]
    [com.amazon.ssm.network.systemdownloadspeed]: [2.2 Mbps]
    [com.amazon.ssm.network.appdownloadspeed]: [2.1 Mbps]
```

## 記録＆共有

{% include note.html content="記録＆共有は試験段階の機能であるため、問題が発生する可能性があることに注意してください。たとえば、メモリが大きすぎる場合、出力がタイムアウトになることがあります。" %}

記録＆共有を使用すると、CPU、メモリ、ネットワーク、マルチメディアに関するリアルタイムのメトリック情報を履歴データとしてデータベースに保存できます。同じ情報をSystem X-Rayオーバーレイではリアルタイムでグラフィカルに表示できますが、記録＆共有では取得した情報を履歴に保存できます。履歴はコマンドラインにダンプできます。

記録＆共有機能を使用するには、まず [開発者ツールメニュー] の [記録＆共有] の設定を [**オン**] にします。オンにすると [記録の設定] を選択するよう求められます。

{% include image.html file="firetv/getting_started/images/recordsettings" type="png" max-width= "400px" %}

これらのプロパティでは以下の要素を制御します。

* **間隔**: 記録を取る間隔です。2 秒、4 秒、8 秒、16 秒、32 秒の中から指定します。
* **持続時間**: データをデータベースに保存する期間です。1 時間、2 時間、4 時間、8 時間、16 時間の中から指定します。

デフォルト値 (間隔 2 秒、持続時間 1 時間) では、2 秒ごとに統計値が記録されてデータベースに保存されます。記録はデータベースに合計 1 時間保存されます。

メディアを再生し、ある程度情報が記録されたら、以下のコマンドを使用して、すべてのメトリック履歴をコマンドラインにダンプできます。

```
adb shell dumpsys activity service com.amazon.ssm/.OverlayService -all
```

以下の情報が返されます。

CPU:

* Timestamp
* cpu0
* cpu1
* cpu2
* cpu3

メモリ:

* Timestamp
* Total_Memory
* Available_Memory
* Active_Memory
* Foreground_App_Memory
* Foreground_App_PackageName

ネットワーク:

* Timestamp
* RSSI
* Download_Speed
* Foreground_App_Download_Speed
* Foreground_App_PackageName

マルチメディア:

* Timestamp
* AudioCodec
* AudioInputBitrate
* AudioAccelerated
* AudioSecure
* VideoCodec
* VideoInputBitrate
* VideoAccelerated
* VideoSecure
* VideoResolution
* VideoFramerate
* VideoFramedropped

コマンドラインに表示される情報の例を以下に示します。

```
 CPU
 Timestamp           cpu0 cpu1 cpu2 cpu3
 2016-10-31 11:40:22 19   16   13   18

 MEMORY
 Timestamp           Total_Memory Available_Memory Active_Memory Foreground_App_Memory Foreground_App_PackageName
 2016-10-31 11:40:23 919.3 MB     156.3 MB         731.8 MB      31.3 MB               com.amazon.ssm

 NETWORK
 Timestamp           RSSI Download_Speed Foreground_App_Download_Speed Foreground_App_PackageName
 2016-10-31 11:40:21 -41  14.4 kbps      0 bps                         com.amazon.ssm
 2016-10-31 11:40:23 -41  14.0 kbps      0 bps                         com.amazon.ssm
```

一部のメトリックだけが必要な場合は、コマンドに各種オプションを追加できます。たとえば、メモリとネットワークに関するメトリックの履歴をコマンドラインにダンプする場合は、以下のコマンドを使用します。

<pre>
adb shell dumpsys activity service com.amazon.ssm/.OverlayService <span class="red">-memory -network</span>
</pre>

利用可能なすべてのオプションを以下の表に示します。

| オプション | 説明 |
|-------|--------|
| 空白 <br/>(オプションの指定なし) | スナップショットの情報がダンプされます |
| `-snapshot` | スナップショットの情報がダンプされます |
| `-all` | データベースからすべての情報がダンプされます |
| `-memory`| データベースからメモリ情報がダンプされます |
| `-cpu` |  データベースからCPU情報がダンプされます |
| `-network` | データベースからネットワーク情報がダンプされます |
| `-multimedia` | データベースからマルチメディア情報がダンプされます |


利用可能なオプションを確認するには、`-help`パラメータを指定します。

```
adb shell dumpsys activity service com.amazon.ssm/.OverlayService -help
```

データベースに保存されているメトリックの記録は (持続時間が経過して自動的にデータが消去される前に) 消去することができます。消去するには、[**開発者ツールメニュー**] で [**記録＆共有**] を選択してから、リモコンの [**メニュー**] ボタンを押します。

{% include image.html file="firetv/getting_started/images/xraycleardb" type="png" max-width="500px" %}

## セーフゾーン

テレビによっては、画面のオーバースキャンが使用されています。オーバースキャンとは、表示画面の外側の情報を一部切り捨てて表示することです (モニターの差異に対応するため)。オーバースキャン領域には重要な情報を表示しないでください。

オーバースキャン領域を表示するには、[**セーフゾーン**] を [**オン**] にします。これにより、オーバースキャン領域を確認して、この領域に情報が表示されないようにすることができます。

{% include image.html file="firetv/getting_started/images/xraysafezone" type="png" %}

Fire TV Stick (第 2 世代) には画面サイズ調整機能がありません。画面表示がテレビ画面に正しく収まらない場合、オーバースキャン領域が正確に表示されないことがあります。

## 開発者オプション

{% include note.html content="この機能は現在開発中です。この機能に関する詳細は間もなく公開されます。" %}

現在、NetflixやHBO Goなどの一部のサードパーティアプリでは、Fire TVのホーム画面にある専用の行におすすめコンテンツが表示されます。

開発者オプションにある [Recommended By Your Apps] をオンにすると、この名前の行が NetlixやHBO Goの列に表示されます。この [Recommended By Your Apps] には、サードパーティアプリから送信されたおすすめコンテンツが表示されます。 

現時点では、この行をオンにすると、開発者のアプリが送信するおすすめコンテンツだけが表示されます。この機能の完全版がリリースされたら、ユーザーがインストールしたすべてのサードパーティアプリのおすすめコンテンツが表示されるようになります (独自の行におすすめコンテンツを表示するNetflixやHBO Goなどの一部のアプリを除く)。

## ネットワークアドバイザーを起動する

ネットワーク接続の強度やチャネルなどの詳細情報を確認できるネットワーク分析ウィンドウを起動します。問題がある場合は、ネットワークアドバイザーによって問題を修正するための推奨事項が提供されます。


## 関連項目

詳細については、以下を参照してください。

* [Fire TVのSystem X-Rayオーバーレイ][fire-tv-system-xray]
* [System X-Rayメトリックをカスタマイズする][fire-tv-system-xray-customized-metrics]

{% include links.html %}
