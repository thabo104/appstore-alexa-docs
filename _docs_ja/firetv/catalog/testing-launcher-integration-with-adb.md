---
title: ADB を使用したランチャー統合テスト
permalink: testing-launcher-integration-with-adb.html
sidebar: catalog_ja
product: Fire TV Catalog
toc-style: kramdown
github: true
---


<a class="anchor" name="はじめに"></a>

<h2>はじめに</h2>
<p>アプリを Fire TV ホーム画面ランチャーに統合した後（「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/launcher-integration" rel="nofollow">アプリと Fire TV ホーム画面ランチャーの統合</a>」参照）、Android Debug Bridge（ADB）を使って、アプリがサインインインテントや再生インテントに正しく応答しているかテストすることができます。</p>
<p>このテスト方法は、アプリの開発がまだ完了していない段階や、ランチャーからのインテントに応答するコードを実装する前に使用してください（「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/launcher-integration" rel="nofollow">アプリと Fire TV ホーム画面ランチャーの統合</a>」参照）。アプリのランチャー統合テストには、Fire TV 端末が必要です。</p>
<p>アプリが完成していない場合、またはインテントに応答するコードを実装していない場合は、テストアプリの機能を使用してランチャー統合テストを行ってください。「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/testing-launcher-integration-with-the-test-app" rel="nofollow">テストアプリを使用したランチャー統合テスト</a>」を参照してください。</p>
<p><strong>注意：</strong>ADB は、Amazon ではなく、Android Open Source Project により提供されます。ADB リファレンス資料へのすべてのリンクは、クリックすると Android の開発者向けウェブサイトが表示されます。</p>


<a class="anchor" name="プロセスの概要"></a>

<h2>プロセスの概要</h2>
<p>ADB を使用した Fire TV ランチャー統合のテストは、主に次のようなプロセスに沿って行います。
</p>
<ol>
<li>ADB を使用して Fire TV 端末へのアプリのインストールする</li>
<li>アプリへのサインインリクエストをテストする</li>
<li>アプリへの再生リクエストをテストする</li>
</ol>


<a class="anchor" name="手順 1：ADB を使用して Fire TV 端末へのアプリのインストールする"></a>

<h2>手順 1：ADB を使用して Fire TV 端末へのアプリのインストールする</h2>
<p>アプリをテストする前に、アプリを Fire TV 端末にインストールする必要があります。</p>
<p>アプリを Fire TV 端末にインストールするには、以下の手順に従います。</p>
<ol>
<li>ADB を使用して Fire TV 端末を開発用コンピューターに接続します。「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/connecting-adb" class="external-link" rel="nofollow">ADB による接続</a>」を参照してください。
</li>
<li>テストのためにアプリを端末にサイドロードします。「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/installing-and-running-your-app" class="external-link" rel="nofollow">アプリのインストールと実行</a>」を参照してください。
</li>
</ol>
<p>このページのすべての <code>adb</code> コマンドでは、Android アクティビティマネージャー (<code>am</code>) が使用され、インテントがアプリに送信されます。<code>am</code> の構文とオプションについての詳細は、Android の開発者向けウェブサイトの 「<a href="http://developer.android.com/tools/help/adb.html" class="external-link" rel="nofollow">Android Debug Bridge</a>」を参照してください。</p>


<a class="anchor" name="手順 2：サインインリクエストをテストする"></a>

