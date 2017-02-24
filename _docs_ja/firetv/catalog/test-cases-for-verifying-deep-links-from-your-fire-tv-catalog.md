---
title: Fire TV のディープリンクを確認するためのテストケース
permalink: test-cases-for-verifying-deep-links-from-your-fire-tv-catalog.html
sidebar: catalog_ja
product: Fire TV Catalog
toc: false
github: true
---

<a class="anchor" name="はじめに"></a>

<h2>はじめに</h2>
<p>このページでは、Fire TV アプリを Amazon アプリストアに申請する前に、アプリに対して実行する必要のあるテストケースを一覧します。テストワークフローを説明どおりに実行することにより、Amazon アプリストアに申請したアプリの審査がスムーズに行われるようになります。ここに示されているテストケースの対象となるアプリは、Fire TV に統合されており、そのメディアカタログが Amazon に統合され、アップロードされているものであることに注意してください。詳細については、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/understanding-fire-tv-catalog-integration" class="external-link" rel="nofollow">Fire TV カタログ統合について</a>」を参照してください。</p>


<a class="anchor" name="推奨されるテストプロセスの概要"></a>

<h2>推奨されるテストプロセスの概要</h2>
<p>次のフローチャートは、アプリが Fire TV ホーム画面ランチャーに正しく統合されていることを確認する際に推奨されるテストプロセスの概要を示しています。アプリの状態 (公開済みまたは未公開) と条件 (ログインが必要かどうか、無料の試用版かどうか) に応じて、アプリに適用する必要のある手順だけを実行します。
</p>
<p><img src="https://images-na.ssl-images-amazon.com/images/G/01/mobile-apps/devportal2/content/sdk/images/fire-tv-ci/TestingFlowchart_ja-JP.png" style="max-width: 100%;" />
</p>
<p>次の一連の各手順を、アプリに応じて実行します。フローチャートをガイドとして使用して、テストプロセス全体の中での位置を把握してください。
</p>


<a class="anchor" name="手順 1: Amazon ホーム画面ランチャーとアプリが想定どおりに機能することを確認する"></a>

