---
title: アプリと Fire TV ホーム画面ランチャーの統合
permalink: launcher-integration.html
sidebar: catalog_ja
product: Fire TV Catalog
toc-style: kramdown
github: true
---

<h2>はじめに</h2>
<p>Amazon Fire TV ホーム画面ランチャーで使用できるようにアプリに変更を加えると、メディアコンテンツとユーザーの登録ステータスが Amazon Fire TV ユーザーインターフェイスで他のコンテンツと統合されます。このプロセスは、Amazon Fire TV のコンテンツと開発者様のコンテンツの「ディープリンク」とも呼ばれています。このディープリンクは、アプリのカタログと Fire TV の統合における二大要素の 1 つです（もう 1 つは<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-upload" rel="nofollow">カタログのアップロード</a>です）。
</p>
<p>このページでは、カタログを Fire TV ホーム画面ランチャーと統合する上で必要なアプリの変更について説明します。アプリを変更した後は、アプリを再発行する前に統合をテストします。詳細については、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/testing-launcher-integration-with-adb" class="external-link" rel="nofollow">ADB を使用したランチャー統合テスト</a>」、および「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/testing-launcher-integration-with-the-test-app" class="external-link" rel="nofollow">テストアプリを使用したランチャー統合テスト</a>」を参照してください。
</p>


<h2>プロセスの概要</h2>
<p>アプリをホーム画面ランチャーに統合するには、次の 6 つの手順を実行します。</p>
<ol>
<li>ユーザーの登録ステータスとアプリ機能に関するその他の情報を保持する Android インテントをブロードキャストします。</li>
<li>ランチャーから機能リクエストを受信し、手順 1 と同じ情報で応答します。</li>
<li>ランチャーから再生リクエストまたはサインインリクエストを受信します。</li>
<li>カタログと利用可能なコンテンツの間に発生する同期の問題に対処するエラー処理コードを追加します。</li>
<li>これらの変更をすべて処理するよう、Android マニフェストを設定します。</li>
<li><span class="confluence-link">更新したアプリを再発行</span>して、ユーザーが変更内容を利用できるようにします。</li>
</ol>
<p>アプリは引き続き以下に対応できます。</p>
<ul class="bullets">
<li>再生およびサインインのアクティビティと動作</li>
<li>サービスに対するユーザー登録ステータスの管理</li>
</ul>

