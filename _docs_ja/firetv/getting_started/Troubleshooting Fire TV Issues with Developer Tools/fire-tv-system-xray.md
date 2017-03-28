---
title: Fire TVのSystem X-Rayオーバーレイ
permalink: fire-tv-system-xray.html
sidebar: firetv
product: Fire TV
reviewers: Dongjun Huang (primary), Andy Halverson (SA)
toc: false
github: true
---

System X-Rayは、Fire TV端末のアプリやシステムの問題を特定する際に役立つ、企業や個人の開発者向けツールです。System X-Rayは、システムメトリック情報を瞬時に収集し、画面の上部にオーバーレイとして表示します。オンにすると、ビデオの再生中やゲームのプレイ中など、ユーザーがアプリケーションを実行しているときにも、オーバーレイが画面に常に表示されるようになります。

System X-Rayは、Fire OSバージョン 5.0.2 以降を搭載しているすべてのAmazon Fire TVおよびFire TV Stickデバイスで利用できます。

* TOC
{:toc}

## System X-Rayを有効にする

{% include content/{{site.language}}/fire/firetv-enabledevtools.md %}

[開発者ツールメニュー] ダイアログボックスが表示されたら、System X-Rayを [**オン**] にします。

{% include image.html file="firetv/getting_started/images/xray-devtooloptions" type="png" max-width="500px" %}

(ダイアログボックスを閉じるには、[戻る] ボタンを押します。)System X-Rayをオンにすると、横長の長方形のオーバーレイが画面に表示され、そこにさまざまな種類の情報が表示されます。

{% include image.html file="firetv/getting_started/images/firetv_xrayall" type="png" %}

System X-Rayのオーバーレイは、アプリを変更したりFire TVで移動の操作をしたりしても、表示され続けます。System X-Rayのオーバーレイは、以下の 4 つのセクションに分かれています。

*  [ディスプレイ (DIS)](#dis)
*  [CPU (CPU)](#cpu)
*  [メモリ (MEM)](#mem)
*  [ネットワーク (NET)](#net)

## ディスプレイ (DIS) {#dis}

{% include image.html file="firetv/getting_started/images/firetv_xraydisplay" type="png" %}

ディスプレイセクションには以下が表示されます。

* **HDMIモード**: ディスプレイの**物理的な高さ** (ピクセル単位) と**リフレッシュレート** (1 秒あたりのフレーム数) が表示されます。たとえば、"1080p 60" と表示される場合は、ディスプレイの物理的な高さが 1080 ピクセルであり、リフレッシュレート (1 秒あたりのフレーム数) が 60 であることを表しています。* **HDCP**: HDMIケーブルからテレビに送信されるコンテンツの暗号化のためにFire TVが使用しているHDCP (High-bandwidth Digital Content Protection) のバージョンを示しています。

Amazon Fire TVでは、[設定] > [ディスプレイとサウンド] > [Display] > [Video Resolution] の順に移動して解像度を変更できます。ただし、ネットワークやシステムリソースの状態を考慮し、ユーザーエクスペリエンスを向上させるために、ユーザーがどの解像度を選択した場合でもアプリでその解像度を変更することができます。たとえば、YouTubeアプリでビデオを再生する際にネットワーク接続が遅い場合は、再生がスムーズに継続するようアプリによって解像度を下げることができます。

## CPU {#cpu}

{% include image.html file="firetv/getting_started/images/firetv_xraycpu" type="png" %}

CPU (中央処理装置) セクションには、デバイスのコアごとにリアルタイムのCPU使用量 (%) が異なる色で表示されます。各列がそれぞれのコアを表しています。CPU使用率は以下のように表示されます。

*  0% ～ 33% (低い使用率) の場合は<span style="color: green">緑色</span>で表示
*  34% ～ 66% (中程度の使用率) の場合は<span style="color: orange">オレンジ色</span>で表示
*  67% ～ 100% (高い使用率) の場合は<span style="color: red">赤色</span>で表示

Amazon Fire TV端末にコアが 2 つしかない場合 (Fire TV Stickの場合)　は、2 列しか表示されません。

CPU使用率は、CPUを大量に消費するアプリを特定する際に役立ちます。使用率が常に高いコアがある場合、処理をマルチスレッド化する必要がある可能性があります。

## メモリ {#mem}

{% include image.html file="firetv/getting_started/images/firetv_xraymemory" type="png" %}

メモリセクションには、**アプリ** (<span style="color: blue">青色</span>)、**その他** (<span style="color: gray">灰色</span>)、および**使用可能** (<span style="background-color: gray; color: white; padding: 1px;">白色</span>) というラベル付きのバーが表示されます。

*  **<span style="color: blue">青色の部分</span>**: アプリ &ndash; メモリ (具体的には、GPUメモリではなく、フォアグラウンドアプリの[Proportional Set Size (PSS)](https://en.wikipedia.org/wiki/Proportional_set_size)) の使用量とフォアグラウンドアプリのパッケージ名が表示されます。フォアグラウンドアプリのパッケージ名はバーの下に表示されます。ホーム画面が表示されている場合は、`com.amazon.tv.launcher`がアプリ名として表示されます。
*  **<span style="color: gray">灰色の部分</span>**: その他 &ndash; その他のアプリケーションによるメモリ使用量を示しています。
*  **<span style="background-color: gray; color: white; padding: 1px;">白色の部分</span>**: 使用可能なメモリ &ndash; デバイスの使用可能なメモリ (空きメモリ) を示しています。

この例では、44.7 MBのメモリがFire TVランチャーに、744.8 MBがシステム全体によって使用されており、849.3 MBが使用可能です。

メモリ情報は、以下のような問題を特定する際に使用できます。

* アプリのメモリリーク
* 過度のメモリ消費
* デバイスのメモリ不足の状態

## ネットワーク {#net}

{% include image.html file="firetv/getting_started/images/firetv_xraynetwork" type="png" %}

ネットワークセクションには、WiFi信号の強度と、デバイス全体および表示中のアプリのダウンロード速度が表示されます。各ラベルの説明は以下のとおりです。

* **RSSI (受信信号強度)**: WiFi信号の強度 (dBm単位) を示しています。バーは信号の強度を示しています。CPUセクションと同じ色分けで問題の重大さが表されます (<span style="color: green">緑色</span>は強い信号、<span style="color: orange">オレンジ色</span>は中程度の信号、<span style="color: red">赤色</span>は弱い信号を表します)。数値は常に負の数です。信号が強いと数値は 0 に近づきます。Amazon Fire TVがWiFiではなく有線で接続されている場合、RSSIは表示されません。* **システム**: デバイスに実際にダウンロードされているデータ量 (bps単位) が測定されます (表示中およびバックグラウンドのアプリの両方を含む)。これは、利用可能な帯域幅を示すものではありません。0 bpsと表示されている場合、その瞬間はデータがダウンロードされていません。* **表示**: 表示中のアプリ (フォアグラウンドのアプリ) によって実際にダウンロードされているデータ量 (bps単位) が測定されます。この数値は、システムのダウンロード速度よりも高くなることはありません。

ネットワークセクションの情報を使用して、以下のような問題を診断できます。

* 接続の問題
* 遅いダウンロード速度
* 低品質のストリーム (メディアプレーヤーによって選択された品質)


## 関連項目

詳細については、以下を参照してください。

* [開発者ツールのオプション][fire-tv-system-xray-developer-tools]
* [System X-Rayメトリックをカスタマイズする][fire-tv-system-xray-customized-metrics]

{% include links.html %}