<h2>手順 1: Amazon ホーム画面ランチャーとアプリが想定どおりに機能することを確認する</h2>
<p>アプリが Amazon アプリストアで現在入手可能かどうかに応じて、次の 2 つのテストケースのいずれかを選択し、説明に従ってその手順を実行します。この手順でテストされるのは、次の機能です。</p>
<ul>
<li>Amazon ホーム画面ランチャーがアプリと正しく連携して動作する。</li>
<li>アプリがお客様に正しい UX を提供する。</li>
</ul>
<h3>テストケース: アプリが Amazon アプリストアから現在入手可能である場合</h3>
<p>Amazon アプリストアで現在利用できるアプリに対してランチャーとアプリの機能を確認するには、次の手順を実行します。</p>
<ol>
<li>アプリがインストールされていない状態で、プライムでも利用できないコンテンツアイテムの 1 つを選択し、<strong>[その他の視聴方法]</strong> (<strong>MWTW</strong>) ボタンのプロバイダー行に移動します。<br /><br /><img src="https://images-na.ssl-images-amazon.com/images/G/01/mobile-apps/devportal2/content/sdk/images/fire-tv-ci/MWTW_button.png" /><br /><br /><ul>
<li><strong>MWTW</strong> ボタンが表示されていない場合、このコンテンツは他のいずれのプロバイダー (プライムまたは Amazon ビデオ) でも利用できない可能性があります。<br />その場合、コンテンツの <strong>[映画＆TV番組]</strong> 詳細ページで、<strong>[Watch Now with [App Name] – 開く]</strong> ボタンを探します。アプリが無料の試行版である場合、このボタンには「<strong>Watch with [Provider] <strong>–</strong> [X time] Free Trial</strong>」と表示されることに注意してください。<br /><br /><img src="https://images-na.ssl-images-amazon.com/images/G/01/mobile-apps/devportal2/content/sdk/images/fire-tv-ci/No_MWTW_button.png" /></li>
<li><strong>MWTW</strong> ボタンが表示されている場合、そのボタンをクリックします。アプリ名の右側に「<strong>Also Available with [App Name]</strong>」と表示されます。</li>
</ul></li>
<li>アプリ名を <strong>MWTW</strong> リストから選択します (<strong>MWTW</strong> ボタンが表示されていない場合は、<strong>[映画＆TV番組]</strong> 詳細ページからアクションボタンを選択します)。<br />アプリを購入/ダウンロードするためのオプションを含む、アプリの詳細ページが表示されます。<br /><img src="https://images-na.ssl-images-amazon.com/images/G/01/mobile-apps/devportal2/content/sdk/images/fire-tv-ci/DownloadPurchase.png" /><br /><br /></li>
<li>アプリを購入/ダウンロードします。</li>
<li>アプリを開きます。ただし、サインインしません (アプリのアクティブ化画面で終了してください)。</li>
<li>テストプロセスの<strong>手順 2</strong> (後述) に進み、テスト対象のアプリに対応する手順を実行します。</li>
</ol>
<p>
</p>
<h3>テストケース: アプリがまだ Amazon アプリストアに公開されていない場合</h3>
<p>Amazon アプリストアにまだ公開されていないアプリに対してランチャーとアプリの機能を確認するには、次の手順を実行します。</p>
<ol>
<li>APK を Fire TV 端末にサイドロードします (「アプリのインストールと実行」を参照してください)。</li>
<li>プライムでも利用できないコンテンツアイテムの 1 つを選択し、<strong>[その他の視聴方法]</strong> (<strong>MWTW</strong>) ボタンのプロバイダー行に移動します。<br /><br /><img src="https://images-na.ssl-images-amazon.com/images/G/01/mobile-apps/devportal2/content/sdk/images/fire-tv-ci/MWTW_button.png" /><br /><br /><ul>
<li><strong>MWTW</strong> ボタンが表示されていない場合、このコンテンツは他のいずれのプロバイダー (プライムまたは Amazon ビデオ) でも利用できない可能性があります。<br />その場合、コンテンツの [映画＆TV番組] 詳細ページに、「<strong>Watch with [Provider] – 開く</strong>」または「<strong>Watch with [Provider] <strong>–</strong> [X time] Free Trial</strong>」というラベルの付いたボタンが表示されます。<br /><br /><img src="https://images-na.ssl-images-amazon.com/images/G/01/mobile-apps/devportal2/content/sdk/images/fire-tv-ci/No_MWTW_button.png" /><br /></li>
<li><strong>MWTW</strong> ボタンが表示されている場合は、アプリ名の右側に、<strong>[開く]</strong> と表示されます。</li>
</ul></li>
<li>アプリ名を <strong>MWTW</strong> リストから選択します (<strong>MWTW</strong> ボタンが表示されていない場合は、<strong>[映画＆TV番組]</strong> 詳細ページからアクションボタンを選択します)。<br />アプリを開くオプションを含む、アプリの詳細ページが表示されます。アプリはサイドロードされているので、Fire TV システムはアプリがすでにインストールされていることを認識しています。</li>
<li>アプリを開きます。ただし、サインインしません。<br />アプリのアクティブ化画面が表示されます。</li>
<li>テストプロセスの<strong>手順 2</strong> (後述) に進み、テスト対象のアプリに対応する手順を実行します。</li>
</ol>


<a class="anchor" name="手順 2: 選択したコンテンツの再生を確認する"></a>

<h2>手順 2: 選択したコンテンツの再生を確認する</h2>
<p>このテストケースでは、ユーザーが選択したコンテンツの再生が Fire TV 内から直接始まり、途中で一旦アプリに戻る必要がないことを確認します。
</p>
<p>選択したコンテンツが Fire TV 内から再生されることをテストするには、次の手順を実行します。<strong>
<br /></strong>
</p>
<ol>
<li>Fire TV 端末をアクティブ化します (必要な場合)。この手順は、新しい端末の使用開始時に 1 回だけ行う必要があるものです。端末がアクティブ化されていない場合、アクティブ化を完了するように求めるプロンプトが表示されます。</li>
<li>アプリでログイン認証情報とアクティブな登録が必要で、まだ行っていない場合は、アプリにサインインし、登録をアクティブ化する処理を完了します。</li>
<li>アプリから利用できるコンテンツアイテムに移動します。
<br />
<ol type="a">
<li>リモコンの <strong>[戻る]</strong> ボタンを押してアプリから、アプリの詳細ページに戻ります。</li>
<li>このページから、<strong>[映画＆TV番組]</strong> 詳細ページに戻ります。</li>
</ol></li>
<li>ここで、<strong>[購入Box]</strong> ボタンのラベルが、「<strong>Watch Now with [Provider]</strong>」に更新されていなければなりません。</li>
<li>コンテンツを選択して、再生を開始します。
<br />
<ol type="a">
<li><strong>MWTW</strong> ボタンをクリックします (表示されている場合)。</li>
<li><strong>MWTW</strong> メニュー内のリストの最上位に、アプリが単独で表示されます。</li>
<li><strong>[購入Box]</strong> ボタン (または <strong>MWTW</strong> 内のアプリ名) を選択します。
<br />このボタンを選択するとアプリが起動され、選択したコンテンツの再生が試行されます。</li>
<li>選択したコンテンツの再生が開始されたことを確認します。</li>
</ol></li>
<li>アプリが表示されている間、または動画がまさに再生されている間に、1 つ以上の別のコンテンツアイテムについて、このセクションの手順3～5を繰り返します。</li>
</ol>


