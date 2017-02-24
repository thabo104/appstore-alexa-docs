---
title: Fire TV カタログ統合のための AWS アカウントのセットアップ
permalink: setting-up-your-aws-account-for-fire-tv-catalog-integration.html
sidebar: catalog_ja
product: Fire TV Catalog
toc: false
github: true
---


<h2>はじめに</h2>
<p>Fire TV カタログ統合では、アマゾン ウェブ サービス（AWS）のツールを使用して、カタログをアップロードします。また、カタログの保存用ツールへのアクセスを許可するユーザーの管理も、このツールで行います。カタログファイルをアップロードする前に、AWS アカウントをセットアップし、Amazon Fire TV の担当者とアカウント情報を交換する必要があります。</p>


<a class="anchor" name="手順の概要"></a>

<h2>手順の概要</h2>
<p>AWS アカウントのセットアップは、一度で完了します。Amazon へのカタログファイルのアップロードを開始する前にセットアップを完了しておく必要があります。AWS アカウントのセットアップとテストを行うには、次の手順を実行します。</p>
<ol>
  <li>AWS アカウントにサインインまたはサインアップします。</li>
  <li>Amazon Fire TV の担当者に、12 桁の AWS アカウント ID（IAM ユーザー ID とは異なります）を送信します。</li>
  <li>Amazon Fire TV の担当者からアプリ用の S3 バケット情報を取得します。</li>
  <li>Identity and Access Management（IAM）AWS ユーザーに、Fire TV S3 バケットにファイルをアップロードするためのアクセス許可を付与します。</li>
  <li>IAM ユーザーのポリシーをテストします。</li>
  <li>AWS CLI をセットアップします（必要な場合）。</li>
  <li>サンプル CDF ファイルと AWS コマンドラインインターフェイス（CLI）を使用してカタログのアップロードのテストを行い、カタログファイルをアップロードできることを確認します。</li>
</ol>


<a class="anchor" name="手順 1：AWS アカウントにサインインする、またはサインアップする（新規 AWS ユーザーの場合）"></a>

<h2>手順 1：AWS アカウントにサインインする、またはサインアップする（新規 AWS ユーザーの場合）</h2>
<p>カタログファイルを Amazon S3 で Amazon のサービスにアップロードするには、アマゾン ウェブ サービス（AWS）のアカウントが必要です。AWS アカウントをお持ちの場合は、アカウントにサインインしてください。お持ちでない場合は、AWS アカウントを作成する必要があります。
</p>
<p>AWS アカウントを作成するには、以下の手順に従います。
</p>
<ol>
<li>AWS ホーム ページにアクセスします。
<br /> <a href="http://aws.amazon.com/" class="external-link" rel="nofollow">http://aws.amazon.com/</a></li>
<li>[<strong>コンソールへサインイン</strong>] ボタンをクリックします。ログイン画面が表示されます。</li>
<li>E メールアドレスまたは携帯電話番号を入力します。</li>
<li>[<strong>私は新規ユーザーです</strong>] オプションを選択します。</li>
<li>[<strong>サインイン（セキュリティシステムを使う）</strong>] ボタンをクリックします。</li>
<li>指示に従ってアカウントを作成します。</li>
</ol>


<a class="anchor" name="手順 2：Amazon Fire TV の担当者に、12 桁の AWS アカウント ID を送信する"></a>

<h2>手順 2：Amazon Fire TV の担当者に、12 桁の AWS アカウント ID を送信する</h2>
<p>Fire TV サービスが、Amazon によって作成された S3 カタログバケットへのアクセス許可を付与できるように、セキュリティで保護された方法で、Amazon Fire TV の担当者に AWS アカウントの 12 桁のアカウント ID を送信します。
</p>
<p>AWS アカウント ID は、IAM ユーザー専用のアクセスキー ID やシークレットアクセスキーとは異なります。
</p>
<p>AWS アカウント ID を確認するには、以下の手順に従います。
</p>
<ul>
<li>アカウント所有者（ルートアカウントユーザー）の場合は、[<a href="https://console.aws.amazon.com/iam/home#security_credential" class="external-link" rel="nofollow">セキュリティ認証情報</a>] ページの [<strong>アカウント ID</strong>] タブの下に AWS アカウント ID が表示されます。</li>
</ul>
<p><img src="https://images-na.ssl-images-amazon.com/images/G/01/mobile-apps/devportal2/content/sdk/images/fire-tv-ci/AccountID_root.png" />
</p>
<ul>
<li>IAM ユーザーまたはフェデレーションユーザーの場合は、<a href="https://console.aws.amazon.com/support/home#/support/home" class="external-link" rel="nofollow">サポートセンター</a>の右上隅に表示されます（IAM ユーザーのセットアップを完了していない場合は、次のセクションに記載された手順を参照してください。IAM ユーザーのセキュリティポリシーを設定するには、Amazon Fire TV の担当者から S3 バケットの名前を入手する必要があります）。
<br /></li>
</ul>
<p><img src="https://images-na.ssl-images-amazon.com/images/G/01/mobile-apps/devportal2/content/sdk/images/fire-tv-ci/AccountID.png" />
</p>


