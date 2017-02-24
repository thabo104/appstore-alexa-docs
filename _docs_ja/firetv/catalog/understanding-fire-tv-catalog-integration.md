---
title: Fire TV カタログ統合について
permalink: understanding-fire-tv-catalog-integration.html
sidebar: catalog_ja
product: Fire TV Catalog
toc: false
github: true
---

<h2>はじめに</h2>
<p>メディアカタログを Amazon Fire TV に統合すると、Fire TV ホーム画面からコンテンツを探して再生できるようになります。カタログ統合は、主に次の 2 つの要素で構成されます。
</p>
<ul>
<li>開発者様のアプリから提供する映画や TV 番組を指定するカタログファイル。
<br /></li>
<li>アプリと Fire TV ホーム画面ランチャーの統合。これによって、ユーザーは検索結果や閲覧結果からコンテンツを直接再生することができます。
<br /></li>
</ul>
<p>カタログを統合することで、Fire TV ホーム画面から実行される検索結果に開発者様のコンテンツが含まれるようになります。また、ユーザーが開発者様のアプリ以外で Fire TV を閲覧しているとき、たとえばジャンル別の閲覧（「ユニバーサル閲覧・検索」ともいいます）中に、開発者様のコンテンツを見つけることができます。コンテンツは、ユーザーが Fire TV UI のどこで見つけた場合でも、アプリを開かずに直接再生できます。
<br />
</p>
<p><strong>注意</strong>：Amazon のプラットフォームにカタログを統合する方法の詳細については、<a href="http://www.amazon.com/gp/html-forms-controller/aftsdk-cdf-request" class="external-link" rel="nofollow">こちらから</a>お問い合わせください。
</p>


<a class="anchor" name="カタログを Fire TV に統合する利点"></a>

