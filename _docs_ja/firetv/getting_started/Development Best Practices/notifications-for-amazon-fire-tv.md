---
title: Amazon Fire TVの通知機能
permalink: notifications-for-amazon-fire-tv.html
sidebar: firetv
product: Fire TV
SMEs: Mike Miller, David Goehring, Mustafa Hakim, Stephen Whitney. 
toc-style: kramdown
github: true
---

第 2 世代のFire TV端末では、[Android通知API](http://developer.android.com/reference/android/app/Notification.html)を使用した標準のAndroid通知がサポートされるようになりました。これらの通知は、下で説明するように、\"通知センター\"に表示されます。第 1 世代のFire TV端末については、標準の通知と通知センターのサポートが後日提供される予定です。

* TOC
{:toc}

## 通知の概要

通知は、アプリのユーザーインターフェース以外の場所に表示されるユーザー向けのメッセージです。Fire TVでは、[Android通知API](http://developer.android.com/reference/android/app/Notification.html)をサポートしていますが、いくつか制限があります。

通知は、通常、アプリのアップデートが利用可能であることをユーザーに知らせるために使用します。アップデートの内容には次のようなものがあります。

* 新しいコンテンツが利用可能になった
* ゲームに新しいレベルが追加された
* 既存のシリーズの新しいエピソードが利用可能になった
* ライブTVチャンネルのラインナップが変更された
* アプリで新しいゲームパックが利用可能になった
* 新機能が追加された
* バッジや報酬を新たに獲得した
* 新規リリースが利用可能になった

皆さんは、スマートフォンでさまざまなアプリからメッセージを受け取ることに慣れていることと思いますが、Fire TV対応アプリの通知を使用すれば同じようにユーザーにメッセージを届けることができます。通知は、何らかの形でアプリを再度利用するようにユーザーを促すための手段と言えます。

通知は、[Recommendations機能](https://developer.android.com/training/tv/discovery/recommendations.html)とは異なることに注意してください。Recommendations機能では、別のAndroid API (現在、Fire TVではサポートされていません) を使用して、ユーザーにコンテンツをおすすめします。おすすめのコンテンツは、通常、ホーム画面の専用のエリアに表示されます。

## Fire TVでサポートされている通知の種類

Fire TVでは、次の通知を作成できます。

* [ヘッドアップ通知](../notifications-for-amazon-fire-tv.md#headsup)
* [トースト](../notifications-for-amazon-fire-tv.md#toasts)
* [標準の通知](#standard notifications)

### ヘッドアップ通知 {#headsup}

Fire TVは、Androidの[ヘッドアップ通知](https://developer.android.com/guide/topics/ui/notifiers/notifications.html#Heads-up)をサポートしています。Android端末では通常、ヘッドアップ通知はフローティングウィンドウとして画面の上部に表示されます。ユーザーはこのウィンドウで何らかの操作を行うことができます (例: 他のアプリを使用しているときに通話を受ける)。 

Fire TVでは、ヘッドアップ通知は画面の下部に表示され、数秒後に消えます。通知が表示されている間に、ユーザーは何らかの操作を実行できます。たとえば、ボタンをクリックしたり、[戻る] ボタンで通知を消去したりすることができます。 

消去しなかったヘッドアップ通知はすべて通知センターに表示され、ユーザーは好きなときに通知センターで通知をもう一度確認できます。これにより、通知がユーザーに確実に届きます(これまでは、ユーザーがヘッドアップ通知を見逃した場合、確認する方法はありませんでした)。

ヘッドアップ通知を作成するときは、通知の優先度をHIGHに設定する必要があります。

```java
.setPriority(Notification.PRIORITY_HIGH) // ヘッドアップの優先度はHIGHに設定する必要があります
```

Fire TVでは、[進捗状況の表示](https://developer.android.com/training/notify-user/display-progress.html)と[通知のスタック表示](https://developer.android.com/training/wearables/notifications/stacks.html)はサポートされていません。レイアウトに関しては、ヘッドアップ通知の高さは通常のレイアウトのみに制限されています (拡張レイアウトはありません)。

### トースト {#toasts}

ほとんど使用されませんが、Fire TVでは[トースト](https://developer.android.com/guide/topics/ui/notifiers/toasts.html)もサポートしています。トーストは小さなポップアップで、アプリ内に短い時間表示されてから消え、ユーザーがメッセージを操作する機能はありません。ヘッドアップ通知とは異なり、トーストは通知センターに保存されません。

### 標準の通知 {#standardnotifications}

標準の通知は実際には情報提供であり、(画面の右下隅にポップアップ表示されるヘッドアップ通知とは異なり) 現在のフォアグラウンドアクティビティが中断されることはありません。アプリからの通知は、表示されるとすぐに通知センターに追加されます。 

通知センターは、[設定] メニュー内に表示されます。ユーザーがまだ通知を確認していない場合は、[設定] の横に小さなベルが表示されます。 

{% include image.html file="firetv/getting_started/images/notificationbell" type="png" %}

ユーザーが [設定] 内で [通知] を選択すると、本記事で「通知センター」と呼んでいるものが開きます。

{% include image.html file="firetv/getting_started/images/notificationcenter" type="png" %}

通知センターでは、通知が 1 つのリストにまとめられて、新しい順に並んでいます。Fire TVアプリストアのクライアント自体は、アプリにアップデートがあるときに通知を送信します (そのため、これらの通知のプッシュについて心配する必要はありません)。次のスクリーンショットでは、2つのアプリにアップデートがあります。
 
{% include image.html file="firetv/getting_started/images/notificationcards" type="png" %}

ユーザーがアイコンをクリックすると、アプリの利用可能なアップデートが表示されます。ユーザーはアプリのアップデートを行うかどうかを選択できます。 

{% include image.html file="firetv/getting_started/images/notificationavailableupdates" type="png" %}

通知には、通知の理由が伝わる情報を含める必要があります。また、通知が選択されたときに起動するオプションのインテントを含めることもできます。たとえば、通知を使用して、インテントに関連付けられた特定のアクティビティへのディープリンクでユーザーがアプリを起動できるようにすることができます。

アップデートが完了すると、ユーザーはアプリの起動を促されます。 

{% include image.html file="firetv/getting_started/images/notificationlaunch" type="png" %}

ユーザーは、端末ごとにアプリ通知のオンとオフを切り替えることもできます(これよりも細かく通知を構成することはできません)。ユーザーは、[**環境設定**] > [**Notification Settings**] > [**アプリ通知**] に移動して、アプリ通知を制御できます。

{% include image.html file="firetv/getting_started/images/configurenotificationoptions" type="png" %}

ユーザーは、[**制限なし**] を選択して、ヘッドアップ通知が画面に表示されないようにすることもできます(標準の通知は引き続き通知センターに表示され、メインナビゲーションの [設定] にベルのアイコンが表示されます)。

すべての通知は、ユーザーが通知に対処するか、通知を消去する、アプリ通知を無効にする、またはアプリによって通知が削除されるまで、通知センターに表示されます。 

ヘッドアップ通知として表示されたときに消去されなかった通知は、通知センターに表示されます。

各通知には、受け取った時刻または日付が表示されます。

ユーザーが通知センターにアクセスすると、通知をクリックしたかどうかにかかわらず、[設定] のベルアイコンは削除されます。

## 通知の要件

次の表に、通知の要件を示します。

<table class="grid">
<colgroup>
<col width="15%" />
<col width="70%" />
<col width="15%" />
</colgroup>
<thead>
<tr>
<th>機能</th>
<th>説明</th>
<th>必須か</th>
</tr>
</thead>
<tbody>
<tr>
  <td>大きな画像</td>
  <td markdown="span">通知カードのタイル画像として使用される大きな画像。この画像は、通知センターに表示されます。画像のアスペクト比は 16:9 でなければなりません。画像コンテナの実際のサイズは 228dp x 128dpです。そのため、画像は少なくともこのサイズ (以上) である必要があります。画像がこれより大きい場合は縮小されます。詳細については、「[setLargeIcon](https://developer.android.com/reference/android/app/Notification.Builder.html#setLargeIcon(android.graphics.drawable.Icon))」を参照してください。大きな画像が提供されない場合、Fire TVでは大きなアプリアイコンが使用されます。</td>
  <td>省略可能</td>
</tr>

<tr>
  <td>アクション</td>
  <td>アプリを起動するAndroidのインテントまたはディープリンク。</td>
  <td>省略可能</td>
</tr>

<tr>
  <td>タイトル</td>
  <td>通知のタイトル。</td>
  <td>必須</td>
</tr>

<tr>
  <td>説明</td>
  <td>通知の説明。</td>
  <td>必須</td>
</tr>

<tr>
  <td>アクションテキスト</td>
  <td>メニューボタンのテキスト (デフォルトは "今すぐ起動する")。これは緊急の通知として設定された通知にのみ含まれます。</td>
  <td>省略可能</td>
</tr>

<tr>
  <td>優先度</td>
  <td>Androidの通知の優先度 (範囲は -2 ～ +2)。優先度が +1 または +2 (HIGHまたはMAX) の場合、通知は緊急の通知と見なされます。設定しない場合、デフォルトの優先度は 0 です。</td>
  <td>省略可能</td>
</tr>
</tbody>
</table>

## コードサンプル

通知の作成方法に関するコードサンプルと技術的な手順については、Androidドキュメントの「[通知](http://developer.android.com/guide/topics/ui/notifiers/notifications.html)」を参照してください。

## システム通知

Fire TVでは、ユーザーにシステム通知も送信されます。サードパーティアプリでシステムメッセージ通知を複製することや開始することはできませんが、重要なため、ここでメッセージ通知について説明します。Fire TVの一般的なシステム通知には、次のようなものがあります。

* バッテリー残量の低下
* ヘッドフォンの取り外し
* Bluetoothのペアリング
* アプリケーションのダウンロード/インストールの完了
* その他のシステムアップデート

これらの通知は、画面の隅に小さなポップアップとして表示され、画面上の他のコンテンツの手前に表示されます。
システム通知も通知センターに保存されます (ただし、最初に表示されたときにユーザーが通知を消去しなかった場合に限られます)。

Fire TVでは、アプリにアップデートがあるときにも通知が表示されます。これらの通知は、アプリで作成するものではなく、Fire TVアプリストアのクライアントによってトリガーされます。 

Fire TVでは、2 種類のアプリアップデートメッセージが作成されます。"Required Updat" メッセージはアプリのアイコン上に表示される視覚的なプロンプトで、新しいアップデートが利用可能であることを示します。 

もう 1 つのアップデートメッセージは、端末のダイアログボックスを介してユーザーに通知されます。ユーザーがアプリやゲームで新しいセッションを開始すると、アップデートの新機能の詳細と "Update Now" または "Launch without Updating" のオプションが表示されます。

{% include image.html file="firetv/getting_started/images/092816_badlands" type="png" caption="アプリのアップデートの通知" %}

アプリのインストール後、ユーザーは起動準備が整ったことを知らせる簡単な通知を受け取ります。

{% include image.html file="firetv/getting_started/images/092816_PostInstall2" type="png" caption="インストール後の通知" %}

## 廃止されたFire TV通知APIからの移行 {#deprecation}

これまで、Amazon Fire TVにはTV用に設計されたカスタム通知APIが搭載されていました。このAmazon通知APIは、Fire OS 5 で**廃止**されました。現在アプリでFire TV通知APIを使用している場合、それらの通知は引き続き機能しますが、このAPIは後日プラットフォームから**削除**されます。アプリでAmazon通知APIを使用している場合は、代わりに[標準のAndroid (Lollipop) 通知API](http://developer.android.com/guide/topics/ui/notifiers/notifications.html)の使用に移行することを強くお勧めします。

Amazon通知APIからアプリを移行するには:

*   `AmazonNotification`と`AmazonNotificationManager`への参照、およびパッケージ`com.amazon.device.notification`への参照をすべて削除します。これらは、Android通知APIの[`Notification`](https://developer.android.com/reference/android/app/Notification.html)クラスと[`NotificationManager`](http://developer.android.com/reference/android/app/NotificationManager.html)クラスに置き換えることができます。
*   `AmazonNotification.setType()`メソッドおよび`TYPE_INFO`と`TYPE_MEDIA_INFO`定数への参照は削除する必要があります。Androidの通知では、これらの種類が指定されません。

{% include links.html %}
