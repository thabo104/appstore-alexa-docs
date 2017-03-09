---
title: カタログデータ形式（CDF）について
permalink: about-the-cdf.html
sidebar: catalog_ja
product: Fire TV Catalog
toc-style: kramdown
github: true
---

<p>カタログデータ形式（CDF）ファイル（以下、「カタログファイル」）は、CDF XSD ファイル内で定義されたスキーマを使用する XML ファイルです。CDF ファイルには、アプリのメディアコンテンツ（映画、TV 番組、特別番組、ミニシリーズ、番外編など）に関するメタデータ（タイトル、長さ、リリース年など）が格納されます。CDF ファイルは、メタデータを Amazon Fire TV のユニバーサル閲覧・検索機能に統合するために使用されます。ユニバーサル閲覧・検索機能とは、個別のアプリではなく、Fire TV ホーム画面からコンテンツの検索や閲覧を行うことができる機能です。統合プロセス全体の概要については「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-integration">Fire TV カタログ統合の準備</a>」を参照してください。</p>
<p>このページでは、主要な要素やそれらを関連付ける方法など、カタログ形式全般の概要について説明します。ここで使い方を取り上げているもの以外にも利用可能な要素があります。詳細については、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference">カタログデータ形式スキーマリファレンス</a>」または実際の <a href="https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog.xsd">XSD スキーマファイル</a>を参照してください。</p>

* TOC
{:toc}

<h2>サンプルカタログファイル</h2>
<p>次に示すのは、アイテム（映画）が 1 つだけ格納され、必須の要素のみを使用したシンプルなカタログファイルの例です。実際には、この例よりも詳しい情報を作品ごとに指定することを強くお勧めします。ただし、最も基本的な CDF ファイルの構造は、この限定的な例で十分に把握できます。<a href="https://s3.amazonaws.com/com.amazon.aftb.cdf/cdf-examples.zip">cdf-examples.zip</a> ファイルをダウンロードすると、より情報量の多い包括的なサンプルを参照できます。</p>
<pre class="brush: xml;gutter:false;">&lt;?xml version="1.0" encoding="utf-8" ?&gt;
&lt;Catalog xmlns="http://www.amazon.com/FireTv/2014-04-11/ingestion" version="FireTv-v1.3"&gt;
&lt;Partner&gt;Everything Ever Made Filmworks&lt;/Partner&gt;
&lt;Works&gt;
&lt;Movie&gt;
&lt;ID&gt;MV-12345&lt;/ID&gt;
&lt;Title locale="en-US"&gt;Edison Kinetoscopic Record of a Sneeze&lt;/Title&gt;
&lt;Offers&gt;
&lt;SubscriptionOffer&gt;
&lt;Regions&gt;
&lt;Country&gt;US&lt;/Country&gt;
&lt;/Regions&gt;
&lt;/SubscriptionOffer&gt;
&lt;/Offers&gt;
&lt;/Movie&gt;
&lt;/Works&gt;
&lt;/Catalog&gt;
</pre>