<h2>手順 1:アプリの機能情報を保持するインテントをアプリからブロードキャストする</h2>
<p>コンテンツを再生するには、Fire TV ホーム画面ランチャーがアプリからユーザーの情報を受け取る必要があります。これにより、コンテンツを後で再生したり、ユーザーにサービスへのサインインをリクエストしたりすることができます。この情報は、以下のときに、Android ブロードキャストインテントとしてアプリから送信する必要があります。</p>
<ul>
<li>アプリの起動時。</li>
<li>ランチャーからリクエストされたとき（手順 2 を参照）。</li>
<li>ユーザーの登録ステータス変更時。たとえば、サービスにサインインまたはサインアウトした場合。</li>
</ul>
<h3 id="IntegratingYourAppwiththeFireTVHomeScreenLauncher-TypesofIntents:PlaybackandSign-inIntents">インテントの種類:再生インテントとサインインインテント</h3>
<p>Fire TV ランチャー統合とディープリンク用に、2 種類の Android インテントを作成します。これらはアプリからブロードキャストする必要があります。</p>
<ul>
<li><strong>サインインインテント</strong>:現在のユーザーがアプリにサインインしていない場合は、サインインインテントをブロードキャストします。</li>
<li><strong>再生インテント</strong>:ユーザーがサインインした直後やアプリを有効にしたときなど、現在のユーザーがアプリに既にサインインしている場合は、再生インテントをブロードキャストします。</li>
</ul>
<p>この 2 つのインテントタイプを使用して、アプリの機能を Amazon Fire TV に伝達します。</p>
<h3 id="IntegratingYourAppwiththeFireTVHomeScreenLauncher-BuildingandSendinganIntent">インテントの構築および送信</h3>
<p>アプリの機能をブロードキャストするには、標準の Android インテントを構築し、それを <a href="http://developer.android.com/reference/android/content/Context.html#sendBroadcast%28android.content.Intent%29" class="external-link" rel="nofollow">sendBroadcast()</a> メソッドを使用してアプリのコンテキストに送信します。インテントを構築する際は、以下の手順を実行してください。</p>
<ul class="bullets">
<li>インテントパッケージに <code>com.amazon.tv.launcher</code> という名前をつけます。</li>
<li>インテントアクションを <code>com.amazon.device.CAPABILITIES</code> に設定します。</li>
<li>他のすべてのインテント情報をインテントエクストラとして指定します。</li>
</ul>
<p>以下は、理論型変数である <code>userIsSignedIn</code> に基づいて、さまざまなインテントエクストラをブロードキャストする <code>BroadcastCapabilities()</code> メソッドの例です。この例の値はすべてサンプルデータであり、実際の値に置き替える必要があります。</p>
<pre class="brush:java;"> public void BroadcastCapabilities(Context context)
{
Intent intent = new Intent();
intent.setPackage("com.amazon.tv.launcher");
intent.setAction("com.amazon.device.CAPABILITIES");
if (userIsSignedIn) {
intent.putExtra("amazon.intent.extra.PLAY_INTENT_ACTION","android.intent.action.VIEW");
intent.putExtra("amazon.intent.extra.PLAY_INTENT_PACKAGE","com.contentcompany.player");
intent.putExtra("amazon.intent.extra.PLAY_INTENT_CLASS","com.contentcompany.player.PlayActivity");
intent.putExtra("amazon.intent.extra.PLAY_INTENT_FLAGS", Intent.FLAG_ACTIVITY_NEW_TASK | Intent.MORE_FLAGS});
} else {
intent.putExtra("amazon.intent.extra.SIGNIN_INTENT_ACTION","android.intent.action.VIEW");
intent.putExtra("amazon.intent.extra.SIGNIN_INTENT_PACKAGE","com.contentcompany.player");
intent.putExtra("amazon.intent.extra.SIGNIN_INTENT_CLASS","com.contentcompany.player.SignInActivity");
intent.putExtra("amazon.intent.extra.SIGNIN_INTENT_FLAGS", Intent.FLAG_ACTIVITY_NEW_TASK | Intent.MORE_FLAGS});
}
intent.putExtra("amazon.intent.extra.PARTNER_ID","contentcompany");
intent.putExtra("amazon.intent.extra.DISPLAY_NAME","Our Video App");

