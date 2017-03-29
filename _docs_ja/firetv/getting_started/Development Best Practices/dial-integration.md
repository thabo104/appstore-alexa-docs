---
title: DIALの統合
permalink: dial-integration.html
sidebar: firetv
product: Fire TV
toc-style: kramdown
github: true
---

Amazon Fire TV端末は、Whisperplayサービスを介した[DIAL (Discovery-and-Launch) プロトコル][1]をサポートしています。DIALはオープンプロトコルの 1 つで、これを使用すると、別の端末からセカンドスクリーンアプリを使用してFire TV対応アプリを検出し、起動できるようになります。そのためには、Fire TVとセカンドスクリーン端末が同じネットワークに存在する必要があります。

DIALは、キャスティングやミラーリングの機能を提供するAPIではありません。セカンドスクリーン端末のアプリがFire TVでアプリを見つけて起動できるようにするだけです。通常は、セカンドスクリーンアプリ (起動メッセージの送信側) と、対応するFire TV対応アプリ (メッセージの受信する側) の両方を実装します。

オープンDIALプロトコルの詳細と、アプリをDIALサービスに登録する方法については、[DIALのウェブサイト][2]を参照してください。

* TOC
{:toc}

## DIALを実装する

DIALを使用する場合、Fire TV対応アプリのコードを変更する必要はありませんが、アプリのマニフェストとリソースに変更を加えて、DIALをサポートしていることを示し、起動インテントを受信できるようにする必要があります。

Fire TVとセカンドスクリーンアプリにDIALのサポートを実装するには、次の 5 つの手順を実行します。

1. Fire TVでアプリを検出して起動するためのDIALプロトコルを、セカンドスクリーンアプリに実装します。詳細については、[DIALのウェブサイト][2]、特に「[Details for Developers][3]」の内容を参照してください。
2. Fire TV対応アプリをDIALレジストリに登録します。詳細については、[About the Registry][4]を参照してください。
3. Fire TV対応アプリで、DIAL起動インテントペイロードを処理します。この手順は、セカンドスクリーンアプリがインテントペイロードを送信する場合にのみ必要です。このペイロードは、値`com.amazon.extra.DIAL_PARAM`を持つ[インテント][5]エクストラとして配信されます。4. Fire TV対応アプリで、DIALをサポートするようにAndroidマニフェストを変更します。詳細については、「[Androidマニフェストを変更する][6]」を参照してください。5. Fire TV対応アプリで、`Whisperplay.xml`ファイルをアプリのリソースに追加します。詳細については、「[Whisperplay.xmlファイルを追加する][7]」を参照してください。

## Androidマニフェストを変更する

DIALをサポートするには、Androidマニフェスト (`AndroidManifest.xml`) に次の 2 つの変更を加えます。

* WhisperplayとDIALをサポートしていることを示す `<meta-data>` 要素を `<application>` に追加します。
* `DEFAULT`カテゴリを起動インテントに追加します。

マニフェストの `<application>` 部分に次の `<meta-data>` 要素を加えます。

```java
<application ... >
    <meta-data android:name="whisperplay"  android:resource="@xml/whisperplay"/>
    ...
</application>
```

次に、`DEFAULT`インテントカテゴリを、プライマリ (メイン) アクティビティの `<intent-filter>` 要素に追加します。

```java
    <activity android:name=".MainActivity"
              android:label="@string/title_activity_main" >
        ...
        <intent-filter>
            <action android:name="android.intent.action.MAIN" />
            <category android:name="android.intent.category.LAUNCHER"/>
            <category android:name="android.intent.category.DEFAULT" />
        </intent-filter>
    </activity>
```

## Whisperplay.xmlファイルを追加する

Whisperplay.xmlというファイルを、res/xml/ディレクトリにあるアプリのリソースに追加します。このファイルの内容は次のようになります。DialAppNameには、DIALレジストリにあるアプリの名前が入ります。

```java
<whisperplay>
    <dial>
        <application>
            <dialid>DialAppName</dialid>
            <startAction>android.intent.action.MAIN</startAction>
        </application>
    </dial>
</whisperplay>
```


## DIALペイロードインテント

DIALペイロード (DIAL起動リクエストを介してアプリに渡される情報) を受信するようにアプリが設定されていると、このペイロードは、値`com.amazon.extra.DIAL_PARAM`を持つ[インテント][5]エクストラとして配信されます。

[1]: http://www.dial-multiscreen.org
[2]: http://www.dial-multiscreen.org/
[3]: http://www.dial-multiscreen.org/details-for-developers
[4]: http://www.dial-multiscreen.org/dial-registry
[5]: http://developer.android.com/reference/android/content/Intent.html
[6]: https://developer.amazon.com/public/solutions/devices/fire-tv/docs/dial-integration#manifest
[7]: https://developer.amazon.com/public/solutions/devices/fire-tv/docs/dial-integration#xmlfile

{% include links.html %}
