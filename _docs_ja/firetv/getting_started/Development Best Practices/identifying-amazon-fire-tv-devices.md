---
title: Amazon Fire TV端末を識別する
permalink: identifying-amazon-fire-tv-devices.html
sidebar: firetv
product: Fire TV
toc: false
github: true
---

Amazon Fire TV端末を識別するには、機能に`amazon.hardware.fire_tv`があるかどうかを確認します。

次の表は、各種Fire TV端末の機能の一覧を示しています。

<style>
td.center {
text-align: center;
 }
</style>
 
<table class="grid">
<colgroup>
  <col width="40%" />
  <col width="15%" />
  <col width="15%" />
  <col width="15%" />
  <col width="15%" />
</colgroup>
<thead>
<tr>
  <th>機能</th>
  <th>Fire TV Stick <br/>(第 2 世代)</th>
  <th>Fire TV <br/>(第 2 世代)</th>
  <th>Fire TV Stick <br/>(第 1 世代)</th>
  <th>Fire TV <br/>(第 1 世代)</th>
</tr>
</thead>
<tbody>
<tr>
  <td><code>amazon.hardware.fire_tv</code></td>
  <td class="center"> ✓ </td>
  <td class="center"> ✓ </td>
  <td class="center"> ✓ </td>
  <td class="center"> ✓ </td>
</tr>
<tr>
  <td><code>amazon.hardware.low_power</code></td>
  <td class="center"> ✓ </td>
  <td class="center"> </td>
  <td class="center"> ✓ </td>
   <td class="center"> </td>
</tr>
<tr>
  <td><code>amazon.hardware.uhd_capable</code></td>
  <td class="center"></td>
  <td class="center"> ✓ </td>
  <td class="center"> </td>
  <td class="center"> </td>
   
</tr>
<tr>
  <td><code>amazon.software.drm_teardown</code></td>
  <td class="center"></td>
  <td class="center"></td>
  <td class="center"></td>
   <td class="center"> ✓ </td>
</tr>
<tr>
<td><code>android.hardware.type.television</code></td>
  <td class="center"> ✓ </td>
  <td class="center"> ✓ </td>
  <td class="center"> ✓ </td>
  <td class="center"> ✓ </td>
</tr>
</tbody>
</table>

Fire TV端末は例外なく、機能`amazon.hardware.fire_tv`の有無で識別できます。

この機能を取得するには、[`Context`][2]オブジェクトに対して[`getPackageManager()`][1] メソッドを呼び出し、[`hasSystemFeature()`][3] から`com.hardware.amazon.fire_tv`が返されるかどうかを確認します。コードサンプルを次に示します。

```java
final String AMAZON_FEATURE_FIRE_TV = "amazon.hardware.fire_tv";

if (getPackageManager().hasSystemFeature(AMAZON_FEATURE_FIRE_TV)) {
 Log.v(TAG, "Yes, this is a Fire TV device.");
 } else {
  Log.v(TAG, "No, this is not a Fire TV device.");
 }
```

## Fire TV端末を確認する理由

コードでFire TV端末の確認が必要になる理由は、さまざまあります。

*  文字列を選択したり特別なサービス (無料のPlexサービスなど) を提供したりするためにAmazon Fire TVを識別するため。
*  アプリが`onPause()` メソッドでDRMとHWのデコードパイプラインを切断する必要があるかどうかを判断するため (これは、Fire TVの第 1 世代とFire TV Stickでは複数のDRMコンテキストを適切に処理できないために必要になります)。
*  TVプラットフォームに、UIを操作するためのD-pad (ナビゲーション) コントローラーが必要かどうかを確認するため。
*  アプリで 4K Ultra HDを再生する必要があるかどうかを判断するため。

## モデルを確認する

以前は、`android.os.Build.MODEL`と`Build.MANUFACTURER`を組み合わせることで、Fire TV端末を識別できました。今後、発売されるAmazonの端末が増えると、この方法は正しく機能しなくなります。 

個々のAmazon製品モデルに基づいて動作を完全に切り替える必要がある場合に、`MODEL`名が使用されることがあります。このようなコードは今後の端末では動作しなくなる可能性があるため、ご注意ください。`com.hardware.amazon.fire_tv`機能をベースにし、今後のFire TV端末でも認識できる代替の手法を含めるようにしてください。

Fire TV端末を表す[`android.os.Build.MODEL`][4]値は次のとおりです。

<table class="grid">
<colgroup>
  <col width="20%" />
  <col width="20%" />
  <col width="20%" />
  <col width="20%" />
</colgroup>
<thead>
<tr>
  <th>Fire TV Stick (第 2 世代)</th>
  <th>Fire TV (第 2 世代)</th>
  <th>Fire TV Stick (第 1 世代)</th>
  <th>Fire TV (第 1 世代)</th>
</tr>
</thead>
<tbody>
<tr>
  <td><code>AFTT</code></td>
  <td><code>AFTS</code></td>
  <td><code>AFTM</code></td>
  <td><code>AFTB</code></td>
</tr>
</tbody>
</table>

次に示す、モデルを調べるコードサンプルは、この機能を使用した代替手法です。

```java
final String AMAZON_FEATURE_FIRE_TV = "amazon.hardware.fire_tv";
String AMAZON_MODEL = Build.MODEL;

if (AMAZON_MODEL.matches("AFTS")) {
 Log.v(TAG, "Yes, this is a Fire TV Gen 2 device.");
} else if (getPackageManager().hasSystemFeature(AMAZON_FEATURE_FIRE_TV)) {
 Log.v(TAG, "Yes, this is a Fire TV device.");
} else {
 Log.v(TAG, "No, this is not a Fire TV device");
}
```

[1]: https://developer.android.com/reference/android/content/Context.html#getPackageManager()
[2]: https://developer.android.com/reference/android/content/Context.html
[3]: https://developer.android.com/reference/android/content/pm/PackageManager.html#hasSystemFeature(java.lang.String)
[4]: https://developer.android.com/reference/android/os/Build.html#MODEL