<h2>カタログを Fire TV に統合する利点</h2>
<p>カタログを統合すると、ユーザーは、開発者様のコンテンツを Amazon や Fire TV 内の他のストリーミングメディアプロバイダーのコンテンツとともにシームレスに表示、閲覧、検索することができます。これには以下の利点があります。<br></p>
<ul>
<li>
<a href="#ubas">開発者様のコンテンツが、全コンテンツプロバイダーを対象としたユニバーサル閲覧・検索の結果に表示される</a>
</li>
<li>
<a href="#acquisition">新規顧客に開発者様のアプリをダウンロードして利用してもらうきっかけになる</a>
</li>
<li>
<a href="#rec">検索結果の優先表示や使いやすさによって既存顧客を維持できる</a>
</li>
<li>
<a href="#featured">Fire TV ホーム画面の「おすすめの映画と番組」でコンテンツを宣伝することができる</a>
</li>
</ul><a class="anchor" id="ubas"></a>
<h3>全コンテンツプロバイダーを対象としたユニバーサル閲覧・検索の結果</h3>
<p>カタログ統合を行うと、ユーザーは、コンテンツを提供しているアプリを問わず、まとめて検索や閲覧ができるようになります。たとえば、Fire TV のユーザーが「Argoneum 2」という架空の映画を観ようとして、Fire TV ホーム画面で「Argoneum」を検索したとします。Fire TV は以下のような検索結果を返します。</p>
<p><img src="https://images-na.ssl-images-amazon.com/images/G/01/mobile-apps/devportal2/content/sdk/images/fire-tv-ci/CI_Argoneum2.png"></p>
<p>検索結果には、カタログを統合しているすべてのコンテンツプロバイダーを対象としてヒットしたすべてのアイテムが表示されますが、1 つの作品に関する複数の結果が １ 件の検索結果にまとめて表示されます（後述の「<a href="#mtatching">コンテンツマッチ</a>」を参照）。</p>同じ検索でも、開発者様のカタログが統合用に提出されていない場合は、検索結果に、Amazon が提供するコンテンツと、カタログを統合済みの他のコンテンツプロバイダーが提供するコンテンツしか表示されません。ユーザーが開発者様のアプリを指定して再生し、アプリ内で検索をしない限り、同じ映画を提供していても気づいてもらうことができません。
<h3>新規顧客の獲得</h3>
<p>カタログを統合すると、新規顧客によるアプリのダウンロードや利用の促進が見込めます。カタログが統合されることで、ユーザーが開発者様のアプリをダウンロードしていない場合やサービスに登録していない場合でも、開発者様のコンテンツが Fire TV ホーム画面の検索結果に表示されるようになります。新規ユーザーに無料体験を提供し、Fire TV 端末から登録できるようにすると、他の提供内容にもよりますが、目立つ [<strong>アプリを選択して視聴</strong>] ボックスに、開発者様が提供するコンテンツを表示することができます（これらの優先ルールは予告なしに変更される場合があります）。</p>
<p>たとえば、架空の TV シリーズ「Office Factor」が、架空のストリーミングサービス Enyo Xtra の登録者向けに公開されているとします。Enyo Xtra に未登録のユーザーが「Office Factor」を検索すると、同シリーズの情報とともに、Enyo Xtra サービスの無料体験を促すメッセージが Fire TV に表示されます。</p>
<p><img src="https://images-na.ssl-images-amazon.com/images/G/01/mobile-apps/devportal2/content/sdk/images/fire-tv-ci/CI_OfficeFactor_trial.png" width="700"></p>
<p>ユーザーが [無料体験] ボタンをクリックすると、ユーザーが Enyo Xtra をダウンロードして無料体験を開始するための画面が Fire TV に表示されます。</p>
<p><img src="https://images-na.ssl-images-amazon.com/images/G/01/mobile-apps/devportal2/content/sdk/images/fire-tv-ci/EnyoXtra_trial.png" width="700"></p><a class="anchor" id="rec"></a>
<h3>既存顧客の維持</h3>
<p>映画やテレビ番組の詳細ページには、統合カタログのデータに基づいて、すべての利用可能なプロバイダーとオプションが表示されます。通常は、視聴方法の種類（無料、登録、レンタル、購入）によって優先順位が決定されます。優先順位とは、アプリの登録者に開発者様のアプリが最初の選択肢として表示される頻度の高さを指しています。おすすめの視聴オプションとしてアプリが表示されることで、ユーザーはサービスへの登録に価値を感じることができます（これらの優先ルールは予告なしに変更される場合があります）。</p>
<p>以下は、架空のサービス StreamTime の登録者が架空の映画「Repeat Offender」を検索した場合の例です。検索結果には、この映画が、StreamTime で視聴するか、Amazon からデジタルコピーを購入できることが表示されています。優先順位に基づき、StreamTime が最初の選択肢になっています。</p>
<p><img src="https://images-na.ssl-images-amazon.com/images/G/01/mobile-apps/devportal2/content/sdk/images/fire-tv-ci/RepeatOffender.png" width="700"></p><a class="anchor" id="featured"></a>
<h3 id="UnderstandingFireTVCatalogIntegration(DRAFT)-InclusioninFeaturedMoviesandTV">おすすめの映画と番組への追加</h3>
<p>Fire TV ホーム画面には「おすすめの映画と番組」というカテゴリがあり、作品のセレクションが回転式で表示されます。おすすめのタイトルに含まれるのは、統合カタログのコンテンツのみです。</p>


<a class="anchor" name="カタログ統合の要素"></a>

<h2>カタログ統合の要素</h2>
<p>Fire TV カタログ統合には 2 つの重要な要素があり、どちらも必須です。</p>
<ul>
<li>
<strong>カタログデータ形式（CDF）ファイル</strong>：CDF ファイルは <a href="https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog-13.xsd" class="external-link" rel="nofollow">CDF XSD ファイル</a>で定義されているスキーマを使用した XML ファイルです。CDF ファイルは、開発者様が Fire TV アプリで提供する映画やテレビ番組のカタログが含まれたファイルです。カタログ内の各作品のエントリには、作品のタイトル、リリース日、出演者、キャストとスタッフ、上映時間など、作品について記述したメタデータが記載されます。メタデータには作品の視聴方法（無料、登録、レンタル、購入）も含まれます。このカタログは開発者様が Amazon にアップロードします。CDF ファイルとスキーマについての詳細は、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-cdf-overview">カタログデータ形式（CDF）について</a>」および「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference">カタログデータ形式（CDF）リファレンス</a>」を参照してください。
</li>
<li><strong>Amazon ホーム画面ランチャー</strong>：Fire TV ホーム画面で使用されるメディアランチャーと統合するようにアプリを設定します。これによって、ユーザーはアプリを起動せずにカタログからコンテンツを再生することができます。<br></li>
</ul>


