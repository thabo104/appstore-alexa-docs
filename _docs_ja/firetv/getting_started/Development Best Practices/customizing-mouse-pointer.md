---
title: マウスポインタのカスタマイズ
permalink: customizing-mouse-pointer.html
sidebar: firetv_ja
product: Fire TV
toc-style: kramdown
github: true
---

アプリがポインタベースの入力をサポートしている場合、Fire TVでは、ユーザーはUSBまたはBluetoothで接続されたマウスを使ってアプリを操作できます。デフォルトでは、マウスポインタは画面上に大きな円で表示されます。

{% include image.html alt="円形のポインタ" file="firetv/getting_started/images/pointer-circle-bg" type="png" %}

Androidマニフェスト (`AndroidManifest.xml`) に要素を追加することで、このマウスポインタの外見を矢印に変えることができます。

{% include image.html alt="矢印のポインタ" file="firetv/getting_started/images/pointer-arrow-bg" type="png" %}

{% include note.html content="Fire TVプラットフォームはマウスの使用をサポートしていますが、Fire TV対応アプリがAmazonアプリストアで承認されるためには、ナビゲーションとユーザー入力のプライマリモードとしてコントローラーを使用する必要があります。詳しくは、「[Amazon Fire TVでのコントローラーのサポート][supporting-controllers-on-amazon-fire-tv]」を参照してください。" %}

## Androidマニフェストに変更を加える

任意のアクティビティでデフォルトのマウスポインタを矢印に変更するには、マニフェストの`<activity>`内に`<meta-data>`要素を追加します。

```java
<activity
        android:name=".MyActivity"
        android:label="My Activity">
    ...
    <intent-filter>
        <action android:name="android.intent.action.MAIN" />
        <category android:name="android.intent.category.LAUNCHER"/>
    </intent-filter>
    <meta-data android:name="com.amazon.input.cursor" android:value="pointer"/>
</activity>
```

{% include links.html %}