//Send the intent to the Launcher
context.sendBroadcast(intent);
}
</pre>
<h3 id="IntegratingYourAppwiththeFireTVHomeScreenLauncher-IntentExtras">インテントエクストラ</h3>
<p><code><a href="http://developer.android.com/reference/android/content/Intent.html#putExtra%28java.lang.String,%20java.lang.String%29" rel="nofollow" class="external-link">Intent.putExtra()</a></code> メソッドを使って、エクストラフィールドのキーと値でアプリの機能を指定します。すべてのインテントエクストラには、<code>amazon.intent.extra</code> のプレフィックスパッケージがあります。</p>
<p>以下の表に、すべての必須インテントエクストラと、再生用およびサインイン用のエクストラを示します。すべてのインテントエクストラの値には、プレフィックス <code>amazon.intent.extra</code> が付きます。</p>
<div class="table-wrap">
<table class="confluenceTable tablesorter tablesorter-default">
<thead>
<tr class="tablesorter-headerRow">
<td></td>
</tr>
</thead>
</table>
</div>
<div class="table-wrap">
<table class="confluenceTable tablesorter tablesorter-default">
<tbody>
<tr>
<td class="confluenceTd"><code>PARTNER_ID</code></td>
<td class="confluenceTd">常時</td>
<td class="confluenceTd">パートナー ID（Amazon から提供される ID であり、カタログ統合に使用する ID と同じもの）。</td>
</tr>
<tr>
<td class="confluenceTd"><code>DISPLAY_NAME</code></td>
<td class="confluenceTd">常時</td>
<td class="confluenceTd">ランチャーが表示するアプリの名前。新しいバージョンのランチャーでは表示名はサーバーで管理されますが、古いバージョンのランチャーでは引き続きこのエクストラが必要です。</td>
</tr>
<tr>
<td class="confluenceTd"><code>DATA_EXTRA_NAME</code></td>
<td class="confluenceTd">条件付き</td>
<td class="confluenceTd">データのコンテンツ ID を含むエクストラの名前（例: titleData）。この値は、コンテンツ ID が URI で表示されていない場合にのみ指定します。コンテンツ ID が URI 形式でない場合（例: <code>123456</code>）、<code>DATA_EXTRA_NAME</code> を使用して、ランチャーがその ID に使用するインテントエクストラの名前を指定します。詳細については、手順 3 を参照してください。そのコンテンツ ID には、<code><a href="http://developer.android.com/reference/android/content/Intent.html#getStringExtra%28java.lang.String%29" rel="nofollow" class="external-link">Intent.getStringExtra()</a></code> メソッドを使ってアクセスします。</td>
</tr>
<tr>
<td class="confluenceTd"><code>PLAY_INTENT_ACTION</code></td>
<td class="confluenceTd">ユーザーのサインイン時</td>
<td class="confluenceTd">再生インテント用で、ランチャーが送信するインテントアクション。通常は <code>android.intent.action.VIEW</code>。</td>
</tr>
<tr>
<td class="confluenceTd"><code>PLAY_INTENT_PACKAGE</code></td>
<td class="confluenceTd">ユーザーのサインイン時</td>
<td class="confluenceTd">再生インテント用で、アプリのパッケージ（例: <code>com.contentcompany.player</code>）。</td>
</tr>
<tr>
<td class="confluenceTd"><code>PLAY_INTENT_CLASS</code></td>
<td class="confluenceTd">ユーザーのサインイン時</td>
<td class="confluenceTd">再生インテント用で、アプリの完全なパッケージ名とクラス名（例: <code>com.contentcompany.player.PlayActivity</code>）。</td>
</tr>
<tr>
<td class="confluenceTd"><code>PLAY_INTENT_FLAGS</code></td>
<td class="confluenceTd">ユーザーのサインイン時</td>
<td class="confluenceTd">
再生インテント用で、アプリがインテントから受け取る必要のあるフラグ。整数。使用できるフラグ値については、Android リファレンスガイドの <a href="http://developer.android.com/reference/android/content/Intent.html" rel="nofollow" class="external-link">Intent</a> を参照してください。
</td>
</tr>
<tr>
<td class="confluenceTd"><code>SIGNIN_INTENT_ACTION</code></td>
<td class="confluenceTd">ユーザーのサインアウト時</td>
<td class="confluenceTd">サインインインテント用で、ランチャーが送信するインテントアクション。通常は <code>android.intent.action.VIEW</code>。</td>
</tr>
<tr>
<td class="confluenceTd"><code>SIGNIN_INTENT_PACKAGE</code></td>
<td class="confluenceTd">ユーザーのサインアウト時</td>
<td class="confluenceTd">サインインインテント用で、アプリのパッケージ（例: <code>com.contentcompany.player</code>）。</td>
</tr>
<tr>
<td class="confluenceTd"><code>SIGNIN_INTENT_CLASS</code></td>
<td class="confluenceTd">ユーザーのサインアウト時</td>
<td class="confluenceTd">サインインインテント用で、アプリのクラス名（例: <code>SignInActivity</code>）。</td>
</tr>
<tr>
<td class="confluenceTd"><code>SIGNIN_INTENT_FLAGS</code></td>
<td class="confluenceTd">ユーザーのサインアウト時</td>
<td class="confluenceTd">
サインインインテント用で、アプリがインテントから受け取る必要のあるフラグ。整数。使用できるフラグ値については、Android リファレンスガイドの <a href="http://developer.android.com/reference/android/content/Intent.html" rel="nofollow" class="external-link">Intent</a> を参照してください。
</td>
</tr>
</tbody>
</table>
</div>
<p>&nbsp;</p>
<p>次の 2 つのエクストラは常に必須です。</p>
<ul>
<li>Amazon から提供されたパートナー ID（<code>PARTNER_ID</code>）。この ID は、カタログ統合に使用する ID と同じものです。</li>
<li>アプリの表示名（<code>DISPLAY_NAME</code>）。表示名は、再生またはサインインのボタンに特定の名前をつけるために、ランチャーで使用されます。</li>
</ul>
<p>残りのインテントエクストラは、ユーザーにコンテンツを再生する権限があるかどうか（サインインしているかどうか）、または処理を進めるにはサインインする必要があるかどうかによって異なります。</p>
<ul class="bullets">
<li>ユーザーがサインインしている場合は、プレフィックス <code>PLAY_</code> を持つエクストラが必須になります。</li>
<li>ユーザーがサインインしていない場合、プレフィックス <code>SIGNIN_</code> を持つエクストラが必須になります。</li>
</ul>
<h3 id="IntegratingYourAppwiththeFireTVHomeScreenLauncher-Examples">例</h3>
<p>たとえば、ユーザーがサインインしたときやアプリを有効にしたときには、以下のエクストラを指定したインテントが送信されます。</p>
<ul>
<li><code>PARTNER_ID</code></li>
<li><code>DISPLAY_NAME</code></li>
<li><code>PLAY_INTENT_ACTION</code></li>
<li><code>PLAY_INTENT_PACKAGE</code></li>
<li><code>PLAY_INTENT_CLASS</code></li>
<li><code>PLAY_INTENT_FLAGS</code></li>
</ul>
<p>別の例として、ランチャーからアプリの機能がリクエストされたときにユーザーがサインインしていない場合は、以下のエクストラを指定したインテントが送信されます。</p>
<ul>
<li><code>PARTNER_ID</code></li>
<li><code>DISPLAY_NAME</code></li>
<li><code>SIGNIN_INTENT_ACTION</code></li>
<li><code>SIGNIN_INTENT_PACKAGE</code></li>
<li><code>SIGNIN_INTENT_CLASS</code></li>
<li><code>SIGNIN_INTENT_FLAGS</code></li>
</ul>
<p>両方のインテントエクストラを一度に指定しないでください。<code>PLAY_</code> で始まるキーがあると、ランチャーでは、ユーザーがコンテンツを視聴する権限があるものとみなされます。</p>
<p>アプリに複数の登録レベル（無料、基本、プレミアムなど）がある場合、各レベルの複数のブロードキャストインテントセットにさまざまな <code>PARTNER_ID</code> と <code>DISPLAY_NAME</code> の値を指定できます。</p>


