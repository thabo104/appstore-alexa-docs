---
title: カタログデータ形式（CDF）ファイルの最新バージョンのへの移行
permalink: migrating-a-cdf-file-to-the-latest-version.html
sidebar: catalog_ja
product: Fire TV Catalog
toc-style: kramdown
github: true
---


<a class="anchor" name="はじめに"></a>

<a class="anchor" name="intro"></a>

<h2>はじめに</h2>
<p>Amazon Fire TV では、新しいメタデータの受け入れ、使用していない情報の削除、カタログ構造の整理のために、カタログデータ形式（CDF）XML スキーマを更新することがあります。これらの変更で既存の CDF ファイルが無効になることはありませんが、古いタグ内の一部のデータが無視されたり以前とは異なる方法で使用されたりすることがあるため、廃止に関する警告が<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/receiving-and-understanding-the-catalog-ingestion-report">インジェストレポート</a>に表示されます。古いスキーマは、今後サポートされなくなる可能性があります。最適な環境でご利用いただけるように、 Amazon では、常に最新の CDF スキーマバージョンに基づいてカタログファイルを作成することを推奨しています。</p>
<p>この変更を加える方法や箇所はカタログファイルの作成方法によって異なります。コードを使用してデータベースから情報を取得し、CDF ファイルに変換している場合は、変換コードを変更する必要があります。CDF と照合するようにデータベースが構築されている場合は、データベースのフィールドを変更する必要があります。</p>
<p>CDF ファイルの各バージョンは順に変更が加えられているため、v1.0 から v1.1、v1.1 から v1.2 のように段階を踏んでアップグレードしてください。開発者様によって開始バージョンが異なるだけで、アップグレードは直線的に進みます。ファイルで使用している CDF バージョンがわからない場合は最初から始めてください。バージョン間の変更点は、たいていの場合が新しいオプション要素の追加です。そのため、現在のファイルを新しいスキーマバージョンに適応させる際に必要な変更は少なく、通常はバージョンあたり 1 つか 2 つのみです。<br></p>
<p>一部の XML 要素は、CDF XSD ファイルで定義された順序でカタログファイルに配置する必要があります。要素を配置する順序を誤ると、カタログファイルが無効になります。要素の順序についてご不明な点がある場合は、該当する XSD ファイルを参照してください。</p>
<ul>
<li>
<a href="https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog-10.xsd">CDF XSD バージョン 1.0</a>
</li>
<li>
<a href="https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog-11.xsd">CDF XSD バージョン 1.1</a>
</li>
<li>
<a href="https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog-12.xsd">CDF XSD バージョン 1.2</a>
</li>
<li>
<a href="https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog-13.xsd">CDF XSD バージョン 1.3</a>
</li>
</ul>
<p><a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference">サンプル CDF ファイル</a>も参照してください（ダウンロードできます）。</p>
<p>このトピックは、XML と <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-cdf-overview">CDF スキーマ</a>について理解していることを前提としています。</p>


<a class="anchor" name="CDF v1.0 から v1.1 への移行"></a>

<a class="anchor" name="v1.0_to_v1.1"></a>