<h2>一般的な CDF ファイルの構造</h2>
<p>このセクションでは CDF スキーマの構造とその要素の概要について説明します。なお、XML の知識が十分にあることを前提としています。</p>
<p>カタログファイルの最上位のアウトラインは次のように表すことができます。</p>
<pre>&lt;Catalog&gt;
&lt;Partner&gt;
&lt;Works&gt;
&lt;/Catalog&gt;</pre>
<p><a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#Catalog">Catalog</a>（<strong>必須</strong>）は、すべてのカタログファイルのルート要素です。</p>
<p><a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#Partner">Partner</a>（<strong>必須</strong>）は、コンテンツプロバイダーを識別する要素です。</p>
<p><a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#Works">Works</a>（<strong>必須</strong>）には、ファイルの大部分が含まれます。具体的には、ライブラリ内のすべての映画と TV 番組、各エントリについて提供する情報、ユーザーがそれらの作品を視聴するための利用方法です。</p>
<p>Works 要素には子要素を必要な数だけ含めることができます。子要素とは、１ つが映画や TV 番組などの １ つの作品を表します。Works 要素に子要素が含まれていない場合は、利用できるコンテンツがなくなったとみなされ、インデックスから削除されます。</p>
<p>使用できる作品タイプの要素は次のとおりです。</p>
<table class="auto-width">
<tbody>
<tr>
<td>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#Movie">Movie</a>
</td>
<td>劇場公開用の映画や TV 放映用の映画を表します。</td>
</tr>
<tr>
<td>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#TvSpecial">TvSpecial</a>
</td>
<td>単発の TV 番組を表します。特別イベントや、通常の連続物のエピソードには含まれないがシリーズに関連する番組などが対象です。</td>
</tr>
<tr>
<td>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#TvShow">TvShow</a>
</td>
<td>連続物の TV 番組を表します。通常は複数のエピソードをシーズンとしてまとめて提供します。</td>
</tr>
<tr>
<td>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#TvSeason">TvSeason</a>
</td>
<td>TV 番組の 1 つのシーズンを表します。<br></td>
</tr>
<tr>
<td>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#TvEpisode">TvEpisode</a>
</td>
<td>TV 番組の 1 つのシーズン内の 1 つのエピソードを表します。</td>
</tr>
<tr>
<td>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#MiniSeries">MiniSeries</a>
</td>
<td>少数の連続するエピソードで構成される TV 番組のシリーズを表します。</td>
</tr>
<tr>
<td>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#MiniSeriesEpisode">MiniSeriesEpisode</a>
</td>
<td>ミニシリーズ内の 1 つのエピソードを表します。</td>
</tr>
<tr>
<td>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#Extra">Extra</a>
</td>
<td>クリップやトレーラーを表します。多くの場合、別の作品に関連しています。</td>
</tr>
</tbody>
</table>
<p>Movie は単独の要素です。TvShow、TvSeason、TvEpisode は独立した要素ですが、ID で相互に関連付けられます。MiniSeries と MiniSeriesEpisode も同様です。TvSpecial と Extra は、独立した要素ですが、別の作品と関連付けることもできます。詳細については「<a href="#tying">TV 番組、シーズン、エピソードの関連付け</a>」を参照してください。</p>