<h2>手順 2:ランチャーから機能リクエストを受信する</h2>
<p>Amazon Fire TV ホーム画面ランチャーが、アプリの機能とユーザーの登録ステータスをリクエストすることがあります。ランチャーはこの情報を、アクションが <code>com.amazon.device.REQUEST_CAPABILITIES</code> の Android ブロードキャストインテントでリクエストします。アプリは、手順 1 で作成したのと同じインテントでこのリクエストに応答する必要があります。</p>
<p><strong>注意:</strong>ランチャーがリクエストを送信するまで待たないでください。手順 1 で説明したように、アプリが起動されるたびに、また、ユーザーの登録ステータスが変更された場合に、アプリの機能情報を送信する必要があります。</p>
<p>以下の例は、ランチャーのブロードキャストインテントを処理する簡単なクラスを示しています。ランチャーに送信する機能情報は、手順 1 で送信する情報と同じであるため、同じメソッド（この場合、<code>broadcastCapabilities()</code>）を使用して、この 2 つのタスクを管理できます。</p>
<pre class="brush:java;">public class CapabilityRequestReceiver extends BroadcastReceiver
{
@Override public void onReceive(Context context, Intent intent)
{
broadcastCapabilities(); //the method you use to broadcast your app's information to the launcher
}
}
</pre>


