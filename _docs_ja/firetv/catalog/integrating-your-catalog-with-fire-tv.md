---
title: カタログと Amazon Fire TV の統合
permalink: integrating-your-catalog-with-fire-tv.html
sidebar: catalog_ja
product: Fire TV Catalog
toc-style: kramdown
github: true
---

メディアカタログおよびメディアアプリを Fire TV のプラットフォームに統合する。

<h2>はじめに</h2>
<p>メディアカタログを Amazon Fire TV に統合すると、Fire TV ホーム画面からコンテンツを探して再生できるようになります。カタログ統合は、主に次の 2 つの要素で構成されます。</p>
<ul>
<li>開発者様のアプリから提供する映画や TV 番組を指定するカタログファイル。<br></li>
<li>アプリと Fire TV ホーム画面ランチャーの統合。これによって、ユーザーは検索結果や閲覧結果からコンテンツを直接再生することができます。<br></li>
</ul>カタログを統合することで、Fire TV ホーム画面から実行される検索結果に開発者様のコンテンツが含まれるようになります。また、ユーザーが開発者様のアプリ以外で Fire TV を閲覧しているとき、たとえばジャンル別の閲覧（「ユニバーサル閲覧・検索」ともいいます）中に、開発者様のコンテンツを見つけることができます。コンテンツは、ユーザーが Fire TV UI のどこで見つけた場合でも、アプリを開かずに直接再生できます。
<p><strong>注意</strong>：以下の各ページには、Amazon のカタログ統合プロセスに関する情報が記載されています。Amazon のプラットフォームにカタログを統合する方法の詳細については、<a href="http://www.amazon.com/gp/html-forms-controller/aftsdk-cdf-request">こちらから</a>お問い合わせください。</p>
<h2>このセクションのリソース</h2>
<p>以下の各トピックでは、Fire TV カタログとランチャーの統合について説明しています。このプロセスを初めて行う場合は、これらのトピックを順番通りに参照することをお勧めします。</p>
<ul>
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
<li>
<a target="_blank" href="https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog.xsd">カタログデータ形式（CDF）スキーマ定義</a>：最新の CDF が定義されている XSD ファイル。
</li>
<li>
<a target="_blank" href="https://s3.amazonaws.com/com.amazon.aftb.cdf/cdf-examples.zip">カタログデータ形式（CDF）サンプル</a>：各メディアタイプとカタログ全体の CDF XML サンプル、および番組、シーズン、特別番組、トレーラーやクリップ、エピソードなどをひとまとめにする方法を示したサンプルが含まれている zip ファイルがダウンロードできます。
</li>
</ul>
<h2>カタログデータ形式（CDF）XML スキーマへの変更点</h2>
<p>カタログファイルの基になっている CDF スキーマは、新しい機能を追加するために随時更新されます。まれに、既存の要素が削除される場合や変更される場合もあります。このページで、最新の変更点に関する概要を確認してください。新しい要素の使用方法に関する詳細と手順については、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/migrating-a-cdf-file-to-the-latest-version">カタログデータ形式（CDF）ファイルの最新バージョンへの移行</a>」を参照してください。</p>
<h3>最新情報（2015/10）: CDF v1.3</h3>
<ul>
<li>新規タグ <code>&lt;MiniSeries&gt;</code> および <code>&lt;MiniSeriesEpisode&gt;</code> の追加: <code>&lt;TVEpisode&gt;</code> タイプに属さないエピソード型のコンテンツに使用するためのタグです。Amazon では、<code>&lt;TvSeason&gt;</code> と <code>&lt;TvShow&gt;</code> の両方に属しているエピソードを有効な <code>&lt;TVEpisode&gt;</code> タイプとして扱います。<code>&lt;MiniSeriesEpisode&gt;</code> は、<code>&lt;TvSeason&gt;</code> に属さない連続エピソードから成るコンテンツに使用します。<code>&lt;MiniSeriesEpisode&gt;</code> の各エントリには順序が必要なため、各エピソードにシーケンス番号を指定する必要があります。</li>
<li>新規タグ <code>&lt;TVSpecial&gt;</code> の追加: <code>&lt;TvShow&gt;</code> に属する場合と属さない場合がある、連続していないエピソードや 1 回限りのエピソード用のタグです。<code>&lt;TVSpecial&gt;</code> の各エントリには <code>&lt;OriginalAirDate&gt;</code> が必要で、これは Amazon が <code>&lt;TVSpecial&gt;</code> を他のエントリと並べるために使用します。<code>&lt;TVSpecial&gt;</code> は <code>&lt;TVShow&gt;</code> にリンクできますが、その際 <code>&lt;TVSeason&gt;</code> にリンクする必要はありません。</li>
<li>新規タグ <code>&lt;Extra&gt;</code> の追加: トレーラーとクリップを含めるためのタグです。トレーラーとクリップは他のコンテンツに関連付けることができます。</li>
<li><code>&lt;ReleaseDate&gt;</code> や <code>&lt;ReleaseCountry&gt;</code> 要素などの　<code>&lt;ReleaseInfo&gt;</code> 要素が廃止されました。<code>&lt;ReleaseCountry&gt;</code> 情報は使用されなくなりました。<code>&lt;ReleaseDate&gt;</code> 情報は、現在は各作品タイプに追加されています。<code>&lt;Movie&gt;</code>、<code>&lt;TvShow&gt;</code>、および <code>&lt;MiniSeries&gt;</code> に新しい <code>&lt;ReleaseDate&gt;</code> 要素が追加されました。<code>&lt;TvEpisode&gt;</code>、<code>&lt;TvSpecial&gt;</code>、および <code>&lt;MiniSeriesEpisode&gt;</code> では <code>&lt;OriginalAirDate&gt;</code> を使用します。<code>&lt;Extra&gt;</code> にはリリース日の情報は含まれません。</li>
</ul>
<h3>最新情報（2015/5/27）CDF v1.2</h3>
<ul>
<li>新規タグ <code>&lt;JP_Require18PlusAgeConfirmation&gt;</code> の追加: 日本市場での成人向けコンテンツを示すタグです。</li>
<li>新規タグ <code>&lt;Count&gt;</code> の追加: <code>RatingType</code> のこのタグで、レーティングに貢献したユーザーの数を示します。</li>
<li><code>ActorType</code> の <code>&lt;Role&gt;</code> タグがオプションになりました。</li>
<li>各 Offer タイプの <code>&lt;Quality&gt;</code> 要素が廃止されました。代わりに、<code>&lt;LaunchDetails&gt;</code> 内の <code>&lt;Quality&gt;</code> 要素を使用します。</li>
<li>新規タグ <code>&lt;LaunchDetails&gt;</code> の追加: <code>&lt;Quality&gt;</code>、<code>&lt;AudioLanguage&gt;</code>（吹き替えオプション用）、<code>&lt;Subtitle&gt;</code>（他言語による字幕用）、<code>&lt;LaunchId&gt;</code>（これらのメタデータを格納したカスタム再生用 ID）など、Fire TV ランチャーで使用できる新しいコンテンツメタデータを提供します。</li>
</ul>
<h2>過去のリソース</h2>
<ul>
<li>
<a href="https://s3.amazonaws.com/com.amazon.aftb.cdf/cdf-xsd-ref-12.html">カタログデータ形式（CDF）リファレンス</a>（バージョン 1.2）：カタログデータ形式の XML スキーマ定義（XSD）に関する全体的なリファレンスドキュメントです。
</li>
<li>
<a href="https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog-12.xsd">カタログデータ形式（CDF）スキーマ定義</a>（バージョン 1.2）：CDF 形式を定義する XSD ファイルです。
</li>
<li>
<a href="https://s3.amazonaws.com/com.amazon.aftb.cdf/cdf-xsd-ref-11.html">カタログデータ形式（CDF）リファレンス</a>（バージョン 1.1）：カタログデータ形式の XML スキーマ定義（XSD）に関する全体的なリファレンスドキュメントです。
</li>
<li>
<a href="https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog-11.xsd">カタログデータ形式（CDF）スキーマ定義</a>（バージョン 1.1）：CDF 形式を定義する XSD ファイルです。
</li>
<li>
<a href="https://s3.amazonaws.com/com.amazon.aftb.cdf/cdf-xsd-ref-10.html">カタログデータ形式（CDF）リファレンス</a>（バージョン 1.0）：カタログデータ形式の XML スキーマ定義（XSD）に関する全体的なリファレンスドキュメントです。
</li>
<li>
<a href="https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog-10.xsd">カタログデータ形式（CDF）スキーマ定義</a>（バージョン 1.0）：CDF 形式を定義する XSD ファイルです。
</li>
</ul>


{% include links.html %}
