---
title: Uploading Your Catalog to Amazon
permalink: uploading-your-catalog.html
sidebar: catalog_ja
product: Fire TV Catalog
toc: false
github: true
---

<h2>はじめに</h2>
<p>このページでは、カタログデータ形式（CDF）ファイルを検証して、Amazon のカタログのインジェスト用 AWS S3 バケットにアップロードする方法を説明します。Amazon では、アップロードの前に CDF ファイルの検証を行うことを強く推奨しています。アップロード処理の一環として検証を行ってください。</p>


<a class="anchor" name="前提条件"></a>

<h2>前提条件</h2>
<p>Amazon にカタログをアップロードする前に、AWS アカウントをセットアップし、12 桁の AWS アカウント ID を Amazon Fire TV の担当者に提供する必要があります。Fire TV の担当者がカタログのインジェスト用の AWS S3 バケットを作成し、開発者様にバケットへのアクセス許可を設定します。詳細については、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/setting-up-your-aws-account-for-fire-tv-catalog-integration" rel="nofollow">Fire TV カタログ統合のための AWS アカウントのセットアップ</a>」を参照してください。</p>


<a class="anchor" name="CDF ファイルの検証"></a>

<h2>CDF ファイルの検証</h2>
<p>Amazon では、CDF ファイルを AWS にアップロードする前に、ファイルの検証を行うことを推奨しています。ローカルでファイルを検証することで、ファイルのインジェストや Fire TV カタログへの統合に支障をきたすエラーを防ぐことができます。Amazonの CDF XSD ファイルに記載されたスキーマに対して CDF ファイルを検証してください。こちらから <a class="external-link" href="https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog.xsd" rel="nofollow">CDF XSD ファイル</a>をダウンロードできます。</p>
<p>XML 検証ツールで確認できるのは、XML 形式が適切であり（例：タグの破損や欠落がない）、CDF スキーマに対して有効である（例：不正確な入れ子になった要素がない）ことだけです。XML 検証によって CDF ファイルの一般的なエラーは検出できますが、AWS にファイルをアップロードするまでわからないエラーが残る場合もあります。</p>
<p>CDF ファイルの検証には、XML 検証ツールを使用してください。XML 検証ツールは各種ソースから無料で入手できます。Amazon では提供していません。</p>
<ul>
<li>IDE を使って CDF ファイルを作成または編集した場合は、IDE に XML 検証ツールが含まれている可能性があります。</li>
<li>Mac または Linux では、<a class="external-link" href="http://xmlsoft.org/xmllint.html" rel="nofollow">xmllint</a> ユーティリティを使用してください。Mac または Linux の OS には通常、このようなユーティリティが事前にインストールされています。
</li>
<li>Windows の場合は、各種 XML 検証ツールを無料でダウンロードすることができます。<br></li>
</ul>
<p>xmllint を使用して CDF ファイルを検証するには、以下の手順に従います。</p>
<ol>
<li>
<a class="external-link" href="https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog.xsd" rel="nofollow">CDF XSD ファイル</a>をダウンロードし、作成済みの CDF ファイルと同じディレクトリにコピーまたは移動します。
</li>
<li>ターミナルウィンドウ（Windows ではコマンドウィンドウ）を開き、コンピューターのコマンドラインインターフェイスにアクセスします。</li>
<li>シェルのプロンプトが表示されたら、以下のコマンドを入力します。<br>
<br>
<code>$ xmllint --schema catalog.xsd --noout &lt;cdf_file_name&gt;.xml</code><br>
<br>
"$" はシェルプロンプトを表しています。"&lt;cdf_file_name&gt;" は実際の CDF ファイル名に置き換えてください。--noout オプションを指定すると、xmllint が XML ファイルをトラバースする際に、エクストラが出力されません。検証の終了後、ファイルにエラーがあった場合は xmllint によってレポートされます。ない場合は XML ファイルが指定のスキーマに対して有効であることがレポートされます。</li>
</ol>


<a class="anchor" name="CDF ファイルのアップロード"></a>

