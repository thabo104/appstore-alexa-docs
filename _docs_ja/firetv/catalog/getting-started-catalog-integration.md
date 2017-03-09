---
title: Fire TV カタログ統合の準備
permalink: getting-started-catalog-integration.html
sidebar: catalog_ja
product: Fire TV Catalog
toc-style: kramdown
github: true
---


<h2>はじめに</h2>
<p>このページでは、Fire TV 統合に必要なカタログファイルを作成し、Amazon にファイルを提出して、カタログ統合に必要な変更をアプリに加えるためのプロセスについて詳しく説明します。このプロセスを開始する前に、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/understanding-fire-tv-catalog-integration" rel="nofollow">Fire TV カタログ統合について</a>」に説明されている Fire TV カタログ統合の基本概念について十分に理解してください。
</p>
<p>注意: 現時点ではAmazonインスタントビデオに存在するタイトルのみがカタログ統合への対象となります。今後この制限は緩和する予定です。</p>


<a class="anchor" name="開始前の確認"></a>

<h2>開始前の確認</h2>
<p>カタログ統合プロセスを開始する前に、以下の要件を満たしている、または簡単に満たせることを確認してください。</p>
<ul>
<li><strong>アプリのメタデータへの容易なアクセス</strong>: ほとんどのアプリでは、データベースからメタデータをエクスポートする必要があり、それができない場合は手動でカタログファイルを作成することが必要になります。</li>
<li><strong>アマゾン ウェブ サービス（AWS）アカウント</strong>: 組織内の誰かが AWS アカウントを持ち、AWS S3 ツールに習熟しているか習熟する意欲がある必要があります。Fire TV が開発者様のカタログを取得して統合できるように、コマンドラインインターフェイス（CLI）を使用して複数の AWS コマンドを実行し、カタログファイルを AWS にアップロードする必要があります。Amazon では、AWS SDK を使用してこのプロセスを自動化することを推奨しています。</li>
<li><strong>アプリのソースコードへのアクセス</strong>: アプリとそのコンテンツを Fire TV ホーム画面ランチャーに統合するには、アプリのソースコードに多少の変更を加える必要があります。アプリのソースコードに変更を加える担当者は、Android 開発の基本的な理解が必要になります。</li>
</ul>
<p>このページで説明する手順は、開発者または IT プロフェッショナルを対象としています。確かな技術的経験をお持ちでない場合、Amazon では、カタログ統合プロセスの完了と自動化をサポートできる人に協力を求めることを推奨しています。</p>


<a class="anchor" name="統合プロセスの概要"></a>

<h2>統合プロセスの概要</h2>
<p>カタログ統合は、主に次の 2 つの要素で構成されます。
</p>
<ul>
<li>カタログの作成とアップロード</li>
<li>アプリと Amazon Fire TV ホーム画面ランチャーの統合</li>
</ul>
<p>カタログの作成とアップロードは、複数のステップから成るプロセスで、自動化を利用することで単純化できます。このプロセスの自動化と単純化を行うための cron ジョブのスクリプト作成と設定に、1 名の開発者を割り当てることを検討してください。また、アプリと Amazon ホーム画面ランチャーの統合に対応するために、2 人目の開発者が必要になります。できれば Android 開発の経験のある方が推奨されます。カタログ統合を問題なく行うには、これら 2 つのプロセスの完了が必要ですが、互いに依存関係はないため、各プロセスの開発作業は並行して行うことができます。
</p>
<h3>カタログの作成とアップロード
</h3>
<p>次の図は、メディアカタログファイルを作成し、そのファイルを AWS S3 ストレージにアップロードするための大まかな手順を示しています。
</p>
<p><img src="https://images-na.ssl-images-amazon.com/images/G/01/mobile-apps/devportal2/content/sdk/images/fire-tv-ci/Catalog_Process.png" />
</p>
<ol>
<li>カタログメタデータ用にカタログデータ形式（CDF）で XML ファイルを作成します。</li>
<li> <a href="https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog.xsd" class="external-link" rel="nofollow">CDF スキーマ（xsd）</a>ファイルに対して CDF ファイルを検証します。</li>
<li>Amazon によって開発者様用に作成されるアマゾン ウェブ サービス（AWS）S3 カタログバケットに CDF ファイルをアップロードします。</li>
<li>Amazon で生成されるインジェストレポートで CDF ファイルが正常にインジェストされているかどうかを確認し、失敗している場合はレポートの内容に基づいてトラブルシューティングを行います。</li>
</ol>
<h3>Amazon Fire TV ホーム画面ランチャーとの統合
</h3>
<p>次の図は、アプリを Amazon Fire TV ホーム画面ランチャーに統合し、その統合をテストするための大まかな手順を示しています。
</p>
<p><img src="https://images-na.ssl-images-amazon.com/images/G/01/mobile-apps/devportal2/content/sdk/images/fire-tv-ci/Launcher_Process.png" />
</p>
<ol>
<li>アプリを Amazon Fire TV ホーム画面ランチャーに統合するようにアプリのコードを変更します。</li>
<li>アプリとランチャーの統合をテストします。</li>
</ol>