<a class="anchor" name="手順 3：Amazon Fire TV の担当者からアプリ用の S3 バケット情報を取得する"></a>

<h2>手順 3：Amazon Fire TV の担当者からアプリ用の S3 バケット情報を取得する</h2>
<p>AWS アカウント ID を Amazon Fire TV 担当者に送信すると、担当者から S3 バケットの名前が送信されます。このカタログバケットはアカウントに固有のものであり、開発者様のアカウントだけがアクセスできます。他のカタログ統合パートナーは、開発者様の S3 カタログバケットを表示することもアクセスすることもできません。
</p>


<a class="anchor" name="手順 4：Fire TV S3 カタログバケットにファイルをアップロードできるように、Identity and Access Management（IAM）AWS ユーザーにアクセス許可を付与する"></a>

<h2>手順 4：Fire TV S3 カタログバケットにファイルをアップロードできるように、Identity and Access Management（IAM）AWS ユーザーにアクセス許可を付与する</h2>
<p>Identity and Access Management（IAM）ユーザーに、すべての S3 バケットか少なくとも Fire TV S3 カタログバケットへの "S3 PutObject" 以上のアクセス許可を設定します。このアクセス許可を付与されたユーザーは、S3 バケットにファイルをアップロードできるようになります。
</p>
<p>AWS ルート認証情報を使用して Amazon S3 やカタログバケットにアクセスすることも可能ですが、AWS では、Identity and Access Management（IAM）ユーザーを別途作成し、そのユーザー認証情報を使用して AWS とやり取りすることを推奨しています。たとえば、S3 に対しては管理者フルアクセス権を持つものの、他の AWS サービスにはアクセスできない IAM ユーザーを作成できます。または、カタログデータのアップロードのみを実行でき、アカウントの他の部分にはアクセスできないようにアクセス制限された IAM ユーザーを作成することもできます。組織内で S3 バケットにアクセスする必要があるユーザーには、AWS アカウントの IAM ユーザーをセットアップしてください。組織のメンバーに個別に IAM ユーザーをセットアップすると、各ユーザーに必要なアクセス許可のみを付与することができます。
</p>
<h3 id="SettingUpYourAWSAccountforFireTVCatalogIntegration-CreatinganewIAMUser">IAM ユーザーを新しく作成する
</h3>
<p>IAM ユーザーを新しく作成するには、以下の手順に従います。
</p>
<ol>
<li>AWSのメインコンソールにアクセスします：<a class="external-link" href="https://console.aws.amazon.com/console/home?region=us-east-1" rel="nofollow">https://console.aws.amazon.com/</a>。</li>
<li>[<strong>セキュリティ &amp; アイデンティティ</strong>] の [<strong>Identity &amp; Access Management</strong>] をクリックし、[Identity and Access Management へようこそ] ページを表示します。</li>
<li>[<strong>セキュリティステータス</strong>] で、[<strong>個々の IAM ユーザーの作成</strong>] をクリックし、メニューアイテムを展開します。[<strong>ユーザーの管理</strong>] をクリックし、AWS アカウントに関連付けられた IAM ユーザーのリストを表示します。</li>
<li>[<strong>新規ユーザーの作成</strong>] ボタンをクリックし、新規ユーザーを作成します：
<ol>
<li>[<strong>ユーザー名の入力</strong>] で、最大 5 人まで、新規ユーザーの名前を選択して入力します。</li>
<li>[<strong>ユーザーごとにアクセスキーを生成</strong>] チェックボックスをオンにします。</li>
<li>[<strong>作成</strong>] をクリックします。</li>
</ol></li>
<li>メッセージが表示されるので、新規ユーザーのセキュリティ認証情報をダウンロードするか、別の方法で保存します。</li>
</ol>
<p>セキュリティ認証情報には、2 つのアクセスキー（アクセスキー ID とシークレットアクセスキー）が含まれています。シークレットアクセスキーを取得できるのは、IAM ユーザーを作成したときだけです。ただし、IAM ユーザーはいつでも新規作成できます。アクセスキー ID は、<a href="https://console.aws.amazon.com/iam/home#users" class="external-link" rel="nofollow">IAM ユーザーのページ</a>の [セキュリティ認証情報] タブで確認できます。
</p>
<p>カタログ統合 S3 バケットにアクセスするすべてのユーザーに IAM ユーザーのアクセスキーが必要です。
</p>
<h3 id="SettingUpYourAWSAccountforFireTVCatalogIntegration-GivingIAMUsersAccesstoYourAmazonS3Bucket">IAM ユーザーに Amazon S3 バケットへのアクセス許可を付与する
</h3>
<p>IAM ユーザーのセットアップが完了したら、IAM ユーザーに S3 バケットへのアクセス許可を付与する必要があります。この手順を開始する前に、Amazon Fire TV の担当者から S3 バケットの名前を入手しておく必要があります。
</p>
<p>既存の IAM ユーザーに Amazon S3 バケットへのアクセス許可を付与するには、以下の手順に従います。
</p>
<ol>
<li>AWSのメインコンソールにアクセスします：<a class="external-link" href="https://console.aws.amazon.com/console/home?region=us-east-1" rel="nofollow">https://console.aws.amazon.com/</a>。</li>
<li>[<strong>セキュリティ &amp; アイデンティティ</strong>] の [<strong>Identity &amp; Access Management</strong>] をクリックし、[Identity and Access Management へようこそ] ページを表示します。</li>
<li>左ウィンドウで、[<strong>ユーザー</strong>] をクリックし、アカウントに関連付けられた IAM ユーザーのリストを表示します。</li>
<li>ユーザーのリストから、S3 バケットへのアクセス許可を付与するユーザーを選択します。</li>
<li>ユーザーの詳細ページで、[<strong>アクセス許可</strong>] タブをクリックし、ユーザーにセキュリティポリシーを設定します。アクセス許可の一般的な設定方法として、次の 2 とおりの方法があります。
<br />
<ul>
<li> <strong>選択肢 1</strong>：アカウントのすべての S3 機能へのフルアクセス許可をユーザーに付与する場合は、"AmazonS3FullAccess" ポリシーを適用します：
<ol>
<li>[<strong>アクセス許可</strong>] タブの [<strong>管理ポリシー</strong>] で、[<strong>ポリシーのアタッチ</strong>] をクリックし、[ポリシーのアタッチ] 画面に移動します。</li>
<li>[フィルター] ボックスに「AmazonS3FullAccess」と入力し、AmazonS3FullAccess ポリシーを表示します。</li>
<li>AmazonS3FullAccess ポリシーの横にあるチェックボックスをオンにし、[<strong>ポリシーのアタッチ</strong>] をクリックします。</li>
</ol></li>
<li> <strong>選択肢 2</strong>：バケットに新しいカスタムポリシーを設定し、ユーザーアクセス許可をカタログバケットのみに制限します：
<ol>
<li>[<strong>アクセス許可</strong>] タブの [<strong>インラインポリシー</strong>] で、新しいインラインポリシーを作成するためのリンクをクリックし、[許可を設定] ページに移動します。</li>
<li>[許可を設定] ページで、[<strong>カスタムポリシー</strong>] を選択し、[<strong>選択</strong>] をクリックして [ポリシーの確認] ページに移動します。</li>
<li>[<strong>ポリシーの確認</strong>] ページで、次の情報を入力します：
<ul>
<li>[<strong>ポリシー名</strong>]：ポリシーの一意の名前を入力します。任意の名前を指定できます。</li>
<li>[ポリシードキュメント]：[ポリシードキュメント] フィールドに次の行をコピーして貼り付けます。&lt;Bucket_Name&gt; プレースホルダーは実際の S3 バケット名に置き換えてください。
<br />
<br /> <code>{"Statement":[{"Effect":"Allow","Action":"s3:*","Resource":"arn:aws:s3:::*&lt;Bucket_Name&gt;"}]}
<br />
<br /></code></li>
</ul></li>
<li>[<strong>ポリシーの検証</strong>] をクリックします。
<br /> ポリシーが有効であることを示すステータスメッセージまたはポリシーの修正を指示するエラーメッセージのどちらかが表示されます。
<br />
<br /></li>
<li>[<strong>ポリシーの適用</strong>] をクリックし、ポリシーをユーザーに適用します。</li>
</ol></li>
</ul></li>
</ol>