<a class="anchor" name="コンテンツマッチ"></a>

<a class="anchor" name="matching"></a>

<h2>コンテンツマッチ</h2>
<p>映画などのコンテンツアイテムが複数のコンテンツプロバイダーの統合カタログに含まれている場合、Amazon はアイテムのメタデータ（タイトル、公開年度など）を使用して、実際には同一のコンテンツであることを識別してマッチングします。その結果、Fire TV のユニバーサル閲覧・検索で、各プロバイダーの個々のエントリを表示するのではなく、エントリを 1 つだけ表示することができます。<br></p>
<p>以下は、3 つのプロバイダーが提供している架空の映画「Argoneum」の、コンテンツマッチを行わない場合の検索結果です。ユーザーは各結果を順に確認して、プロバイダーを選び、映画の視聴方法（無料、レンタル、購入、プロバイダー登録）を決めなければなりません。<br></p>
<p><img src="https://images-na.ssl-images-amazon.com/images/G/01/mobile-apps/devportal2/content/sdk/images/fire-tv-ci/ArgoneumWithoutMatching._V285450033_.png" alt="目的の映画のインスタンス 3 件と 2 番目の結果 2 件が表示された検索結果" width="700"></p>
<p>コンテンツマッチを行うと、ユーザーに表示される検索結果がわかりやすくなります。<br></p>
<p><img src="https://images-na.ssl-images-amazon.com/images/G/01/mobile-apps/devportal2/content/sdk/images/fire-tv-ci/ArgoneumWithMatching._V285443455_.png" alt="目的の映画のインスタンス 1 件と 2 番目の結果 1 件が表示された検索結果" width="700"></p>
<p>１ 件だけ表示された「Argoneum」のエントリをユーザーが選択すると、3 つのプロバイダーとそれぞれの視聴方法がすべて 1 か所に表示されます。</p>
<p>Amazon がコンテンツを正しくマッチングできる可能性は、提供された情報量によって異なります。アイテムの必須要素のみが CDF ファイルに含まれている場合、Amazon がマッチングに利用できるデータはタイトルのみになる可能性があります。公開年度、コンテンツの上映時間、シーズンやミニシリーズのエピソード番号など、一意のメタデータ値が含まれていると、ユーザーがコンテンツを検索または閲覧した際に正確なマッチング結果を提供できる可能性が高まります。<br></p>


<a class="anchor" name="Fire TV カタログ統合のガイドラインと期待事項"></a>