<h2>手順 2：サインインリクエストをテストする</h2>
<p>Fire TV ランチャーからのサインインリクエストには、リクエスト自体に加えて、リクエストされたコンテンツへのリファレンスが含まれています。このため、ユーザーがサインインするとすぐにコンテンツが再生されます。コンテンツリファレンスは、実装に応じて、URI とデータエクストラの名前/値ペアのいずれかになります。</p>
<p>サインインリクエストをテストするには、以下の手順に従います。</p>
<ol>
<li>ADB を使用して Fire TV 端末に接続したコンピューターで、ターミナルウィンドウを開いてコマンドラインにアクセスします。</li>
<li>シェルのプロンプト（$ で示されます）が表示されたら、以下のいずれかのコマンドを入力します。
<ul>
<li>コンテンツを URI で指定している場合は、以下を入力します。<br>
<code>$ <code class="text plain">adb shell am start -a &lt;signin_intent_action&gt;&nbsp; -n &lt;signin_component&gt; -f &lt;signin_intent_flags&gt; -d &lt;content_uri&gt;<br>
<br></code></code></li>
<li>コンテンツをデータエクストラで指定している場合は、以下を入力します。<br>
<code>$ <code class="text plain">adb shell am start -a &lt;signin_intent_action&gt;&nbsp; -n &lt;signin_component&gt; -f &lt;signin_intent_flags&gt; -e &lt;data_extra_name&gt; &lt;content_id&gt;</code></code></li>
</ul>
</li>
</ol>
<h3 id="TestingLauncherIntegrationwithADB-CommandOptions">コマンドオプション</h3>
<p>次の表に、上の 2 つのコマンドで使用できるオプションを示します。&lt;山カッコ&gt; 内のテキストはアプリに応じた値に置き換えてください。</p>
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
<td class="confluenceTd"><code>-a &lt;signin_intent_action&gt;</code></td>
<td class="confluenceTd"><code>SIGNIN_INTENT_ACTION</code> エクストラからのサインインインテントアクション。<br>
<code><br>
例：com.yourcompany.player.SIGN_IN</code></td>
</tr>
<tr>
<td class="confluenceTd">
<p><code>-n &lt;signin_component&gt;</code></p>
</td>
<td class="confluenceTd">サインインアクティビティの完全なコンポーネント名。パッケージ名とクラス名がスラッシュで区切られる。これらの値はそれぞれ、<code>SIGNIN_INTENT_PACKAGE</code> エクストラと <code>SIGNIN_INTENT_CLASS</code> エクストラから取得されます。<br>
<br>
例：<code>com.yourcompany.player/com.yourcompany.player.MainActivity</code></td>
</tr>
<tr>
<td class="confluenceTd"><code>-f &lt;signin_intent_flags&gt;</code></td>
<td class="confluenceTd">
<p><code>SIGNIN_INTENT_FLAGS</code> エクストラで小数値として指定し、デフォルトのランチャーフラグと結合したインテントフラグ。デフォルトでは、ランチャーは以下のフラグを送信します。</p>
<ul>
<li><code>Intent.FLAG_ACTIVITY_NEW_TASK</code></li>
<li><code>Intent.FLAG_INCLUDE_STOPPED_PACKAGES</code></li>
<li><code>Intent.FLAG_ACTIVITY_RESET_TASK_IF_NEEDED</code></li>
</ul>
<p>小数値の例：270532640</p>
</td>
</tr>
<tr>
<td class="confluenceTd"><code>-d &lt;content_uri&gt;</code></td>
<td class="confluenceTd">コンテンツへのリンクが URI で指定されている場合は、そのURI です。オプション -d を使用する場合は、オプション <code>-e</code> は使用しないでください。</td>
</tr>
<tr>
<td class="confluenceTd"><code>-e &lt;data_extra_name&gt;</code><code><br>
&lt;content_id&gt;</code></td>
<td class="confluenceTd">コンテンツへのリンクが URI 以外の方法で指定されている場合は、そのコンテンツのキーと値のペアです。キーは <code>DATA_EXTRA_NAME</code> エクストラから取得されます。オプション -e を使用する場合は、オプション <code>-d</code> は使用しないでください。</td>
</tr>
</tbody>
</table>
</div>
<h3 id="TestingLauncherIntegrationwithADB-Examples">例</h3>
<p>以下の例は、コンテンツを URI で指定している場合に入力するサインインインテントのコマンドを示しています。</p>
<p>$ <code class="text plain">adb shell am start -a com.yourcompany.player.SIGN_IN&nbsp; -n com.yourcompany.player/com.yourcompany.player.MainActivity -f 270532640 -d myplayer://content/12345</code></p>
<p>以下の例は、コンテンツを URI 以外で指定している場合に入力するサインインインテントのコマンドを示しています。</p>
<p>$ <code class="text plain">adb shell am start -a com.yourcompany.player.SIGN_IN&nbsp; -n com.yourcompany.player/com.yourcompany.player.MainActivity -f 270532640 -e content_id 12345</code></p>


<a class="anchor" name="手順 3：再生リクエストをテストする"></a>