<a class="anchor" name="手順 1:CDF ファイルの作成"></a>

<h2>手順 1:CDF ファイルの作成</h2>
<p>まず、アプリのコンテンツカタログのメタデータを記載した　カタログ定義形式（CDF）ファイルを作成する必要があります。CDF ファイルとは、Amazon の CDF スキーマで定義されている形式に準拠した XML ファイルです。</p>
<p>カタログファイルの構造の詳細については、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-cdf-overview" class="external-link" rel="nofollow">カタログデータ形式（CDF）について</a>」および「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference" class="external-link" rel="nofollow">カタログデータファイルスキーマリファレンス</a>」を参照するか、<a href="https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog.xsd" class="external-link" rel="nofollow">CDF</a> <a href="https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog.xsd" class="external-link" rel="nofollow">XSD ファイル</a>をダウンロードしてください。</p>
<p>このファイルは、以下の 2 つの方法のいずれかで作成できます。</p>
<ul>
<li>自動化されたプロセスを使用して、データベースからデータをエクスポートし、そのデータを CDF スキーマに準拠した CDF XML ファイルに変換することで、ファイルを作成する。</li>
<li>手動で CDF ファイルを作成する。</li>
</ul>
<h3 id="GettingStartedwithFireTVCatalogIntegration(DRAFT)-CreatingtheCDFfileviaExportingandTransformingYourData">データのエクスポートと変換による CDF ファイルの作成</h3>
<p>Fire TV と統合するアプリは、ほとんどの場合、自動プロセスを使用してアプリのカタログデータ用の CDF ファイルを作成できます。</p>
<p>自動プロセスを使用して CDF ファイルを作成するには、以下の手順に従います。</p>
<ol>
<li>アプリのデータベースからメタデータをエクスポートします。データのエクスポートについてサポートが必要な場合は、組織内のデータベース管理者かサポート担当者に相談してください。エクスポート対象のフィールドは、CDF スキーマで定義されているフィールドとほぼ同等であることが必要です（「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-cdf-overview" class="external-link" rel="nofollow">カタログデータ形式（CDF）について</a>」および「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference" class="external-link" rel="nofollow">カタログデータファイルスキーマリファレンス</a>」を参照）。
</li>
<li>CDF ドキュメントを参照し、エクスポートしたデータを CDF スキーマに準拠した XML ファイルにコピーするための XSLT 変換を記述します。サポートが必要な場合は開発者に相談してください。</li>
</ol>
<h3 id="GettingStartedwithFireTVCatalogIntegration(DRAFT)-ManuallyCreatingyourCDFFile">手動による CDF ファイルの作成</h3>
<p>コンテンツカタログのメタデータがデータベースに保存されていない場合や、何らかの理由によりそのデータをエクスポートして XML ファイルに変換することができない場合は、手動で CDF ファイルを作成することが必要になります。</p>
<p>手動で CDF ファイルを作成するには、以下の手順に従います。</p>
<ol>
<li>XML の扱いにまだ慣れていない場合は、XML とその概念についてよく理解します。</li>
<li>CDF ファイルのテンプレートとして使用できる CDF スキーマ XSD ファイルをダウンロードします: <a href="https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog.xsd" class="external-link" rel="nofollow">CDF XSD ファイルのダウンロード</a>。
</li>
<li>CDF ドキュメントを参照し、XML エディター（多くのエディターがさまざまな提供元からダウンロードできます）を使用して、アプリのカタログデータ用の CDF ファイルを作成します。</li>
</ol>


