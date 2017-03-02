---
title: Fire TV カタログデータ形式（CDF）スキーマリファレンス
permalink: catalog-data-format-schema-reference.html
sidebar: catalog_ja
product: Fire TV Catalog
toc: false
github: true
---

<h2>はじめに</h2>
<p>Amazon Fire TV にアップロードするメディアコンテンツのカタログは、カタログデータ形式（CDF）のスキーマに用意されている要素を使って作成します。このトピックでは、それらの要素を一覧形式で紹介します。</p>
<p>CDF カタログファイルの構造の概要と各要素の相互作用については、「カタログデータ形式（CDF）について」を参照してください。カタログのサンプルファイル（<a href="https://s3.amazonaws.com/com.amazon.aftb.cdf/cdf-examples.zip">cdf-examples.zip</a>）がダウンロードできるようになっています。カタログファイルがどのように構成されているかを理解するための参考にしてください。XSD の内容については、<a target="_blank" href="https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog.xsd">catalog.xsd</a> をダウンロードし、実際に確認できます。<br></p>
<p>以下の内容を使用するには、XML に対する十分な理解が必要です。<br></p>


<h2>CDF スキーマ要素一覧</h2>
<p>このページでは、以下に示した CDF スキーマの要素について取り上げます。</p>
<table>
<tbody>
<tr>
<td>
<a href="#AdultProduct">AdultProduct</a>
</td>
<td>
<a href="#FreeOffer">FreeOffer</a>
</td>
<td>
<a href="#Partner">Partner</a>
</td>
<td>
<a href="#ShortDescription">ShortDescription</a>
</td>
</tr>
<tr>
<td>
<a href="#AudioLanguage">AudioLanguage</a>
</td>
<td>
<a href="#Genre">Genre</a>
</td>
<td>
<a href="#Price">Price</a>
</td>
<td>
<a href="#ShowID">ShowID</a>
</td>
</tr>
<tr>
<td>
<a href="#CastMember">CastMember</a>
</td>
<td>
<a href="#Genres">Genres</a>
</td>
<td>
<a href="#PurchaseOffer">PurchaseOffer</a>
</td>
<td>
<a href="#ShowTitle">ShowTitle</a>
</td>
</tr>
<tr>
<td>
<a href="#Catalog">Catalog</a>
</td>
<td>
<a href="#ID">ID</a>
</td>
<td>
<a href="#Quality">Quality</a>
</td>
<td>
<a href="#Source">Source</a>
</td>
</tr>
<tr>
<td>
<a href="#Certification">Certification</a>
</td>
<td>
<a href="#ImageUrl">ImageUrl</a>
</td>
<td>
<a href="#Rank">Rank</a>
</td>
<td>
<a href="#Studio">Studio</a>
</td>
</tr>
<tr>
<td>
<a href="#Color">Color</a>
</td>
<td>
<a href="#Job">Job</a>
</td>
<td>
<a href="#Regions">Regions</a>
</td>
<td>
<a href="#Studios">Studios</a>
</td>
</tr>
<tr>
<td>
<a href="#ContentRating">ContentRating</a>
</td>
<td>
<a href="#JP_Require18PlusAgeConfirmation">JP_Require18PlusAgeConfirmation</a>
</td>
<td>
<a href="#RelatesToExternalID">RelatesToExternalID</a>
</td>
<td>
<a href="#SubscriptionOffer">SubscriptionOffer</a>
</td>
</tr>
<tr>
<td>
<a href="#ContentRatings">ContentRatings</a>
</td>
<td>
<a href="#Language">Language</a>
</td>
<td>
<a href="#RelatesToID">RelatesToID</a>
</td>
<td>
<a href="#Subtitle">Subtitle</a>
</td>
</tr>
<tr>
<td>
<a href="#Copyright">Copyright</a>
</td>
<td>
<a href="#LaunchDetails">LaunchDetails</a>
</td>
<td>
<a href="#ReleaseCountry">ReleaseCountry</a>
</td>
<td>
<a href="#Synopsis">Synopsis</a>
</td>
</tr>
<tr>
<td>
<a href="#Count">Count</a>
</td>
<td>
<a href="#LaunchId">LaunchId</a>
</td>
<td>
<a href="#ReleaseDate">ReleaseDate</a>
</td>
<td>
<a href="#System">System</a>
</td>
</tr>
<tr>
<td>
<a href="#Country">Country</a>
</td>
<td>
<a href="#MaxValue">MaxValue</a>
</td>
<td>
<a href="#ReleaseInfo">ReleaseInfo</a>
</td>
<td>
<a href="#Title">Title</a>
</td>
</tr>
<tr>
<td>
<a href="#Credits">Credits</a>
</td>
<td>
<a href="#MiniSeries">MiniSeries</a>
</td>
<td>
<a href="#ReleaseYear">ReleaseYear</a>
</td>
<td>
<a href="#TvEpisode">TvEpisode</a>
</td>
</tr>
<tr>
<td>
<a href="#CrewMember">CrewMember</a>
</td>
<td>
<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>
</td>
<td>
<a href="#RentalOffer">RentalOffer</a>
</td>
<td>
<a href="#TvSeason">TvSeason</a>
</td>
</tr>
<tr>
<td>
<a href="#CustomerRating">CustomerRating</a>
</td>
<td>
<a href="#MiniSeriesID">MiniSeriesID</a>
</td>
<td>
<a href="#Role">Role</a>
</td>
<td>
<a href="#TvShow">TvShow</a>
</td>
</tr>
<tr>
<td>
<a href="#Duration">Duration</a>
</td>
<td>
<a href="#MiniSeriesTitle">MiniSeriesTitle</a>
</td>
<td>
<a href="#RuntimeMinutes">RuntimeMinutes</a>
</td>
<td>
<a href="#TvSpecial">TvSpecial</a>
</td>
</tr>
<tr>
<td>
<a href="#EpisodeInSeason">EpisodeInSeason</a>
</td>
<td>
<a href="#Movie">Movie</a>
</td>
<td>
<a href="#Score">Score</a>
</td>
<td>
<a href="#Type">Type</a>
</td>
</tr>
<tr>
<td>
<a href="#EpisodeInSeries">EpisodeInSeries</a>
</td>
<td>
<a href="#Name">Name</a>
</td>
<td>
<a href="#SeasonID">SeasonID</a>
</td>
<td>
<a href="#WindowEnd">WindowEnd</a>
</td>
</tr>
<tr>
<td>
<a href="#ExternalID">ExternalID</a>
</td>
<td>
<a href="#Offers">Offers</a>
</td>
<td>
<a href="#SeasonInShow">SeasonInShow</a>
</td>
<td>
<a href="#WindowStart">WindowStart</a>
</td>
</tr>
<tr>
<td>
<a href="#Extra">Extra</a>
</td>
<td>
<a href="#OriginalAirDate">OriginalAirDate</a>
</td>
<td>
<a href="#SeasonTitle">SeasonTitle</a>
</td>
<td>
<a href="#Works">Works</a>
</td>
</tr>
</tbody>
</table>


<a class="anchor" name="CDF スキーマ要素の定義"></a>

<a class="anchor" name="elements"></a>

