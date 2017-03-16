---
title: System X-Rayメトリックをカスタマイズする
permalink: fire-tv-system-xray-customized-metrics.html
sidebar: firetv
product: Fire TV
reviewers: Dongjun Huang (primary), Andy Halverson (SA)
toc: false
github: true
---

System X-Rayのメトリックの表示は、表示したい情報を送信することでカスタマイズできます。この機能を使用すると、静的な情報のほか、メトリックが各種しきい値を超えたとき、イベントが発生したときに、有益な情報を表示できます。

{% include note.html content="開発者ツールオプションメニューの表示方法や、オーバーレイに表示されるメトリックの読み方など、System X-Rayの概要については、「[Fire TVのSystem X-Rayオーバーレイ][fire-tv-system-xray]」を参照してください。" %}

* TOC
{:toc}

## カスタムメトリックを作成する

定義したメトリックが含まれた[インテント](https://developer.android.com/reference/android/content/Intent.html)がアプリによってブロードキャストされ、System X-Rayで受信されると、アプリセクションが表示されます。以下のコードは、System X-Ray用のインテントの作成方法を示しています。

```java
private void updateMetrics(Context context) {

// インテントを初期化
Intent intent = new Intent("com.amazon.ssm.METRICS_UPDATE");
intent.putExtra("com.amazon.ssm.PACKAGENAME", context.getPackageName());

// メトリックを追加
intent.putExtra("Metrics1", "First metric");
intent.putExtra("Color1", "green");

intent.putExtra("Metrics2", "Second metric");
intent.putExtra("Color2", "yellow");

intent.putExtra("Metrics3", "Third metric");
intent.putExtra("Color3", "red");

// 送信
context.sendBroadcast(intent);
}
```

このサンプルでは、[`Context`](https://developer.android.com/reference/android/content/Context.html)クラスを使用して、環境に必要なリソースとクラスを取得しています。

アクション`com.amazon.ssm.METRICS_UPDATE`でインテントを初期化して、エクストラとしてアプリのパッケージ名を追加します。アプリがフォアグラウンドにある場合、System X-Rayはアプリセクションのみを表示するため、パッケージ名は必須です。このコードをアクティビティに配置すると、[`getPackageName()`](https://developer.android.com/reference/android/content/Context.html#getPackageName()) ヘルパーメソッドを呼び出すことができます。

メトリックの名前は`Metrics1`、`Metrics2`、`Metrics3` のいずれかにする必要があります。これ以外の名前は無視されます。メトリックの値には任意の文字列を設定できますが、切り捨てられる場合があることに注意してください。System X-Rayは、各メトリックを`[name]:[value]`という形式で表示します。

メトリックのデフォルトの色は灰色です。色を変更するには、インテントにエクストラを追加する必要があります。エクストラの名前は`Color1`、`Color2`、`Color3` のいずれかにする必要があります。値は`red`、`yellow`、`green`、`blue`を指定できます。色を適用するためにメトリック名と色名に同じ数字を入れる必要があります。たとえば、`Metrics1`には`Color1`が適用されます。色の値は互いに独立しているため、色が同じメトリックを複数使用できます。

インテントを設定できたら、`sendBroadcast(Intent)` メソッドを呼び出すことができます。System X-Rayが有効になっていれば、`App`というセクションが追加され、インテントで定義したメトリックが表示されます。メトリックの値や色を変更する場合は、値または色を変更したインテントを再度作成して送信する必要があります。

System X-Rayで複数のメトリックを追跡している場合は、一部のメトリックしか変更しなかった場合でも、System X-Rayではメトリックの状態がキャッシュされないため、すべてのメトリックの状態を再度送信する必要があります。一部しか送信しない場合、送信しなかったメトリックはSystem X-Rayから削除されます。

## カスタムメトリックの例

この機能の使用例をいくつか説明します。

### 静的な情報

アプリを複数のFire TV端末でテストする場合や複数のWiFiネットワークを使用する場合は、テストしているFire TVモデルや、Fire TVが使用しているWiFiネットワークのSSIDを確認できると便利です。アプリの起動時にこの情報を取得して、System X-Rayに送信できます。以下のコードで、静的な情報を表示する方法の例を示します。

```java
private void updateMetrics(Context context, String buildModel, String ssid) {
    // インテントを初期化
    Intent intent = new Intent("com.amazon.ssm.METRICS_UPDATE");
    intent.putExtra("com.amazon.ssm.PACKAGENAME", context.getPackageName());

    // メトリックを追加
    intent.putExtra("Metrics1", buildModel);
    intent.putExtra("Metrics2", ssid);

    // 送信
    context.sendBroadcast(intent);
}
```

上のコードを入力すると、下の画像のように表示されます。この画像では、Fire TV端末のモデルがAFTS (ボックスタイプのFire TVの第 2 世代) であることが示されています。また、Fire TVがGuestというネットワークに接続されていることも示されています。

{% include image.html file="firetv/getting_started/images/systemxray_custom1" type="png" max-width="150px" %}

### しきい値

メトリックが各種しきい値を超えているかどうかを追跡する必要がある場合もあります。たとえば、アプリにビデオコンテンツがあり、ビデオ再生中のドロップフレーム数を追跡したいとします。その場合、たとえば 5 フレーム未満の場合は緑色、5 ～ 9 フレームの場合は黄色、10 フレーム以上の場合は赤色で表示するよう設定できます。

ドロップフレーム数が更新されると、それに応じて色がしきい値に対応する色に変わります。以下のコードサンプルは、しきい値の設定方法を示しています。

```java
private void updateMetrics(Context context, int numFrameDrops, String frameDropStatus) {
    // インテントを初期化
    Intent intent = new Intent("com.amazon.ssm.METRICS_UPDATE");
    intent.putExtra("com.amazon.ssm.PACKAGENAME", context.getPackageName());

    // メトリックを追加
    intent.putExtra("Metrics1", "FrameDrops:"+numFrameDrops);
    intent.putExtra("Color1", frameDropStatus);

    // 送信
    context.sendBroadcast(intent);
}
```

以下のスクリーンショットは、各しきい値範囲に該当する場合にどのように表示されるかを示しています。

{% include image.html file="firetv/getting_started/images/systemxray_custom2" type="png" max-width="500px" %}

### イベント

イベントログは便利ですが、イベントが発生した時刻を見やすい方法で追跡したい場合もあります。たとえば、テストで 3 時間ビデオを再生した結果、例外が断続的にスローされることが判明する場合があります。イベントの設定方法の例を以下に示します。

```java
private void updateMetrics(Context context, String message, String time) {
    // インテントを初期化
    Intent intent = new Intent("com.amazon.ssm.METRICS_UPDATE");
    intent.putExtra("com.amazon.ssm.PACKAGENAME", context.getPackageName());

    // メトリックを追加
    intent.putExtra("Metrics1", message);
    intent.putExtra("Color1", "Red");

    intent.putExtra("Metrics2", "Time:"+time);
    intent.putExtra("Color2", "Red");

    // 送信
    context.sendBroadcast(intent);
}
```

以下のスクリーンショットは、例外とその発生時刻が表示されています。

{% include image.html file="firetv/getting_started/images/systemxray_custom3" type="png"  max-width="150px" %}

## 関連項目

詳細については、以下を参照してください。

* [Fire TVのSystem X-Rayオーバーレイ][fire-tv-system-xray]
* [開発者ツールのオプション][fire-tv-system-xray-developer-tools]

{% include links.html %}
