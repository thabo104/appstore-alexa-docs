---
title: 統合テストアプリを使用した Fire TV ランチャー統合テスト
permalink: testing-launcher-integration-with-the-test-app.html
sidebar: catalog_ja
product: Fire TV Catalog
toc: false
github: true
---


<a class="anchor" name="はじめに"></a>

<h2>はじめに</h2>
<p>アプリを Fire TV ホーム画面ランチャーに統合した後（「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/launcher-integration" rel="nofollow">アプリと Fire TV ホーム画面ランチャーの統合</a>」参照）、Amazon の統合テストアプリを使って、アプリがサインインインテントや再生インテント、および機能リクエストに正しく応答しているかテストすることができます。このテストアプリはランチャーのリクエストを模倣しており、作成したアプリでランチャー統合を適切に実装したことを確認する最も簡単な方法です。</p>
<p>このテスト方法は、アプリの開発が完了し、ランチャーからのインテントに応答するコードが実装済みの場合に使用してください （「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/launcher-integration" rel="nofollow">アプリと Fire TV ホーム画面ランチャーの統合</a>」参照）。統合テストアプリを使用してアプリの統合をテストするには、Fire TV 端末が必要です。</p>
<p>すべての機能が実装されたアプリのテストや、サインインインテントや再生インテントのテストのみを行う場合は、Android Debug Bridge（ADB）を使用するテスト方法を使用してください。「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/testing-launcher-integration-with-adb" class="external-link" rel="nofollow">ADB を使用したランチャー統合テスト</a>」を参照してください。</p>


<a class="anchor" name="プロセスの概要"></a>

<h2>プロセスの概要</h2>
<p>Amazon の Fire TV 統合テストアプリを使用した Fire TV ランチャー統合のテストは、主に次のようなプロセスに沿って行います。</p>
<ol>
<li>統合テストアプリをダウンロードする</li>
<li>適切なインテントパッケージを使用して統合テストアプリと連携するように開発者様のアプリを更新する</li>
<li>アプリと Fire TV 統合テストアプリを Fire TV 端末にインストールする</li>
<li>Fire TV 統合テストアプリを使用してアプリをテストする</li>
</ol>


<a class="anchor" name="手順 1：統合テストアプリをダウンロードする"></a>

<h2>手順 1：統合テストアプリをダウンロードする</h2>
<p>テストを開始する前に、Fire TV 統合テストアプリをコンピューターにダウンロードする必要があります。<br></p>
<div style="width: auto; background: #f0a50e; border: 1px solid #e39612; padding: 10px; margin:10px; border-radius: 4px 4px 4px 4px; display: inline-block;">
<a href="https://s3.amazonaws.com/android-sdk-manager/aftv-misc/IntegrationTest.apk">アプリのダウンロード</a>
</div>


<a class="anchor" name="手順 2：テスト向けにアプリを変更する"></a>

<h2>手順 2：テスト向けにアプリを変更する</h2>
<p>Fire TV 統合テストアプリと連携するように、アプリに変更を加える必要があります。</p>
<p>この変更を行うには、アプリに以下の変更を加えます。</p>
<ol>
<li>「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/launcher-integration" rel="nofollow">アプリと Fire TV ホーム画面ランチャーの統合</a>」で説明しているアプリの変更をまだ実施していない場合は、実施します。
</li>
<li>ブロードキャスト機能メソッド内で、<code>com.amazon.tv.launcher</code> の名前を <code>com.amazon.tv.integrationtestonly</code> に変更します。たとえば、<code>intent.setPackage(“com.amazon.tv.launcher”)</code> を <code>intent.setPackage(“com.amazon.tv.integrationtestonly”)</code> にします。</li>
</ol>
<p><strong>注意</strong>：<code>integrationtestonly</code> インテントパッケージはテスト以外では使用しません。テスト終了後、アプリを Amazon アプリストアに申請する前に、必ずインテントパッケージ名を元の名前の <code>com.amazon.tv.launcher</code> に戻してください。</p>


<a class="anchor" name="手順 3：アプリと Fire TV 統合テストアプリを Fire TV 端末にインストールする"></a>