<a class="anchor" name="手順 2:CDF ファイルの検証"></a>

<h2>手順 2:CDF ファイルの検証</h2>
<p>Amazon では、CDF ファイルを AWS にアップロードする前に、ファイルの検証を行うことを推奨しています。ローカルでファイルを検証することで、ファイルのインジェストや Fire TV カタログへの統合に支障をきたすエラーを防ぐことができます。Amazonの CDF XSD ファイルに記載されたスキーマに対して CDF ファイルを検証してください。<a href="https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog.xsd" class="external-link" rel="nofollow">こちらから CDF XSD ファイルをダウンロードできます。</a></p>
<p>XML 検証ツールで確認できるのは、XML 形式が適切であり（例：タグの破損や欠落がない）、CDF スキーマに対して有効である（例：不正確な入れ子になった要素がない）ことだけです。XML 検証によって CDF ファイルの一般的なエラーは検出できますが、AWS にファイルをアップロードするまでわからないエラーが残る場合もあります。</p>
<p>CDF ファイルの検証には、XML 検証ツールを使用してください。CDF 検証ツールは各種ソースから無料で入手できます。Amazon では提供していません。</p>
<ul>
<li>IDE を使って CDF ファイルを作成または編集した場合は、IDE に XML 検証ツールが含まれている可能性があります。</li>
<li>Mac または Linux では、<a href="http://xmlsoft.org/xmllint.html" class="external-link" rel="nofollow">xmllint</a> ユーティリティを使用してください。Mac または Linux の OS には通常、このようなユーティリティが事前にインストールされています。
</li>
<li>Windows の場合は、各種 XML 検証ツールを無料でダウンロードすることができます。</li>
</ul>
<p>xmllint を使用して CDF ファイルを検証するには、以下の手順に従います。</p>
<ol>
<li>
<a href="https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog.xsd" class="external-link" rel="nofollow">CDF XSD ファイル</a>をダウンロードし、作成済みの CDF ファイルと同じディレクトリにコピーまたは移動します。
</li>
<li>ターミナルウィンドウ（Windows ではコマンドウィンドウ）を開き、コンピューターのコマンドラインインターフェイスにアクセスします。</li>
<li>シェルのプロンプトが表示されたら、以下のコマンドを入力します。<br>
<br>
<code>$ xmllint --schema catalog.xsd --noout &lt;cdf_file_name&gt;.xml</code><br>
<br>
"$" はシェルプロンプトを表しています。"&lt;cdf_file_name&gt;" は実際の CDF ファイル名に置き換えてください。--noout オプションを指定すると、xmllint が XML ファイルをトラバースする際に、エクストラが出力されません。検証の終了後、ファイルにエラーがあった場合は xmllint によってレポートされます。ない場合は XML ファイルが指定のスキーマに対して有効であることがレポートされます。</li>
</ol>
<p><strong>注意</strong>:サンプルからコマンドをコピーして貼り付ける場合は、ダブルハイフン（"--"）がブラウザやターミナルエディターによって en ダッシュに自動修正されていないことを確認してください。</p>


<a class="anchor" name="手順 3:AWS S3 への CDF ファイルのアップロード"></a>