<h2>すべての作品に共通する要素</h2>
<p>上記のすべての作品タイプが、共通する要素を基礎として構成されています。どのタイプの場合も、基礎からの拡張に使用されている固有の要素は 1 ～ 5 個程度です。共通する要素のうち、必須の要素はほんのわずかです。CDF スキーマで利用できる要素の大部分がオプションです。ただし、メタデータを追加で指定すると、ユーザーがコンテンツを簡単に検索できるようになる上、Amazon でも開発者様のコンテンツを他のコンテンツプロバイダーのコンテンツと<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/understanding-fire-tv-catalog-integration#matching">マッチング</a>しやすくなり、検索や閲覧のユーザーエクスペリエンスが向上します。</p>
<p>Work 要素のアウトラインは次のように表すことができます。</p>
<pre>&lt;<em>WorkType</em>&gt; (&lt;Movie&gt; や &lt;TvSeason&gt; など)
&lt;ID&gt;
&lt;Title&gt;
&lt;Offers&gt;
&lt;/<em>WorkType</em>&gt;</pre>
<p><a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#ID">ID</a>（<strong>必須</strong>）は、作品の識別子で、開発者様が指定します。各作品の ID は開発者様のカタログ内で一意である必要があります。また、その作品を提供している間は ID を変更しないでください。ID 要素は、TV エピソードを TV 番組やシーズンの一部として指定する場合など、作品の要素どうしを関連付ける目的でも使用されます。</p>
<p><a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#Title">Title</a>（<strong>必須</strong>）は、作品のタイトルです。タイトルは複数の言語で指定できます。</p>
<p><a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#Offers">Offers</a>（<strong>必須</strong>）には、ユーザーが作品を視聴する方法（無料、レンタルまたは購入、登録）を指定します。Offers は利用時間やリージョンで制限することができます。Offers 要素には少なくとも 1 つの視聴方法を含める必要がありますが、上限はなく、必要な数だけ含めることができます。視聴方法は 4 種類あります。</p>
<table class="auto-width">
<tbody>
<tr>
<td>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#FreeOffer">FreeOffer</a>
</td>
<td>すべてのユーザーがいつでも視聴することができる作品です。</td>
</tr>
<tr>
<td>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#SubscriptionOffer">SubscriptionOffer</a>
</td>
<td>視聴するのにサービスへの登録を必要とする作品です。</td>
</tr>
<tr>
<td>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#PurchaseOffer">PurchaseOffer</a>
</td>
<td>視聴するのに 1 回限りの支払いを必要とする作品です。支払い後は、いつでも視聴することができます。</td>
</tr>
<tr>
<td>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#RentalOffer">RentalOffer</a>
</td>
<td>視聴するのに 1 回限りの支払いを必要とする作品で、支払い後は一定期間のみ視聴できます。</td>
</tr>
</tbody>
</table>
<p>視聴方法のアウトラインは、次のように表すことができます。オプションの要素がいくつかあります。</p>
<pre>&lt;<em>OfferType</em>&gt; （&lt;FreeOffer&gt; や &lt;PurchaseOffer&gt; など）
&lt;Regions&gt;
&lt;WindowStart&gt;
&lt;WindowEnd&gt;
&lt;LaunchDetails&gt;
&lt;Price&gt; （レンタルまたは購入の場合のみ）
&lt;Duration&gt; （レンタルの場合のみ）
&lt;/<em>OfferType</em>&gt;
</pre>
<p><a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#Regions">Regions</a>（<strong>必須</strong>）には、この視聴方法が有効な国を指定します。Regions は<strong>必須</strong>であり、少なくとも <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#Country">Country</a> を 1 つ含む必要があります。</p>
<p><a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#WindowsStart">WindowsStart</a> と <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#WindowsEnd">WindowsEnd</a>（どちらも<strong>オプション</strong>です）は、一方だけ、または両方を使用して、この視聴方法が有効な期間を指定します。WindowsStart より前と WindowsEnd より後の期間には、この視聴方法は表示されません。</p>
<p><a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#LaunchDetails">LaunchDetails</a>（<strong>オプション</strong>）には、この視聴方法での画質、音声の言語、字幕のオプションを指定できます。また、これらのオプションを事前に設定しておいて作品の再生を直接開始できるようにする特別な ID も定義できます。</p>
<p><a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#Price">Price</a> は作品をレンタルまたは購入するための価格です。RentalOffer と PurchaseOffer の場合は<strong>必須</strong>です。以下の 4 種類の通貨のいずれかを使用して指定できます: 米国ドル、英国ポンド、日本円、ユーロ。<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#Duration">Duration</a> は、レンタル期間の時間数です。RentalOffer の場合は<strong>必須</strong>です。</p>
<p>作品の視聴方法を変更する場合は、新しい視聴方法の情報で更新したカタログファイルを提出する必要があります。</p>
<p>映画、番外編、TV 番組の詳細ページには、そのアイテムで利用できるすべての視聴方法とコンテンツプロバイダーが表示されます。視聴方法は次の順に表示されます（変更される可能性があります）。</p>
<ul>
<li>無料コンテンツ</li>
<li>登録が必要なコンテンツ</li>
<li>価格が設定されているコンテンツ（購入またはレンタル）</li>
</ul>