<h2>手順 3：アプリと Fire TV 統合テストアプリを Fire TV 端末にインストールする</h2>
<p>テストを開始する前に、アプリと Fire TV 統合テストアプリを Fire TV 端末にインストールする必要があります。</p>
<p>アプリと Fire TV 統合テストアプリを Fire TV 端末にインストールするには、以下の手順に従います。</p>
<ol>
<li>ADB を使用して Fire TV 端末をコンピューターにネットワーク接続または USB ケーブル接続で接続します。「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/connecting-adb" class="external-link" rel="nofollow">ADB による接続</a>」を参照してください。
</li>
<li>アプリと統合テストアプリの両方をデバイスにサイドロードします。「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/installing-and-running-your-app" class="external-link" rel="nofollow">アプリのインストールと実行</a>」を参照してください。
</li>
</ol>


<a class="anchor" name="手順 4：統合テストでアプリをテストする"></a>

<h2>手順 4：統合テストでアプリをテストする</h2>
<p>アプリと統合テストアプリの両方が Fire TV 端末で使用できるようになったら、テストを開始することができます。</p>
<p>アプリをテストするには、以下の手順に従います。</p>
<ol>
<li>統合テストアプリを起動します。
<ol>
<li>Fire TV メインメニューから、[<strong>設定</strong>] &gt; [<strong>アプリ</strong>] &gt; [<strong>インストールしたアプリの管理</strong>] の順に選択し、統合テストアプリを選択します。</li>
<li>[<strong>アプリの起動</strong>] を選択します。</li>
</ol>
</li>
<li>[機能リクエスト] をクリックします。<br>
<br>
アプリから機能をリクエストするブロードキャストインテントが統合テストアプリによって送信されます。アプリがリクエストに応答し、必要な要素がすべて含まれていた場合、正常に終了したことを示すメッセージと、アプリから返された各機能の値がテストアプリに表示されます。<br>
<br>
<strong>注意</strong>：正常な終了とは、アプリがブロードキャストに応答したことだけを表しています。このテストは、入力したデータの正確さを検証するものではありません。<br>
<br></li>
<li>アプリから返された機能の値を検証します。<br>
<br>
機能の送受信が正常に終了すると、Fire TV にテキスト入力ボックスと [<strong>インテントの送信</strong>] ボタンが表示されます。</li>
<li>コンテンツの URL または ID を入力して、[<strong>インテントの送信]</strong> をクリックします。<br>
<br>
コンテンツリファレンスは、実装によって、URI である場合と、データエクストラの名前と値のペアである場合があります。開発者様のアプリが認識するコンテンツリファレンスを入力してください。コンテンツリファレンスと実装が適切であれば、アプリが起動し、インテントとコンテンツリファレンスの処理が行われます。 <strong><br></strong></li>
</ol>
<p>アプリのテストが完了したら、必ずブロードキャストインテントパッケージを <code>com.amazon.tv.launcher</code> に戻してください。</p>


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
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/testing-launcher-integration-with-adb">ADB を使用したランチャー統合テスト</a>:Android Debug Bridge（ADB）を使用したアプリのランチャー統合のテストについて。</li>
<li> <strong>テストアプリを使用したランチャー統合テスト</strong>:Amazon のテストアプリシミュレーターを使用したアプリのランチャー統合のテストについて。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/fire-tv-catalog-integration-faqs">Fire TV カタログ統合の FAQ</a>:カタログ統合についてのよくある質問。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/migrating-a-cdf-file-to-the-latest-version">カタログデータ形式（CDF）ファイルの最新バージョンへの移行</a>:カタログで最新バージョンの CDF スキーマが使用されるようにする方法。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference">カタログデータ形式（CDF）スキーマリファレンス</a>:すべての CDF 要素の定義、要件、サンプル。</li>
<li><a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/test-cases-for-verifying-deep-links-from-your-fire-tv-catalog">Fire TV のディープリンクを確認するためのテストケース</a>: アプリのランチャー統合を確認するために実行するテストケースについて。</li>

</ul>
{% include links.html %}