<a class="anchor" name="手順 5：IAM ユーザーポリシーをテストする"></a>

<h2>手順 5：IAM ユーザーポリシーをテストする</h2>
<p>IAM ユーザーとセキュリティポリシーを適切に設定できたかどうかを確認するために、AWS の Policy Simulator ツールを使用します。Policy Simulator を使用してポリシーを検証するには、以下の手順に従います。</p>
<ol>
  <li>ウェブブラウザで、Policy Simulator に移動します：<br>
    <a href="https://policysim.aws.amazon.com/home/index.jsp" class="external-link" rel="nofollow">https://policysim.aws.amazon.com/home/index.jsp?#</a>
  </li>
  <li>左のペインで、ポリシーを検証するユーザーを選択します。</li>
  <li>右のペインで、[<strong>サービスの選択</strong>] ドロップダウンリストから [<strong>S3</strong>] を選択します。</li>
  <li>[<strong>アクションの選択</strong>] ドロップダウンリストから [<strong>PutObject</strong>] を選択します。</li>
  <li>[<strong>サービス</strong>] 列の [<strong>Amazon S3</strong>] エントリの左にある切り替え矢印をクリックし、シミュレーション設定を展開します。</li>
  <li>[<strong>ARN</strong>] フィールドに "arn:aws:s3:::&lt;Bucket_Name&gt;/catalogs/*" をコピーして貼り付けます。&lt;Bucket_Name&gt; プレースホルダーはご利用の S3 カタログバケットの名前に置き換えてください。</li>
  <li>[<strong>シミュレーションの実行</strong>] をクリックし、シミュレーションを実行します。</li>