<h3>すべての作品に共通するオプションの要素</h3>
<p>ここまで、共通する必須の要素と、共通するオプションの要素の一部について説明しました。これらの知識だけで、有効な CDF ファイルを作成できます。ただし、これらは、利用できる要素全体の 3 分の 1 にすぎません。共通する要素の残りはすべて、作品の詳しい情報を提供するためのオプションの要素です。たとえば、ジャンル、認可、キャストとスタッフ、あらすじ、撮影スタジオ、画像、ユーザーによる評価を示すための要素があります。要素の詳しい一覧については、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference">カタログデータ形式スキーマリファレンス</a>」を参照してください。</p>
<h3>文字列についての注意</h3>
<p>CDF スキーマでは、作品のタイトルや説明などの一部の文字列データが、カスタムの LocalizedString タイプとして定義されています。ローカライズされた文字列を使用すると、同じコンテンツをさまざまな言語で提供し、ユーザーのデバイスの言語設定に応じて表示することができます。これらの文字列には、<em>locale</em>（標準型 xsd:language）という必須属性があります。以下にその例を示します。</p>
<pre class="brush: xml;gutter:false">&lt;Title locale="en-US"&gt;Edison Kinetoscopic Record of a Sneeze&lt;/Title&gt;</pre>
<p>ローカライズされた文字列には、<em>pronunciation</em>（標準型 xsd:string）というオプションの属性もあります。この属性は、漢字で文字列テキストを指定する日本語のカタログエントリ用に用意されています。日本語では、文字ではなく、発音に基づいてソート順が決まる（漢字では定義できない）ためです。<em>pronunciation</em> 属性には通常、発音の情報を平仮名で指定します。</p>


<h2>作品タイプ固有の要素</h2>
<p>作品タイプには、共通する要素に加えて、1 ～ 5 個のその作品固有の要素があります。一般的に、これらの要素には 2 種類の用途があります。（1）最初のリリース日または放映日の指定と（2）作品との関連付け（TV エピソードから TV 番組など）です。</p>
<p>リリース日は<strong>オプション</strong>ですが、指定することをお勧めします。<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#ReleaseDate">ReleaseDate</a>（映画、TV 番組、ミニシリーズの場合）または <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#OriginalAirDate">OriginalAirDate</a>（TV およびミニシリーズのエピソードと TV の特別番組の場合）で指定できます。</p>
<p>番組、シーズン、エピソードを関連付ける要素は<strong>必須</strong>です。これについては次のセクションで詳しく説明します。</p>
<p>タイプ固有の要素の特記事項については、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference">カタログデータ形式スキーマリファレンス</a>」を参照してください。</p>