<a class="anchor" name="手順 3: アプリをアンインストールした際にランチャーが更新されることを確認する"></a>

<h2>手順 3: アプリをアンインストールした際にランチャーが更新されることを確認する</h2>
<p>次の 2 つのテストケースは、アプリが Fire TV 端末に現在インストールされていない場合の、コンテンツアイテムへのディープリンクをテストします。アプリでログイン認証情報が必要かどうかに応じて、該当する方の一連の手順を行います。
</p>
<h3 id="TestCases-TestCase:YourAppDoesNotRequireAnyLoginCredentials">テストケース: アプリがログイン認証情報をいっさい必要としない場合
</h3>
<p>ログイン認証情報を必要としないアンインストール済みアプリに対するディープリンクを確認するには、次の手順を実行します。<strong>
<br /></strong>
</p>
<ol>
<li>Fire TV 端末の [ホーム] ボタンを長押しします。HUD が表示されます。</li>
<li>HUD ポップアップから <strong>[設定]</strong> を選択します。</li>
<li><strong>[アプリケーション] &gt; [インストール済みアプリケーションを管理]</strong> に移動します。</li>
<li>アプリをアンインストールします。</li>
<li>以前のディープリンクテストで使用したコンテンツを探します。</li>
<li><strong>[購入Box]</strong> ボタンがアクティブ化されていない状態に戻っていることを確認します。「<strong>Watch Now with [Provider]</strong>」とは表示されなくなっていなければなりません。</li>
</ol>
<h3 id="TestCases-TestCase:YourAppRequiresLoginCredentials">テストケース: アプリがログイン認証情報を必要とする場合
</h3>
<p>ログイン認証情報を必要とするアンインストール済みリンクに対するディープリンクを確認するには、次の手順を実行します。
</p>
<ol>
<li>アプリからサインアウトします (サインアウトしていない場合)。</li>
<li>アプリから、コンテンツアイテムへのディープリンクをテストするために以前使用したコンテンツページに戻ります。</li>
<li><strong>[購入Box]</strong> ボタンがアクティブ化されていない状態に戻っていることを確認します。「<strong>Watch Now with [Provider]</strong>」とは表示されなくなっていなければなりません。</li>
<li>再びサインインするか、アプリ内の登録を再アクティブ化します。</li>
<li><strong>[購入Box]</strong> ボタンのラベルが、「<strong>Watch Now with [Provider]</strong>」に更新されていることを確認します。</li>
<li>アプリをアンインストールします。
<br />
<ol type="a">
<li><strong>[ホーム]</strong> ボタンを長押しします。
<br /><strong>ヘッドアップディスプレイ (HUD)</strong> が表示されます。</li>
<li><strong>HUD</strong> ポップアップメニューから <strong>[設定]</strong> を選択します。</li>
<li><strong>[アプリケーション] &gt; [インストール済みアプリケーションを管理]</strong> に移動します。</li>
<li>アプリをアンインストールします。</li>
</ol></li>
<li>以前のディープリンクテストで使用したコンテンツを探します。</li>
<li><strong>[購入Box]</strong> ボタンがアクティブ化されていない状態に戻っていることを確認します。「<strong>Watch Now with [Provider]</strong>」とは表示されなくなっていなければなりません。</li>
</ol>


<a class="anchor" name="無効なコンテンツ ID の送信テスト"></a>