<h2>CDF v1.0 から v1.1 への移行</h2>
<p>CDF v1.0 と v1.1 の違いは以下のとおりです。
</p>
<table class="auto-width"> <tbody>
<tr>
<th>アイテム</th>
<th>タイプ</th>
<th>変更</th>
<th>説明</th>
</tr>
<tr>
<td><em>WorkType</em>.Source</td>
<td>要素</td>
<td>追加</td>
<td> オプションです。作品の提供元を指定します。使用できる値は以下のとおりです。
<ul>
<li><em>original</em>:開発者様の会社で制作された作品です。たとえば、Amazon であれば、Amazon オリジナルのシリーズ作品
<br /> 「トランスペアレント」にこの値を指定します。</li>
<li><em>licensed</em>:別の提供元から開発者様の会社にライセンス供与されている作品です。
<br /></li>
<li><em>other</em>:提供元はわかっているが <em>original</em> にも <em>licensed</em> にも分類できない作品です。</li>
<li><em>unknown</em>:提供元が不明な作品です。</li>
</ul> </td>
</tr>
<tr>
<td><em>WorkType</em>.AdultProduct</td>
<td>要素</td>
<td>廃止</td>
<td>この値は使用されなくなったため、この要素は削除する必要があります。アダルトコンテンツは ContentRatings 要素を
<br /> 使用して識別できます。日本では、v1.2 で追加された JP_Require18PlusAgeConfirmation 要素を使用できます。</td>
</tr> </tbody>
</table>
<h3>CDF ファイルを v1.0 から v1.1 に更新するには
</h3>
<ol>
<li><em>WorkType</em>.AdultProduct のすべてのインスタンスを削除します。</li>
<li>省略可能: Source 要素をすべての Works 要素（Movie、TvShow、TvEpisode、TvSpecial、TvSeason、MiniSeries、MiniSeriesEpisode、Extra）に追加します。Source 要素の配置方法は作品タイプによって異なります。正しい配置方法については XSD を参照してください。</li>
</ol>


<a class="anchor" name="CDF v1.1 から v1.2 への移行"></a>

<a class="anchor" name="v1.1_to_v1.2"></a>