<h2>手順 3：再生リクエストをテストする</h2>
<p>サインインリクエストと同様に、再生リクエストでは、機能交換の際に、ランチャーに提供したデータを使用します。再生リクエストには、実装によって、URI、またはデータエクストラの名前と値のペアのいずれかのコンテンツリファレンスが含まれます。
</p>
<p>再生リクエストをテストするには、以下の手順に従います。
</p>
<ol>
<li>ADB を使用して Fire TV 端末に接続したコンピューターで、ターミナルウィンドウを開いてコマンドラインにアクセスします。</li>
<li>シェルのプロンプト（$ で示されます）が表示されたら、以下のいずれかのコマンドを入力します。
<ul>
<li>コンテンツを URI で指定している場合は、以下を入力します。
<br /> <code><code>$</code></code> <code class="text plain">adb shell am start -a &lt;playback_intent_action&gt;&nbsp; -n &lt;playback_component&gt; -f &lt;playback_intent_flags&gt; -d &lt;content_uri&gt;</code> <code><code class="text plain">
<br />
<br /></code></code></li>
<li>コンテンツをデータエクストラのキーと値のペアで指定している場合、以下を入力します。
<br /> <code><code><code>$</code></code></code> <code class="text plain">adb shell am start -a &lt;playback_intent_action&gt;&nbsp; -n &lt;playback_component&gt; -f &lt;playback_intent_flags&gt; -e &lt;data_extra_name&gt; &lt;content_id&gt;</code></li>
</ul></li>
</ol>
<h3 id="TestingLauncherIntegrationwithADB-CommandOptions.1">コマンドオプション
</h3>
<p>次の表に、上の 2 つのコマンドで使用できるオプションを示します。&lt;山カッコ&gt; 内のテキストはアプリに応じた値に置き換えてください。
</p>
<div class="table-wrap">
<table class="confluenceTable tablesorter tablesorter-default">
<thead>
<tr class="tablesorter-headerRow">
<td></td>
</tr> </thead>
</table>
</div>
<div class="table-wrap">
<table class="confluenceTable tablesorter tablesorter-default"> <tbody>
<tr>
<td class="confluenceTd"><code>&lt;playback_intent_action&gt;</code></td>
<td class="confluenceTd"><code>PLAY_INTENT_ACTION</code> エクストラからの再生インテントアクション。
<br />
<br /> 例：<code>com.yourcompany.player.PLAY</code></td>
</tr>
<tr>
<td class="confluenceTd"><code>&lt;playback_component&gt;</code></td>
<td class="confluenceTd">再生アクティビティの完全なコンポーネント名。パッケージ名とクラス名がスラッシュで区切られる。これらの値はそれぞれ、<code>PLAY_INTENT_PACKAGE</code> エクストラと <code>PLAY_INTENT_CLASS</code> エクストラから取得されます。
<br />
<br /> 例：
<br /> <code>com.yourcompany.player/com.yourcompany.player.MainActivity</code></td>
</tr>
<tr>
<td class="confluenceTd"><code>&lt;playback_intent_flags&gt;</code></td>
<td class="confluenceTd">
<p><code>PLAYBACK_INTENT_FLAGS</code> エクストラで小数値として指定し、デフォルトのランチャーフラグと結合したインテントフラグ。デフォルトでは、ランチャーは以下のフラグを送信します。
</p>
<ul>
<li><code>Intent.FLAG_ACTIVITY_NEW_TASK</code></li>
<li><code>Intent.FLAG_INCLUDE_STOPPED_PACKAGES</code></li>
<li><code>Intent.FLAG_ACTIVITY_RESET_TASK_IF_NEEDED</code></li>
</ul>
<p>小数値の例：270532640.
</p> </td>
</tr>
<tr>
<td class="confluenceTd"><code>&lt;content_uri&gt;</code></td>
<td class="confluenceTd">コンテンツへのリンクが URI で指定されている場合は、そのURI です。オプション -d を使用する場合は、オプション <code>-e</code> は使用しないでください。</td>
</tr>
<tr>
<td class="confluenceTd"><code>&lt;data_extra_name&gt;</code> <code>
<br /> &lt;content_id&gt;</code></td>
<td class="confluenceTd">コンテンツへのリンクが URI 以外の方法で指定されている場合は、そのコンテンツのキーと値のペアです。キーは <code>DATA_EXTRA_NAME</code> エクストラから取得されます。オプション -e を使用する場合は、オプション <code>-d</code> は使用しないでください。</td>
</tr> </tbody>
</table>
</div>
<h3 id="TestingLauncherIntegrationwithADB-Examples.1">例
</h3>
<p>以下の例は、コンテンツを URI で指定している場合に入力する再生インテントのコマンドを示しています。
</p>
<p>$ <code class="text plain">adb shell am start -a com.yourcompany.player.PLAY&nbsp; -n com.yourcompany.player/com.yourcompany.player.MainActivity -f 270532640 -d myplayer://content/12345</code>
</p>
<p><strong><span style="color: rgb(255,0,0);">&nbsp;</span></strong>
</p>
<p>以下の例は、コンテンツを URI 以外で指定している場合に入力する再生インテントのコマンドを示しています。 <strong><span style="color: rgb(255,0,0);">
<br /></span></strong>
</p>
<p>$ <code class="text plain">adb shell am start -a com.yourcompany.player.PLAY&nbsp; -n com.yourcompany.player/com.yourcompany.player.MainActivity -f 270532640 -e content_id 12345</code>
</p>


<a class="anchor" name="関連リソース"></a>

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
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/launcher-integration">ランチャー統合</a>:アプリと Fire TV ホーム画面ランチャーの統合について。</li>
<li> <strong>ADB を使用したランチャー統合テスト</strong>:Android Debug Bridge（ADB）を使用したアプリのランチャー統合のテストについて。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/testing-launcher-integration-with-the-test-app">テストアプリを使用したランチャー統合テスト</a>:Amazon のテストアプリシミュレーターを使用したアプリのランチャー統合のテストについて。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/fire-tv-catalog-integration-faqs">Fire TV カタログ統合の FAQ</a>:カタログ統合についてのよくある質問。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/migrating-a-cdf-file-to-the-latest-version">カタログデータ形式（CDF）ファイルの最新バージョンへの移行</a>:カタログで最新バージョンの CDF スキーマが使用されるようにする方法。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference">カタログデータ形式（CDF）スキーマリファレンス</a>:すべての CDF 要素の定義、要件、サンプル。</li>
<li><a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/test-cases-for-verifying-deep-links-from-your-fire-tv-catalog">Fire TV のディープリンクを確認するためのテストケース</a>: アプリのランチャー統合を確認するために実行するテストケースについて。</li>

</ul>




{% include links.html %}
