---
title: Fire TV カタログインジェストレポートの取得とその内容
permalink: receiving-and-understanding-the-catalog-ingestion-report.html
sidebar: catalog_ja
product: Fire TV Catalog
toc-style: kramdown
github: true
---

<a class="anchor" name="はじめに"></a>

<a class="anchor" name="intro"></a>

<h2>はじめに</h2>
<p>Amazon Fire TV のユニバーサル閲覧・検索機能との統合のために Amazon Simple Storage Service（S3）バケットに<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-upload">カタログデータをアップロード</a>すると、カタログ統合システムにより、カタログファイルが使用可能かどうかを報告する<em>インジェストレポート</em>が 4 時間以内に生成されます。このレポートには、成功または失敗の全般的なステータス、ファイル内に見つかった問題、および各問題の詳細が記載されています。</p>
<p><strong>注意：</strong>インジェストレポートシステムは、ベータリリースです。現時点では、インジェストステータスを通知する E メールを受信するかどうかを選択できます。カタログファイルの変更や修正をスムーズに実施できるように、Amazon ビジネスデベロッパーマネージャーが、問題があるかどうかを通知し、問題の把握と解決のお手伝いをします。</p>


<a class="anchor" name="インジェストレポートの取得"></a>

<a class="anchor" name="retrieving"></a>

<h2>インジェストレポートの取得</h2>
<p>インジェストレポートは、<em>report.html</em> という名前の HTML ファイルで、カタログファイルをアップロードしたのと同じ S3 バケット内に配信されます。新しいレポートが作成されたことを通知する E メールを受信するかどうかを選択できます。この通知には、レポートの概要と、レポート全体をダウンロードできるコマンドが記載されています。</p>
<h3>インジェストステータスの通知 E メールを受け取る方法</h3>
<p>インジェストレポートの概要 E メールを受け取るには、<a href="mailto:p11-catalog-subscriptions@amazon.com">p11-catalog-subscriptions@amazon.com</a> 宛てに E メールを送信し、カタログの配信リストへの追加を依頼します。Amazon ではその依頼を検証して、開発者様をリストに追加します。成功を通知する E メールと失敗を通知する E メールは個別に送信されます。両方の E メールの受信を希望する場合は、両方のリストへの追加を依頼してください。アップロードするたびに、また、インジェストステータスが変更されたときに、レポートが作成されます。</p>
<h3>E メール内の情報を活用する方法</h3>
<p>受け取った E メールには、インジェストステータスが成功または失敗であることが記載され、失敗の場合には、各エラーの概要が記載されています。また、詳細なレポートを取得するためのアマゾン ウェブ サービス（AWS）コマンドも記載されています。このコマンドを使用するには、最初に、<a title="AWS コマンドラインインターフェイス" target="_blank" href="https://aws.amazon.com/cli/">AWS コマンドラインインターフェイス（CLI）</a>ツールをインストールする必要があります。インストールが完了したら、通常のコマンドウィンドウまたはターミナルウィンドウで AWS コマンドを使用できます。この操作により、開発者様の機密のカタログ情報が確実に保護されます。このコマンドを使用してレポートを取得できるのは、開発者様の S3 バケットへのアクセス件を持つユーザーのみに制限されるためです。</p>
<p>次に、レポートを取得するための AWS コマンドの例を示します。E メールからこの行をコピーして、コマンドウィンドウまたはターミナルウィンドウに貼り付けてください。</p>
<p><code>aws s3api get-object --bucket cdf-test --key reports/report.html --version-id FciuqMvVh2oWFv726L6Ytf8ECLbO6Kj0 report.html</code></p>
<p>このコマンドを使用して、現在のフォルダーにレポートをダウンロードします。ダウンロードしたファイルの名前は、<em>report.html</em> です。コマンドの詳細については、AWS CLI コマンドリファレンスの「<a href="http://docs.aws.amazon.com/cli/latest/reference/s3api/get-object.html">get-object</a>」のページを参照してください。</p>


<a class="anchor" name="インジェストレポートの内容"></a>

<a class="anchor" name="report_contents"></a>

<h2>インジェストレポートの内容</h2>
<p>インジェストレポートには次の 3 つのセクションがあります。</p>
<ul>
<li>概要。ステータスが成功と失敗のいずれであるかが記載されています。</li>
<li>エラー、警告、推奨事項。</li>
<li>追加、削除、更新、未変更のカタログエントリのカウント。</li>
</ul>
<h3>概要</h3>
<p>次に、インジェストレポートの「概要」セクションの例を示します。</p>
<p><img src="https://images-na.ssl-images-amazon.com/images/G/01/mobile-apps/devportal2/content/sdk/images/fire-tv-ingestion-reports/IGSum._V289417383_.jpg" alt="インジェストレポートの「概要」セクションの例"><br></p>
<p>「概要」には、インジェストの試行ごとに付与された一意の ID、使用されたカタログ、インジェストの試行が行われた日時、試行の結果が記載されています。試行の結果には、次の 2 つの可能性があります。</p>
<ul>
<li>
<strong>成功</strong>：カタログにエラーは見つかりませんでした。ただし、有用な警告や推奨事項がある場合があります。カタログ情報は、無事に Fire TV ユニバーサル閲覧・検索機能に統合されました。
<ul>
 <li>
   <strong>注意：</strong>ステータスが「成功」の場合でも、結果が予期していたとおりかどうかを「<a href="#counts">カウント</a>」セクションで確認してください。たとえば、カタログの大部分を誤って削除してしまった場合でも、削除されなかった部分にエラーがなければ、インジェストステータスは「成功」になります。"成功" の文字のみを確認するのではなく、削除されたエントリの数が想定より多いことに気付けば、問題が発生している可能性があると推測できます。
 </li>