<h2>TV 番組、シーズン、エピソードの関連付け</h2>
<p>TV エピソードは、特定の TV 番組の 1 シーズンの間に放映されます。ミニシリーズは、個別のエピソードで構成されます。番外編は、予告編や映画の舞台裏に関する情報です。TV 特別番組は TV 番組と関連付けることもできますが、通常の連続物には含まれません。CDF に用意されている要素を使用して、これらを関連付けることができます。Fire TV ユーザーが TV 番組を閲覧したときに、その番組がシーズン単位で整理され、各エピソードがシーズン内に連続して表示されるのは、これらの要素が使用されているためです。
</p>
<p>通常、ID またはタイトルを使用して、作品を別の作品に関連付けることができます。ID は、カタログ内の対象作品の ID と一致する必要があります。対象作品が自分のカタログ内にない場合は、ID の代わりにタイトルを使用できます。カタログ内でのマッチングにタイトルは必要ありません。タイトルは、作品をグループ化する目的のみで使用されます。
</p>
<p>次の表に、作品タイプごとの要素を示します。
</p>
<table class="auto-width"> <tbody>
<tr>
<th>作品タイプ</th>
<th>関連付けの要素</th>
</tr>
<tr>
<td>TvEpisode</td>
<td> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#ShowID">ShowID</a> または <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#ShowTitle">ShowTitle</a>
<br /> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#SeasonID">SeasonID</a> または <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#SeasonInShow">SeasonInShow</a>
<br /> <strong>注意</strong>:TvEpisode には <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#SeasonTitle">SeasonTitle</a> 要素もありますが、この要素はグループ化には使用されません。 </td>
</tr>
<tr>
<td>TvSeason</td>
<td> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#ShowID">ShowID</a> または <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#ShowTitle">ShowTitle</a> </td>
</tr>
<tr>
<td>TvShow</td>
<td>なし</td>
</tr>
<tr>
<td>TvSpecial</td>
<td> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#ShowID">ShowID</a> または <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#ShowTitle">ShowTitle</a> </td>
</tr>
<tr>
<td>MiniSeries</td>
<td>なし</td>
</tr>
<tr>
<td>MiniSeriesEpisode</td>
<td> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#MiniSeriesID">MiniSeriesID</a> または <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#MiniSeriesTitle">MiniSeriesTitle</a> </td>
</tr>
<tr>
<td>Extra</td>
<td> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#RelatesToID">RelatesToID</a> または <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#RelatesToExternalID">RelatesToExternalID</a> </td>
</tr>
<tr>
<td>Movie</td>
<td>なし</td>
</tr> </tbody>
</table>
<p>TvEpisode では、カタログ内にないシーズンを指定するときにタイトルではなく番号を使用します。Extra では、IMDb など、外部の ID スキーマへのリンクを使用します。どちらを使用するかは開発者様が選ぶことができますが、TvEpisode、TvSeason、MiniSeriesEpisode では、要素の選択肢で<strong>必ず</strong>どちらかを指定してください。TvSpecial と Extra は単独の作品として扱うことができるため、関連付けの値は<strong>オプション</strong>です。
<br />
</p>
<p>以下の図は、TV 番組用に ID を使用したときにさまざまな要素と値がどのように一致するかを示しています。
</p>
<p><img src="https://images-na.ssl-images-amazon.com/images/G/01/mobile-apps/devportal2/content/sdk/images/fire-tv-ci/RelatingShowsSeasonsSpecialsAndEpisodes._V285301666_.png" alt="この図は、TV 番組、シーズン、エピソード、特別番組の各 ID の関係を示しています。" />
</p>
<p>たとえば、TvShow の ID が "TV-123456" の場合、TvEpisode と TvSeason の ShowID 値も同じく "TV-123456" になります。「<a target="_blank" href="https://s3.amazonaws.com/com.amazon.aftb.cdf/cdf-examples.zip">カタログデータ形式スキーマリファレンス</a>」をダウンロードすると、これらの概念を具体的に示す、完全に実装されたカタログを確認できます。
</p>


<h2>ボックスアートイメージ（ImageUrl）の要件</h2>
<p><a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference#ImageUrl">ImageUrl</a> 要素は、すべての作品に共通するオプション要素の 1 つです。「ボックスアート」とも呼ばれる、作品を表す画像の URL を指定します。ImageUrl が指定されていない場合は、<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/understanding-fire-tv-catalog-integration#matching">マッチング</a>できれば、IMDb などの他のソースから利用可能な画像が使用されます。そうでない場合は、汎用的なプレースホルダー画像が使用される場合があります。</p>
<p><strong>注意</strong>:カタログでは、エントリ全体の少なくとも 50% に有効な画像を提供する必要があります。50% に満たない場合は、統合プロセスが失敗し、カタログ全体が却下されます。<br></p>
<h3>画像の要件</h3>
<table class="auto-width">
<tbody>
<tr>
<td>タイプ</td>
<td>JPG（推奨）または PNG</td>
<td>これ以外の画像タイプは使用できません。</td>
</tr>
<tr>
<td>アスペクト比</td>
<td>1:3 ～ 3:1（推奨は 1:2 と 2:1）<br></td>
<td>アスペクト比が 1:3 未満か 3:1 を超える画像は使用できません。<br>
アスペクト比が 1:2 ～ 1:3 の画像は 1:2 になるように画像の端が切り取られます。<br>
アスペクト比が 2:1 ～ 3:1 の画像は 2:1 になるように画像の端が切り取られます。</td>
</tr>
<tr>
<td>サイズ</td>
<td>高さが 240 px 以上（推奨は 480 px）</td>
<td>
画像の高さが 480 px 未満の場合、<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/receiving-and-understanding-the-catalog-ingestion-report">インジェストレポート</a>に警告が記載されますが、高さが 240 ～ 480 px の画像は無効な画像の合計数に加算されることなく受け付けられます。高さが 240 px 未満の画像は使用されません。最適な品質を維持するために、必要に応じてサイズを変更できるような大きい画像（大きいほど良い）を使用することをお勧めします。<br>
<br>
<strong>注意</strong>:アスペクト比が理由で画像の端が切り取られた場合は、切り取られた後の画像も元のサイズに関係なくこの高さの要件を満たしている必要があります。
</td>
</tr>
</tbody>
</table>
<p>画像は、少なくとも次の表に記載されている仕様を満たしていることが推奨されます。これは、ボックスアートイメージに関する仕様です。作品自体の仕様ではありません。</p>
<table class="auto-width">
<tbody>
<tr>
<th>メディア</th>
<th>アスペクト比</th>
<th>最小サイズ</th>
</tr>
<tr>
<td>映画</td>
<td>3:4</td>
<td>360 x 480 px</td>
</tr>
<tr>
<td>TV エピソード、シーズン、番組、特別番組<br>
ミニシリーズ、ミニシリーズエピソード</td>
<td>16:10</td>
<td>768 x 480 px</td>
</tr>
<tr>
<td>TV エピソード、シーズン、番組、特別番組<br>
ミニシリーズ、ミニシリーズエピソード</td>
<td>16:9</td>
<td>853 x 480 px</td>
</tr>
</tbody>
</table>