<h2>手順 3:ランチャーからの再生およびサインインインテントを処理する</h2>
<p>ユーザーが Fire TV ユーザーインターフェイスでコンテンツの詳細を確認しようとすると、サービスに対するユーザーのステータスに基づいて、Fire TV では異なるオプションが表示されます。</p>
<ul>
<li>ユーザーがサービスにログインしている場合（機能のブロードキャストで <code>PLAY_</code> インテントエクストラを提供した場合）、アプリの表示名が記載されたボタンが表示されます（例: 「MyCompany Player」）。ユーザーがボタンを選択すると、ランチャーから再生インテントがアプリに送信されます。</li>
<li>ユーザーがログインしていない場合（<code>SIGNIN_</code> インテントを提供した場合）、「Launch」に続いてアプリの表示名が記載されたボタンが表示されます（例: 「Launch MyCompany Player」）。ユーザーがボタンを選択すると、ランチャーからサインインインテントがアプリに送信されます。</li>
</ul>
<p>どちらの場合も、ランチャーでは、機能のブロードキャストで提供された情報が使用され、アプリに送信する再生インテントとサインインインテントの両方が構築されます。</p>
<p>再生インテントまたはサインインインテントのいずれかを処理するには、これらのインテントを受信また処理し、リクエストされたコンテンツを再生するアクティビティをアプリに実装します。<strong>注意:</strong>これらのインテントの処理では、アプリは即座に（またはユーザーがサインインした後すぐに）再生を開始する<strong>必要があります</strong>。アプリには、追加の詳細ページや他の種類のランディングページを表示しないでください。<br></p>
<p>以下のコードは、再生アクティビティの概略を示しています。</p>
<pre class="brush: java:gutter:false"> public class PlayActivity extends Activity {
@Override
public void onCreate(Bundle bundle) {
super.onCreate(bundle);
Uri data = getIntent().getData();
//Play the content specified by 'data'
// OR
String data = getIntent.getStringExtra("titleExtra");
//Play the content specified by the extra you indicated in DATA_EXTRA_NAME
}
}
</pre>
<p>再生インテントとサインインインテントのどちらにも、アプリがそのコンテンツを即座に（再生インテント）、またはユーザーがサインインした後に（サインインインテント）再生できるよう、リクエストされたコンテンツの ID が含まれています。このコンテンツの ID と ID の形式は、<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/overview/integrating-your-catalog-with-fire-tv">カタログ統合</a>の一環としてメディアカタログで指定します。コンテンツ ID が URI 形式である場合（例: <code>myapp://Media/123456</code>）、その URI がランチャーからインテントデータ（<code>Intent.getData()</code>）の一部として送信されます。コンテンツ ID が URI 形式でない場合（例: <code>123456</code>）、その ID は、ランチャーから機能のブロードキャストの一環として <code>DATA_EXTRA_NAME</code> で指定したエクストラで送信されます。そのコンテンツ ID には、<code><a href="http://developer.android.com/reference/android/content/Intent.html#getStringExtra%28java.lang.String%29" rel="nofollow">Intent.getStringExtra()</a></code> メソッドを使ってアクセスできます。</p>
<p><strong>注意:</strong> ランチャーからは、CDF カタログで指定したデータのみが送信されます。その ID を特定の形式にする必要はありません。カタログで指定する ID が、アプリにより再生時に要求されるものと同じ形式、またはアプリが使用できる形式であることを確認してください。</p>


<a class="anchor" name="手順 4:カタログと利用可能なコンテンツの間の同期の問題に対処するエラー処理コードを追加する"></a>

<h2>手順 4:カタログと利用可能なコンテンツの間の同期の問題に対処するエラー処理コードを追加する</h2>
<p>Fire TV に統合されたアプリの多くが直面する共通の問題の 1 つに、カタログが利用可能な実際のコンテンツと同期されなくなることがあるというものがあります。ユーザーが検索または閲覧してコンテンツのアイテムを選択したときに、そのアイテムが実際には再生できない場合、黒い画面が表示され、その画面から移動する方法がわからない状態になります。これはユーザーが非常にストレスを感じる状況であり、Fire TV からアプリへのアクセスに悪影響を及ぼします。</p>
<p>同期の問題が起こる理由はいくつかあります。</p>
<ul>
<li>新しいカタログをアップロードしたばかりで、カタログが正常にインジェストされてから実際のコンテンツが再生可能になるまでに数時間の差がある。</li>
<li>コンテンツの一部を置き換えたが、この変更を反映した更新済みのカタログがまだアップロードされていないかインジェストされていない。</li>
</ul>
<p>利用できないコンテンツのアイテムが選択されたときに黒い画面が表示されないように、Amazon ではエラー処理コードをアプリに実装することを推奨しています。このコードによって、利用できないコンテンツをユーザーが選択しようとする状況で、有用なエラーメッセージが表示され、ユーザーが適切な場所にリダイレクトされます。その結果、この種のエラーを好意的なユーザーエクスペリエンスに変えることができます。</p>


<a class="anchor" name="手順 5:Android マニフェストを設定する"></a>