<h2>無効なコンテンツ ID の送信テスト</h2>
<p>テストケースとしては、これ以外にも、無効なコンテンツ ID をアプリに送信して、この条件でアプリが適切に処理することを確認する必要があります。アプリがこの条件を適切に処理できない場合は、エラー処理コードを再調査して、必要に応じて修正します。</p>
<p>無効なコンテンツ ID のアプリへの送信をテストするには、次の手順を実行します。</p>
<ol>
<li>アプリを Fire TV 端末にダウンロードまたはサイドロードします。</li>
<li>必要に応じて、サインインし、アプリへの登録をアクティブ化します。</li>
<li>テストアプリ (「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/testing-launcher-integration-with-the-test-app" class="external-link" rel="nofollow">統合テストアプリを使用した Fire TV ランチャー統合テスト</a>」を参照) または ADB コマンド (「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/testing-launcher-integration-with-adb" class="external-link" rel="nofollow">ADB を使用したランチャー統合テスト</a>」を参照) のいずれかを使用して、無効な ID をアプリに送信します。アプリを Fire TV ホーム画面ランチャーに統合する方法の詳細については、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/launcher-integration" class="external-link" rel="nofollow">アプリと Fire TV ホーム画面ランチャーの統合</a>」を参照してください。</li>
<li>最初に、有効な ID を送信して、コンテンツが適切に起動されることを確認します。</li>
<li>次に示す無効な ID 条件をテストします。<br /><ol type="a">
<li>数値で構成される無効な ID を送信する。</li>
<li>英文字で構成される無効な ID を送信する。</li>
<li>数値と文字の混在で構成される無効な ID を送信します。</li>
</ol></li>
<li>無効な ID を送信しても、アプリが適切に処理することを確認します。<br />アプリが起動し、アプリ内のメイン画面が表示されることを確認します。アプリ内のメイン画面が表示されない場合は、表示されるようにエラー処理コードを変更します。</li>
</ol>


<a class="anchor" name="関連リソース"></a>

<h2>関連リソース</h2>
<h2>関連リソース</h2>
<ul>
<li>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/overview/integrating-your-catalog-with-fire-tv">カタログと Amazon Fire TV の統合</a>:Fire TV カタログ統合のランディングページ。
</li>
<li>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/understanding-fire-tv-catalog-integration">Fire TV カタログ統合について</a>:カタログ統合の概念の紹介。
</li>
<li>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-integration">カタログ統合の準備</a>：Fire TV カタログ統合のクイックスタートガイド。
</li>
<li>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-cdf-overview">カタログデータ形式（CDF）について</a>:カタログファイルに必要な構成方法と必須フィールドに関する説明。
</li>
<li>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/setting-up-your-aws-account-for-fire-tv-catalog-integration">Fire TV カタログ統合のための AWS アカウントのセットアップ</a>:AWS の 1 回限りのセットアップ手順。
</li>
<li>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-upload">Amazon へのカタログのアップロード</a>:CDF ファイルを Amazon S3 にアップロードする方法。
</li>
<li>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/receiving-and-understanding-the-catalog-ingestion-report">カタログインジェストレポートの取得とその内容</a>:カタログの統合ステータスに関するレポートのオプトインと使用方法について。
</li>
<li>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-ingestion-report-messages">カタログデータ形式インジェストレポートのメッセージ</a>:各インジェストレポート情報の読み方と対処方法。
</li>
<li>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/launcher-integration">ランチャー統合</a>:アプリと Fire TV ホーム画面ランチャーの統合について。
</li>
<li>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/testing-launcher-integration-with-adb">ADB を使用したランチャー統合テスト</a>:Android Debug Bridge（ADB）を使用したアプリのランチャー統合のテストについて。
</li>
<li>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/testing-launcher-integration-with-the-test-app">テストアプリを使用したランチャー統合テスト</a>:Amazon のテストアプリシミュレーターを使用したアプリのランチャー統合のテストについて。
</li>
<li>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/fire-tv-catalog-integration-faqs">Fire TV カタログ統合の FAQ</a>:カタログ統合についてのよくある質問。
</li>
<li>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/migrating-a-cdf-file-to-the-latest-version">カタログデータ形式（CDF）ファイルの最新バージョンへの移行</a>:カタログで最新バージョンの CDF スキーマが使用されるようにする方法。
</li>
<li>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference">カタログデータ形式（CDF）スキーマリファレンス</a>:すべての CDF 要素の定義、要件、サンプル。
</li>
<li><strong>Fire TV のディープリンクを確認するためのテストケース</strong>: アプリのランチャー統合を確認するために実行するテストケースについて。</li>
</ul>



{% include links.html %}