<h2>手順 3:AWS S3 への CDF ファイルのアップロード</h2>
<p>CDF ファイルが有効であることを検証したら、次のコマンドを使用して、Amazon によって開発者様のカタログ用に設定された S3 バケットに CDF ファイルをアップロードできます。 <code class="plain plain">
<br />
<br /> $ aws s3api put-object --body &lt;catalog_file_name.xml&gt; --bucket &lt;s3_bucket_name&gt; --key catalogs/catalog.xml --acl bucket-owner-full-control</code> <strong>
<br />
<br /> 注意</strong>: このコマンドをコピーしてターミナルウィンドウに貼り付ける場合、"--" が en ダッシュではなく二重ダッシュになっていることを確認してください。山かっこ（"&lt;&gt;"）内のテキストは、実際のファイル名とバケット名の値に置き換えてください。
</p>
<p>詳細な手順については、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-upload" class="external-link" rel="nofollow">Amazon へのカタログのアップロード</a>」を参照してください。
</p>


<a class="anchor" name="手順 4:アップロードした CDF ファイルの検証"></a>

<h2>手順 4:アップロードした CDF ファイルの検証</h2>
<p>新しい CDF ファイルをアップロードするたびに、カタログデータのインポート結果について成功か失敗かを示すレポートがカタログバケットに配信されます。このレポートの詳細と、CDF のアップロードが失敗した場合のトラブルシューティングにレポートを活用する方法については、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/receiving-and-understanding-the-catalog-ingestion-report" class="external-link" rel="nofollow">インジェストレポートの取得とその内容</a>」を参照してください。
</p>


<a class="anchor" name="手順 5:アプリと Fire TV ホーム画面ランチャーの統合"></a>

<h2>手順 5:アプリと Fire TV ホーム画面ランチャーの統合</h2>
<p>有効なカタログが Amazon によってインジェストされたら、Fire TV ホーム画面ランチャーと統合するために、アプリのソースコードに少し変更を加える必要があります。ホーム画面ランチャーは、以下のようなタイプの機能を扱います。</p>
<ul>
<li>ユーザーのサインイン</li>
<li>ユニバーサル閲覧・検索</li>
<li>コンテンツの再生</li>
</ul>
<p>ランチャー統合の詳細な手順とサンプルについては、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/launcher-integration">ランチャー統合</a>」を参照してください。<br></p>
<p>アプリと Fire TV ホーム画面ランチャーを統合するには、以下の手順に従います。</p>
<ol>
<li>アプリのソースコードで、ユーザーの登録ステータスとアプリに関するその他の情報が格納されたインテントを設定します。<br>
<ol type="a">
<li>アプリのソースコードで、アプリの機能をブロードキャストするために使用できる標準の Android インテントを作成します。</li>
<li>アプリが起動したとき、Fire TV ランチャーからインテントが要求されたとき、またはユーザーの登録ステータスが変更されたときに、アプリによってインテントがブロードキャストされるようにします。</li>
<li>アプリのコンテキストを使用してインテントを送信します。</li>
</ol>
</li>
<li>コード内に、Fire TV ランチャーからの機能リクエストを受信するクラスを追加します。</li>
<li>Fire TV ランチャーから再生インテントとサインインインテントを受信して処理するためのアクティビティをアプリに実装します。</li>
<li>以下の各要素をアプリの Android マニフェストに追加します。
<ul>
<li>Fire TV ランチャーからインテントを受信するための、再生アクティビティとサインインアクティビティ用の <code>&lt;intent-filter&gt;</code> 要素。</li>
<li><code>BroadcastReceiver</code> クラスの名前を指定する android:name 属性を持ち、<code>com.amazon.device.REQUEST_CAPABILITIES</code> アクション用の <code>&lt;intent-filter&gt;</code> を子要素として含む、<code>&lt;receiver&gt;</code> 要素。</li>
<li>Fire TV ランチャーが確実にインテントを受け付けるようにするための <code>&lt;uses-permissions&gt;</code> 要素。</li>
</ul>
</li>
</ol>


<a class="anchor" name="手順 6:アプリと Fire TV ホーム画面ランチャーの統合のテスト"></a>