</ol>
<p>ポリシーが有効の場合、[許可] のメッセージが表示されます。有効でない場合は、[拒否] とエラーの説明が表示されます。</p>


<a class="anchor" name="手順 6：AWS コマンドラインインターフェイス（CLI）をセットアップする（必要な場合）"></a>

<h2>手順 6：AWS コマンドラインインターフェイス（CLI）をセットアップする（必要な場合）</h2>
<p>Amazon S3 やカタログバケットとやり取りするには、Amazon S3 とやり取りするための各種ツールを使用できます。以下に例を示します。</p>
<ul>
  <li>AWS コマンドラインインターフェイス（CLI）。詳細については、「<a href="http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-set-up.html" rel="nofollow" class="external-link">Getting Set Up with the AWS Command Line Interface</a>」を参照してください。
  </li>
  <li>任意のプログラミング言語でカタログのアップロードを実装するための <a href="https://aws.amazon.com/tools/" class="external-link" rel="nofollow">AWS SDK</a> のいずれか。たとえば、<a href="http://aws.amazon.com/sdk-for-java/" class="external-link" rel="nofollow">AWS SDK for Java</a> には、<a href="http://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/AmazonS3Client.html" class="external-link" rel="nofollow">S3 クライアント</a>と<a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/UploadObjSingleOpJava.html" class="external-link" rel="nofollow">サンプルコード</a>が含まれています。AWS 開発者ツールの詳細については、「<a href="http://aws.amazon.com/developers/getting-started/?nc1=h_d_gs" class="external-link" rel="nofollow">アマゾン ウェブ サービスを使った開発の始め方</a>」を参照してください。
  </li>
</ul>
<p>S3 アクセスツールを使用する場合は、開発者様ご自身で実装したものも含め、最初に、そのツールに、IAM ユーザーのアクセスキー ID とシークレットアクセスキーを設定する必要があります。たとえば、AWS CLI を設定するには、<code>aws configure</code> コマンドを使用します。以下の例は、<code>aws configure</code> コマンド構文と、CLI を設定するためのプロンプトを示しています。</p>
<div class="container">
  <div class="line number1 index0 alt2">
    <code class="plain plain">$ aws configure</code>
  </div>
  <div class="line number2 index1 alt1">
    <code class="plain plain">AWS Access Key ID [None]: AAAAAAAAAAAAAEXAMPLE</code>
  </div>
  <div class="line number3 index2 alt2">
    <code class="plain plain">AWS Secret Access Key [None]: aAaaaAAaaAAA/A1AAAAA/aAaAaaAAEXAMPLEKEY</code>
  </div>
  <div class="line number4 index3 alt1">
    <code class="plain plain">Default region name [None]: us-west-2</code>
  </div>
  <div class="line number5 index4 alt2">
    <p><code class="plain plain">Default output format [None]: json</code></p>
    <p>AWS CLI の設定方法については、「<a href="http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html" class="external-link" rel="nofollow">Configuring the AWS Command Line Interface</a>」を参照してください。<br></p>
  </div>
</div>


<a class="anchor" name="関連リソース"></a>

<h2>関連リソース</h2>
<ul>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/overview/integrating-your-catalog-with-fire-tv">カタログと Amazon Fire TV の統合</a>:Fire TV カタログ統合のランディングページ。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/understanding-fire-tv-catalog-integration">Fire TV カタログ統合について</a>:カタログ統合の概念の紹介。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-integration">カタログ統合の準備</a>：Fire TV カタログ統合のクイックスタートガイド。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-cdf-overview">カタログデータ形式（CDF）について</a>:カタログファイルに必要な構成方法と必須フィールドに関する説明。</li>
<li> <strong>Fire TV カタログ統合のための AWS アカウントのセットアップ</strong>:AWS の 1 回限りのセットアップ手順。</li>
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