<h2>手順 5:Android マニフェストを設定する</h2>
<p>ランチャーから送信されるブロードキャストインテントを処理するために、Android マニフェストを設定します。具体的には、次の 3 つを追加する必要があります。
</p>
<ul class="bullets">
<li>再生インテントとサインインインテントを処理するための、インテントフィルターを追加します。</li>
<li>ランチャーの機能リクエストインテントのレシーバーを追加します。</li>
<li>インテントが適切なアクセス権で送信されるように、アクセス権を追加します。</li>
</ul>
<h3 class="secondary" id="IntegratingYourAppwiththeFireTVHomeScreenLauncher-AddIntentFiltersforPlaybackandSignin">再生およびサインイン用のインテントフィルターの追加
</h3>
<p>ランチャーからインテントを受信するために、再生アクティビティとサインインアクティビティ用のインテントフィルターを追加します。この例では、<code>PlayActivity</code> という名前の再生アクティビティを使用します。
</p>
<pre class="brush: java;"> &lt;activity
android:name=".PlayActivity"
android:label="Playback Activity"&gt;
...
&lt;intent-filter&gt;
&lt;action android:name="com.contentcompany.player.PlayActivity"&gt;
&lt;category android:name="android.intent.category.DEFAULT"&gt;
&lt;/intent-filter&gt;
&lt;/activity&gt;
</pre>
<h3 class="secondary" id="AddaReceiverforLauncherRequests">ランチャーリクエストのレシーバーの追加
</h3>
<p>マニフェストに <code>BroadcastReceiver</code> クラスの名前で <code>receiver</code> 要素を追加し、<code>com.amazon.device.REQUEST_CAPABILITIES</code> アクションで <code>intent-filter</code> 要素を追加します。この例では、レシーバークラスは <code>CapabilityRequestReceiver</code> です。
</p>
<pre class="brush: xml"> &lt;receiver android:name="CapabilityRequestReceiver" &gt;
&lt;intent-filter&gt;
&lt;action android:name="com.amazon.device.REQUEST_CAPABILITIES" /&gt;
&lt;/intent-filter&gt;
&lt;/receiver&gt;
</pre>
<h3 class="secondary" id="AddPermissions">アクセス権の追加
</h3>
<p>ランチャーがインテントを確実に受信できるよう、マニフェストに <code>uses-permission</code> 要素を追加します。
</p>
<pre class="brush: xml:gutter:false">&lt;uses-permission android:name="com.amazon.device.permission.COMRADE_CAPABILITIES" /&gt;</pre>

<h2>関連リソース</h2>
<ul>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/overview/integrating-your-catalog-with-fire-tv">カタログと Amazon Fire TV の統合</a>:Fire TV カタログ統合のランディングページ。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/understanding-fire-tv-catalog-integration">Fire TV カタログ統合について</a>:カタログ統合の概念の紹介。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-integration">カタログ統合の準備</a>：Fire TV カタログ統合のクイックスタートガイド。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-cdf-overview">カタログデータ形式（CDF）について</a>:カタログファイルに必要な構成方法と必須フィールドに関する説明。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/setting-up-your-aws-account-for-fire-tv-catalog-integration">Fire TV カタログ統合のための AWS アカウントのセットアップ</a>:AWS の 1 回限りのセットアップ手順。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-upload">Amazon へのカタログのアップロード</a>:CDF ファイルを Amazon S3 にアップロードする方法。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/receiving-and-understanding-the-catalog-ingestion-report">カタログインジェストレポートの取得とその内容</a>:カタログの統合ステータスに関するレポートのオプトインと使用方法について。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-ingestion-report-messages">カタログデータ形式インジェストレポートのメッセージ</a>:各インジェストレポート情報の読み方と対処方法。</li>
<li> <strong>ランチャー統合</strong>:アプリと Fire TV ホーム画面ランチャーの統合について。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/testing-launcher-integration-with-adb">ADB を使用したランチャー統合テスト</a>:Android Debug Bridge（ADB）を使用したアプリのランチャー統合のテストについて。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/testing-launcher-integration-with-the-test-app">テストアプリを使用したランチャー統合テスト</a>:Amazon のテストアプリシミュレーターを使用したアプリのランチャー統合のテストについて。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/fire-tv-catalog-integration-faqs">Fire TV カタログ統合の FAQ</a>:カタログ統合についてのよくある質問。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/migrating-a-cdf-file-to-the-latest-version">カタログデータ形式（CDF）ファイルの最新バージョンへの移行</a>:カタログで最新バージョンの CDF スキーマが使用されるようにする方法。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference">カタログデータ形式（CDF）スキーマリファレンス</a>:すべての CDF 要素の定義、要件、サンプル。</li>
<li><a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/test-cases-for-verifying-deep-links-from-your-fire-tv-catalog">Fire TV のディープリンクを確認するためのテストケース</a>: アプリのランチャー統合を確認するために実行するテストケースについて。</li>
</ul>

{% include links.html %}