<h2>手順 6:アプリと Fire TV ホーム画面ランチャーの統合のテスト</h2>
<p>アプリと Fire TV の統合は、以下の 2 つの方法でテストできます。Fire TV とのカタログ統合が期待通りに機能するように、これらの方法によってアプリに加えた変更が正しいかを検証します。
</p>
<ul>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/testing-launcher-integration-with-adb" class="external-link" rel="nofollow">ADB を使用したランチャー統合テスト</a>: Android Debug Bridge（ADB）ユーティリティを使用して、アプリを Fire TV 端末にサイドロードし、サインインインテントと再生インテントにアプリが正しく応答するかどうかを検証します。この方法は、アプリの開発が完了し、再生用のランチャーインテントに応答するコードが実装済みの場合に使用してください（「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/launcher-integration" rel="nofollow">ランチャー統合</a>」を参照）。また、この方法でアプリからのコンテンツ再生を検証することもできます。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/testing-launcher-integration-with-the-test-app" class="external-link" rel="nofollow">テストアプリを使用したランチャー統合テスト</a>: Amazon が提供するテストアプリをダウンロードして使用し、アプリをテストして、サインインインテントと再生インテントにアプリが正しく応答するかどうかを検証します。この方法は、アプリの開発がまだ完了していない場合や、ランチャーからのインテントに応答するコードを実装していない場合に使用してください（「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/launcher-integration" rel="nofollow">ランチャー統合</a>」を参照）。</li>
</ul>


<a class="anchor" name="関連リソース"></a>

<h2>関連リソース</h2>
<ul>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/overview/integrating-your-catalog-with-fire-tv">カタログと Amazon Fire TV の統合</a>:Fire TV カタログ統合のランディングページ。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/understanding-fire-tv-catalog-integration">Fire TV カタログ統合について</a>:カタログ統合の概念の紹介。</li>
<li><strong>カタログ統合の準備</strong>:カタログ統合のクイックスタートガイド。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-cdf-overview">カタログデータ形式（CDF）について</a>:カタログファイルに必要な構成方法と必須フィールドに関する説明。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/setting-up-your-aws-account-for-fire-tv-catalog-integration">Fire TV カタログ統合のための AWS アカウントのセットアップ</a>:AWS の 1 回限りのセットアップ手順。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-upload">Amazon へのカタログのアップロード</a>:CDF ファイルを Amazon S3 にアップロードする方法。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/receiving-and-understanding-the-catalog-ingestion-report">カタログインジェストレポートの取得とその内容</a>:カタログの統合ステータスに関するレポートのオプトインと使用方法について。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-ingestion-report-messages">カタログデータ形式インジェストレポートのメッセージ</a>:各インジェストレポート情報の読み方と対処方法。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/launcher-integration">ランチャー統合</a>:アプリと Fire TV ホーム画面ランチャーの統合について。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/testing-launcher-integration-with-adb">ADB を使用したランチャー統合テスト</a>:Android Debug Bridge（ADB）を使用したアプリのランチャー統合のテストについて。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/testing-launcher-integration-with-the-test-app">テストアプリを使用したランチャー統合テスト</a>:Amazon のテストアプリシミュレーターを使用したアプリのランチャー統合のテストについて。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/fire-tv-catalog-integration-faqs">Fire TV カタログ統合の FAQ</a>:カタログ統合についてのよくある質問。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/migrating-a-cdf-file-to-the-latest-version">カタログデータ形式（CDF）ファイルの最新バージョンへの移行</a>:カタログで最新バージョンの CDF スキーマが使用されるようにする方法。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference">カタログデータ形式（CDF）スキーマリファレンス</a>:すべての CDF 要素の定義、要件、サンプル。</li>
<li><a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/test-cases-for-verifying-deep-links-from-your-fire-tv-catalog">Fire TV のディープリンクを確認するためのテストケース</a>: アプリのランチャー統合を確認するために実行するテストケースについて。</li>

</ul>



{% include links.html %}