<h2>CDF スキーマ要素の定義</h2>
<a class="anchor" id="AdultProduct"></a>
<h3>AdultProduct（廃止）</h3>
<p><strong>廃止されました。使用しないでください</strong>。この情報は、<a href="#ContentRating">ContentRating</a> を使用して伝達します。日本では、<a href="#JP_Require18PlusAgeConfirmation">JP_Require18PlusAgeConfirmation</a>（CDF v1.2 以降）を使用することもできます。</p>
<p>成人のみを対象としたコンテンツとして作品を識別します。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>廃止</td>
<td>CDF バージョン 1.1</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Movie">Movie</a>、<a href="#TvShow">TvShow</a>、<a href="#TvSeason">TvSeason</a>、<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSpecial">TvSpecial</a>、<a href="#MiniSeries">MiniSeries</a>、<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>、<a href="#Extra">Extra</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>許容される値</td>
<td>true<br>
false</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;Movie&gt;false&lt;/Movie&gt;
...
<strong>&lt;AdultProduct&gt;false&lt;/AdultProduct&gt;</strong>
...
&lt;/Movie&gt;false&lt;/Movie&gt;
</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="AudioLanguage"></a>
<h3>AudioLanguage</h3>
<p>複数の言語に吹き替えられた作品のオーディオオプション。AudioLanguage 要素は必要に応じていくつでも追加し、作品の吹き替え版を指定することができます。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#LaunchDetails">LaunchDetails</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>許容される値</td>
<td>標準の XML/HTML 言語コード（en、en-US、fr、fr-FR など）</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;LaunchDetails&gt;
&lt;Quality&gt;SD&lt;/Quality&gt;
&lt;Quality&gt;HD&lt;/Quality&gt;
<strong>&lt;AudioLanguage&gt;en-US&lt;/AudioLanguage&gt;
&lt;AudioLanguage&gt;es-MX&lt;/AudioLanguage&gt;</strong>
&lt;Subtitle&gt;en-US&lt;/Subtitle&gt;
&lt;Subtitle&gt;es-MX&lt;/Subtitle&gt;
&lt;LaunchId&gt;MV123456_HD_es-MX_en&lt;/LaunchId&gt;
&lt;/LaunchDetails&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="CastMember"></a>
<h3>CastMember</h3>
<p>作品のキャスト（俳優、ホスト、ナレーター、声優など）に含まれる人物についての情報を保持します。<a href="#Credits">Credits</a> 要素（省略可能）が存在する場合、CastMember または <a href="#CrewMember">CrewMember</a> のいずれかの項目が少なくとも 1 つ存在する必要があります。CastMember 要素は必要に応じていくつでも追加できます。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>CrewMember 要素が存在しない場合は必須。存在する場合は省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Credits">Credits</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>
<a href="#Name">Name</a>（必須）、<a href="#ExternalID">ExternalID</a>（省略可能）、<a href="#Role">Role</a>（省略可能）
</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;Credits&gt;
<strong>&lt;CastMember&gt;</strong>
&lt;Name locale="en-US"&gt;Alan Smithee&lt;/Name&gt;
&lt;ExternalID scheme="imdb"&gt;tt0000000&lt;/ExternalID&gt;
&lt;Role locale="en-US"&gt;Self&lt;/Role&gt;
<strong>&lt;/CastMember&gt;</strong>
&lt;/Credits&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Catalog"></a>
<h3>Catalog</h3>
<p>CDF ファイルのルート要素。すべてのカタログファイルには、Catalog 要素が 1 つ存在し、それ以外の内容は、この要素に含まれています。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>必須</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>なし</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>
<a href="#partner">Partner</a>（必須）、<a href="#works">Works</a>（必須）
</td>
</tr>
<tr>
<td>属性</td>
<td>
<table class="auto-width">
<tbody>
<tr>
<th width="20%">属性</th>
<th width="20%">許容される値</th>
<th>説明</th>
</tr>
<tr>
<td>xmlns</td>
<td>http://www.amazon.com/FireTv/2014-04-11/ingestion</td>
<td><strong>必須</strong>。XML 名前空間。</td>
</tr>
<tr>
<td>SchemaVersion</td>
<td>FireTv-v1.2<br>
FireTv-v1.3</td>
<td><strong>省略可能</strong>。CDF v1.2 で追加されました。このカタログで使用されているスキーマのバージョンです。使用しているスキーマのバージョンは、スキーマの "id" を参照して確認できます。この属性は互換性上の理由から省略できますが、バージョンを指定することをお勧めします。</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;xml version="1.0" encoding="utf-8" ?&gt;
&lt;Catalog xmlns="http://www.amazon.com/FireTv/2014-04-11/ingestion" version="FireTv-v1.3"&gt;
&lt;Partner&gt;Everything Ever Made Filmworks&lt;/Partner&gt;
&lt;Works&gt;
...
&lt;/Works&gt;
&lt;Catalog&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Certification"></a>
<h3>Certification</h3>
<p>特定の認定<a href="#System">システム</a>のもとで作品に与えられた証明または評価。ContentRating に割り当てることのできる Certification 要素は 1 つだけです。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>ContentRating で必須<br></strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#ContentRating">ContentRating</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;ContentRating&gt;
&lt;System&gt;MPAA&lt;/System&gt;
<strong>&lt;Certification&gt;PG-13&lt;/Certification&gt;</strong>
&lt;/ContentRating&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Color"></a>
<h3>Color</h3>
<p>映画が主にカラーであるか白黒であるかを指定します。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Movie">Movie</a>、<a href="#TvShow">TvShow</a>、<a href="#TvSeason">TvSeason</a>、<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSpecial">TvSpecial</a>、<a href="#MiniSeries">MiniSeries</a>、<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>、<a href="#Extra">Extra</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>許容される値</td>
<td>color<br>
black_and_white</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;Movie&gt;
...
<strong>&lt;Color&gt;black_and_white&lt;/Color&gt;</strong>
...
&lt;/Movie&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="ContentRating"></a>
<h3>ContentRating</h3>
<p>レーティングシステム（または評価機関）および作品に与えられた評価を指定する要素が格納されます。<a href="#ContentRatings">ContentRatings</a>（省略可能）が存在する場合に、ContentRating を少なくとも 1 つ含んでいる必要があります。ContentRating 要素は必要に応じていくつでも追加できます（システムと評価の組み合わせごとに 1 つ）。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>ContentRatings 要素（省略可能）が存在する場合は必須<br></strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#ContentRatings">ContentRatings</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>
<a href="#System">System</a>（必須）、<a href="#Certification">Certification</a>（必須）
</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;ContentRatings&gt;
<strong>&lt;ContentRating&gt;</strong>
&lt;System&gt;MPAA&lt;/System&gt;
&lt;Certification&gt;PG-13&lt;/Certification&gt;
<strong>&lt;/ContentRating&gt;</strong>
&lt;/ContentRatings&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="ContentRatings"></a>
<h3>ContentRatings</h3>
<p>特定の認定機関によって作品に与えられた公式な評価を保持します。ContentRatings 要素は、作品ごとに 1 つだけ許容されます。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Movie">Movie</a>、<a href="#TvShow">TvShow</a>、<a href="#TvSeason">TvSeason</a>、<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSpecial">TvSpecial</a>、<a href="#MiniSeries">MiniSeries</a>、<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>、<a href="#Extra">Extra</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>
<a href="#ContentRating">ContentRating</a>（少なくとも 1 つは必要）
</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre><strong>&lt;ContentRatings&gt;</strong>
&lt;ContentRating&gt;
&lt;System&gt;MPAA&lt;/System&gt;
&lt;Certification&gt;PG-13&lt;/Certification&gt;
&lt;/ContentRating&gt;
&lt;ContentRating&gt;
&lt;System&gt;Eirin&lt;/System&gt;
&lt;Certification&gt;R15+&lt;/Certification&gt;
&lt;/ContentRating&gt;
<strong>&lt;/ContentRatings&gt;</strong></pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Copyright"></a>
<h3>Copyright</h3>
<p>作品の著作権表示。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Movie">Movie</a>、<a href="#TvShow">TvShow</a>、<a href="#TvSeason">TvSeason</a>、<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSpecial">TvSpecial</a>、<a href="#MiniSeries">MiniSeries</a>、<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>、<a href="#Extra">Extra</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>
<table class="auto-width">
<tbody>
<tr>
<th width="20%">属性</th>
<th width="20%">許容される値</th>
<th>説明</th>
</tr>
<tr>
<td>locale</td>
<td>標準の XML/HTML 言語コード（en、en-US、fr、fr-FR など）</td>
<td><strong>必須</strong>。この文字列を使用する端末またはソフトウェアの言語設定。</td>
</tr>
<tr>
<td>pronunciation</td>
<td>文字列</td>
<td><strong>省略可能</strong>。要素のテキストが漢字で表記される場合に使用されます。日本語のソート順は、文字ではなく発音（漢字からは特定不可能）に基づいて決まります。その情報を与えるのが <em>pronunciation</em> 属性です。通常ひらがなが使用されます。</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td>例</td>
<td>&lt;Copyright locale="en-US"&gt;© 2014 Amazon Studios&lt;/Copyright&gt;</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Count"></a>
<h3>Count</h3>
<p>視聴者の評価<a href="#Score">スコア</a>に寄与したユーザーの数。Count は、<a href="#CustomerRating">CustomerRating</a> ごとに 1 つだけ許容されます。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.2</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#CustomerRating">CustomerRating</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>許容される値</td>
<td>負数以外の整数。</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;CustomerRating&gt;
&lt;Score&gt;8.2&lt;/Score&gt;
&lt;MaxValue&gt;10&lt;/MaxValue&gt;
<strong>&lt;Count&gt;512&lt;/Count&gt;</strong>
&lt;/CustomerRating&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Country"></a>
<h3>Country</h3>
<p>特定の視聴方法（登録、無料、購入、レンタル）の対象となる国。各視聴方法には、必要に応じて Country 要素をいくつでも追加できます。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>必須</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Regions">Regions</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>許容される値</td>
<td>
次に示す <a href="http://www.iso.org/iso/country_codes.htm">ISO 3166-1 国コード</a>のサブセットを使用できます。<br>
AF AX AL DZ AS AD AO AI AQ AG AR AM AW AU AT AZ BS BH BD BB BY BE BZ BJ BM BT BO BQ BA BW BV BR IO BN BG BF BI KH CM CA CV KY CF TD CL CN CX CC CO KM CG CD CK CR CI HR CU CW CY CZ DK DJ DM DO EC EG SV GQ ER EE ET FK FO FJ FI FR GF PF TF GA GM GE DE GH GI GR GL GD GP GU GT GG GN GW GY HT HM VA HN HK HU IS IN ID IR IQ IE IM IL IT JM JP JE JO KZ KE KI KP KR KW KG LA LV LB LS LR LY LI LT LU MO MK MG MW MY MV ML MT MH MQ MR MU YT MX FM MD MC MN ME MS MA MZ MM NA NR NP NL NC NZ NI NE NG NU NF MP NO OM PK PW PS PA PG PY PE PH PN PL PT PR QA RE RO RU RW BL SH KN LC MF PM VC WS SM ST SA SN RS SC SL SG SX SK SI SB SO ZA GS SS ES LK SD SR SJ SZ SE CH SY TW TJ TZ TH TL TG TK TO TT TN TR TM TC TV UG UA AE GB US UM UY UZ VU VE VN VG VI WF EH YE ZM ZW
</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;SubscriptionOffer&gt;
&lt;Regions&gt;
<strong>&lt;Country&gt;US&lt;/Country&gt;
&lt;Country&gt;CA&lt;/Country&gt;</strong>
&lt;/Regions&gt;
...
&lt;/SubscriptionOffer&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Credits"></a>
<h3>Credits</h3>
<p>作品のキャストとクルーのメンバーを表す要素が格納されます。同じ人物をキャストまたはクルーとして複数回指定することができます。指定できる Credits 要素は各作品につき 1 つだけです。Credits が存在する場合、<a href="#CastMember">CastMember</a> または <a href="#CrewMember">CrewMember</a> を少なくとも 1 つ含んでいる必要があります。いずれの要素も必要に応じていくつでも追加できます。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Movie">Movie</a>、<a href="#TvShow">TvShow</a>、<a href="#TvSeason">TvSeason</a>、<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSpecial">TvSpecial</a>、<a href="#MiniSeries">MiniSeries</a>、<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>、<a href="#Extra">Extra</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>
<a href="#CastMember">CastMember</a>、<a href="#CrewMember">CrewMember</a>（この 2 つのうち少なくとも 1 つは必要）
</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre><strong>&lt;Credits&gt;</strong>
&lt;CastMember&gt;
&lt;Name locale="en-US"&gt;Alan Smithee&lt;/Name&gt;
&lt;Role locale="en-US"&gt;Self&lt;/Role&gt;
&lt;/CastMember&gt;
<strong>&lt;/Credits&gt;</strong></pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="CrewMember"></a>
<h3>CrewMember</h3>
<p>作品の裏方のクルー（ディレクター、ライター、カメラマン、照明係第一助手、アニメーター、撮影助手など）に関する情報を表す要素が格納されます。<a href="#Credits">Credits</a>（省略可能）が存在する場合、<a href="#CastMember">CastMember</a> または CrewMember のいずれかの項目が少なくとも 1 つ存在する必要があります。CrewMember 要素は必要に応じていくつでも追加できます。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>CastMember 要素が存在しない場合は必須。存在する場合は省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Credits">Credits</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>
<a href="#Name">Name</a>（必須）、<a href="#ExternalID">ExternalID</a>（省略可能）、<a href="#Job">Job</a>（省略可能）
</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;Credits&gt;
<strong>&lt;CrewMember&gt;</strong>
&lt;Name locale="en-US"&gt;Alan Smithee&lt;/Name&gt;
&lt;ExternalID scheme="imdb"&gt;tt0000000&lt;/ExternalID&gt;
&lt;Job locale="en-US"&gt;Director&lt;/Job&gt;
<strong>&lt;/CrewMember&gt;</strong>
&lt;/Credits&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="CustomerRating"></a>
<h3>CustomerRating</h3>
<p>作品に対する視聴者の評価の平均スコア、最大値、スコアに寄与した評価の数を表す要素が格納されます。指定できる CustomerRating 要素は各作品につき 1 つだけです。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Movie">Movie</a>、<a href="#TvShow">TvShow</a>、<a href="#TvSeason">TvSeason</a>、<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSpecial">TvSpecial</a>、<a href="#MiniSeries">MiniSeries</a>、<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>、<a href="#Extra">Extra</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>
<a href="#Score">Score</a>（必須）、<a href="#MaxValue">MaxValue</a>（必須）、<a href="#Count">Count</a>（省略可、CDF v1.2 以降のみ）
</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre><strong>&lt;CustomerRating&gt;</strong>
&lt;Score&gt;8.2&lt;/Score&gt;
&lt;MaxValue&gt;10&lt;/MaxValue&gt;
&lt;Count&gt;512&lt;/Count&gt;
<strong>&lt;/CustomerRating&gt;</strong></pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Duration"></a>
<h3>Duration</h3>
<p>作品のレンタル期間（時単位）を定義します。指定できる Duration 要素は 1 つの RentalOffer につき 1 つだけです。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>必須</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#RentalOffer">RentalOffer</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;RentalOffer&gt;
...
<strong>&lt;Duration&gt;120&lt;/Duration&gt;</strong>
&lt;/RentalOffer&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="EpisodeInSeason"></a>
<h3>EpisodeInSeason</h3>
<p>テレビのシーズンに含まれているエピソードの連続番号。指定できる EpisodeInSeason 要素は各 <a href="#TvEpisode">TvEpisode</a> につき 1 つだけです。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>必須</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#TvEpisode">TvEpisode</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;TvEpisode&gt;
...
<strong>&lt;EpisodeInSeason&gt;6&lt;/EpisodeInSeason&gt;</strong>
...
&lt;/TvEpisode&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="EpisodeInSeries"></a>
<h3>EpisodeInSeries</h3>
<p>シリーズに含まれているミニシリーズのエピソードの連続番号。指定できる EpisodeInSeries 要素は各 <a href="#MiniSeriesEpisode">MiniSeriesEpisode</a> につき 1 つだけです。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>必須</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.3</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;MiniSeriesEpisode&gt;
...
<strong>&lt;EpisodeInSeries&gt;13&lt;/EpisodeInSeries&gt;</strong>
...
&lt;/MiniSeriesEpisode&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="ExternalID"></a>
<h3>ExternalID</h3>
<p>外部ソース（IMDb など）の分類に基づく作品の識別子。この値は、コンテンツのマッチングに使用されます。別のカタログ内の対応する値と比較し、作品や人物が同一であるかどうかを判断します。画像など外部コンテンツのソースとしても使用できます。外部 ID を格納する ExternalID 要素は、必要に応じていくつでも追加できます。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#CastMember">CastMember</a>、<a href="#CrewMember">CrewMember</a>、<a href="#Extra">Extra</a>、<a href="#MiniSeries">MiniSeries</a>、<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>、<a href="#Movie">Movie</a>、<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSeason">TvSeason</a>、<a href="#TvShow">TvShow</a>、<a href="#TvSpecial">TvSpecial</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>
<table class="auto-width">
<tbody>
<tr>
<th width="15%">属性</th>
<th width="25%">説明</th>
<th>許容される値</th>
</tr>
<tr>
<td>scheme</td>
<td><strong>必須</strong>。この ID の提供元となった外部ソース。</td>
<td>imdb<br>
tms<br>
isan<br>
ean<br>
upc</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td>コメント</td>
<td colspan="3">
各ソースの値を次に示します。
<table class="auto-width">
<tbody>
<tr>
<th>値</th>
<th>説明</th>
</tr>
<tr>
<td>imdb</td>
<td>Internet Movie Database（IMDb）。ID は、特定のページの URL の構成要素として存在します。</td>
</tr>
<tr>
<td>tms</td>
<td>Gracenote™ データベースで使用されている ID。</td>
</tr>
<tr>
<td>isan</td>
<td>International Standard Audiovisual Number（ISAN）。26 文字の英数字。通常、ダッシュ区切りで表示されます。</td>
</tr>
<tr>
<td>ean</td>
<td>International Article Number（EAN）。通常 13 桁で表されるバーコード。</td>
</tr>
<tr>
<td>upc</td>
<td>Universal Product Code（UPC）。通常 12 桁で表されるバーコード。</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;Movie&gt;
&lt;ID&gt;MV123456&lt;/ID&gt;
<strong>&lt;ExternalID scheme="imdb"&gt;tt0000000&lt;/ExternalID&gt;
&lt;ExternalID scheme="tms"&gt;MV000000000000&lt;/ExternalID&gt;
&lt;ExternalID scheme="isan"&gt;0000-0000-0F00-0000-X-0000-0000-Y&lt;/ExternalID&gt;
&lt;ExternalID scheme="ean"&gt;0011559514120&lt;/ExternalID&gt;
&lt;ExternalID scheme="upc"&gt;123456789990&lt;/ExternalID&gt;</strong>
...
&lt;/Movie&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Extra"></a>
<h3>Extra</h3>
<p>基本的な作品タイプの 1 つで、クリップまたはトレーラーを表します。単発の作品の場合もありますが、通常は他の作品（外部の作品またはカタログ内の別の作品）に関連付けられます。一般に、DVD に収録されるボーナストラックに相当するものと考えてください。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.3</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Catalog">Catalog</a>
</td>
</tr>
<tr>
<td>全作品タイプ共通の子要素</td>
<td>
必須: <a href="#ID">ID</a>、<a href="#Offers">Offers</a>、<a href="#Title">Title</a><br>
省略可能: <a href="#AdultProduct">AdultProduct</a>（廃止）、<a href="#Color">Color</a>、<a href="#ContentRatings">ContentRatings</a>、<a href="#JP_Require18PlusAgeConfirmation">JP_Require18PlusAgeConfirmation</a>、<a href="#Copyright">Copyright</a>、<a href="#Credits">Credits</a>、<a href="#CustomerRating">CustomerRating</a>、<a href="#ExternalID">ExternalID</a>、<a href="#Genres">Genres</a>、<a href="#ImageUrl">ImageUrl</a>、<a href="#Language">Language</a>、<a href="#Rank">Rank</a>、<a href="#ReleaseInfo">ReleaseInfo</a>（廃止）、<a href="#ShortDescription">ShortDescription</a>、<a href="#ReleaseYear">ReleaseYear</a>、<a href="#RuntimeMinutes">RuntimeMinutes</a>、<a href="#Source">Source</a>、<a href="#Studios">Studios</a>、<a href="#Synopsis">Synopsis</a>
</td>
</tr>
<tr>
<td>Extra に固有の子要素</td>
<td>
必須: <a href="#Type">Type</a><br>
必須: <a href="#RelatesToID">RelatesToID</a> と <a href="#RelatesToExternalID">RelatesToExternalID</a> のどちらか一方（両方は不可）
</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre><strong>&lt;Extra&gt;</strong>
&lt;ID&gt;EXTRA-11111&lt;/ID&gt;
&lt;Title locale="en-US"&gt;Wishenpoof! Trailer&lt;/Title&gt;
&lt;Offers&gt;
&lt;FreeOffer&gt;
&lt;Regions&gt;
&lt;Country&gt;US&lt;/Country&gt;
&lt;/Regions&gt;
&lt;/FreeOffer&gt;
&lt;/Offers&gt;
&lt;Type&gt;trailer&lt;/Type&gt;
<strong>&lt;/Extra&gt;</strong></pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="FreeOffer"></a>
<h3>FreeOffer</h3>
<p>4 つある視聴方法タイプの 1 つ。この視聴方法では、作品をいつでも無料で視聴できます。視聴できる期間を指定することもできます。必要に応じて、Offers に複数の FreeOffer 要素を追加することができます。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能（ただし、Offers には少なくとも 1 つの視聴方法タイプが必要）</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Offers">Offers</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>
必須: <a href="#Regions">Regions</a><br>
省略可能: <a href="#LaunchDetails">LaunchDetails</a>、<a href="#Quality">Quality</a>（廃止）、<a href="#WindowStart">WindowStart</a>、<a href="#WindowEnd">WindowEnd</a>
</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre><strong>&lt;FreeOffer&gt;</strong>
&lt;Regions&gt;
&lt;Country&gt;US&lt;/Country&gt;
&lt;Country&gt;CA&lt;/Country&gt;
&lt;/Regions&gt;
&lt;WindowStart&gt;2014-02-06T12:00:00-07:00&lt;/WindowStart&gt;
&lt;WindowEnd&gt;2016-01-01T07:00:00-07:00&lt;/WindowEnd&gt;
&lt;LaunchDetails&gt;
&lt;Quality&gt;HD&lt;/Quality&gt;
&lt;AudioLanguage&gt;en-US&lt;/AudioLanguage&gt;
&lt;Subtitle&gt;en-US&lt;/Subtitle&gt;
&lt;Subtitle&gt;fr&lt;/Subtitle&gt;
&lt;Subtitle&gt;es&lt;/Subtitle&gt;
&lt;LaunchId&gt;EXTRA-11113_HD_en-US&lt;/LaunchId&gt;
&lt;/LaunchDetails&gt;
<strong>&lt;/FreeOffer&gt;</strong></pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Genre"></a>
<h3>Genre</h3>
<p>作品のジャンル（コメディー、ホラー、ドラマ、ドキュメンタリーなど）。必要であれば、1 つの作品を複数の Genre 要素で表すこともできます。検索とマッチングの機能を最大限に活かすために、できる限り標準的なジャンルの名称を用いてください。複数の説明を組み合わせて 1 つの文字列にするのではなく複数の Genre タグを使用してください。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>Genres 要素（省略可能）が存在する場合は必須</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Genres">Movie</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>
<table class="auto-width">
<tbody>
<tr>
<th width="20%">属性</th>
<th width="20%">許容される値</th>
<th>説明</th>
</tr>
<tr>
<td>locale</td>
<td>標準の XML/HTML 言語コード（en、en-US、fr、fr-FR など）</td>
<td><strong>必須</strong>。この文字列を使用する端末またはソフトウェアの言語設定。</td>
</tr>
<tr>
<td>pronunciation</td>
<td>文字列</td>
<td><strong>省略可能</strong>。要素のテキストが漢字で表記される場合に使用されます。日本語のソート順は、文字ではなく発音（漢字からは特定不可能）に基づいて決まります。その情報を与えるのが <em>pronunciation</em> 属性です。通常ひらがなが使用されます。</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;Genres&gt;
<strong>&lt;Genre locale="en-US"&gt;horror&lt;/Genre&gt;
&lt;Genre locale="en-US"&gt;sci-fi&lt;/Genre&gt;</strong>
&lt;/Genres&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Genres"></a>
<h3>Genres</h3>
<p>作品のカテゴリ（コメディー、ホラー、ドキュメンタリーなど）を表す 1 つまたは複数の <a href="#Genre">Genre</a> タグを格納します。<br></p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Movie">Movie</a>、<a href="#TvShow">TvShow</a>、<a href="#TvSeason">TvSeason</a>、<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSpecial">TvSpecial</a>、<a href="#MiniSeries">MiniSeries</a>、<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>、<a href="#Extra">Extra</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>
<a href="#Genre">Genre</a>（Genres が存在する場合に少なくとも 1 つは必要）
</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre><strong>&lt;Genres&gt;</strong>
&lt;Genre locale="en-US"&gt;horror&lt;/Genre&gt;
&lt;Genre locale="en-US"&gt;sci-fi&lt;/Genre&gt;
<strong>&lt;/Genres&gt;</strong></pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="ID"></a>
<h3>ID</h3>
<p>作品の識別子となる文字列。この値は 1 文字以上とし、カタログに存在する他のすべての ID を通じて一意であることが必要です。同じ ID の作品が 2 つ存在すると、インジェストシステムによってカタログが拒否されます。ID の決め方に方針を設け、重複を確実に防いでください。たとえば、パートナー ID + 作品タイプ + 十分な長さを持った識別子（GUID など）を ID として使用することが考えられます（例: "AmazonStudios_ Movie_01152ce2-de7e-44c1-9736-e8f3b15a1ddf"）。カタログ内で ID の一意性を確保できれば、どのような方針でもかまいません。</p>
<p>既存のカタログを更新するとき、作品の ID を変更しないようご注意ください。カタログから ID が消えた場合、弊社は、その作品がサービス上で利用できなくなったものとし、弊社のインデックスから削除します。<br></p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>必須</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Movie">Movie</a>、<a href="#TvShow">TvShow</a>、<a href="#TvSeason">TvSeason</a>、<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSpecial">TvSpecial</a>、<a href="#MiniSeries">MiniSeries</a>、<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>、<a href="#Extra">Extra</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;Movie&gt;
<strong>&lt;ID&gt;AmazonStudios_Movie_01152ce2-de7e-44c1-9736-e8f3b15a1ddf&lt;/ID&gt;</strong>
...
&lt;/Movie&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="ImageUrl"></a>
<h3>ImageUrl</h3>
<p>作品を表す画像の URL。"ボックスアート" とも呼ばれます。指定できる ImageUrl 要素は各作品につき 1 つだけです。ImageUrl が指定されていなかった場合、弊社にて他のソース（IMDb など）から利用可能なアートを使用するか、汎用的なプレースホルダー画像を使用します。画像の要件については、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-cdf-overview#ボックスアートイメージ（ImageUrl）の要件">カタログデータ形式（CDF）について</a>」を参照してください。</p>
<p><strong>注意</strong>: 作品のコンテンツについての重複しない画像を作品ごとに指定してください。汎用的なプレースホルダー画像（ロゴなど）は使用しないでください。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能（「コメント」を参照）</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Movie">Movie</a>、<a href="#TvShow">TvShow</a>、<a href="#TvSeason">TvSeason</a>、<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSpecial">TvSpecial</a>、<a href="#MiniSeries">MiniSeries</a>、<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>、<a href="#Extra">Extra</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>コメント</td>
<td>
ImageUrl 要素は省略可能ですが、登録対象の 50% 以上にこの要素が含まれていること、またその画像の参照先が有効であることが必要です。ファイル内の 50% を超える画像が無効と判断された場合（画像の欠落も無効と見なされます）、アップロードしたカタログはインジェストシステムによって拒否されます。複数の提供者から同じ作品が提出された場合、Amazon でマッチングを行い、そのすべての提供作品を 1 つの検索結果にまとめることで、検索に対する顧客満足度を高めていますが、画像はこのマッチング作業でも重要となります。最終的にはそのことが、視聴者に提供する特定の作品の見つけやすさにつながってきます。画像のサイズと縦横比の要件については、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-cdf-overview#ボックスアートイメージ（ImageUrl）の要件">カタログデータ形式について</a>」を参照してください。
</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;TvShow&gt;
...
<strong>&lt;ImageUrl&gt;http://amazon.com/images/01152ce2de7e44c1/image.jpg&lt;/ImageUrl&gt;</strong>
...
&lt;/TvShow&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Job"></a>
<h3>Job</h3>
<p>作品の CrewMember の職種（ディレクター、カメラマン、ライター、アニメーターなど）。CrewMember には、Job 要素を必要に応じていくつでも追加できます。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#CrewMember">CrewMember</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>
<table class="auto-width">
<tbody>
<tr>
<th width="20%">属性</th>
<th width="20%">許容される値</th>
<th>説明</th>
</tr>
<tr>
<td>locale</td>
<td>標準の XML/HTML 言語コード（en、en-US、fr、fr-FR など）</td>
<td><strong>必須</strong>。この文字列を使用する端末またはソフトウェアの言語設定。</td>
</tr>
<tr>
<td>pronunciation</td>
<td>文字列</td>
<td><strong>省略可能</strong>。要素のテキストが漢字で表記される場合に使用されます。日本語のソート順は、文字ではなく発音（漢字からは特定不可能）に基づいて決まります。その情報を与えるのが <em>pronunciation</em> 属性です。通常ひらがなが使用されます。</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;CrewMember&gt;
&lt;Name locale="en-US"&gt;Alan Smithee&lt;/Name&gt;
&lt;ExternalID scheme="imdb"&gt;tt0000000&lt;/ExternalID&gt;
<strong>&lt;Job locale="en-US"&gt;Grip&lt;/Job&gt;</strong>
&lt;/CrewMember&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="JP_Require18PlusAgeConfirmation"></a>
<h3>JP_Require18PlusAgeConfirmation</h3>
<p>18 歳以上の視聴者を対象とした、日本市場向けのコンテンツとしてマークします。このフラグを true に設定した場合、日本におけるそのコンテンツの視聴者は、日本の法的要件に従い、年齢が 18 歳以上であることを確認する必要があります。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.2</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Movie">Movie</a>、<a href="#TvShow">TvShow</a>、<a href="#TvSeason">TvSeason</a>、<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSpecial">TvSpecial</a>、<a href="#MiniSeries">MiniSeries</a>、<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>、<a href="#Extra">Extra</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>許容される値</td>
<td>true<br>
false</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;Movie&gt;
...
<strong>&lt;JP_Require18PlusAgeConfirmation&gt;true&lt;/JP_Require18PlusAgeConfirmation&gt;</strong>
&lt;/Movie&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Language"></a>
<h3>Language</h3>
<p>作品が最初に制作された言語。これは、音声における言語を指す場合と、サイレント作品における画面上に表示されるテキストの言語を指す場合とがあります。指定できる Language 要素は各作品につき 1 つだけです。さらに、吹き替えオプションを指定するには、<a href="#AudioLanguage">AudioLanguage</a> を使用します。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Movie">Movie</a>、<a href="#TvShow">TvShow</a>、<a href="#TvSeason">TvSeason</a>、<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSpecial">TvSpecial</a>、<a href="#MiniSeries">MiniSeries</a>、<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>、<a href="#Extra">Extra</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>許容される値</td>
<td>標準の XML/HTML 言語コード（en、en-US、fr、fr-FR など）</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;Movie&gt;
...
<strong>&lt;Language&gt;ja&lt;/Language&gt;</strong>
...
&lt;/Movie&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="LaunchDetails"></a>
<h3>LaunchDetails</h3>
<p>作品の特定の視聴方法で利用できるビデオの画質、音声言語、字幕のオプションを指定する要素が格納されます。LaunchDetails には、LaunchId という省略可能な要素も存在します。LaunchId を使用すると、あらかじめ決まった画質、言語、字幕の構成で作品の再生を直接開始することができます。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.2</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#SubscriptionOffer">SubscriptionOffer</a>、<a href="#FreeOffer">FreeOffer</a>、<a href="#PurchaseOffer">PurchaseOffer</a>、<a href="#RentalOffer">RentalOffer</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>
<a href="#Quality">Quality</a>（省略可能）、<a href="#AudioLanguage">AudioLanguage</a>（省略可能）、<a href="#Subtitle">Subtitle</a>（省略可能）、<a href="#LaunchId">LaunchId</a>（省略可能）
</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;FreeOffer&gt;
&lt;Regions&gt;
&lt;Country&gt;US&lt;/Country&gt;
&lt;/Regions&gt;
<strong>&lt;LaunchDetails&gt;</strong>
&lt;Quality&gt;SD&lt;/Quality&gt;
&lt;Quality&gt;HD&lt;/Quality&gt;
&lt;AudioLanguage&gt;en-US&lt;/AudioLanguage&gt;
&lt;AudioLanguage&gt;fr-FR&lt;/AudioLanguage&gt;
&lt;Subtitle&gt;en-US&lt;/Subtitle&gt;
&lt;Subtitle&gt;fr&lt;/Subtitle&gt;
&lt;Subtitle&gt;es&lt;/Subtitle&gt;
&lt;LaunchId&gt;EXTRA-11113_HD_en-US&lt;/LaunchId&gt;
<strong>&lt;/LaunchDetails&gt;</strong>
&lt;/FreeOffer&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="LaunchId"></a>
<h3>LaunchId</h3>
<p>あらかじめ決まった画質、音声言語、字幕の構成（またはその一部の組み合わせ）で作品を再生ための識別子。LaunchId には決まった形式がありませんが、開発者様のアプリのロジックで確実に認識できる形式としてください。1 つの LaunchDetails 要素に追加できる LaunchId は 1 つだけです。そのため複数の LaunchId を指定するには、複数の LaunchDetails 要素を追加する必要があります。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.2</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#LaunchDetails">LaunchDetails</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;SubscriptionOffer&gt;
&lt;Regions&gt;
&lt;Country&gt;US&lt;/Country&gt;
&lt;/Regions&gt;
&lt;LaunchDetails&gt;
&lt;Quality&gt;SD&lt;/Quality&gt;
&lt;Quality&gt;HD&lt;/Quality&gt;
&lt;AudioLanguage&gt;en-US&lt;/AudioLanguage&gt;
&lt;AudioLanguage&gt;fr-FR&lt;/AudioLanguage&gt;
&lt;Subtitle&gt;en-US&lt;/Subtitle&gt;
&lt;Subtitle&gt;fr&lt;/Subtitle&gt;
<strong>&lt;LaunchId&gt;EXTRA-11113_HD_en-US&lt;/LaunchId&gt;</strong>
&lt;/LaunchDetails&gt;
&lt;LaunchDetails&gt;
&lt;Quality&gt;SD&lt;/Quality&gt;
&lt;Quality&gt;HD&lt;/Quality&gt;
&lt;AudioLanguage&gt;en-US&lt;/AudioLanguage&gt;
&lt;AudioLanguage&gt;fr-FR&lt;/AudioLanguage&gt;
&lt;Subtitle&gt;en-US&lt;/Subtitle&gt;
&lt;Subtitle&gt;fr&lt;/Subtitle&gt;
<strong>&lt;LaunchId&gt;EXTRA-11113_SD_fr-FR_en-US&lt;/LaunchId&gt;</strong>
&lt;/LaunchDetails&gt;
&lt;/SubscriptionOffer&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="MaxValue"></a>
<h3>MaxValue</h3>
<p>作品に対する視聴者の評価として考えられる最高値。指定できる MaxValue は、各 CustomerRating につき 1 つだけです。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>CustomerRating 要素（省略可能）が存在する場合は必須</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Movie">Movie</a>、<a href="#TvShow">TvShow</a>、<a href="#TvSeason">TvSeason</a>、<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSpecial">TvSpecial</a>、<a href="#MiniSeries">MiniSeries</a>、<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>、<a href="#Extra">Extra</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;CustomerRating&gt;
&lt;Score&gt;8.2&lt;/Score&gt;
<strong>&lt;MaxValue&gt;10&lt;/MaxValue&gt;</strong>
&lt;Count&gt;512&lt;/Count&gt;
&lt;/CustomerRating&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="MiniSeries"></a>
<h3>MiniSeries</h3>
<p>MiniSeries は基本的な作品タイプの 1 つです。その大まかな定義は、シーズンとして提供されない、少数の一連のエピソードから成るテレビ番組です。MiniSeries に含めることができるエピソード数に明示的な制限はありませんが、常識的な判断で、ごく少数のエピソードに限定してください。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.3</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Catalog">Catalog</a>
</td>
</tr>
<tr>
<td>全作品タイプ共通の子要素</td>
<td>
必須: <a href="#ID">ID</a>、<a href="#Offers">Offers</a>、<a href="#Title">Title</a><br>
省略可能: <a href="#AdultProduct">AdultProduct</a>（廃止）、<a href="#Color">Color</a>、<a href="#ContentRatings">ContentRatings</a>、<a href="#JP_Require18PlusAgeConfirmation">JP_Require18PlusAgeConfirmation</a>、<a href="#Copyright">Copyright</a>、<a href="#Credits">Credits</a>、<a href="#CustomerRating">CustomerRating</a>、<a href="#ExternalID">ExternalID</a>、<a href="#Genres">Genres</a>、<a href="#ImageUrl">ImageUrl</a>、<a href="#Language">Language</a>、<a href="#Rank">Rank</a>、<a href="#ReleaseInfo">ReleaseInfo</a>（廃止）、<a href="#ShortDescription">ShortDescription</a>、<a href="#ReleaseYear">ReleaseYear</a>、<a href="#RuntimeMinutes">RuntimeMinutes</a>、<a href="#Source">Source</a>、<a href="#Studios">Studios</a>、<a href="#Synopsis">Synopsis</a>
</td>
</tr>
<tr>
<td>MiniSeries に固有の子要素</td>
<td>
<a href="#ReleaseDate">ReleaseDate</a>（省略可能）
</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre><strong>&lt;MiniSeries&gt;</strong>
&lt;ID&gt;MS-2329880&lt;/ID&gt;
&lt;Title locale="en-US"&gt;All the Best People&lt;/Title&gt;
&lt;Offers&gt;
&lt;SubscriptionOffer&gt;
&lt;Regions&gt;
&lt;Country&gt;US&lt;/Country&gt;
&lt;/Regions&gt;
&lt;/SubscriptionOffer&gt;
&lt;/Offers&gt;
&lt;ReleaseDate&gt;2005-04-29T20:00:00&lt;/ReleaseDate&gt;
<strong>&lt;/MiniSeries&gt;</strong></pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="MiniSeriesEpisode"></a>
<h3>MiniSeriesEpisode</h3>
<p>MiniSeriesEpisode は基本的な作品タイプの 1 つで、MiniSeries 内の単一のエピソードを表します。このコンテンツはシーズンには関連付けられず、MiniSeries のコンテキストで順序が決定されます。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.3</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Catalog">Catalog</a>
</td>
</tr>
<tr>
<td>全作品タイプ共通の子要素</td>
<td>
必須: <a href="#ID">ID</a>、<a href="#Offers">Offers</a>、<a href="#Title">Title</a><br>
省略可能: <a href="#AdultProduct">AdultProduct</a>（廃止）、<a href="#Color">Color</a>、<a href="#ContentRatings">ContentRatings</a>、<a href="#JP_Require18PlusAgeConfirmation">JP_Require18PlusAgeConfirmation</a>、<a href="#Copyright">Copyright</a>、<a href="#Credits">Credits</a>、<a href="#CustomerRating">CustomerRating</a>、<a href="#ExternalID">ExternalID</a>、<a href="#Genres">Genres</a>、<a href="#ImageUrl">ImageUrl</a>、<a href="#Language">Language</a>、<a href="#Rank">Rank</a>、<a href="#ReleaseInfo">ReleaseInfo</a>（廃止）、<a href="#ShortDescription">ShortDescription</a>、<a href="#ReleaseYear">ReleaseYear</a>、<a href="#RuntimeMinutes">RuntimeMinutes</a>、<a href="#Source">Source</a>、<a href="#Studios">Studios</a>、<a href="#Synopsis">Synopsis</a>
</td>
</tr>
<tr>
<td>MiniSeriesEpisode に固有の子要素</td>
<td>
必須: <a href="#EpisodeInSeries">EpisodeInSeries</a><br>
必須: <a href="#MiniSeriesID">MiniSeriesID</a> と <a href="#MiniSeriesTitle">MiniSeriesTitle</a> のどちらか一方（両方は不可）<br>
省略可能: <a href="#OriginalAirDate">OriginalAirDate</a>
</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;MiniSeries&gt;
&lt;ID&gt;MS-123456789&lt;/ID&gt;
...
&lt;/MiniSeries&gt;
<strong>&lt;MiniSeriesEpisode&gt;</strong>
&lt;ID&gt;MSE-2329880&lt;/ID&gt;
&lt;Title locale="en-US"&gt;The First Steps on a New Planet&lt;/Title&gt;
&lt;Offers&gt;
&lt;SubscriptionOffer&gt;
&lt;Regions&gt;
&lt;Country&gt;US&lt;/Country&gt;
&lt;/Regions&gt;
&lt;/SubscriptionOffer&gt;
&lt;/Offers&gt;
&lt;MiniSeriesID&gt;MS-123456789&lt;/MiniSeriesID&gt;
&lt;EpisodeInSeries&gt;1&lt;/EpisodeInSeries&gt;
&lt;OriginalAirDate&gt;2012-07-02T20:00:00&lt;/OriginalAirDate&gt;
<strong>&lt;/MiniSeriesEpisode&gt;</strong></pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="MiniSeriesID"></a>
<h3>MiniSeriesID</h3>
<p>エピソードの従属先となっているミニシリーズを指定するための要素です。この <a href="#ID">ID</a> の <a href="#MiniSeries">MiniSeries</a> が、この MiniSeriesEpisode と同じカタログに存在していることが必要です。ミニシリーズの指定には MiniSeriesID または <a href="#MiniSeriesTitle">MiniSeriesTitle</a> を適宜選んで使用できますが、両方を使用することはできません。カタログにミニシリーズが存在する場合は、必ず MiniSeriesID を使用してください。ミニシリーズがカタログに存在しない場合は、使用する MiniSeries 項目を作成するようお勧めします。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>MiniSeriesTitle 要素が存在しない場合は必須</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.3</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;MiniSeries&gt;
&lt;ID&gt;MS-2329880&lt;/ID&gt;
...
&lt;/MiniSeries&gt;
&lt;/MiniSeriesEpisode&gt;
...
<strong>&lt;MiniSeriesID&gt;MS-2329880&lt;/MiniSeriesID&gt;</strong>
&lt;EpisodeInSeries&gt;3&lt;/EpisodeInSeries&gt;
&lt;/MiniSeriesEpisode&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="MiniSeriesTitle"></a>
<h3>MiniSeriesTitle</h3>
<p>ミニシリーズがカタログに含まれていない場合にエピソードの従属先となるミニシリーズを指定します。MiniSeriesTitle は、UI に使用されるだけの文字列であり、カタログ内の既存のタイトルと一致している必要はありません。ミニシリーズの指定には <a href="#MiniSeriesID">MiniSeriesID</a> または MiniSeriesTitle を適宜選んで使用できますが、両方を使用することはできません。ごくまれなケースではありますが、MiniSeriesTitle は、MiniSeriesID が存在しない場合に<em>のみ</em>使用してください。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>MiniSeriesID 要素が存在しない場合は必須</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.3</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;/MiniSeriesEpisode&gt;
...
<strong>&lt;MiniSeriesTitle&gt;Cats, The Most Beautiful Creature&lt;/MiniSeriesTitle&gt;</strong>
&lt;EpisodeInSeries&gt;3&lt;/EpisodeInSeries&gt;
&lt;/MiniSeriesEpisode&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Movie"></a>
<h3>Movie</h3>
<p>Movie は基本的な作品タイプの 1 つです。短編映画に使用することもできますが、通常は長編映画を表します。作品は劇場向けの映画でも、テレビ用に作られた映画でもかまいません。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Catalog">Catalog</a>
</td>
</tr>
<tr>
<td>全作品タイプ共通の子要素</td>
<td>
必須: <a href="#ID">ID</a>、<a href="#Offers">Offers</a>、<a href="#Title">Title</a><br>
省略可能: <a href="#AdultProduct">AdultProduct</a>（廃止）、<a href="#Color">Color</a>、<a href="#ContentRatings">ContentRatings</a>、<a href="#JP_Require18PlusAgeConfirmation">JP_Require18PlusAgeConfirmation</a>、<a href="#Copyright">Copyright</a>、<a href="#Credits">Credits</a>、<a href="#CustomerRating">CustomerRating</a>、<a href="#ExternalID">ExternalID</a>、<a href="#Genres">Genres</a>、<a href="#ImageUrl">ImageUrl</a>、<br>
<a href="#Language">Language</a>、<a href="#Rank">Rank</a>、<a href="#ReleaseInfo">ReleaseInfo</a>（廃止）、<a href="#ShortDescription">ShortDescription</a>、<a href="#ReleaseYear">ReleaseYear</a>、<a href="#RuntimeMinutes">RuntimeMinutes</a>、<a href="#Source">Source</a>、<a href="#Studios">Studios</a>、<a href="#Synopsis">Synopsis</a>
</td>
</tr>
<tr>
<td>Movie に固有の子要素</td>
<td>
<a href="#ReleaseDate">ReleaseDate</a>（省略可能）
</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre><strong>&lt;Movie&gt;</strong>
&lt;ID&gt;MV-123456&lt;/ID&gt;
&lt;Title locale="en-US"&gt;Chase the Prawns&lt;/Title&gt;
&lt;Offers&gt;
&lt;SubscriptionOffer&gt;
&lt;Regions&gt;
&lt;Country&gt;US&lt;/Country&gt;
&lt;/Regions&gt;
&lt;/SubscriptionOffer&gt;
&lt;/Offers&gt;
&lt;ReleaseDate&gt;2013-10-04T00:00:00&lt;/ReleaseDate&gt;
<strong>&lt;/Movie&gt;</strong></pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Name"></a>
<h3>Name</h3>
<p>作品のキャストメンバーまたはクルーメンバーの名前。キャストメンバーの場合、これは役柄の名前ではなく、その俳優の名前となります。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>CastMember 要素または CrewMember 要素で必須</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#CastMember">CastMember</a>、<a href="#CrewMember">CrewMember</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>
<table class="auto-width">
<tbody>
<tr>
<th width="20%">属性</th>
<th width="20%">許容される値</th>
<th>説明</th>
</tr>
<tr>
<td>locale</td>
<td>標準の XML/HTML 言語コード（en、en-US、fr、fr-FR など）</td>
<td><strong>必須</strong>。この文字列を使用する端末またはソフトウェアの言語設定。</td>
</tr>
<tr>
<td>pronunciation</td>
<td>文字列</td>
<td><strong>省略可能</strong>。要素のテキストが漢字で表記される場合に使用されます。日本語のソート順は、文字ではなく発音（漢字からは特定不可能）に基づいて決まります。その情報を与えるのが <em>pronunciation</em> 属性です。通常ひらがなが使用されます。</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;CastMember&gt;
<strong>&lt;Name locale="en-US"&gt;Alan Smithee&lt;/Name&gt;</strong>
...
&lt;/CastMember&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Offers"></a>
<h3>Offers</h3>
<p>視聴者が特定の作品を再生できる方法（無料、サービスの登録、レンタル、購入のいずれか）を表します。指定できる Offers 要素は作品タイプごとに 1 つで、その Offers 要素に少なくとも 1 つの視聴方法タイプを追加する必要があります。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>必須</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Movie">Movie</a>、<a href="#TvShow">TvShow</a>、<a href="#TvSeason">TvSeason</a>、<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSpecial">TvSpecial</a>、<a href="#MiniSeries">MiniSeries</a>、<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>、<a href="#Extra">Extra</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>
<a href="#SubscriptionOffer">SubscriptionOffer</a>（省略可能）、<a href="#FreeOffer">FreeOffer</a>（省略可能）、<a href="#PurchaseOffer">PurchaseOffer</a>（省略可能）、<a href="#RentalOffer">RentalOffer</a>（省略可能）
</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre><strong>&lt;Offers&gt;</strong>
&lt;FreeOffer&gt;
&lt;Regions&gt;
&lt;Country&gt;CA&lt;/Country&gt;
&lt;/Regions&gt;
&lt;WindowStart&gt;2014-02-06T12:00:00-07:00&lt;/WindowStart&gt;
&lt;WindowEnd&gt;2016-01-01T07:00:00-07:00&lt;/WindowEnd&gt;
&lt;LaunchDetails&gt;
&lt;Quality&gt;SD&lt;/Quality&gt;
&lt;/LaunchDetails&gt;
&lt;/FreeOffer&gt;
&lt;SubscriptionOffer&gt;
&lt;Regions&gt;
&lt;Country&gt;CA&lt;/Country&gt;
&lt;/Regions&gt;
&lt;LaunchDetails&gt;
&lt;Quality&gt;HD&lt;/Quality&gt;
&lt;/LaunchDetails&gt;
&lt;/SubscriptionOffer&gt;
<strong>&lt;/Offers&gt;</strong></pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="OriginalAirDate"></a>
<h3>OriginalAirDate</h3>
<p>作品が最初にテレビで放送された日時。省略可能な要素である ReleaseYear が存在する場合、この値の年部分が <a href="#ReleaseYear">ReleaseYear</a> と一致している必要があります。この情報は、この作品を他のカタログ内のコンテンツと比較する目的で使用することができます。コンテンツをマッチングすることで、1 つの作品に対し、視聴可能なすべての提供元を示した単一のリストを表示することができます。同じ作品に対して複数の検索結果を表示せずに済みます。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.3</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSpecial">TvSpecial</a>、<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>許容される値</td>
<td>XML の <em>dateTime</em> 値。この値の形式は YYYY-MM-DDThh:mm:ss です。YYYY-MM-DD は年、月、日を、hh:mm:ss は時、分、秒を表します。"T" はその 2 つの区切りとなります。年から秒までの値全体を指定する必要があります。時刻値がわからない場合は単に 00:00:00 としてください。UTC とのオフセットを値の最後に追加して特定のタイムゾーンを示すこともできます。</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;TvSpecial&gt;
...
<strong>&lt;OriginalAirDate&gt;2012-05-13T00:00:00&lt;/OriginalAirDate&gt;</strong>
&lt;/TvSpecial&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Partner"></a>
<h3>Partner</h3>
<p>このカタログの提供者を識別します。決められた形式はありませんが、人が判読できる形式にするようお勧めします。たとえば、Amazon アプリストアに表示されるアプリの名前がこの用途に適しています。提供者のフルネームを使用することもできます。個々のカタログファイルには、Partner 要素が 1つ存在している必要があります。</p>
<table class="auto-width">
<tbody>
<tr span="2">
<td><strong>必須</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#catalog">Catalog</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;Catalog xmlns="http://www.amazon.com/FireTv/2014-04-11/ingestion" version="FireTv-v1.3"&gt;
<strong>&lt;Partner&gt;Everything Ever Made Filmworks&lt;/Partner&gt;</strong>
...
&lt;Catalog&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Price"></a>
<h3>Price</h3>
<p>作品のレンタルまたは購入にかかる費用。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>PurchaseOffer と RentalOffer で必須</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#PurchaseOffer">PurchaseOffer</a>、<a href="#RentalOffer">RentalOffer</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>
<table class="auto-width">
<tbody>
<tr>
<th width="20%">属性</th>
<th width="20%">許容される値</th>
<th>説明</th>
</tr>
<tr>
<td>currency</td>
<td>USD<br>
GBP<br>
JPY<br>
EUR</td>
<td><strong>必須</strong>。価格の通貨。指定できる通貨は、視聴方法タイプごとに 1 つだけです（ドル、ポンド、円、ユーロのいずれか）。</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;PurchaseOffer&gt;
&lt;Regions&gt;
&lt;Country&gt;US&lt;/Country&gt;
&lt;/Regions&gt;
<strong>&lt;Price currency="USD"&gt;1.99&lt;/Price&gt;</strong>
&lt;/PurchaseOffer&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="PurchaseOffer"></a>
<h3>PurchaseOffer</h3>
<p>4 つある視聴方法タイプの 1 つ。この視聴方法では、作品を購入することができます。1 回限りの支払いで作品を所有し、いつでも視聴することができます。必要に応じて、Offers に複数の PurchaseOffer 要素を追加することができます。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能（ただし、Offers には少なくとも 1 つの視聴方法タイプが必要）</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Offers">Offers</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>
必須: <a href="#Regions">Regions</a>、<a href="#Price">Price</a><br>
省略可能: <a href="#LaunchDetails">LaunchDetails</a>、<a href="#Quality">Quality</a>（廃止）、<a href="#WindowStart">WindowStart</a>、<a href="#WindowEnd">WindowEnd</a>
</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre><strong>&lt;PurchaseOffer&gt;</strong>
&lt;Regions&gt;
&lt;Country&gt;US&lt;/Country&gt;
&lt;/Regions&gt;
&lt;LaunchDetails&gt;
&lt;Quality&gt;HD&lt;/Quality&gt;
&lt;AudioLanguage&gt;en-US&lt;/AudioLanguage&gt;
&lt;Subtitle&gt;fr&lt;/Subtitle&gt;
&lt;Subtitle&gt;es&lt;/Subtitle&gt;
&lt;/LaunchDetails&gt;
&lt;Price currency="USD"&gt;1.99&lt;/Price&gt;
<strong>&lt;/PurchaseOffer&gt;</strong></pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Quality"></a>
<h3>Quality</h3>
<p>作品の画質を表します。標準解像度（SD）、高解像度（HD）、超高解像度（UHD）があります。1 つの作品を複数の画質オプションで提供することができます。</p>
<p><strong>注意</strong>: Quality という名前の要素は 2 つ存在します。1 つ目は各視聴方法タイプの直接の子で、これは CDF v1.2 で廃止されました。もう 1 つは LaunchDetails の子で、各視聴方法タイプの孫となります。ここで取り上げるのは、新しい（廃止ではない）方の Quality 要素についてのみです。ただし両者には、親要素以外、形式と内容に違いはありません。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.2</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#LaunchDetails">LaunchDetails</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>許容される値</td>
<td>SD<br>
HD<br>
UHD</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;FreeOffer&gt;
&lt;Regions&gt;
&lt;Country&gt;US&lt;/Country&gt;
&lt;/Regions&gt;
&lt;LaunchDetails&gt;
<strong>&lt;Quality&gt;HD&lt;/Quality&gt;
&lt;Quality&gt;UHD&lt;/Quality&gt;</strong>
&lt;/LaunchDetails&gt;
&lt;/FreeOffer&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Rank"></a>
<h3>Rank</h3>
<p>カタログ内の他のアイテムに対する相対的な数値で人気を示したスコアです。最高ランクは 1 として定義されます。ランキングの決め方は自由です。複数のアイテムに同じランクを割り当ててもかまいません。1 つの作品に割り当てることのできる Rank 要素は 1 つだけです。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Movie">Movie</a>、<a href="#TvShow">TvShow</a>、<a href="#TvSeason">TvSeason</a>、<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSpecial">TvSpecial</a>、<a href="#MiniSeries">MiniSeries</a>、<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>、<a href="#Extra">Extra</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;TvShow&gt;
...
<strong>&lt;Rank&gt;36&lt;/Rank&gt;</strong>
...
&lt;/TvShow&gt;
</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Regions"></a>
<h3>Regions</h3>
<p>特定の視聴方法が利用できる国を表します。指定できる Regions 要素は各視聴方法タイプにつき 1 つだけです。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>必須</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#SubscriptionOffer">SubscriptionOffer</a>、<a href="#FreeOffer">FreeOffer</a>、<a href="#PurchaseOffer">PurchaseOffer</a>、<a href="#RentalOffer">RentalOffer</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>
<a href="#Country">Country</a>（少なくとも 1 つは必要）
</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;FreeOffer&gt;
<strong>&lt;Regions&gt;</strong>
&lt;Country&gt;US&lt;/Country&gt;
&lt;Country&gt;CA&lt;/Country&gt;
&lt;Country&gt;MX&lt;/Country&gt;
<strong>&lt;/Regions&gt;</strong>
&lt;/FreeOffer&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="RelatesToExternalID"></a>
<h3>RelatesToExternalID</h3>
<p>Extra（映画のトレーラーなど）が関連付けられている他の作品（そのトレーラーの本編となる映画など）を指定する目的で使用します。外部ソース（IMDb など）の分類に基づく他の作品（映画など）を判別するための識別子は、RelatesToExternalID で指定します。RelatesToExternalID は、関連付けられている作品が同じカタログに存在しない場合に使用します。関連付けの指定には <a href="#RelatesToID">RelatesToID</a> または RelatesToExternalID を適宜選んで使用できますが、両方を使用することはできません。RelatesToExternalID は、RelatesToID が存在しない場合に<em>のみ</em>使用してください。</p>
<p>RelatesToExternalID と <a href="#ExternalID">ExternalID</a> を混同しないでください。ExternalID は Extra そのものを指すのに対し、RelatesToExternalID は Extra に関連付けられている作品を指します。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.3</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Extra">Extra</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>
<table class="auto-width">
<tbody>
<tr>
<th width="15%">属性</th>
<th width="25%">説明</th>
<th>許容される値</th>
</tr>
<tr>
<td>scheme</td>
<td><strong>必須</strong>。この ID の提供元となった外部ソース。</td>
<td>imdb<br>
tms<br>
isan<br>
ean<br>
upc</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td>コメント</td>
<td colspan="3">
各ソースの値を次に示します。
<table class="auto-width">
<tbody>
<tr>
<th>値</th>
<th>説明</th>
</tr>
<tr>
<td>imdb</td>
<td>Internet Movie Database（IMDb）。ID は、特定のページの URL の構成要素として存在します。</td>
</tr>
<tr>
<td>tms</td>
<td>Gracenote™ データベースで使用されている ID。</td>
</tr>
<tr>
<td>isan</td>
<td>International Standard Audiovisual Number（ISAN）。26 文字の英数字。通常、ダッシュ区切りで表示されます。</td>
</tr>
<tr>
<td>ean</td>
<td>International Article Number（EAN）。通常 13 桁で表されるバーコード。</td>
</tr>
<tr>
<td>upc</td>
<td>Universal Product Code（UPC）。通常 12 桁で表されるバーコード。</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;Extra&gt;
...
&lt;Type&gt;trailer&lt;/Type&gt;
<strong>&lt;RelatesToExternalID scheme="imdb"&gt;tt0000000&lt;/RelatesToExternalID&gt;
&lt;RelatesToExternalID scheme="tms"&gt;MV000000000000&lt;/RelatesToExternalID&gt;
&lt;RelatesToExternalID scheme="isan"&gt;0000-0000-0F00-0000-X-0000-0000-Y&lt;/RelatesToExternalID&gt;
&lt;RelatesToExternalID scheme="ean"&gt;0011559514120&lt;/RelatesToExternalID&gt;
&lt;RelatesToExternalID scheme="upc"&gt;123456789990&lt;/RelatesToExternalID&gt;</strong>
&lt;/Extra&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="RelatesToID"></a>
<h3>RelatesToID</h3>
<p>Extra（映画のトレーラーなど）が関連付けられている他の作品（そのトレーラーの本編となる映画など）を指定する目的で使用します。この <a href="#ID">ID</a> の作品が、この Extra と同じカタログに存在していることが必要です。関連付ける作品の指定には RelatesToID または <a href="#RelatesToExternalID">&lt;RelatesToExternalID&gt;</a> を適宜選んで使用できますが、両方を使用することはできません。関連付ける作品がカタログに存在する場合は、必ず RelatesToID を使用してください。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.3</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Extra">Extra</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;TvShow&gt;
&lt;ID&gt;TV123456&lt;/ID&gt;
...
&lt;/TvShow&gt;
&lt;Extra&gt;
...
&lt;Type&gt;trailer&lt;/Type&gt;
<strong>&lt;RelatesToID&gt;TV123456&lt;/RelatesToID&gt;</strong>
&lt;/Extra&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="ReleaseCountry"></a>
<h3>ReleaseCountry（廃止）</h3>
<p><strong>廃止されました。使用しないでください。</strong>この要素には代わりとなる要素がありません。</p>
<p>その作品が最初にリリースされた国。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>廃止</td>
<td>CDF バージョン 1.3</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#ReleaseInfo">ReleaseInfo</a>（廃止）
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>許容される値</td>
<td>
次に示す <a href="http://www.iso.org/iso/country_codes.htm">ISO 3166 国コード</a>のサブセットを使用できます。<br>
AF AX AL DZ AS AD AO AI AQ AG AR AM AW AU AT AZ BS BH BD BB BY BE BZ BJ BM BT BO BQ BA BW BV BR IO BN BG BF BI KH CM CA CV KY CF TD CL CN CX CC CO KM CG CD CK CR CI HR CU CW CY CZ DK DJ DM DO EC EG SV GQ ER EE ET FK FO FJ FI FR GF PF TF GA GM GE DE GH GI GR GL GD GP GU GT GG GN GW GY HT HM VA HN HK HU IS IN ID IR IQ IE IM IL IT JM JP JE JO KZ KE KI KP KR KW KG LA LV LB LS LR LY LI LT LU MO MK MG MW MY MV ML MT MH MQ MR MU YT MX FM MD MC MN ME MS MA MZ MM NA NR NP NL NC NZ NI NE NG NU NF MP NO OM PK PW PS PA PG PY PE PH PN PL PT PR QA RE RO RU RW BL SH KN LC MF PM VC WS SM ST SA SN RS SC SL SG SX SK SI SB SO ZA GS SS ES LK SD SR SJ SZ SE CH SY TW TJ TZ TH TL TG TK TO TT TN TR TM TC TV UG UA AE GB US UM UY UZ VU VE VN VG VI WF EH YE ZM ZW
</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;TvEpisode&gt;
...
&lt;ReleaseInfo&gt;
&lt;ReleaseDate&gt;2002-02-20&lt;/ReleaseDate&gt;
<strong>&lt;ReleaseCountry&gt;BT&lt;/ReleaseCountry&gt;</strong>
&lt;/ReleaseInfo&gt;
...
&lt;/TvEpisode&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="ReleaseDate"></a>
<h3>ReleaseDate</h3>
<p>作品が最初に一般公開された日時。テレビの場合は初回放映日。省略可能な要素である ReleaseYear が存在する場合、この値の年部分が <a href="#ReleaseYear">ReleaseYear</a> と一致している必要があります。この情報は特に、この作品を他のカタログ内のコンテンツと比較する目的で使用することができます。コンテンツをマッチングすることで、1 つの作品に対し、視聴可能なすべての提供元を示した単一のリストを表示することができます。同じ作品に対して複数の検索結果を表示せずに済みます。</p>
<p><strong>注意</strong>: 同じ名前の廃止になった要素については、「<a href="#ReleaseDateDep">ReleaseDate（廃止）</a>」を参照してください。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.3</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Movie">Movie</a>、<a href="#TvShow">TvShow</a>、<a href="#MiniSeries">MiniSeries</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>許容される値</td>
<td>XML の <em>dateTime</em> 値。この値の形式は YYYY-MM-DDThh:mm:ss です。YYYY-MM-DD は年、月、日を、hh:mm:ss は時、分、秒を表します。"T" はその 2 つの区切りとなります。年から秒までの値全体を指定する必要があります。時刻値がわからない場合は単に 00:00:00 としてください。UTC とのオフセットを値の最後に追加して特定のタイムゾーンを示すこともできます。</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;TvShow&gt;
...
<strong>&lt;ReleaseDate&gt;2012-05-13T00:00:00&lt;/ReleaseDate&gt;</strong>
&lt;/TvShow&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="ReleaseDateDep"></a>
<h3>ReleaseDate（廃止）</h3>
<p><strong>廃止されました。使用しないでください</strong>。<a href="#ReleaseDate">ReleaseDate</a>（名前は同じですが、位置とデータ型が異なります）または <a href="#OriginalAirDate">OriginalAirDate</a> を代わりに使用します。</p>
<p>作品が最初に一般公開された日付。テレビの場合は初回放映日。省略可能な要素である ReleaseYear が存在する場合、この値の年部分が <a href="#ReleaseYear">ReleaseYear</a> と一致している必要があります。この情報は特に、この作品を他のカタログ内のコンテンツと比較する目的で使用することができます。コンテンツをマッチングすることで、1 つの作品に対し、視聴可能なすべての提供元を示した単一のリストを表示することができます。同じ作品に対して複数の検索結果を表示せずに済みます。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>ReleaseInfo で必須</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>廃止</td>
<td>CDF バージョン 1.3</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#ReleaseInfo">ReleaseInfo</a>（廃止）
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>許容される値</td>
<td>XML の <em>date</em> 値。この値の形式は YYYY-MM-DD（年、月、日）です。</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;TvShow&gt;
...
&lt;ReleaseInfo&gt;
<strong>&lt;ReleaseDate&gt;2012-05-13&lt;/ReleaseDate&gt;</strong>
&lt;/ReleaseInfo&gt;
&lt;/TvShow&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="ReleaseInfo"></a>
<h3>ReleaseInfo（廃止）</h3>
<p><strong>廃止されました。使用しないでください</strong>。リリース日の情報については、作品タイプに応じた <a href="#ReleaseDate">ReleaseDate</a> または <a href="#OriginalAirDate">OriginalAirDate</a> を使用してください。今後 ReleaseCountry の情報は使用されません。</p>
<p>作品のリリース先となる国とリリース日を指定する要素が格納されます。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Movie">Movie</a>、<a href="#TvShow">TvShow</a>、<a href="#TvSeason">TvSeason</a>、<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSpecial">TvSpecial</a>、<a href="#MiniSeries">MiniSeries</a>、<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>、<a href="#Extra">Extra</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>
<a href="#ReleaseDateDep">ReleaseDate</a>（必須、廃止）、<a href="#ReleaseCountry">ReleaseCountry</a>（省略可能、廃止）
</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;TvEpisode&gt;
...
<strong>&lt;ReleaseInfo&gt;</strong>
&lt;ReleaseDate&gt;2002-02-20&lt;/ReleaseDate&gt;
&lt;ReleaseCountry&gt;BT&lt;/ReleaseCountry&gt;
<strong>&lt;/ReleaseInfo&gt;</strong>
...
&lt;/TvEpisode&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="ReleaseYear"></a>
<h3>ReleaseYear</h3>
<p>作品が最初に一般公開された年。テレビの場合は初回放映年。この値は、同じ作品の <a href="#ReleaseDate">ReleaseDate</a> または <a href="#OriginalAirDate">OriginalAirDate</a> 要素に指定されている年と一致している必要があります。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能（ただし指定することを強く推奨）</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Movie">Movie</a>、<a href="#TvShow">TvShow</a>、<a href="#TvSeason">TvSeason</a>、<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSpecial">TvSpecial</a>、<a href="#MiniSeries">MiniSeries</a>、<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>、<a href="#Extra">Extra</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>コメント</td>
<td>この要素は省略することもできますが、指定することを推奨します。複数の提供者から同じ作品が提出された場合、Amazon でマッチングを行い、そのすべての提供作品を 1 つの検索結果にまとめることで、検索に対する顧客満足度を高めていますが、この値は、そのマッチング作業で特に重要となります。最終的にはそのことが、視聴者に提供する特定の作品の見つけやすさにつながってきます。</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;TvEpisode&gt;
...
<strong>&lt;ReleaseYear&gt;1959&lt;/Releaseyear&gt;</strong>
...
&lt;/TvEpisode&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="RentalOffer"></a>
<h3>RentalOffer</h3>
<p>4 つある視聴方法タイプの 1 つ。この視聴方法では、1 回の支払いで限られた期間、作品を視聴することができます。必要に応じて、Offers に複数の RentalOffer 要素を追加することができます。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能（ただし、Offers には少なくとも 1 つの視聴方法タイプが必要）</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Offers">Offers</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>
必須: <a href="#Regions">Regions</a>、<a href="#Price">Price</a>、<a href="#Duration">Duration</a><br>
省略可能: <a href="#LaunchDetails">LaunchDetails</a>、<a href="#Quality">Quality</a>（廃止）、<a href="#WindowStart">WindowStart</a>、<a href="#WindowEnd">WindowEnd</a>
</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre><strong>&lt;RentalOffer&gt;</strong>
&lt;Regions&gt;
&lt;Country&gt;US&lt;/Country&gt;
&lt;/Regions&gt;
&lt;LaunchDetails&gt;
&lt;Quality&gt;HD&lt;/Quality&gt;
&lt;AudioLanguage&gt;en-US&lt;/AudioLanguage&gt;
&lt;Subtitle&gt;fr&lt;/Subtitle&gt;
&lt;Subtitle&gt;es&lt;/Subtitle&gt;
&lt;/LaunchDetails&gt;
&lt;Price currency="USD"&gt;1.99&lt;/Price&gt;
&lt;Duration&gt;120&lt;/Duration&gt;
<strong>&lt;/RentalOffer&gt;</strong></pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Role"></a>
<h3>Role</h3>
<p>作品の中で CastMember が演じる役柄の名前。たとえば、ロビン・フッド、湖のランスロ、アテナ、セルフを指定します。この値に "actor"（CastMember 項目はすべて役者）や "unknown" は使用しないでください。一人で複数の役柄を演じている場合、CastMember 要素に複数の Role 要素を追加できます。<br></p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#CastMember">CastMember</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>
<table class="auto-width">
<tbody>
<tr>
<th width="20%">属性</th>
<th width="20%">許容される値</th>
<th>説明</th>
</tr>
<tr>
<td>locale</td>
<td>標準の XML/HTML 言語コード（en、en-US、fr、fr-FR など）</td>
<td><strong>必須</strong>。この文字列を使用する端末またはソフトウェアの言語設定。</td>
</tr>
<tr>
<td>pronunciation</td>
<td>文字列</td>
<td><strong>省略可能</strong>。要素のテキストが漢字で表記される場合に使用されます。日本語のソート順は、文字ではなく発音（漢字からは特定不可能）に基づいて決まります。その情報を与えるのが <em>pronunciation</em> 属性です。通常ひらがなが使用されます。</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;Credits&gt;
&lt;CastMember&gt;
&lt;Name locale="en-US"&gt;Alan Smithee&lt;/Name&gt;
&lt;ExternalID scheme="imdb"&gt;tt0000000&lt;/ExternalID&gt;
<strong>&lt;Role locale="en-US"&gt;Robin Hood&lt;/Role&gt;
&lt;Role locale="en-US"&gt;Self&lt;/Role&gt;</strong>
&lt;/CastMember&gt;
&lt;/Credits&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="RuntimeMinutes"></a>
<h3>RuntimeMinutes</h3>
<p>コンテンツ全体の実行時間（分）。負数は指定できません。また、2880 よりも小さい値である必要があります。よほどの理由がないかぎり、2880 を超えるケースはありません。指定できる RuntimeMinutes 要素は各作品につき 1 つだけです。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Movie">Movie</a>、<a href="#TvShow">TvShow</a>、<a href="#TvSeason">TvSeason</a>、<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSpecial">TvSpecial</a>、<a href="#MiniSeries">MiniSeries</a>、<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>、<a href="#Extra">Extra</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;TvEpisode&gt;
...
<strong>&lt;RuntimeMinutes&gt;37&lt;/RuntimeMinutes&gt;</strong>
...
&lt;/TvEpisode&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Score"></a>
<h3>Score</h3>
<p>視聴者のフィードバックに基づく作品の平均スコア（評価）。この値の収集方法は自由です。レーティングシステムの尺度となる <a href="#MaxValue">MaxValue</a> に応じて決めてください。Score に寄与した投票の数を表す <a href="#Count">Count</a>（省略可能）を追加することもできます。CustomerRating に指定できる Score は 1 つだけです。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>CustomerRating で必須</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#CustomerRating">CustomerRating</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;CustomerRating&gt;
<strong>&lt;Score&gt;8.2&lt;/Score&gt;</strong>
&lt;MaxValue&gt;10&lt;/MaxValue&gt;
&lt;Count&gt;512&lt;/Count&gt;
&lt;/CustomerRating&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="SeasonID"></a>
<h3>SeasonID</h3>
<p>TVEpisode の従属先となるシーズンの ID。この <a href="#ID">ID</a> の <a href="#TVSeason">TVSeason</a> が、この TvEpisode と同じカタログに存在していることが必要です。シーズンの指定には SeasonID または <a href="#SeasonInShow">SeasonInShow</a> を適宜選んで使用できますが、両方を使用することはできません。該当するシーズンがカタログに存在する場合は、必ず SeasonID を使用してください。カタログに存在しない場合は、TvSeason 項目の作成を検討してください。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>SeasonInShow 要素が存在しない場合は必須</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#TvEpisode">TvEpisode</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;TvSeason&gt;
&lt;ID&gt;SEA-2329880&lt;/ID&gt;
...
&lt;/TvSeason&gt;
&lt;TvEpisode&gt;
...
<strong>&lt;SeasonID&gt;SEA-2329880&lt;/SeasonID&gt;</strong>
...
&lt;/TvEpisode&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="SeasonInShow"></a>
<h3>SeasonInShow</h3>
<p>TVEpisode の従属先シーズンの番号。従属先シーズンがカタログに存在しない場合に使用されます。SeasonInShow は単に UI で使用される番号であり、何かと一致している必要はありません。シーズンの指定には <a href="#SeasonID">SeasonID</a> または SeasonInShow を適宜選んで使用できますが、両方を使用することはできません。ごくまれなケースではありますが、SeasonInShow は、SeasonID が存在しない場合に<em>のみ</em>使用してください。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>SeasonID 要素が存在しない場合は必須</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#TvEpisode">TvEpisode</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;TvEpisode&gt;
...
<strong>&lt;SeasonInShow&gt;2&lt;/SeasonInShow&gt;</strong>
...
&lt;/TvEpisode&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="SeasonTitle"></a>
<h3>SeasonTitle</h3>
<p>TvEpisode が従属するシーズンのタイトル（"Season 2" など）。対応する TvSeason 要素がカタログに含まれている場合、必ずしもこの値をその <a href="#Title">Title</a> と一致させる必要はありません。指定できる SeasonTitle 要素は各 TvEpisode につき 1 つだけです。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#TvEpisode">TvEpisode</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>
<table class="auto-width">
<tbody>
<tr>
<th width="20%">属性</th>
<th width="20%">許容される値</th>
<th>説明</th>
</tr>
<tr>
<td>locale</td>
<td>標準の XML/HTML 言語コード（en、en-US、fr、fr-FR など）</td>
<td><strong>必須</strong>。この文字列を使用する端末またはソフトウェアの言語設定。</td>
</tr>
<tr>
<td>pronunciation</td>
<td>文字列</td>
<td><strong>省略可能</strong>。要素のテキストが漢字で表記される場合に使用されます。日本語のソート順は、文字ではなく発音（漢字からは特定不可能）に基づいて決まります。その情報を与えるのが <em>pronunciation</em> 属性です。通常ひらがなが使用されます。</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;TvEpisode&gt;
...
&lt;SeasonInShow&gt;2&lt;/SeasonInShow&gt;
<strong>&lt;SeasonTitle</strong><strong><strong> locale="en-US"</strong>&gt;Season 2&lt;/SeasonTitle&gt;</strong>
...
&lt;/TvEpisode&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="ShortDescription"></a>
<h3>ShortDescription</h3>
<p>作品の内容についての 2 ～ 3 行の説明。ShortDescription に他の場所で確認できる情報（作品のタイトルなど）は使用しないでください。ローカライズされた説明を提供する目的で 1 つの作品に、複数の ShortDescription 要素を追加することができます。もっと長く詳しい説明を入力するには、<a href="#Synopsis">Synopsis</a> 要素を使用してください。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Movie">Movie</a>、<a href="#TvShow">TvShow</a>、<a href="#TvSeason">TvSeason</a>、<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSpecial">TvSpecial</a>、<a href="#MiniSeries">MiniSeries</a>、<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>、<a href="#Extra">Extra</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>
<table class="auto-width">
<tbody>
<tr>
<th>属性</th>
<th>許容される値</th>
<th>説明</th>
</tr>
<tr>
<td>locale</td>
<td>標準の XML/HTML 言語コード（en、en-US、fr、fr-FR など）</td>
<td><strong>必須</strong>。この文字列を使用する端末またはソフトウェアの言語設定。</td>
</tr>
<tr>
<td>pronunciation</td>
<td>文字列</td>
<td><strong>省略可能</strong>。要素のテキストが漢字で表記される場合に使用されます。日本語のソート順は、文字ではなく発音（漢字からは特定不可能）に基づいて決まります。その情報を与えるのが <em>pronunciation</em> 属性です。通常ひらがなが使用されます。</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;TvSpecial&gt;
...
<strong>&lt;ShortDescription</strong><strong><strong> locale="en-US"</strong>&gt;Alan shows us some trees and sings songs about them.&lt;/ShortDescription&gt;</strong>
...
&lt;/TvSpecial&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="ShowID"></a>
<h3>ShowID</h3>
<p>TvEpisode、TvSeason、または TvSpecial をカタログ内の TvShow に関連付ける目的で使用されます。この値は、TvShow 要素の <a href="#ID">ID</a> 値と一致している必要があります。番組の指定には ShowID または <a href="#ShowTitle">ShowTitle</a> を適宜選んで使用できますが、両方を使用することはできません。カタログに TvShow が存在するときは必ず ShowID を使用してください。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>TvEpisode と TvSeason で ShowTitle が存在しない場合は必須</strong><br>
<strong>TvSpecial では省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#TvSeason">TvSeason</a>、<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSpecial">TvSpecial</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>許容される値</td>
<td><br></td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;TvShow&gt;
&lt;ID&gt;TV-2329880&lt;/ID&gt;
...
&lt;/TvShow&gt;
&lt;TvSeason&gt;
...
<strong>&lt;ShowID&gt;TV-2329880&lt;/ShowID&gt;</strong>
...
&lt;/TvSeason&gt;
&lt;TvEpisode&gt;
...
<strong>&lt;ShowID&gt;TV-2329880&lt;/ShowID&gt;</strong>
...
&lt;/TvEpisode&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="ShowTitle"></a>
<h3>ShowTitle</h3>
<p>TvEpisode、TvSeason、または TvSpecial をカタログ内の TvShow に関連付ける目的で使用されます。この値は、UI に使用されるだけの文字列であり、カタログ内のいずれのタイトルとも一致している必要はありません。番組の指定には <a href="#ShowID">ShowID</a> または ShowTitle を適宜選んで使用できますが、両方を使用することはできません。ShowTitle は、ShowID が存在しない場合に<em>のみ</em>使用してください。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>TvEpisode と TvSeason で ShowID が存在しない場合は必須</strong><br>
<strong>TvSpecial では省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#TvSeason">TvSeason</a>、<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSpecial">TvSpecial</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>
<table class="auto-width">
<tbody>
<tr>
<th>属性</th>
<th>許容される値</th>
<th>説明</th>
</tr>
<tr>
<td>locale</td>
<td>標準の XML/HTML 言語コード（en、en-US、fr、fr-FR など）</td>
<td><strong>必須</strong>。この文字列を使用する端末またはソフトウェアの言語設定。</td>
</tr>
<tr>
<td>pronunciation</td>
<td>文字列</td>
<td><strong>省略可能</strong>。要素のテキストが漢字で表記される場合に使用されます。日本語のソート順は、文字ではなく発音（漢字からは特定不可能）に基づいて決まります。その情報を与えるのが <em>pronunciation</em> 属性です。通常ひらがなが使用されます。</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;TvSeason&gt;
...
<strong>&lt;ShowTitle</strong><strong><strong> locale="en-US"</strong>&gt;Depth of Field&lt;/ShowTitle&gt;</strong>
...
&lt;/TvSeason&gt;
</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Source"></a>
<h3>Source</h3>
<p>作品の提供元。指定できる Source は各作品につき 1 つだけです。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Movie">Movie</a>、<a href="#TvShow">TvShow</a>、<a href="#TvSeason">TvSeason</a>、<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSpecial">TvSpecial</a>、<a href="#MiniSeries">MiniSeries</a>、<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>、<a href="#Extra">Extra</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>許容される値</td>
<td>original<br>
licensed<br>
unknown<br>
other</td>
</tr>
<tr>
<td>コメント</td>
<td colspan="3">
各ソースの値を次に示します。
<table class="auto-width">
<tbody>
<tr>
<th>値</th>
<th>説明</th>
</tr>
<tr>
<td>original</td>
<td>このコンテンツは、このカタログの提供者によって製作・制作されました。</td>
</tr>
<tr>
<td>licensed</td>
<td>このカタログの提供者が第三者から作品のライセンスを取得しました。</td>
</tr>
<tr>
<td>unknown</td>
<td>このコンテンツの提供元は不明です。</td>
</tr>
<tr>
<td>other</td>
<td>作品の提供元は判明していますが、original も licensed も該当しません。</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;MiniSeriesEpisode&gt;
...
<strong>&lt;Source&gt;licensed&lt;/Source&gt;</strong>
...
&lt;/MiniSeriesEpisode&gt;
</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Studio"></a>
<h3>Studio</h3>
<p>作品が製作されたスタジオ。Studio 項目は、1 つの作品に複数割り当てることができます。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>Studios 要素（省略可能）に必須</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Studios">Studios</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;TvEpisode&gt;
...
&lt;Studios&gt;
<strong>&lt;Studio&gt;Amazon Studios&lt;/Studio&gt;</strong>
<strong>&lt;Studio&gt;Another Production Company&lt;/Studio&gt;</strong>
&lt;/Studios&gt;
...
&lt;/TvEpisode&gt;
</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Studios"></a>
<h3>Studios</h3>
<p>作品が製作されたスタジオを識別する Studio 要素が格納されます。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Movie">Movie</a>、<a href="#TvShow">TvShow</a>、<a href="#TvSeason">TvSeason</a>、<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSpecial">TvSpecial</a>、<a href="#MiniSeries">MiniSeries</a>、<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>、<a href="#Extra">Extra</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>
<a href="#Studio">Studio</a>（少なくとも 1 つは必要）
</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;TvEpisode&gt;
...
<strong>&lt;Studios&gt;</strong>
&lt;Studio&gt;Amazon Studios&lt;/Studio&gt;
&lt;Studio&gt;Another Production Company&lt;/Studio&gt;
<strong>&lt;/Studios&gt;</strong>
...
&lt;/TvEpisode&gt;
</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="SubscriptionOffer"></a>
<h3>SubscriptionOffer</h3>
<p>4 つある視聴方法タイプの 1 つ。この視聴方法では、プロバイダーのサービスの会員が作品を視聴できます。必要に応じて、Offers に複数の SubscriptionOffer 要素を追加することができます。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能（ただし、Offers には少なくとも 1 つの視聴方法タイプが必要）</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Offers">Offers</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>
必須: <a href="#Regions">Regions</a><br>
省略可能: <a href="#LaunchDetails">LaunchDetails</a>、<a href="#Quality">Quality</a>（廃止）、<a href="#WindowStart">WindowStart</a>、<a href="#WindowEnd">WindowEnd</a>
</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre><strong>&lt;SubscriptionOffer&gt;</strong>
&lt;Regions&gt;
&lt;Country&gt;US&lt;/Country&gt;
&lt;Country&gt;CA&lt;/Country&gt;
&lt;/Regions&gt;
&lt;WindowStart&gt;2014-02-06T12:00:00-07:00&lt;/WindowStart&gt;
&lt;WindowEnd&gt;2016-01-01T07:00:00-07:00&lt;/WindowEnd&gt;
&lt;LaunchDetails&gt;
&lt;Quality&gt;HD&lt;/Quality&gt;
&lt;AudioLanguage&gt;en-US&lt;/AudioLanguage&gt;
&lt;Subtitle&gt;en-US&lt;/Subtitle&gt;
&lt;Subtitle&gt;fr&lt;/Subtitle&gt;
&lt;Subtitle&gt;es&lt;/Subtitle&gt;
&lt;LaunchId&gt;EXTRA-11113_HD_en-US&lt;/LaunchId&gt;
&lt;/LaunchDetails&gt;
<strong>&lt;/SubscriptionOffer&gt;</strong></pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Subtitle"></a>
<h3>Subtitle</h3>
<p>作品の字幕の言語オプション。字幕オプションは、1 つの作品に複数割り当てることができます。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.2</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#LaunchDetails">LaunchDetails</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>許容される値</td>
<td>標準の XML/HTML 言語コード（en、en-US、fr、fr-FR など）</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;SubscriptionOffer&gt;
&lt;Regions&gt;
&lt;Country&gt;US&lt;/Country&gt;
&lt;/Regions&gt;
&lt;LaunchDetails&gt;
&lt;Quality&gt;HD&lt;/Quality&gt;
&lt;AudioLanguage&gt;en-US&lt;/AudioLanguage&gt;
<strong>&lt;Subtitle&gt;fr&lt;/Subtitle&gt;</strong>
<strong>&lt;Subtitle&gt;es&lt;/Subtitle&gt;</strong>
&lt;/LaunchDetails&gt;
&lt;/SubscriptionOffer&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Synopsis"></a>
<h3>Synopsis</h3>
<p>作品の内容に関する説明。Synopsis は、<a href="#ShortDescription">ShortDescription</a> よりも詳しい情報を提供するための要素です。ShortDescription や作品の <a href="#Title">Title</a> を Synopsis として使用することは避けてください。ローカライズされた説明を提供する目的で 1 つの作品に、複数の Synopsis 要素を追加することができます。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Movie">Movie</a>、<a href="#TvShow">TvShow</a>、<a href="#TvSeason">TvSeason</a>、<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSpecial">TvSpecial</a>、<a href="#MiniSeries">MiniSeries</a>、<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>、<a href="#Extra">Extra</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>
<table class="auto-width">
<tbody>
<tr>
<th>属性</th>
<th>許容される値</th>
<th>説明</th>
</tr>
<tr>
<td>locale</td>
<td>標準の XML/HTML 言語コード（en、en-US、fr、fr-FR など）</td>
<td><strong>必須</strong>。この文字列を使用する端末またはソフトウェアの言語設定。</td>
</tr>
<tr>
<td>pronunciation</td>
<td>文字列</td>
<td><strong>省略可能</strong>。要素のテキストが漢字で表記される場合に使用されます。日本語のソート順は、文字ではなく発音（漢字からは特定不可能）に基づいて決まります。その情報を与えるのが <em>pronunciation</em> 属性です。通常ひらがなが使用されます。</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;TvSpecial&gt;
...
&lt;ShortDescription locale="en-US"&gt;Alan shows us some trees and sings songs about them.&lt;/ShortDescription&gt;
&lt;Synopsis locale="en-US"&gt;Alan Smithee, man about town and fervent urban arborist, takes us on a
musical journey around his home town, stopping by some favorite trees to sing about them. As
expected from Mr. Smithee, no path runs straight and his plans meander as he encounters guest
stars and battles a lumberjack with a literal ax to grind.&lt;/Synopsis&gt;
...
&lt;/TvSpecial&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="System"></a>
<h3>System</h3>
<p>作品を評価したレーティングシステム（通常は公式の評価機関）。指定できる System は各評価につき 1 つだけです。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>ContentRating で必須</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#ContentRating">ContentRating</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;ContentRatings&gt;
&lt;ContentRating&gt;
<strong>&lt;System&gt;MPAA&lt;/System&gt;</strong>
&lt;Certification&gt;G&lt;/Certification&gt;
&lt;/ContentRating&gt;
&lt;/ContentRatings&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Title"></a>
<h3>Title</h3>
<p>作品のタイトル。ローカライズされたタイトルを提供する目的で 1 つの作品に、複数の Title 要素を追加することができます。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>必須</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Movie">Movie</a>、<a href="#TvShow">TvShow</a>、<a href="#TvSeason">TvSeason</a>、<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSpecial">TvSpecial</a>、<a href="#MiniSeries">MiniSeries</a>、<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>、<a href="#Extra">Extra</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>
<table class="auto-width">
<tbody>
<tr>
<th>属性</th>
<th>許容される値</th>
<th>説明</th>
</tr>
<tr>
<td>locale</td>
<td>標準の XML/HTML 言語コード（en、en-US、fr、fr-FR など）</td>
<td><strong>必須</strong>。この文字列を使用する端末またはソフトウェアの言語設定。</td>
</tr>
<tr>
<td>pronunciation</td>
<td>文字列</td>
<td><strong>省略可能</strong>。要素のテキストが漢字で表記される場合に使用されます。日本語のソート順は、文字ではなく発音（漢字からは特定不可能）に基づいて決まります。その情報を与えるのが <em>pronunciation</em> 属性です。通常ひらがなが使用されます。</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;TvShow&gt;
&lt;ID&gt;TV123456&lt;/ID&gt;
<strong>&lt;Title locale="en-US"&gt;Office Factor&lt;/Title&gt;</strong>
...
&lt;/TvShow&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="TvEpisode"></a>
<h3>TvEpisode</h3>
<p>TvEpisode は基本的な作品タイプの 1 つで、TvShow の単一のエピソードを表します。通常、TvSeason にも関連付けられます。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Catalog">Catalog</a>
</td>
</tr>
<tr>
<td>全作品タイプ共通の子要素</td>
<td>
必須: <a href="#ID">ID</a>、<a href="#Offers">Offers</a>、<a href="#Title">Title</a><br>
省略可能: <a href="#AdultProduct">AdultProduct</a>（廃止）、<a href="#Color">Color</a>、<a href="#ContentRatings">ContentRatings</a>、<a href="#JP_Require18PlusAgeConfirmation">JP_Require18PlusAgeConfirmation</a>、<a href="#Copyright">Copyright</a>、<a href="#Credits">Credits</a>、<a href="#CustomerRating">CustomerRating</a>、<a href="#ExternalID">ExternalID</a>、<a href="#Genres">Genres</a>、<a href="#ImageUrl">ImageUrl</a>、<br>
<a href="#Language">Language</a>、<a href="#Rank">Rank</a>、<a href="#ReleaseInfo">ReleaseInfo</a>（廃止）、<a href="#ShortDescription">ShortDescription</a>、<a href="#ReleaseYear">ReleaseYear</a>、<a href="#RuntimeMinutes">RuntimeMinutes</a>、<a href="#Source">Source</a>、<a href="#Studios">Studios</a>、<a href="#Synopsis">Synopsis</a>
</td>
</tr>
<tr>
<td>TvEpisode に固有の子要素</td>
<td>
必須: <a href="#ShowID">ShowID</a> または <a href="#ShowTitle">ShowTitle</a>（どちらか一方）<br>
必須: <a href="#SeasonID">SeasonID</a> または <a href="#SeasonInShow">SeasonInShow</a>（どちらか一方）<br>
必須: <a href="#EpisodeInSeason">EpisodeInSeason</a><br>
省略可能: <a href="#SeasonTitle">SeasonTitle</a>、<a href="#OriginalAirDate">OriginalAirDate</a>
</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;TvShow&gt;
&lt;ID&gt;ABC-123457&lt;/ID&gt;
...
&lt;/TvShow&gt;
&lt;TvSeason&gt;
&lt;ID&gt;TVS-987654&lt;/ID&gt;
...
&lt;/TvSeason&gt;
<strong>&lt;TvEpisode&gt;</strong>
&lt;ID&gt;TVE2329880&lt;/ID&gt;
&lt;Title locale="en-US"&gt;What's in a Name?&lt;/Title&gt;
&lt;Offers&gt;
&lt;SubscriptionOffer&gt;
&lt;Regions&gt;
&lt;Country&gt;US&lt;/Country&gt;
&lt;/Regions&gt;
&lt;/SubscriptionOffer&gt;
&lt;/Offers&gt;
&lt;ShowID&gt;ABC-123457&lt;/ShowID&gt;
&lt;SeasonID&gt;TVS-987654&lt;/SeasonInShow&gt;
&lt;EpisodeInSeason&gt;5&lt;/EpisodeInSeason&gt;
<strong>&lt;/TvEpisode&gt;</strong></pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="TvSeason"></a>
<h3>TvSeason</h3>
<p>TvSeason は基本的な作品タイプの 1 つで、TvShow の単一のエピソードを表します。TvEpisode の <a href="#SeasonID">SeasonID</a> 値が TvSeason の <a href="#ID">ID</a> と同じである場合、そのエピソードは、そのシーズンに属していることを表します。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Catalog">Catalog</a>
</td>
</tr>
<tr>
<td>全作品タイプ共通の子要素</td>
<td>
必須: <a href="#ID">ID</a>、<a href="#Offers">Offers</a>、<a href="#Title">Title</a><br>
省略可能: <a href="#AdultProduct">AdultProduct</a>（廃止）、<a href="#Color">Color</a>、<a href="#ContentRatings">ContentRatings</a>、<a href="#JP_Require18PlusAgeConfirmation">JP_Require18PlusAgeConfirmation</a>、<a href="#Copyright">Copyright</a>、<a href="#Credits">Credits</a>、<a href="#CustomerRating">CustomerRating</a>、<a href="#ExternalID">ExternalID</a>、<a href="#Genres">Genres</a>、<a href="#ImageUrl">ImageUrl</a>、<br>
<a href="#Language">Language</a>、<a href="#Rank">Rank</a>、<a href="#ReleaseInfo">ReleaseInfo</a>（廃止）、<a href="#ShortDescription">ShortDescription</a>、<a href="#ReleaseYear">ReleaseYear</a>、<a href="#RuntimeMinutes">RuntimeMinutes</a>、<a href="#Source">Source</a>、<a href="#Studios">Studios</a>、<a href="#Synopsis">Synopsis</a>
</td>
</tr>
<tr>
<td>TvSeason に固有の子要素</td>
<td>
必須: <a href="#ShowID">ShowID</a> または <a href="#ShowTitle">ShowTitle</a>（どちらか一方）<br>
必須: <a href="#SeasonInShow">SeasonInShow</a>
</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;TvShow&gt;
&lt;ID&gt;ABC-123457&lt;/ID&gt;
...
&lt;/TvShow&gt;
<strong>&lt;TvSeason&gt;</strong>
&lt;ID&gt;TVS2329880&lt;/ID&gt;
&lt;Title locale="en-US"&gt;Season Five&lt;/Title&gt;
&lt;Offers&gt;
&lt;SubscriptionOffer&gt;
&lt;Regions&gt;
&lt;Country&gt;US&lt;/Country&gt;
&lt;/Regions&gt;
&lt;/SubscriptionOffer&gt;
&lt;/Offers&gt;
&lt;ShowID&gt;ABC-123457&lt;/ShowID&gt;
&lt;SeasonInShow&gt;5&lt;/SeasonInShow&gt;
<strong>&lt;/TvSeason&gt;</strong>
&lt;TvEpisode&gt;
...
&lt;ShowID&gt;ABC-123457&lt;/ShowID&gt;
&lt;SeasonID&gt;TVS2329880&lt;/SeasonID&gt;
...
&lt;/TvEpisode&gt;
</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="TvShow"></a>
<h3>TvShow</h3>
<p>TvShow は基本的な作品タイプの 1 つで、シーズンとエピソードから成るテレビシリーズです。通常の一連のエピソードとは別に特別番組に関連付けられる場合もあります。TvSeason、TvEpisode、TvSpecial の <a href="#ShowID">ShowID</a> 値が TvShow の <a href="#ID">ID</a> と同じである場合、そのシーズン、エピソード、特別番組は、その TvShow に属していることを表します。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Catalog">Catalog</a>
</td>
</tr>
<tr>
<td>全作品タイプ共通の子要素</td>
<td>
必須: <a href="#ID">ID</a>、<a href="#Offers">Offers</a>、<a href="#Title">Title</a><br>
省略可能: <a href="#AdultProduct">AdultProduct</a>（廃止）、<a href="#Color">Color</a>、<a href="#ContentRatings">ContentRatings</a>、<a href="#JP_Require18PlusAgeConfirmation">JP_Require18PlusAgeConfirmation</a>、<a href="#Copyright">Copyright</a>、<a href="#Credits">Credits</a>、<a href="#CustomerRating">CustomerRating</a>、<a href="#ExternalID">ExternalID</a>、<a href="#Genres">Genres</a>、<a href="#ImageUrl">ImageUrl</a>、<br>
<a href="#Language">Language</a>、<a href="#Rank">Rank</a>、<a href="#ReleaseInfo">ReleaseInfo</a>（廃止）、<a href="#ShortDescription">ShortDescription</a>、<a href="#ReleaseYear">ReleaseYear</a>、<a href="#RuntimeMinutes">RuntimeMinutes</a>、<a href="#Source">Source</a>、<a href="#Studios">Studios</a>、<a href="#Synopsis">Synopsis</a>
</td>
</tr>
<tr>
<td>TvShow に固有の子要素</td>
<td>
<a href="#ReleaseDate">ReleaseDate</a>（省略可能）
</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre><strong>&lt;TvShow&gt;</strong>
&lt;ID&gt;RS-2329880&lt;/ID&gt;
&lt;Title locale="en-US"&gt;Office Factor&lt;/Title&gt;
&lt;Offers&gt;
&lt;SubscriptionOffer&gt;
&lt;Regions&gt;
&lt;Country&gt;US&lt;/Country&gt;
&lt;/Regions&gt;
&lt;/SubscriptionOffer&gt;
&lt;/Offers&gt;
<strong>&lt;/TvShow&gt;</strong>
&lt;TvSeason&gt;
&lt;ID&gt;TVS2329880&lt;/ID&gt;
...
&lt;ShowID&gt;RS-2329880&lt;/ShowID&gt;
...
&lt;/TvSeason&gt;
&lt;TvEpisode&gt;
...
&lt;ShowID&gt;RS-2329880&lt;/ShowID&gt;
&lt;SeasonID&gt;TVS2329880&lt;/SeasonID&gt;
...
&lt;/TvEpisode&gt;
</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="TvSpecial"></a>
<h3>TvSpecial</h3>
<p>TvSpecial は基本的な作品タイプの 1 つで、テレビで放送されるイベントのうち、従来の "番組-シーズン-エピソード" というテレビ階層には該当しないイベントに適用されます。1 回限りのイベント（休日特番など）のほか、各エピソードにエピソード番号ではなく一意の放映日が割り当てられている番組（ニュース番組など）が該当します。TvSpecial は、TvShow に関連付けることができるほか（ただし TvSeason への関連付けは不可）、単発の番組として存在する場合もあります。また、授賞式に関連した番組や、テレビコンサート、回顧録も TvSpecial に該当します。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Catalog">Catalog</a>
</td>
</tr>
<tr>
<td>全作品タイプ共通の子要素</td>
<td>
必須: <a href="#ID">ID</a>、<a href="#Offers">Offers</a>、<a href="#Title">Title</a><br>
省略可能: <a href="#AdultProduct">AdultProduct</a>（廃止）、<a href="#Color">Color</a>、<a href="#ContentRatings">ContentRatings</a>、<a href="#JP_Require18PlusAgeConfirmation">JP_Require18PlusAgeConfirmation</a>、<a href="#Copyright">Copyright</a>、<a href="#Credits">Credits</a>、<a href="#CustomerRating">CustomerRating</a>、<a href="#ExternalID">ExternalID</a>、<a href="#Genres">Genres</a>、<a href="#ImageUrl">ImageUrl</a>、<br>
<a href="#Language">Language</a>、<a href="#Rank">Rank</a>、<a href="#ReleaseInfo">ReleaseInfo</a>（廃止）、<a href="#ShortDescription">ShortDescription</a>、<a href="#ReleaseYear">ReleaseYear</a>、<a href="#RuntimeMinutes">RuntimeMinutes</a>、<a href="#Source">Source</a>、<a href="#Studios">Studios</a>、<a href="#Synopsis">Synopsis</a>
</td>
</tr>
<tr>
<td>TvShow に固有の子要素</td>
<td>
必須: <a href="#OriginalAirDate">OriginalAirDate</a>（CDF v1.3 で追加）<br>
省略可能: <a href="#ShowID">ShowID</a> または <a href="#ShowTitle">ShowTitle</a>（どちらか一方）（CDF v1.3 で追加）
</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>例</td>
<td>
<pre><strong>&lt;TvSpecial&gt;</strong>
&lt;ID&gt;SP-2329880&lt;/ID&gt;
&lt;Title locale="en-US"&gt;Cheese: Friend or Enemy?&lt;/Title&gt;
&lt;Offers&gt;
&lt;SubscriptionOffer&gt;
&lt;Regions&gt;
&lt;Country&gt;US&lt;/Country&gt;
&lt;/Regions&gt;
&lt;/SubscriptionOffer&gt;
&lt;/Offers&gt;
&lt;OriginalAirDate&gt;2005-04-29T20:00:00&lt;/OriginalAirDate&gt;
<strong>&lt;/TvSpecial&gt;</strong>
</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Type"></a>
<h3>Type</h3>
<p>Extra をトレーラー（プレビュー）またはクリップとして指定します。Extra が関連付けられている Movie のメーキングドキュメンタリーのように大規模なものもありますが、トレーラー以外はすべてクリップと見なしてかまいません。指定できる Type は各 Extra につき 1 つだけです。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>必須</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.3</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Extra">Extra</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>許容される値</td>
<td>clip<br>
trailer</td>
</tr>
<tr>
<td>例</td>
<td>
<pre><strong>&lt;Extra&gt;</strong>
..
&lt;Type&gt;trailer&lt;/Type&gt;
...
<strong>&lt;/Extra&gt;</strong></pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="WindowEnd"></a>
<h3>WindowEnd</h3>
<p>特定の視聴方法で作品が視聴できなくなる日時。指定できる WindowEnd は各視聴方法につき 1 つだけです。<a href="#WindowStart">WindowStart</a> と WindowEnd を使用することで、視聴方法が利用できる期間を宣言できます。WindowEnd で指定した期限を過ぎると、対象の視聴者にはその視聴方法が表示されなくなります。すべての視聴方法の期限が切れた場合、視聴者に対して作品そのものが非表示となります。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#SubscriptionOffer">SubscriptionOffer</a>、<a href="#FreeOffer">FreeOffer</a>、<a href="#PurchaseOffer">PurchaseOffer</a>、<a href="#RentalOffer">RentalOffer</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>許容される値</td>
<td>XML の <em>dateTime</em> 値。この値の形式は YYYY-MM-DDThh:mm:ss です。YYYY-MM-DD は年、月、日を、hh:mm:ss は時、分、秒を表します。"T" はその 2 つの区切りとなります。年から秒までの値全体を指定する必要があります。UTC とのオフセットを値の最後に追加して特定のタイムゾーンを示すこともできます。</td>
</tr>
<tr>
<td>コメント</td>
<td>
WindowsStart と WindowsEnd を組み合わせるか、個別に使用して、特定の視聴方法における作品の視聴期間を制御することができます。
<ul>
<li>WindowsStart のみ指定した場合: 指定された日時以降、作品がカタログから削除されるまで無期限に作品を視聴できます。</li>
<li>WindowsEnd のみ指定した場合: 作品は直ちに視聴できますが、視聴できるのは、指定された日時までとなります。</li>
<li>WindowsStart と WindowsEnd の両方を指定した場合: 指定された期間のみ作品を視聴できます。</li>
<li>WindowsStart も WindowsEnd も指定しなかった場合: 作品は直ちに視聴できるようになり、カタログから削除されるまで無期限に作品を視聴できます。</li>
</ul>
</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;FreeOffer&gt;
...
&lt;WindowStart&gt;2014-02-06T12:00:00-07:00&lt;/WindowStart&gt;
<strong>&lt;WindowEnd&gt;2016-01-01T07:00:00-07:00&lt;/WindowEnd&gt;</strong>
...
&lt;/FreeOffer&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="WindowStart"></a>
<h3>WindowStart</h3>
<p>特定の視聴方法で作品が視聴できるようになる日時。WindowStart と <a href="#WindowEnd">WindowEnd</a> を使用することで、視聴方法が利用できる期間を宣言できます。その期間の前後は、視聴方法が視聴者に表示されません。その時点で視聴方法が利用できなければ、作品そのものが視聴者に対して非表示となります。指定できる WindowStart は各視聴方法につき 1 つだけです。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>省略可能</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#SubscriptionOffer">SubscriptionOffer</a>、<a href="#FreeOffer">FreeOffer</a>、<a href="#PurchaseOffer">PurchaseOffer</a>、<a href="#RentalOffer">RentalOffer</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>なし</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>許容される値</td>
<td>XML の <em>dateTime</em> 値。この値の形式は YYYY-MM-DDThh:mm:ss です。YYYY-MM-DD は年、月、日を、hh:mm:ss は時、分、秒を表します。"T" はその 2 つの区切りとなります。年から秒までの値全体を指定する必要があります。UTC とのオフセットを値の最後に追加して特定のタイムゾーンを示すこともできます。</td>
</tr>
<tr>
<td>コメント</td>
<td>
WindowsStart と WindowsEnd を組み合わせるか、個別に使用して、特定の視聴方法における作品の視聴期間を制御することができます。
<ul>
<li>WindowsStart のみ指定した場合: 指定された日時以降、作品がカタログから削除されるまで無期限に作品を視聴できます。</li>
<li>WindowsEnd のみ指定した場合: 作品は直ちに視聴できますが、視聴できるのは、指定された日時までとなります。</li>
<li>WindowsStart と WindowsEnd の両方を指定した場合: 指定された期間のみ作品を視聴できます。</li>
<li>WindowsStart も WindowsEnd も指定しなかった場合: 作品は直ちに視聴できるようになり、カタログから削除されるまで無期限に作品を視聴できます。</li>
</ul>
</td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;FreeOffer&gt;
...
<strong>&lt;WindowStart&gt;2014-02-06T12:00:00-07:00&lt;/WindowStart&gt;</strong>
&lt;WindowEnd&gt;2016-01-01T07:00:00-07:00&lt;/WindowEnd&gt;
...
&lt;/FreeOffer&gt;</pre>
</td>
</tr>
</tbody>
</table>
<hr>
<!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><a class="anchor" id="Works"></a>
<h3>Works</h3>
<p>カタログ内の個々の項目（映画、テレビ番組、シーズン、特別番組、ミニシリーズ、エピソード、トレーラーやクリップ）がすべて格納されます。個々のカタログファイルには、Works 要素が 1 つ存在している必要があります。Works 要素には、作品の項目を必要に応じていくつでも追加できます。また、各タイプも必要に応じていくつでも追加できます。</p>
<p><strong>注意</strong>: CDF v1.0 ～ v1.2 では、Works 要素に少なくとも 1 つの作品が含まれている必要がありました。CDF v1.3 では、空にすることができます。空にした場合、Amazon Fire TV のユニバーサル閲覧・検索から対象カタログのコンテンツが削除されます。</p>
<table class="auto-width">
<tbody>
<tr>
<td colspan="2"><strong>必須</strong></td>
</tr>
<tr>
<td>追加</td>
<td>CDF バージョン 1.0</td>
</tr>
<tr>
<td>親要素</td>
<td>
<a href="#Catalog">Catalog</a>
</td>
</tr>
<tr>
<td width="15%">子要素</td>
<td>
<a href="#Movie">Movie</a>、<a href="#TvShow">TvShow</a>、<a href="#TvSeason">TvSeason</a>、<a href="#TvEpisode">TvEpisode</a>、<a href="#TvSpecial">TvSpecial</a>、<a href="#MiniSeries">MiniSeries</a>、<a href="#MiniSeriesEpisode">MiniSeriesEpisode</a>、<a href="#Extra">Extra</a>
</td>
</tr>
<tr>
<td>属性</td>
<td>なし</td>
</tr>
<tr>
<td>許容される値</td>
<td><br></td>
</tr>
<tr>
<td>例</td>
<td>
<pre>&lt;Catalog&gt;
&lt;Partner&gt;Everything Ever Made Filmworks&lt;/Partner&gt;
&lt;Works&gt;
...
&lt;/Works&gt;
&lt;/Catalog&gt;</pre>
</td>
</tr>
</tbody>
</table>


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
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/receiving-and-understanding-the-catalog-ingestion-report">カタログインジェストレポートの取得とその内容</a>:カタログの統合ステータスに関するレポートのオプトインと使用方法について。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-ingestion-report-messages">カタログデータ形式インジェストレポートのメッセージ</a>:各インジェストレポート情報の読み方と対処方法。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/launcher-integration">ランチャー統合</a>:アプリと Fire TV ホーム画面ランチャーの統合について。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/testing-launcher-integration-with-adb">ADB を使用したランチャー統合テスト</a>:Android Debug Bridge（ADB）を使用したアプリのランチャー統合のテストについて。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/testing-launcher-integration-with-the-test-app">テストアプリを使用したランチャー統合テスト</a>:Amazon のテストアプリシミュレーターを使用したアプリのランチャー統合のテストについて。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/fire-tv-catalog-integration-faqs">Fire TV カタログ統合の FAQ</a>:カタログ統合についてのよくある質問。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/migrating-a-cdf-file-to-the-latest-version">カタログデータ形式（CDF）ファイルの最新バージョンへの移行</a>:カタログで最新バージョンの CDF スキーマが使用されるようにする方法。</li>
<li> <strong>カタログデータ形式（CDF）スキーマリファレンス</strong>:すべての CDF 要素の定義、要件、サンプル。</li>
<li><a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/test-cases-for-verifying-deep-links-from-your-fire-tv-catalog">Fire TV のディープリンクを確認するためのテストケース</a>: アプリのランチャー統合を確認するために実行するテストケースについて。</li>

</ul>



{% include links.html %}