<h2>CDF ファイルのアップロード</h2>
<p>カタログは、カタログバケットの S3 バケット内の <code>catalogs</code> フォルダーに格納されています。任意の S3 ツールを使用してカタログファイルをこのバケットとフォルダーにアップロードしてください。
</p>
<p>CDF ファイルを S3 バケットにアップロードするには、以下の手順に従います。
</p>
<ol>
<li>以下のコマンドを入力します。&lt;catalog_file_name.xml&gt; は CDF ファイル名に、&lt;s3_bucket_name&gt; は S3 バケット名に置き換えてください<code>。</code><code class="plain plain">"--acl bucket-owner-full-control"</code> オプションは、アップロードされたファイルを Amazon が読み取り、カタログをインジェストするために必要です。 <code class="plain plain">
<br />
<br /> $ aws s3api put-object --body &lt;catalog_file_name.xml&gt; --bucket &lt;s3_bucket_name&gt; --key catalogs/catalog.xml --acl bucket-owner-full-control</code> <strong>
<br />
<br /> 注意</strong>：このコマンドをコピーしてターミナルウィンドウに貼り付ける場合は、"--" が en ダッシュではなく二重ダッシュになっていることを確認してください。
<br />
<br /> このコマンドを実行すると、2 GB までのサイズのファイルが正常にアップロードされます。正常に終了すると、AWS CLI にファイルの VersionID、ETag、Expiration のタグが表示されます。 <strong>
<br />
<br /></strong></li>
<li>S3 バケットにカタログファイルが表示されていることを確認します。以下のコマンドを入力して、S3 バケット内のすべてのファイルを一覧表示します。
<br />
<br /> <code class="plain plain">$ aws s3 ls s3://&lt;s3_bucket_name&gt;/catalogs/</code></li>
</ol>
<p>カタログバケットには複数のカタログをアップロードすることができますが、Amazon が使用するカタログは、ファイル名を問わず、最後にアップロードされたカタログだけです。カタログに問題が見つかった場合、または CDF ファイルのデータを更新する必要がある場合は、新しいファイルをアップロードするだけで完了できます。
</p>
<h3 id="UploadingYourCatalogtoAmazon-ExampleWorkflow">ワークフローの例
</h3>
<p>以下のコマンド例は、<code>my-catalog.xml</code> という名前のカタログファイルを <code>cdf-bucket</code> という名前の S3 バケットにアップロードします。
</p>
<div>
<div class="syntaxhighlighter nogutter plain">
<p><code class="plain plain">$ aws s3api put-object --body my-catalog.xml --bucket cdf-bucket --key catalogs/catalog.xml --acl bucket-owner-full-control
<br /></code>
</p>
</div>
<div class="syntaxhighlighter nogutter plain"> このコマンドを実行すると、以下の出力が返されます。
</div>
</div>
<pre>{</pre>
<pre>    "VersionId": "m_QwgKPy9RJZsWperU_LEULD1waJE2He",</pre>
<pre>    "ETag": "\"e8c38d5258ad1f3b241ae2ce347e40bc\"",</pre>
<pre>    "Expiration": "expiry-date=\"Fri, 06 Jan 2017 00:00:00 GMT\", rule-id=\"Rule for the Entire Bucket\""</pre>
<pre>}</pre>
<p>my-catalog.xml ファイルが正常にアップロードされたことを確認するには、以下のコマンドを使用します。
</p>
<p><code class="plain plain">$ aws s3 ls s3://cdf-bucket/catalogs/</code>
</p>
<p>このコマンドを実行すると、現在バケットにあるすべてのカタログファイルのリストが返されます。
</p>
<p><code>2015-12-07 15:02:17&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10236 my-catalog.xml</code>
<br /> <code>2015-12-01 15:10:28&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 166 other-catalog.xml</code>
</p>


<a class="anchor" name="関連リソース"></a>

<h2>関連リソース</h2>
<ul>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/overview/integrating-your-catalog-with-fire-tv">カタログと Amazon Fire TV の統合</a>:Fire TV カタログ統合のランディングページ。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/understanding-fire-tv-catalog-integration">Fire TV カタログ統合について</a>:カタログ統合の概念の紹介。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-integration">カタログ統合の準備</a>：Fire TV カタログ統合のクイックスタートガイド。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-cdf-overview">カタログデータ形式（CDF）について</a>:カタログファイルに必要な構成方法と必須フィールドに関する説明。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/setting-up-your-aws-account-for-fire-tv-catalog-integration">Fire TV カタログ統合のための AWS アカウントのセットアップ</a>:AWS の 1 回限りのセットアップ手順。</li>
<li> <strong>Amazon へのカタログのアップロード</strong>:CDF ファイルを Amazon S3 にアップロードする方法。</li>
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


<a class="anchor" name="AWS に関するその他のリソース"></a>

<h2>AWS に関するその他のリソース</h2>
<p>AWS や Amazon S3 に関する詳細については、以下のリンク先を参照してください。
</p>
<ul>
<li> <a title="アマゾン ウェブ サービス" href="http://aws.amazon.com/">アマゾン ウェブ サービス</a>：すべての AWS 製品</li>
<li> <a href="http://aws.amazon.com/s3/">Amazon Simple Storage Service（S3）</a>：安全なオブジェクトストレージ</li>
<li> <a href="http://aws.amazon.com/iam/">Amazon Identity and Access Management（IAM）</a>：AWS アカウントのユーザーとロールを定義</li>
<li> <a href="http://aws.amazon.com/developers/getting-started/">アマゾン ウェブ サービスを使った開発の始め方</a>：さまざまな言語とプラットフォームのドキュメント、SDK、サンプルアプリ</li>
<li> <a href="http://aws.amazon.com/cli/">AWS コマンドラインインターフェイス（CLI）</a>： AWS サービスへのシンプルなアクセス手段</li>
<li> <a href="http://aws.amazon.com/tools/">アマゾン ウェブ サービスのツール</a>：すべての SDK とサンプルコード</li>
<li> <a href="http://aws.amazon.com/sdk-for-java/">AWS SDK for Java</a>：AWS を開発者様の Java アプリと統合</li>
<li> <a href="http://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/AmazonS3Client.html">Amazon S3 クライアント</a>：Amazon S3 にアクセスするための Java クラス</li>
<li> <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/UploadObjSingleOpJava.html">AWS SDK for Java を使用したオブジェクトのアップロード</a>：データを Amazon S3 にアップロードするためのサンプルコード</li>
</ul>



{% include links.html %}