<h2>CDF v1.1 から v1.2 への移行</h2>
<p>CDF v1.1 と v1.2 の違いは以下のとおりです。</p>
<table class="auto-width">
<tbody>
<tr>
<th>アイテム</th>
<th>タイプ</th>
<th>変更</th>
<th>説明</th>
</tr>
<tr>
<td>Catalog.version</td>
<td>属性</td>
<td>追加</td>
<td>
オプションです。この属性は、ファイルを操作する他のユーザーにこのファイルがどの CDF バージョンに<br>
基づいて作成されたかがわかるようにするためのものです。使用できる値は以下のとおりです。
<ul>
<li>FireTv-v1.2</li>
<li>FireTv-v1.3</li>
</ul>
</td>
</tr>
<tr>
<td><em>OfferType</em>.LaunchDetails</td>
<td>要素</td>
<td>追加</td>
<td>
オプションです。以下の子要素を指定された順序で使用します。<br>
<ul>
<li>Quality:オプションです。ビデオの画質を指定するための <em>OfferType</em>.Quality 要素がこの場所に<br>
移動しました。それ以外の点は古いバージョンと同じです。入力できる値は、SD、HD、UHD です。</li>
<li>AudioLanguage:オプションです。作品の元の言語または吹き替え音声の言語のオプションです。</li>
<li>Subtitle:オプションです。作品の字幕の言語オプションです。</li>
<li>LaunchId:オプションです。このコンテンツを画質、音声、字幕の組み合わせを指定して再生<br>
するための識別子です。1 つの識別子で、音声エンコード（吹き替え）、画質、字幕の言語が<br>
異なり、それ以外は同じメタデータを共有するコンテンツ再生を設定できます。この文字列の<br>
形式は特に決まっていません。開発者様のアプリで解釈できること以外に必須の条件はありません。</li>
</ul>
<p>LaunchDetails の各インスタンスには、Quality、AudioLanguage、Subtitle 要素を必要なだけ使用でき<br>
ます。ただし、LaunchId は 1 つのみです。別の LaunchId を指定する場合は、LaunchDetails 要素を別に<br>
作成します。後述する例を参照してください。</p>
</td>
</tr>
<tr>
<td><em>OfferType</em>.Quality</td>
<td>要素</td>
<td>廃止/移動</td>
<td>この要素は <em>OfferType</em>.LaunchDetails の子要素になりました（上記参照）。新しい場所に移動できますが、<br>
それ以外の点は変わりません。</td>
</tr>
<tr>
<td>CustomerRating.Count</td>
<td>要素</td>
<td>追加</td>
<td>オプションです。最終的な評価の平均に使用される評価の数を指定できます。CustomerRating の下位の<br>
最後の要素として配置します。</td>
</tr>
<tr>
<td>JP_Require18PlusAgeConfirmation</td>
<td>要素</td>
<td>追加</td>
<td>オプションです。日本のコンテンツプロバイダーのみが使用します。入力できる値は true と false です。<br>
true を指定すると、日本の法律に従ってこのコンテンツの日本国内の視聴者にダイアログが表示されます。<br>
視聴者は年齢が 18 歳以上であることに同意する必要があります。この要素は、少なくとも、日本の規制<br>
機関によって 18 歳未満の視聴に適さないとみなされた作品では指定する必要があります。この要素の配置場所は作品タイプによって異なります。</td>
</tr>
<tr>
<td>CastMember.Role</td>
<td>要素</td>
<td>オプションになりました</td>
<td>この要素には、キャストが演じる登場人物の名前を指定します。v1.1 では必須でしたが、現在は省略できます。</td>
</tr>
</tbody>
</table>
<h3>CDF ファイルを v1.1 から v1.2 に更新するには</h3>
<ol>
<li>Quality 要素を保持するすべての SubscriptionOffer、FreeOffer、PurchaseOffer、RentalOffer で、以下の手順に従います。
<ol>
<li>LaunchDetails 要素を各 Offer の最後の要素として追加します。</li>
<li>Quality 要素を現在の場所から LaunchDetails 要素に移動します。<br></li>
<li>例<br>
&nbsp;&nbsp;&nbsp;&nbsp;<strong>変更前</strong><br>
<pre>    &lt;FreeOffer&gt;
&lt;Quality&gt;HD&lt;/Quality&gt;
...
&lt;/FreeOffer&gt;
</pre><strong>変更後</strong><br>
<pre>    &lt;FreeOffer&gt;
...
&lt;LaunchDetails&gt;
&lt;Quality&gt;HD&lt;/Quality&gt;
&lt;/LaunchDetails&gt;
&lt;/FreeOffer&gt;
</pre>
</li>
</ol>
</li>
<li>オプションです。Quality 要素を保持していないすべての SubscriptionOffer、FreeOffer、PurchaseOffer、RentalOffer では、LaunchDetails 要素をそれぞれに最後の要素として追加します。オプションの Quality、AudioLanguage、Subtitle、LaunchId 情報を必要な数だけ追加します。
<ul>
<li>例
<pre>    &lt;FreeOffer&gt;
...
&lt;LaunchDetails&gt;
&lt;Quality&gt;HD&lt;/Quality&gt;
&lt;AudioLanguage&gt;en-us&lt;/AudioLanguage&gt;
&lt;Subtitle&gt;en&lt;/Subtitle&gt;
&lt;Subtitle&gt;es&lt;/Subtitle&gt;
&lt;LaunchId&gt;tt123456_HD_en-us&lt;/LaunchId&gt;
&lt;/LaunchDetails&gt;
&lt;LaunchDetails&gt;
&lt;Quality&gt;HD&lt;/Quality&gt;
&lt;AudioLanguage&gt;es-mx&lt;/AudioLanguage&gt;
&lt;Subtitle&gt;en&lt;/Subtitle&gt;
&lt;Subtitle&gt;es&lt;/Subtitle&gt;
&lt;LaunchId&gt;tt123456_HD_es-mx&lt;/LaunchId&gt;
&lt;/LaunchDetails&gt;
&lt;/FreeOffer&gt;
</pre>
</li>
</ul>
</li>
<li>省略可能ですが推奨です。CDF ファイルの最上部にある既存の Catalog 要素に <em>version</em> 属性を追加し、FireTv-v1.2 に設定します。
<ul>
<li>例
<pre>&lt;Catalog xmlns="http://www.amazon.com/FireTv/2014-04-11/ingestion" version="FireTv-v1.2"&gt;</pre>
</li>
</ul>
</li>
<li>オプションです。CustomerRating 要素をカタログで使用している場合は、Count 要素を CustomerRating の最後の要素として追加してください。この値は、CustomerRating.Score 値が更新されるたびに更新する必要があります。この情報の収集と追跡の方法は、開発者様が自由に決定できます。</li>
<li>これは日本国内の Fire TV コンテンツプロバイダー向けのオプションです。JP_Require18PlusAgeConfirmation 要素を、少なくともこの要素の用途に該当する作品に追加し、true に設定します。要素の配置場所は作品タイプによって異なるため、XSD ファイルを参照してください。
<ul>
<li>例
<pre>    &lt;Movie&gt;
...
&lt;JP_Require18PlusAgeConfirmation&gt;true&lt;/JP_Require18PlusAgeConfirmation&gt;
&lt;ReleaseDate&gt;1959-05-13T04:36:00&lt;/ReleaseDate&gt;
&lt;/Movie&gt;
</pre>
</li>
</ul>
</li>
</ol>