<h2>スキーマに対する CDF ファイルの検証</h2>
<p>カタログファイルをアップロードする前に、カタログが XML 形式であることを確認し、スキーマに対して検証してください。ファイル形式が正しくない場合やカタログファイルが無効な場合は、このサービスで受け付けることができません。たとえば、Linux システムでは、次の <code>xmllint</code> コマンドを使用してファイルを検証できます。このコマンドは、カタログファイル（file.xml）がスキーマファイル（schema.xsd）と同じフォルダーにあり、このフォルダーからコマンドを発行していることを前提としています。最新のスキーマファイルは、<a href="https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog.xsd">こちらから</a>ダウンロードできます。
</p>
<pre>xmllint --noout --schema schema.xsd file.xml</pre>
<p>Eclipse や Intellij などの多くの統合開発環境（IDE）でも、スキーマに対してカタログを検証できます。詳細については、以下のリンクを参照してください。
</p>
<ul>
<li>Eclipse での XML の検証:<a href="http://help.eclipse.org/mars/index.jsp?topic=%2Forg.eclipse.wst.xmleditor.doc.user%2Ftopics%2Ftwxvalid.html">http://help.eclipse.org/mars/index.jsp?topic=%2Forg.eclipse.wst.xmleditor.doc.user%2Ftopics%2Ftwxvalid.html</a></li>
<li>Intellij での XML の検証:<a href="https://www.jetbrains.com/idea/help/validating-web-content-files.html">https://www.jetbrains.com/idea/help/validating-web-content-files.html</a></li>
<li>Visual Studio での XML の検証:<a href="https://msdn.microsoft.com/en-us/library/ms255815.aspx">https://msdn.microsoft.com/ja-jp/library/ms255815.aspx</a></li>
<li>Notepad++ の XML ツールプラグイン:<a href="https://notepad-plus-plus.org">https://notepad-plus-plus.org</a></li>
</ul>


<h2>関連リソース</h2>
<ul>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/overview/integrating-your-catalog-with-fire-tv">カタログと Amazon Fire TV の統合</a>:Fire TV カタログ統合のランディングページ。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/understanding-fire-tv-catalog-integration">Fire TV カタログ統合について</a>:カタログ統合の概念の紹介。</li>
<li> <a href="https://developer.amazon.com/public/solutions/devices/fire-tv/docs/catalog/getting-started-catalog-integration">カタログ統合の準備</a>:Fire TV カタログ統合のクイックスタートガイド。</li>
<li> <strong>カタログデータ形式（CDF）について</strong>:カタログファイルに必要な構成方法と必須フィールドに関する説明。</li>
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
