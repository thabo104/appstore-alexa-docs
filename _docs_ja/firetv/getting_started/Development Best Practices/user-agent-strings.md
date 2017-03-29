---
title: Fire TVのユーザーエージェント文字列
permalink: user-agent-strings.html
sidebar: firetv
product: Fire TV
toc-style: kramdown
github: true
---


Fire TVプラットフォームには、Android WebView ([`android.webkit.WebView`][1])、Amazon WebView ([`com.amazon.android.webkit.AmazonWebView`][2])、Amazonウェブアプリプラットフォームが含まれており、それぞれに関連付けられたユーザーエージェント文字列があります。

アプリやウェブページは、ユーザーエージェント文字列を読み取ることでFire TVを検出し、それぞれに応じたユーザーエクスペリエンスを提供できます。ユーザーエージェント文字列には、ホストオペレーティングシステムのバージョン、ブラウザのバージョンなどの情報を含めることができます。

{% include note.html content="Fire TVプラットフォームには、ブラウザは含まれていません。" %}

{% include tip.html content="Fire TV端末の種類を識別する方法については、「[Amazon Fire TV端末を識別する][identifying-amazon-fire-tv-devices]」を参照してください。" %}

* TOC
{:toc}

## ユーザーエージェント文字列

ユーザーエージェント文字列を読み取る際には、ソフトウェアのアップデート時に変更される可能性のある、文字列内のバージョン番号を利用しないでください。Fire TVプラットフォームに応じてユーザーエクスペリエンスを提供できるように、検出には文字列 "AmazonWebAppPlatform" と "AFT" で始まる端末モデルを組み合わせて使用してください。

次の表に、Fire TVのユーザーエージェント文字列を示します。

| ユーザーエージェント | 文字列 | 例 |
| --- | --- | --- |
| Android WebView<br/>(`android.webkit.WebView`) | `Mozilla/5.0 (Linux; U; Android <android>; <locale>; <device> Build/<build>) AppleWebKit/<webkit> (KHTML, like Gecko) Version/4.0 Mobile Safari/<safari>` | `Mozilla/5.0 (Linux; U; Android 4.2.2; en-us; AFTB Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30` |
| Amazon WebView<br/>(`com.amazon.android.webkit.AmazonWebView`) | `Mozilla/5.0 (Linux; Android <android>; <device> Build/<build>) AppleWebKit/<webkit> (KHTML, like Gecko) Chrome/<chrome> Mobile Safari/<safari>` | `Mozilla/5.0 (Linux; Android 4.2.2; AFTB Build/JDQ39) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.173 Mobile Safari/537.22` |
| Amazon Web App Platform | `Mozilla/5.0 (Linux; Android <android>; <device> Build/<build>) AppleWebKit/<webkit> (KHTML, like Gecko) Chrome/<chrome> Mobile Safari/<safari> cordova-amazon-fireos/<amazon> AmazonWebAppPlatform/<amazon>` | `Mozilla/5.0 (Linux; Android 4.2.2; AFTB Build/JDQ39) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.173 Mobile Safari/537.22 cordova-amazon-fireos/3.4.0 AmazonWebAppPlatform/3.4.0;2.0` |

## ユーザーエージェント文字列内のプレースホルダー

以下に挙げるユーザーエージェント文字列内のプレースホルダーは、端末によって異なるバージョン番号、ユーザーによって変更される可能性のある値、またはAmazonが端末のソフトウェアを更新するときに変更される可能性のある値を示しています。

*   `<android>` には、Androidバージョン番号が入ります (例: 4.2.2)。
*   `<locale>` には、スマートフォンで選択された言語と国や地域が入ります。値は小文字で、2 文字のISO 639-1 言語コードと 2 文字のISO 3166-1 alpha-2 国名コードをハイフンでつないだ文字列で構成されます (例: en-us)。*   `<device>` には、`android.os.Build.MODEL`の値が入ります (例: ATFB)。Fire TVプラットフォームのすべての端末を対象にするには、"AFT" で始まる端末の検出を行います。
*   `<build>` には、`android.os.Build.ID`の値が入ります (例: JDQ39)。
*   `<webkit>`、`<chrome>`、`<safari>` には、WebKit、Chrome、Safariのバージョン番号が入ります (例: 534.30)。
*   `<amazon>` には、Amazonウェブアプリプラットフォームのバージョン番号が入ります (例: 3.4.0)。


[1]: http://developer.android.com/reference/android/webkit/WebView.html
[2]: https://developer.amazon.com/public/solutions/platforms/android-fireos/docs/understanding-hybrid-apps

{% include links.html %}