<a class="anchor" name="CDF v1.2 から v1.3 への移行"></a>

<a class="anchor" name="v1.2_to_v1.3"></a>

<h2>CDF v1.2 から v1.3 への移行</h2>
<p>CDF v1.2 と v1.3 の違いは以下のとおりです。
</p>
<table class="auto-width"> <tbody>
<tr>
<th>アイテム</th>
<th>タイプ</th>
<th>変更</th>
<th>説明</th>
</tr>
<tr>
<td>MiniSeries</td>
<td>要素</td>
<td>追加</td>
<td>ミニシリーズの概略が、シーズンのない、少数の連続したエピソードだけで構成された TV
<br /> 番組として定義されました。
<br /></td>
</tr>
<tr>
<td>MiniSeriesEpisode</td>
<td>要素</td>
<td>追加</td>
<td>ミニシリーズの個々のエピソードは、TvShow に対する TvEpisode と同様に使用します。</td>
</tr>
<tr>
<td>Extra</td>
<td>要素</td>
<td>追加</td>
<td> 補完的な素材です。多くの場合、特定の作品に付随します。使用できる値は
<br /> 以下のとおりです。
<ul>
<li><em>clip</em>:作品のワンシーンや、作品を撮ったカメラマンのドキュメンタリーなど、自由に
<br /> 指定できます。DVD のボーナストラックとお考えください。</li>
<li><em>trailer</em>:作品の公式の予告編や関連作品です。</li>
</ul> </td>
</tr>
<tr>
<td>ReleaseInfo</td>
<td>要素</td>
<td>廃止/移動</td>
<td> この要素には 2 つの子要素が含まれていました。
<ul>
<li>ReleaseCountry:使用されなくなりました。</li>
<li>ReleaseDate:以下の場所に移動しました。
<ul>
<li><em>WorkType</em>.ReleaseDate（Movie、TvShow、
<br /> MiniSeries の場合）</li>
<li><em>WorkType</em>.OriginalAirDate（TvEpisode、TvSpecial、MiniSeriesEpisode の場合）</li>
</ul></li>
</ul>
<p>元の値は XML の <em>date</em> 形式（YYYY-MM-DD）ですが、新しい値は <em>dateTime</em> 形式
<br /> （YYYY-MM-DDThh:mm:ss）です。この要素は単に新しい場所に移動するだけでなく、
<br /> 値をそれぞれ更新する必要があります。また、ReleaseInfo.ReleaseDate はオプション
<br /> でしたが、TvSpecial では OriginalAirDate は必須です。それ以外はオプションのままです。
</p> </td>
</tr>
<tr>
<td>Movie.ReleaseDate</td>
<td>要素</td>
<td>追加</td>
<td>オプションです。廃止された Movie.ReleaseInfo.ReleaseDate がこの場所に移動しました。
<br /> 詳細については、上記の ReleaseInfo のエントリを参照してください。</td>
</tr>
<tr>
<td>TvShow.ReleaseDate</td>
<td>要素</td>
<td>追加</td>
<td>オプションです。廃止された TvShow.ReleaseInfo.ReleaseDate がこの場所に移動しました。
<br /> 詳細については、上記の ReleaseInfo のエントリを参照してください。</td>
</tr>
<tr>
<td>TvEpisode.OriginalAirDate</td>
<td>要素</td>
<td>追加</td>
<td>オプションです。廃止された TvEpisode.ReleaseInfo.ReleaseDate がこの場所に移動しました。
<br /> 詳細については、上記の ReleaseInfo のエントリを参照してください。</td>
</tr>
<tr>
<td>TvSpecial.OriginalAirDate</td>
<td>要素</td>
<td>追加</td>
<td>必須。廃止された TvSpecial.ReleaseInfo.ReleaseDate がこの場所に移動しました。詳細に
<br /> ついては、上記の ReleaseInfo のエントリを参照してください。
<br /></td>
</tr>
<tr>
<td>TvSpecial.ShowID</td>
<td>要素</td>
<td>追加</td>
<td>オプションです。特別番組が通常の連続物に含まれないイベントだった場合に、この要素を
<br /> 使用して、特定の番組に特別番組を関連付けることができます。この値はカタログ内の
<br /> TvShow.ID の値と一致する必要があります。この値と TvSpecial.ShowTitle の両方を使用
<br /> することはできません。</td>
</tr>
<tr>
<td>TvSpecial.ShowTitle</td>
<td>要素</td>
<td>追加</td>
<td>オプションです。この要素を使用して、カタログに含まれていない番組に特別番組を関連
<br /> 付けることができます。ShowTitle 文字列は、カタログ内のタイトルとの照合に必要な
<br /> 要素ではありません。基になる構成がない場合に、関連しているように見せるために
<br /> 使用されます。ShowID を使用できない場合は、この値<em>のみ</em>を使用してください。</td>
</tr>
<tr>
<td>Works</td>
<td>要素</td>
<td>空白にできなくなりました。</td>
<td>以前は、空白にするとカタログが無効になりました。現在は、Works 要素を空白にすると、
<br /> Amazon Fire TV のユニバーサル閲覧・検索からすべてのコンテンツが除外されます。</td>
</tr>
<tr>
<td><em>WorkType</em>.ID</td>
<td>要素</td>
<td>1 文字以上の長さにすることが必須になりました。</td>
<td>この要素自体（作品ごとに一意の識別子）は以前から必須でしたが、現在は値も必須です。
<br /> これは情報の構成要素として非常に重要で、シーズンや番組とエピソードとの関連付けの
<br /> ほか、ファイル内のエラー箇所のレポートなどあらゆる場面で使用されるため、必ず設定し、
<br /> 一意の値を指定する必要があります。</td>
</tr> </tbody>
</table>
<h3>CDF ファイルを v1.2 から v1.3 に更新するには
</h3>
<ol>
<li>すべての作品の <em>WorkType</em>.ReleaseInfo.ReleaseDate 要素を新しい場所に移動します。各日付の値を <a href="http://www.w3schools.com/schema/schema_dtypes_date.asp">XML の <em>dateTime</em> 形式</a>（YYYY-MM-DDThh:mm:ss）に変更します。作品がリリースまたは放映された時刻がわからない場合は、文字列のその部分に T00:00:00 を入力してください。対象となる ReleaseDate 要素と OriginalAirDate 要素は、該当する作品タイプの最後にある要素です。
<ul>
<li>Movie.ReleaseInfo.ReleaseDate を Movie.ReleaseDate に移動します。</li>
<li>TvShow.ReleaseInfo.ReleaseDate を TvShow.ReleaseDate に移動します。</li>
<li>TvEpisode.ReleaseInfo.ReleaseDate を TvEpisode.OriginalAirDate に移動します。</li>
<li>TvSpecial.ReleaseInfo.ReleaseDate を TvSpecial.OriginalAirDate に移動します。</li>
<li>TvSeason.ReleaseInfo.ReleaseDate は使用されなくなったため、移動する必要はありません。</li>
<li>例
<br /> &nbsp;&nbsp;&nbsp;&nbsp;<strong>変更前</strong>
<pre>    &lt;Movie&gt;
...
&lt;ReleaseInfo&gt;
&lt;ReleaseDate&gt;1959-05-13&lt;/ReleaseDate&gt;
&lt;/ReleaseInfo&gt;
...
&lt;/Movie&gt;
...
&lt;TvSpecial&gt;
...
&lt;ReleaseInfo&gt;
&lt;ReleaseDate&gt;1959-05-13&lt;/ReleaseDate&gt;
&lt;/ReleaseInfo&gt;
...
&lt;/TvSpecial&gt;
</pre>
<p><strong>変更後</strong>
</p>
<pre>    &lt;Movie&gt;
...
&lt;ReleaseDate&gt;1959-05-13T00:00:00&lt;/ReleaseDate&gt;
&lt;/Movie&gt;
...
&lt;TvSpecial&gt;
...
&lt;OriginalAirDate&gt;1959-05-13T00:00:00&lt;/OriginalAirDate&gt;
&lt;/TvSpecial&gt;
</pre></li>
</ul></li>
<li>ReleaseInfo 要素のすべてのインスタンスを削除します。ReleaseDate 要素と ReleaseCountry 要素が含まれている場合は、それらも削除します。</li>
<li>空白の <em>WorkType</em>.ID 要素がないことを確認します（通常はありません）。見つかった場合は、作品に一意の ID を割り当てます。
<ul>
<li>例
<br /> &nbsp;&nbsp;&nbsp;&nbsp;<strong>変更前</strong>
<pre>    &lt;TvShow&gt;
&lt;ID&gt;&lt;/ID&gt;
...
&lt;/TvShow&gt;
</pre>
<p><strong>変更後</strong>
</p>
<pre>    &lt;TvShow&gt;
&lt;ID&gt;ts-123456&lt;/ID&gt;
...
&lt;/TvShow&gt;
</pre></li>
</ul></li>
<li>オプションです。既存のコンテンツの中に MiniSeries に分類した方が適切であるものがあれば、その情報を新しい MiniSeries 作品タイプと MiniSeriesEpisode 作品タイプに移動します。</li>
<li>オプションです。既存のコンテンツの中に Extra に分類した方が適切であるものがあれば、その情報を新しい Extra 作品タイプに移動します。</li>
<li>省略可能ですが推奨です。CDF ファイルの最上部にある Catalog 要素に <em>version</em> 属性を追加または更新して、FireTv-v1.3 に設定します。
<ul>
<li>例
<pre>    &lt;Catalog xmlns="http://www.amazon.com/FireTv/2014-04-11/ingestion" version="FireTv-v1.3"&gt; </pre></li>
</ul></li>
<li>オプションですが、該当する場合は推奨です。ShowID 要素（推奨）または ShowTitle 要素を各 TvSpecial に追加して、その特別番組を番組に関連付けます。特別番組が単独の作品である場合は、これらの要素を省略できます。</li>
<li>オプションです。OriginalAirDate 要素とその値を、ReleaseInfo.ReleaseDate 要素を使用していない TvSpecial または TvEpisode に追加します。</li>
<li>オプションです。ReleaseDate 要素とその値を、ReleaseInfo.ReleaseDate 要素を使用していない Movie または TvShow に追加します。</li>
</ol>


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
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/testing-launcher-integration-with-the-test-app">テストアプリを使用したランチャー統合テスト</a>:Amazon のテストアプリシミュレーターを使用したアプリのランチャー統合のテストについて。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/fire-tv-catalog-integration-faqs">Fire TV カタログ統合の FAQ</a>:カタログ統合についてのよくある質問。</li>
<li> <strong>カタログデータ形式（CDF）ファイルの最新バージョンへの移行</strong>:カタログで最新バージョンの CDF スキーマが使用されるようにする方法。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference">カタログデータ形式（CDF）スキーマリファレンス</a>:すべての CDF 要素の定義、要件、サンプル。</li>
<li><a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/test-cases-for-verifying-deep-links-from-your-fire-tv-catalog">Fire TV のディープリンクを確認するためのテストケース</a>: アプリのランチャー統合を確認するために実行するテストケースについて。</li>

</ul>


{% include links.html %}