</ul>
</li>
<li>
<strong>失敗</strong>：エラーがあると、そのカタログは使用されません。前回正常にインジェストされたカタログが引き続き有効なカタログとして使用されます。レポートの「<a href="#ews">エラー、警告、推奨事項</a>」セクションで、問題の詳細情報が示されます。
</li>
</ul>
<p>上記の例では、インジェストが 9 つのエラーによって失敗しています。警告と推奨事項も多数生成されていますが、このカテゴリのメッセージは通常、インジェストが失敗する原因にはなりません（画像関連の警告と推奨事項は例外です）。[追加]、[削除]、および　[更新] の数はすべて 0 です。インジェストが失敗し、アップロードしたカタログが使用されないためです。[未変更] の数が 0 であるのは、変更対象のカタログが事前に存在しないことを意味しています。</p>
<p>いずれかのボックスをクリックすると、レポートの該当するセクションに移動できます。</p><a class="anchor" id="ews"></a>
<h3>エラー、警告、推奨事項</h3>
<p>このセクションで、問題を修正するために必要な情報を確認できます。各セクションの [詳細] ボタンをクリックすると、セクションが展開され、個々のメッセージが一覧表示されます。各メッセージの末尾にある数字は、該当するエントリの数です。各メッセージの隣にあるプラス記号をクリックすると、メッセージが生成された作品の ID が表示されます。エラーの詳細が含まれた追加のメッセージが表示される場合もあります。以下は、2 つのエラーを展開した例を示しています。<br></p>
<p><img src="https://images-na.ssl-images-amazon.com/images/G/01/mobile-apps/devportal2/content/sdk/images/fire-tv-ingestion-reports/IGFullyExpandedError._V289417243_.jpg" alt="エラーを展開し、詳細を表示した例"><br></p>
<p>[エラー] のセクションで問題が見つかった場合、インジェストは失敗しますが、[警告] と [推奨事項] では通常、インジェストは成功します。そのため、インジェストが成功した場合でも、レポートには、確認する必要のある [警告] や [推奨事項] が多数記載されている場合があります。<br></p><a class="anchor" id="counts"></a>
<h3>カウント</h3>
<p>レポートの最後のセクションには、インジェストに際してカタログに加えられた変更の詳細が記載されています。このセクションでも、各カテゴリの [詳細] ボタンをクリックすると各作品の ID が表示されます。予期される変更のリストを用意しておくと、最終確認として、このセクションをリストと比較できます。<br></p>
<p>インジェストが失敗すると、アップロードしたカタログは使用されないため、[追加]、[削除]、および [更新] の値は 0 になります。[未変更] の値は、前回インジェストに成功したカタログのカタログエントリの数を示します。</p>
<p>インジェストが成功した場合は、[追加]、[削除]、[更新]、および [未変更] の値は、予期した結果と一致するはずです。前述したとおり、このセクションのカウントは、他の検証結果に基づいてインジェストが成功した場合でも、カタログに問題があることを示していることがあります。</p>


<a class="anchor" name="インジェストレポートに基づくアクション"></a>

<a class="anchor" name="next_steps"></a>

<h2>インジェストレポートに基づくアクション</h2>
<p>以下は、インジェストステータスに応じて実施する必要のある作業です。</p>
<ul>
<li>
<strong>成功</strong>：[追加]、[削除]、[更新]、および [未変更] の数が予期したとおりであれば、必要な作業はありません。ただし、[警告] と [推奨事項] に対処することを検討してください。各エントリの説明と対処法については、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-ingestion-report-messages">カタログデータ形式（CDF）インジェストレポートのメッセージ</a>」を参照してください。
</li>
<li>
<strong>失敗</strong>：「エラー」セクションの各エントリの説明と対処法については、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-ingestion-report-messages">カタログデータ形式（CDF）インジェストレポートのメッセージ</a>」を参照してください。必要な作業やその方法がわからない場合は、Amazon ビジネスデベロッパーマネージャーにお問い合わせください。
</li>
</ul>


<a class="anchor" name="関連リソース"></a>

<a class="anchor" name="related"></a>

<h2>関連リソース</h2>
<ul>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/overview/integrating-your-catalog-with-fire-tv">カタログと Amazon Fire TV の統合</a>:Fire TV カタログ統合のランディングページ。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/understanding-fire-tv-catalog-integration">Fire TV カタログ統合について</a>:カタログ統合の概念の紹介。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-integration">カタログ統合の準備</a>：Fire TV カタログ統合のクイックスタートガイド。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-cdf-overview">カタログデータ形式（CDF）について</a>:カタログファイルに必要な構成方法と必須フィールドに関する説明。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/setting-up-your-aws-account-for-fire-tv-catalog-integration">Fire TV カタログ統合のための AWS アカウントのセットアップ</a>:AWS の 1 回限りのセットアップ手順。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-upload">Amazon へのカタログのアップロード</a>:CDF ファイルを Amazon S3 にアップロードする方法。</li>
<li> <strong>カタログインジェストレポートの取得とその内容</strong>:カタログの統合ステータスに関するレポートのオプトインと使用方法について。</li>
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
