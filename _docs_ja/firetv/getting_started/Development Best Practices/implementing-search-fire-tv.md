---
title: Fire TVに検索機能を実装する
permalink: implementing-search-fire-tv.html
sidebar: firetv
product: Fire TV
toc: false
github: true
---

Fire TVに検索機能を実装するには、テキスト検索と音声検索の主な違いを理解する必要があります。

* TOC
{:toc}

## アプリ内のテキスト検索

アプリ内のテキスト検索とは、アプリ内に明示的にコーディングしたテキスト検索機能のことです。デフォルトでは、アプリのテキスト検索をFire TVで利用することはできません。

## グローバルテキスト検索

Fire TVには、Fire TVのホーム画面で利用できるグローバルテキスト検索が用意されています。グローバルテキスト検索では、Fire TVカタログから結果が返されます。グローバルテキスト検索の結果にメディアを表示するには、[アプリのメディアをFire TVカタログに組み込む][integrating-your-catalog-with-fire-tv]必要があります。

## 音声検索 {#voicesearch}

Fire TVには、音声対応リモコンを使用した音声機能も用意されています。ユーザーは、[Fire TVのAlexa音声機能](https://www.amazon.com/gp/help/customer/display.html?nodeId=201859020)に加え、自然言語を使用して、テレビ番組、映画、その他のメディアを検索することができます。

Fire TVのどの画面を表示しているときでも、音声対応リモコンのマイクを押し、目的のテレビ番組やAlexaアクションを声に出して言うと、このアクションにより、*LeanbackライブラリではなくAlexaクラウドサービスを使用して*グローバル検索が開始されます。

音声によるメディアリクエストでは、常にFire TVカタログからコンテンツが返されます。これらの結果にアプリのメディアを表示するには、[アプリのメディアをFire TVカタログに組み込む][integrating-your-catalog-with-fire-tv]必要があります。

ユーザーがアプリをすでにインストールしている場合、アプリのコンテンツはカタログの結果に直接表示されます。ユーザーがアプリをインストールしていない場合は、ユーザーがアプリを取得してコンテンツを表示できるように [その他の視聴方法] オプションが表示されます (カタログ統合は、どのお客様にも同じコンテンツが提供されるアプリでのみ推奨されるオプションです)。

## Leanbackによる音声認識エラーを防ぐ

Fire TVの音声操作には、LeanbackライブラリではなくAlexaが使用されるため、Fire TV対応アプリでは、Leanbackライブラリの[`SearchFragment`]((http://developer.android.com/reference/android/support/v17/leanback/app/SearchFragment.html))クラスによる音声認識を無効にする必要があります。音声認識を無効にしないと、ユーザーが検索を実行したときにアプリがエラーを返す可能性があります。

Leanbackの`SearchFragment`クラスでは、`startActivityForResult`メソッドが音声認識機能を探しますが、FireTVではこの音声認識機能がサポートされていないため、エラーが生成されます。このエラーを回避するには、`onCreate()` メソッドをオーバーライドし、このメソッドが実行されないように音声認識のコールバックをコメントアウトします。次に、例を示します。

```java
setSpeechRecognitionCallback(() -> {
    if (DEBUG) Log.v(TAG, "recognizeSpeech");
    try {
        //startActivityForResult(getRecognizerIntent(), REQUEST_SPEECH);
    }
    catch (ActivityNotFoundException e) {
        Log.e(TAG, "Cannot find activity for speech recognizer", e);
    }
```

ここでは、`startActivityForResult`メソッドがコメントアウトされるだけなので、音声認識機能は実行されず、エラーは発生しません。

## Alexaのスキルとアプリ

アプリ独自のAlexa対応音声検索機能を作成することはできません。アプリからはメディアの結果のみが返されます。Fire TVではAlexaのどのスキルにもアクセスできますが、このスキルは音声専用の機能です。音声スキルでは、Fire TVのネイティブアプリとやり取りしません。そのため、自分で作成したAlexaのスキルでアプリを制御する方法はありません。

{% include links.html %}