<h2>Fire TV カタログ統合のガイドラインと期待事項</h2>
<p>Fire TV カタログ統合に参加するコンテンツプロバイダー様は、以下のガイドラインに沿ってカタログの更新やアップロードを行う必要があります。また、新しいカタログをアップロードした後の各種待機時間について事前に確認しておいてください。
</p>
<h3>カタログのアップロードに関するガイドライン
<br />
</h3>
<ul>
<li>カタログは、変更の有無を問わず、週に少なくとも 1 回はアップロードしてください。アップロード処理はスクリプト化などの手段を用いて自動化し、最新のカタログが週に 1 回以上の頻度でアップロードされるようにしてください。</li>
<li>最新のカタログファイルが 3 週間よりも前のものである場合、アプリのカタログ統合は無効化されます。</li>
</ul>
<h3>アップロード後にコンテンツが利用可能になるまでの待機時間
<br />
</h3>
<ul>
<li>新たにアップロードされたカタログファイルの検証とインジェストは 4 時間ごとに行われます。新しいカタログをアップロードした後、インジェストが正常に完了するまでに最大 4 時間の待機時間が発生します。</li>
<li>カタログファイルが有効であれば、ファイルに含まれるすべてのコンテンツが、アップロード後 4 時間以内にユーザーが利用できるようになります。ただし、番組やシーズンの端末上のキャッシュは最大 10 時間残るため、カタログのアップロード後コンテンツが利用可能になるまで最大 14 時間の遅れが生じる可能性があります。これは、番組が端末上にキャッシュされているときに新シーズンがアップロードされると、実際には新しいコンテンツが最大で 14 時間ユーザーに表示されないためです。
<br /></li>
<li>コンテンツは、カタログのアップロード後 4 時間以内に、検索や閲覧で他のプロバイダーのコンテンツとマッチングできるようになります。
<br /></li>
</ul>
<h3>カタログ統合のユーザーエクスペリエンス（UX）ガイドライン
</h3>
<ul>
<li>ユーザーが Fire TV のユニバーサル閲覧・検索の結果で開発者様のアプリのコンテンツを選択したときに、すぐにコンテンツの再生が開始されるようにしてください。再生を開始する前に、アプリや作品の詳細画面を表示しないでください。</li>
<li>ランチャー統合の一環として（「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/launcher-integration">アプリと Fire TV ホーム画面ランチャーの統合</a>」を参照）、アプリを開くたびにユーザーの登録ステータスを公開し、コンテンツが開発者様のアプリ以外で見つかった場合に既に登録しているユーザーに [視聴する] オプションが表示されるようにしてください。</li>
<li>現行のカタログの内容が実際にユーザーが利用できるコンテンツと一致していない場合のために、エラー処理コードを実装し、ユーザーが再生できないコンテンツアイテムを選択した場合に不満を感じないように対処してください。このような状況向けにエラー処理コードを実装しなかった場合、ユーザーには黒い画面が表示され、Fire TV にも開発者様のアプリやカタログにも戻る方法がわからなくなります。そうなると、ユーザーは混乱し、ユーザーエクスペリエンスの評価も悪くなります。
<br /></li>
</ul>


<a class="anchor" name="カタログ統合の技術要件"></a>

<h2>カタログ統合の技術要件</h2>
<p>Fire TV とのカタログ統合処理を開始する前に、以下の項目が用意されているか、すぐに用意できることを確認してください。</p>
<ul>
<li><strong>アプリのメタデータへの容易なアクセス</strong>：ほとんどのカタログはメディアデータベースから CDF ファイルにメタデータをエクスポートすることで自動的に作成できます。これにはデータベースへのアクセスと、情報を CDF に変換するコードが必要です。この方法でメタデータをデータベースからエクスポートできない場合は、カタログファイルを手動で作成する必要がありますが、この方法は推奨されません。<br></li>
<li><strong>アマゾン ウェブ サービス（AWS）アカウント</strong>：AWS アカウントと、AWS S3 ツールに詳しい担当者（または学ぶ意欲のある担当者）が必要です。統合するカタログファイルのアップロードと結果レポートのダウンロードを行うために、コマンドラインインターフェイスから AWS コマンドを実行する必要があります。</li>
<li><strong>アプリのソースコードへのアクセス</strong>：アプリとそのコンテンツを Fire TV ホーム画面ランチャーに統合するには、アプリのソースコードに多少の変更を加える必要があります。これには Android 開発に関する基本的な知識が必要になります。</li>
</ul>
<p>AWS アカウントのセットアップや S3 ツールの使い方など、カタログ統合セットアッププロセスの詳細については、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-integration" rel="nofollow">Fire TV カタログ統合の準備</a>」を参照してください。ランチャーとの統合に必要なコード変更については、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/launcher-integration">ランチャー統合</a>」を参照してください。<br></p>


<a class="anchor" name="関連リソース"></a>

<h2>関連リソース</h2>
<ul>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/overview/integrating-your-catalog-with-fire-tv">カタログと Amazon Fire TV の統合</a>:Fire TV カタログ統合のランディングページ。</li>
<li> <strong>Fire TV カタログ統合について</strong>:カタログ統合の概念の紹介。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-integration">カタログ統合の準備</a>：Fire TV カタログ統合のクイックスタートガイド。</li>
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
