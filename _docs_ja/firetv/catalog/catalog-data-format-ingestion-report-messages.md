---
title: カタログデータ形式（CDF）インジェストレポートのメッセージ
permalink: catalog-data-format-ingestion-report-messages.html
sidebar: catalog_ja_ja
product: Fire TV Catalog
toc-style: kramdown
github: true
---

<h2>はじめに</h2>
<p>カタログデータ形式（CDF）インジェストレポートは、Amazon Fire TV クライアントから Amazon にアップロードされる<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/overview/integrating-your-catalog-with-fire-tv">カタログファイル</a>ごとに生成されます。このレポートには、Fire TV のユニバーサル閲覧・検索にカタログファイルが正常に統合されたかどうかが記録されています。正しく統合されていない場合、そのエラーに関する詳しい説明が記載されます。レポートにはまた、ファイルの不備をなくす上で参考となる警告と推奨事項も記載されています。</p>
<p>このページでは、インジェストレポートに出力されるエラーや警告、推奨事項を挙げ、その原因について説明するとともに、それぞれの状況への解決策を紹介しています。インジェストレポートの取得方法と内容の詳細については、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/receiving-and-understanding-the-catalog-ingestion-report">カタログインジェストレポートの取得とその内容</a>」を参照してください。</p>
<p><strong>注意:</strong> このページは、インジェストレポートに出力される可能性のあるメッセージを網羅したものではありません。レポートには、Amazon の検証ツールによって生成された XML 検証エラーが出力される場合もあります。これらのメッセージの具体的な表現は、実際に使用されたツールによって異なります。メッセージは決して親切とは言えず、技術者でなければわからないような表現もあります。そのようなメッセージがレポートに見られた場合は、開発者や IT 担当者、または Amazon ビジネスデベロッパーマネージャーに連絡して、その意味や必要な解決策を問い合わせてください。読みやすいインジェストレポートを入手するためにも、カタログを提出する<em>前に</em>カタログファイルを検証することをお勧めします。ファイルの検証の詳細については、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-integration#手順 2:CDF ファイルの検証">スキーマを使って CDF ファイルを検証する方法</a>」を参照してください。</p>
<h3>要件</h3>
<p>このページは、技術者以外のユーザーが第三者から頼まれて問題を解決したり、開発者が必要な情報を参照したりする状況を想定して書かれています。読者には、少なくとも、XML ファイルの扱いに関する基本的な知識が必要です（要素とは何か、属性とは何か、タグの閉じ方など）。また、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/receiving-and-understanding-the-catalog-ingestion-report">カタログインジェストレポートの取得とその内容</a>」に書かれている内容に精通している必要があります。</p>
<h3>問題の修正に適した担当者</h3>
<p>一般に、カタログファイルは次の 2 とおりの方法で作成されます。</p>
<ul>
<li>自動。メディアデータベースから取り出されたメタデータ情報で自動的に作成されます。この処理はスクリプトやコードによって実行されます。あらかじめ決められたスケジュールに従ってデータが取得され、CDF 対応のカタログファイルに変換されて、S3 バケットにアップロードされます。一度正しく実行されればそれ以降は人が介入せずに済むため、通常はこの方法をお勧めします。<br></li>
<li>手動。カタログファイルの保守担当者が定期的に作成します。<br></li>
</ul>
<p>カタログファイルの作成を自動で行っている会社では、カタログファイルにではなく、ソースデータベースそのものに、いくつかの修正や変更を加える必要があります。データベースへのアクセスはデータベース管理者に限定されていることが多く、変更作業にはデータベース管理者の協力が必要です。アクセス権を与えてもらうか、変更を依頼してください。また、データから CDF ファイルを作成するコードの不備をなくすために、開発者とも連携する必要があります。</p>
<p>カタログの保守を手動で行っている会社では、アクセス制限は比較的緩いと考えられます。<br></p>大きなカタログになると、警告や推奨事項が数千件に達することも少なくありません。通常、数千件の警告のうち、実際に当てはまる項目はほんの一握りです。一括検索・置換によって修正できる問題であることは多くありません。たとえば、キャストとクルーの情報を 10,000 件の項目に追加するように推奨された場合、それに従うためには、それぞれの項目を個別に修正する必要があります。警告と推奨事項は、カタログの使用を妨げるものではありません。それらに対処するかどうかは、時間とリソースの余裕次第となります。<br>
<h3>このドキュメントで使われている表記について</h3>
<p>"CDF ファイル" は、開発者様が Amazon にアップロードするカタログデータファイルです。インジェストレポートの基になるファイルでもあります。<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference">カタログデータ形式（CDF）スキーマ</a>に準拠する XML ファイルとなっています。このファイルの内容について詳しくは、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-cdf-overview">カタログデータ形式（CDF）について</a>」を参照してください。</p>
<p><em><strong>WorkID</strong></em> は、問題が見つかった作品の要素（Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra）の ID です。たとえば、映画の場合、CDF ファイルの movie 項目にある ID 要素の値を指します。インジェストレポート内の各メッセージを展開すると、そのメッセージの原因となった作品ごとの ID が表示されます。</p>
<p><strong>詳細メッセージ</strong>は、レポート内の特定のエラー、警告、推奨事項を展開したときに、<em>WorkID</em> ごとに別途表示されるテキストです。その作品に関して、メッセージの理由が具体的に記載されます。ただし、詳細メッセージが存在しない場合もあります。その場合は <em>WorkID</em> のみが記載されます。</p>
<p>入れ子になった要素はピリオドで区切って表記されます。たとえば、TvEpisode.Credits.CrewMember は、TvEpisode 要素の子である Credits 要素の子要素 CrewMember を表します。Movie.ID は movie 要素の子として存在する ID 要素です。</p>
<p>強調以外の用途で使われている<em>斜体</em>は、実際の値のプレースホルダーです。数字は <em>nn</em>、テキスト文字列は <em>ss</em>、URL は <em>url</em> のように表記されます。</p>
<p>例に使用されている省略記号（...）は、そのテーマに関連した何らかの情報が、簡潔にわかりやすく表記する関係で省略されていることを示します。<br></p>
<hr>

<h2>エラー</h2>
<p>インジェストレポートの「エラー」セクションに 1 つでもメッセージが存在する場合、CDF ファイルは拒否されます。報告されたエラーをすべて修正して、CDF ファイルを再提出してください。</p>
<p><strong>エラー</strong><br>
<a href="#bad_file_parse">Invalid catalog file</a><br>
<a href="#id_not_unique">ID is not unique</a><br>
<a href="#miniseries_id_invalid">MiniSeriesEpisode references an invalid MiniSeriesID</a><br>
<a href="#miniseries_not_found">Referenced MiniSeries not found</a><br>
<a href="#tvseason_not_found">Referenced TvSeason not found</a><br>
<a href="#tvshow_not_found">Referenced TvShow not found</a><br>
<a href="#title_required">Title is required and cannot be blank</a><br>
<a href="#too_many_invalid_images">Too many invalid images</a><br>
<a href="#seasonid_invalid">TvEpisode references an invalid SeasonID</a><br>
<a href="#showid_invalid_tvepisode">TvEpisode references an invalid ShowID</a><br>
<a href="#showid_invalid_tvspecial">TvSpecial references an invalid ShowID</a></p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr>

<h3>エラー: Invalid catalog file</h3>
<p><strong>詳細メッセージ</strong>: Unable to parse provided catalog</p>
<p><strong>問題</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">CDF ファイルが無効です。このメッセージに遭遇することはまれです。実際に多く見られるのはむしろ XML の検証に関するエラーメッセージです。</p>
<p><strong>対処方法</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">Xmllint などのツールや、Notepad++ の検証プラグインを使用してファイルを検証し、エラー箇所を特定してください。ファイルが無効である理由としては、終了タグの漏れ、未定義の要素の使用（単純なタイプミスのほか、XML であるにもかかわらず大文字と小文字が区別されていないなど）、要素の順序の誤り、必要な要素や属性の漏れなど、さまざまな原因が考えられます。このエラーを回避するには、<em>事前に</em>ファイルを検証してから提出するようにしてください。</p>
<p><strong>関連項目</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><a title="カタログデータ形式 - リファレンス（1.3）" target="_blank" href="https://developer.amazon.com/public/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference">カタログデータ形式（CDF）スキーマリファレンス</a><br>
<a href="https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog-13.xsd">カタログデータ形式（CDF）XSD</a><br>
<a href="https://s3.amazonaws.com/com.amazon.aftb.cdf/cdf-examples.zip">サンプル CDF ファイルのダウンロード</a><br>
<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-integration#手順 2:CDF ファイルの検証">スキーマを使って CDF ファイルを検証する方法</a></p>
<hr>

<h3>エラー: ID is not unique</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em> <em>nn</em> works have this ID</p>
<p><strong>例:</strong> <strong>tt123456</strong> 6 works have this ID</p>
<p><strong>問題</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">同じ ID を持った複数の項目がファイルに存在します。CDF ファイル内の作品（Movie、TvShow、TvSeason、TvEpisode など）には、それぞれ一意の ID が割り当てられている必要があります。</p>
<p><strong>対処方法</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">この ID（この例では tt123456）に該当するすべての作品を CDF ファイルで特定してください。1 つを除くすべての ID を変更します。変更後の ID が一意となるように注意してください。CDF ファイルのソースがデータベースである場合、作品のデータベースキーをその ID の一部とすることで一意性を確保することが可能です。ID の割り当てに関する方針を決め、確実に従うようにしてください。</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><strong>注意:</strong> ID を変更するときは、その参照も変更する必要があります。たとえば、TvShow.ID を変更した場合、その TV 番組の TvSeason.ShowID、TvEpisode.ShowID、TvSpecial.ShowID、Extra.RelatesToID 要素もすべて、それに合わせて変更する必要があります。</p>
<p><strong>該当する可能性のある要素</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em>WorkType</em>.ID<br>
<br>
<em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr>

<h3>エラー: MiniSeriesEpisode references an invalid MiniSeriesID</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em></p>
<p><strong>例:</strong> <strong>tt123456</strong> MiniSeriesEpisode references an invalid MiniSeriesID</p>
<p><strong>問題</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">指定された作品 ID（この例では tt123456）の MiniSeriesEpisode に MiniSeriesID 要素が存在しますが、その内容が空です。</p>
<p><strong>対処方法</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">CDF ファイルで、このエピソードの従属先となる MiniSeries 要素を探します。存在する場合は、その ID 値をメモします。MiniSeriesEpisode の項目に移動してその MiniSeriesID 要素を特定し、MiniSeries ID に合わせて値を変更します。つまり、MiniSeries.ID = MiniSeriesEpisode.MiniSeriesID となっている必要があります。</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">MiniSeries 要素が存在せず、追加する予定もない場合は、MiniSeriesEpisode.MiniSeriesID ではなく MiniSeriesEpisode.MiniSeriesTitle を使用してください。MiniSeriesEpisode.MiniSeriesTitle は、指定されたとおりに使用されます。何かに合わせる必要はありません。この方法が推奨されるのは、MiniSeries 要素が存在しない場合のみです。もっと厳密に TvSpecial としてタグ付けできないかも併せて検討してください。</p>
<p><strong>該当する可能性のある要素</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">MiniSeries.ID<br>
MiniSeriesEpisode.MiniSeriesID<br>
MiniSeriesEpisode.MiniSeriesTitle</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr>

<h3>エラー: Referenced MiniSeries not found</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em> MiniSeriesEpisode references a missing MiniSeries with ID of <em>ss</em></p>
<p><strong>例:</strong> <strong>tt123456</strong> MiniSeriesEpisode references a missing MiniSeries with ID of nn654321</p>
<p><strong>問題</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">指定された作品 ID（この例では tt123456）の MiniSeriesEpisode には、その MiniSeries の ID（この例では nn654321）が指定されていますが、対応する MiniSeries がカタログ内に存在しません。</p>
<p><strong>対処方法</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">CDF ファイルで、このエピソードの従属先となる MiniSeries 要素を探します。存在する場合は、その ID 値をメモします。MiniSeriesEpisode の項目に移動してその MiniSeriesID 要素を特定し、MiniSeries ID に合わせて値を変更します。つまり、MiniSeries.ID = MiniSeriesEpisode.MiniSeriesID となっている必要があります。</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">MiniSeries 要素が存在せず、追加する予定もない場合は、MiniSeriesEpisode.MiniSeriesID ではなく MiniSeriesEpisode.MiniSeriesTitle を使用してください。MiniSeriesEpisode.MiniSeriesTitle は、指定されたとおりに使用されます。何かに合わせる必要はありません。この方法が推奨されるのは、MiniSeries 要素が存在しない場合のみです。もっと厳密に TvSpecial としてタグ付けできないかも併せて検討してください。</p>
<p><strong>該当する可能性のある要素</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">MiniSeries.ID<br>
MiniSeriesEpisode.MiniSeriesID<br>
MiniSeriesEpisode.MiniSeriesTitle</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr>

<h3>エラー: Referenced TvSeason not found</h3>
<p><strong>詳細メッセージ:</strong> <strong><em>WorkID</em> TvEpisode references a missing TvSeason with ID of <em>ss</em></strong></p>
<p><strong><strong>例:</strong> <strong>tt123456</strong> TvEpisode references a missing TvSeason with ID of nn654321</strong></p>
<p><strong>問題</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">指定された作品 ID（この例では tt123456）の TvEpisode には、その TvSeason の ID（この例では nn654321）が指定されていますが、対応する TvSeason がカタログ内に存在しません。</p>
<p><strong>対処方法</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">CDF ファイルで、このエピソードの従属先となる TvSeason 要素を探します。TvSeason が存在する場合は、その ID 値をメモします。TvEpisode の項目に移動してその SeasonID 要素を特定し、TvSeason の ID に合わせて値を変更します。つまり、TvSeason.ID = TvEpisode.SeasonID となっている必要があります。</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">TvSeason 要素が存在せず、追加する予定もない場合は、TvEpisode.SeasonID ではなく TvEpisode.SeasonInShow を使用してください。オプションの TvEpisode.SeasonTitle を追加することもできます。TvEpisode.SeasonInShow と TvEpisode.SeasonTitle は、指定されたとおりに使用されます。何かに合わせる必要はありません。この方法が推奨されるのは TvSeason 要素が存在しない場合のみです。空にするのは、その情報をどうしても入手できない場合に限定してください。</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><strong>注意:</strong> 番組のリリースや編成がシーズンによって分類されているとは限りません。そのような場合は、TvEpisode ではなく、TvShow に関連付けられた TvSpecial として、または MiniSeries に関連付けられた MiniSeriesEpisode として作品を分類することを検討してください。</p>
<p><strong>該当する可能性のある要素</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">TvSeason.ID<br>
TvEpisode.SeasonID<br>
TvEpisode.SeasonInShow<br>
TvEpisode.SeasonTitle</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr>

<h3>エラー: Referenced TvShow not found</h3>
<p><strong>詳細メッセージ:</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em><strong>WorkID</strong></em> TvEpisode references a missing TvShow with ID of <em>ss</em><br>
<em><strong>WorkID</strong></em> TvSpecial references a missing TvShow with ID of <em>ss</em></p>
<p><strong>例:</strong> <strong>tt123456</strong> TvEpisode references a missing TvShow with ID of nn654321</p>
<p><strong>問題</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">この問題は、TvEpisode または TvSpecial で発生する場合があります。指定された作品 ID（この例では tt123456）のエピソードまたは特別番組には、その TvShow の ID（この例では nn654321）が指定されていますが、対応する TvShow がカタログ内に存在しません。</p>
<p><strong>対処方法</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">CDF ファイルで、エピソードまたはスペシャルの従属先となる TvShow 要素を探します。TvShow が存在する場合は、その ID 値をメモします。TvSpecial または TvEpisode の項目に移動してその ShowID 要素を特定し、その番組の ID に合わせて値を変更します。つまり、TvShow.ID = TvEpisode.ShowID または TvShow.ID = TvSpecial.ShowID となっている必要があります。</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">TvShow が存在せず、追加する予定もない場合は、ShowID ではなく ShowTitle を使用してください。ShowTitle は、指定されたとおりに使用されます。何かに合わせる必要はありません。この方法が推奨されるのは TvShow 要素が存在しない場合のみです。この場合、TvShow 要素を追加すべきかどうか、または、もっと厳密に TvSpecial としてタグ付けできないかという問題が浮上します。</p>
<p><strong>該当する可能性のある要素</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">TvShow.ID<br>
TvEpisode.ShowID<br>
TvSpecial.ShowID<br>
TvEpisode.ShowTitle<br>
TvSpecial.ShowTitle</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr>

<h3>エラー: Title is required and cannot be blank</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em></p>
<p><strong>問題</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">CDF ファイルには、指定された ID の Title 要素が存在しますが、対応するタイトルテキストが存在しません。</p>
<p><strong>対処方法</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">該当する ID の作品を CDF ファイルから探し、その Title 要素を特定して、テキストを指定してください。以下に例を示します。</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><strong>修正前:</strong> &lt;Title locale="en-US"&gt;&lt;/Title&gt;<br>
<strong>修正後:</strong> &lt;Title locale="en-US"&gt;City Lights&lt;/Title&gt;</p>
<p><strong>該当する可能性のある要素</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em>WorkType</em>.Title<br>
<br>
<em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr>

<h3>エラー: Too many invalid images</h3>
<p>「<a href="#image">画像関連のメッセージ</a>」を参照してください。<br></p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr>

<h3>エラー: TvEpisode references an invalid SeasonID</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em></p>
<p><strong>例:</strong> <strong>tt123456</strong> TvEpisode references an invalid SeasonID</p>
<p><strong>問題</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">指定された作品 ID（この例では tt123456）の TvEpisode に SeasonID 要素が存在しますが、その内容が空です。</p>
<p><strong>対処方法</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">CDF ファイルで、このエピソードの従属先となる TvSeason 要素を探します。存在する場合は、その ID 値をメモします。TvEpisode の項目に移動してその SeasonID 要素を特定し、TvSeason の ID に合わせて値を変更します。つまり、TvSeason.ID = TvEpisode.SeasonID となっている必要があります。</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">TvSeason 要素が存在せず、追加する予定もない場合は、TvEpisode.SeasonID ではなく TvEpisode.SeasonInShow を使用してください。TvEpisode.SeasonInShow は単なる数値であり、指定されたとおりに使用されます。オプションの TvEpisode.SeasonTitle 要素を追加することもできます。この要素も指定されたとおりに使用されます。何かに合わせる必要はありません。この方法が推奨されるのは、TvSeason 要素が存在しない場合のみです。</p>
<p><strong>該当する可能性のある要素</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">TvSeason.ID<br>
TvEpisode.SeasonID<br>
TvEpisode.SeasonInSeries<br>
TvEpisode.SeasonTitle</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr>

<h3>エラー: TvEpisode references an invalid ShowID</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em></p>
<p><strong>例:</strong> <strong>tt123456</strong> TvEpisode references an invalid ShowID</p>
<p><strong>問題</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">指定された作品 ID（この例では tt123456）の TvEpisode に ShowID 要素が存在しますが、その内容が空です。</p>
<p><strong>対処方法</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">CDF ファイルで、このエピソードの従属先となる TvShow 要素を探します。存在する場合は、その ID 値をメモします。TvEpisode の項目に移動してその ShowID 要素を特定し、TvShow の ID に合わせて値を変更します。つまり、TvShow.ID = TvEpisode.ShowID となっている必要があります。</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">TvShow が存在せず、追加する予定もない場合は、TvEpisode.ShowID ではなく TvEpisode.ShowTitle を使用してください。ShowTitle は、指定されたとおりに使用されます。何かに合わせる必要はありません。この方法が推奨されるのは TvShow 要素が存在しない場合のみです。この場合、TvShow 要素を追加すべきかどうか、または、もっと厳密に TvSpecial としてタグ付けできないかという問題が浮上します。</p>
<p><strong>該当する可能性のある要素</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">TvShow.ID<br>
TvEpisode.ShowID<br>
TvEpisode.ShowTitle</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr>

<h3>エラー: TvSpecial references an invalid ShowID</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em></p>
<p><strong>例:</strong> <strong>tt123456</strong> TvSpecial references an invalid ShowID</p>
<p><strong>問題</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">指定された作品 ID（この例では tt123456）の TvSpecial に ShowID 要素が存在しますが、その内容が空です。</p>
<p><strong>対処方法</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">CDF ファイルで、この特別番組の従属先となる TvShow 要素を探します。存在する場合は、その ID 値をメモします。TvSpecial の項目に移動してその ShowID 要素を特定し、TvShow の ID に合わせて値を変更します。つまり、TvShow.ID = TvSpecial.ShowID となっている必要があります。</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">TvShow が存在せず、追加する予定もない場合は、TvSpecial.ShowID ではなく TvSpecial.ShowTitle を使用してください。ShowTitle は、指定されたとおりに使用されます。何かに合わせる必要はありません。この方法が推奨されるのは、TvShow 要素が存在しない場合のみです。TvSpecial の場合、この情報は省略可能です。ShowID/ShowTitle を省略してもかまいません。</p>
<p><strong>該当する可能性のある要素</strong></p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">TvShow.ID<br>
TvSpecial.ShowID<br>
TvSpecial.ShowTitle</p>
<hr>
<hr>



<h2>警告</h2>
<p>警告が原因でカタログのインジェストに失敗することはありません（ただし、画像関連の警告は例外です。あまりに多いと失敗する可能性があります）が、リソースが許す範囲で対処してください。特に、CDF スキーマが変更されていることを示す非推奨警告は注意が必要です。従来と同じようにはデータを使用できなくなる可能性があります。
</p>
<p><strong>警告</strong>
<br /> <a href="#bad_aspect_ratio_link_warn">Aspect ratio should be between %f and %f (%f to %f preferred.)</a>
<br /> <a href="#copyright">Copyright is optional but should not be blank if supplied</a>
<br /> <a href="#credit_name">CastMember or CrewMember name should not be blank</a>
<br /> <a href="#externalid">ExternalID is optional but should not be blank if supplied</a>
<br /> <a href="#image_height_link_warn">Image height must be greater than %d pixels (greater than %d pixels preferred)</a>
<br /> <a href="#year">Inconsistent release year information</a>
<br /> <a href="#invalid_image">Invalid image</a>
<br /> <a href="#miniseries">MiniSeries is not associated with any MiniSeriesEpisodes</a>
<br /> <a href="#castmember">Possible invalid string found for optional CastMember Role element</a>
<br /> <a href="#quality_dep">Quality element in Offer is deprecated in favor of Quality element in LaunchDetails</a>
<br /> <a href="#releaseinfo_dep">ReleaseInfo element is deprecated</a>
<br /> <a href="#role">Role (character name) is optional but should not be blank if supplied</a>
<br /> <a href="#minutes">Runtime minutes is not within expected range of 1 to 2880 minutes</a>
<br /> <a href="#shortdesc">The ShortDescription should not be the same as the Title</a>
<br /> <a href="#synopsis_v_shortdesc_1">The Synopsis should be longer and more descriptive than the ShortDescription</a>
<br /> <a href="#synopsis_v_shortdesc_2">The Synopsis should not be the same as the ShortDescription</a>
<br /> <a href="#synopsis_v_title">The Synopsis should not be the same as the Title</a>
<br /> <a href="#escaped_text">Text contains characters that are escaped more than once</a>
<br /> <a href="#tvseason_v_episodes">TvSeason is not associated with any TvEpisodes</a>
<br /> <a href="#tvshow_v_episodes">TvShow is not associated with any TvEpisodes or TvSpecials</a>
<br /> <a href="#unsupported_image_link">Unsupported image type. Provided image not JPG or PNG format</a>
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr />
<h3>警告: Aspect ratio should be between %f and %f (%f to %f preferred.)
<br />
</h3>
<p>「<a href="#image">画像関連のメッセージ</a>」を参照してください。このメッセージは重要度に応じて、警告として表示される場合と推奨事項として表示される場合とがあります。
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr />
<h3>警告: Copyright is optional but should not be blank if supplied
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em>
</p>
<p><strong>問題</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">該当する ID の作品には Copyright 要素が存在しますが、著作権情報のテキストが存在しません。
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">Copyright 要素は省略可能であるため、著作権情報がわからない場合は削除してもかまいません。それ以外の場合は、指定された ID に該当する作品の要素を CDF ファイルから探し、その Copyright 要素を特定して、欠落している情報を追加してください。以下に例を示します。
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><strong>修正前:</strong> &lt;Copyright locale="en-US"&gt;&lt;/Copyright&gt;
<br /> <strong>修正後:</strong> &lt;Copyright locale="en-US"&gt;© 1894 Edison Manufacturing Company&lt;/Copyright&gt;
</p>
<p><strong>該当する可能性のある要素</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em>WorkType</em>.Copyright
<br />
<br /> <em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="credit_name"></a>
<h3>警告: CastMember or CrewMember name should not be blank
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em>
</p>
<p><strong>問題</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">この警告が該当するのは、CastMember または CrewMember です。その人物の Name 要素が CDF ファイルに存在しますが、その人の名前が欠落しています。
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">指定された ID の作品要素を CDF ファイルから探してください。作品の Credits 要素を探します。その Credits セクションにある各 CastMember 要素または CrewMember 要素を見て、Name 要素が空になっている箇所をすべて洗い出し、その情報を追加します。以下に例を示します。
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><strong>修正前:</strong> &lt;Name locale="en-US"&gt;&lt;/Name&gt;
<br /> <strong>修正後:</strong> &lt;Name locale="en-US"&gt;Alan Smithee&lt;/Name&gt;
</p>
<p><strong>該当する可能性のある要素</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em>WorkType</em>.CastMember.Name
<br /> <em>WorkType</em>.CrewMember.Name
<br />
<br /> <em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="externalid"></a>
<h3>警告: ExternalID is optional but should not be blank if supplied
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em>
</p>
<p><strong>問題</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">CDF ファイルに ExternalID 要素が存在しますが、その情報が指定されていません。ExternalID は、他のソース（IMDb など）から作品や人物に割り当てられた ID や DVD ボックスの UPC コードです。作品（Movie、TvShow など）、CastMember、CrewMember が ExternalID の対象となります。ExternalID があることで、そのソースにリンクしたり、ソースから情報をインジェストしたりすることができます。たとえば、キャストやクルーのメンバーについて、該当する IMDb の ExternalID を使用すれば、その写真や説明をインポートすることができます。
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">指定された ID の要素を CDF ファイルから探してください。そこから各 ExternalID 要素を探します。1 つの作品に複数の ExternalID 要素が存在する場合もあります（CrewMember 要素や CastMember 要素に加えて、その作品そのものの ExternalID が存在することがあるため）。ExternalID 要素は省略可能であるため、必要であれば削除してもかまいません。それ以外の場合は、欠落している情報を追加してください。CastMember の例を次に示します。
</p>
<table style="margin-left: 30.0px;"> <tbody>
<tr>
<td>
<pre>&lt;Movie&gt;
&lt;ID&gt;<em>WorkID</em>&lt;/ID&gt;
&lt;ExternalID scheme="imdb"&gt;tt0029843&lt;/ExternalID&gt;
...
&lt;Credits&gt;
&lt;CastMember&gt;
&lt;Name locale="en-US"&gt;Errol Flynn&lt;/Name&gt;
&lt;ExternalID scheme="imdb"&gt;nm0653028&lt;/ExternalID&gt;
</pre> </td>
</tr> </tbody>
</table>
<p><strong>該当する可能性のある要素</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em>WorkType</em>.ExternalID
<br /> <em>WorkType</em>.CastMember.ExternalID
<br /> <em>WorkType</em>.CrewMember.ExternalID
<br />
<br /> <em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="image_height_link_warn"></a>
<h3>警告: Image height must be greater than %d pixels (greater than %d pixels preferred)
<br />
</h3>
<p>「<a href="#image">画像関連のメッセージ</a>」を参照してください。このメッセージは重要度に応じて、警告として表示される場合と推奨事項として表示される場合とがあります。
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="year"></a>
<h3>警告: Inconsistent release year information
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em> Provided ReleaseYear <em>yyyy</em> differs from the year <em>yyyy</em> in the <em>ss</em> element
</p>
<p>例:
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><strong>tt123456</strong> Provided ReleaseYear 1959 differs from the year 1960 in the OriginalAirDate element
<br /> <strong>tt456789</strong> Provided ReleaseYear 1977 differs from the year 1978 in the ReleaseDate element
</p>
<p><strong>問題</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">作品のリリース年が複数の箇所で指定されていますが、それらが一致しません。ReleaseYear の他に、OriginalAirDate または ReleaseDate が指定されており、それぞれに年が含まれています。調査を行う際には、2 種類の ReleaseDate 要素が存在することに注意してください。1 つは作品の直接の子要素で、もう 1 つは非推奨となった ReleaseInfo 要素の子要素です。ReleaseDate が存在するのは、Movie 要素、TvShow 要素、MiniSeries 要素だけです。非推奨となった ReleaseInfo.ReleaseDate はすべての作品タイプに存在します。OriginalAirDate は、TvEpisode 要素、TvSpecial 要素、MiniSeriesEpisode 要素にしか存在しません。
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><strong>注意:</strong> 今後新たにカタログに追加するときは、非推奨となった ReleaseInfo.ReleaseDate 要素は使用しないでください。この要素が非推奨となる前からカタログが存在する場合は、最新のスキーマに合わせてカタログを更新することをお勧めします。その手順については、以下の「<a href="#releaseinfo_dep">ReleaseInfo element is deprecated</a>」を参照してください。
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">指定された WorkID（この例では tt123456 または tt456789）の要素を CDF ファイルから探してください。その ReleaseYear 要素を探し、年が正しいことを確認して、その値をメモします。次に、該当する作品の OriginalAirDate または ReleaseDate のインスタンスを探し、それらの文字列の年が一致していることを確認します。OriginalAirDate と ReleaseDate のデータには厳密な形式（例: 2003-08-08T00:00:00Z）が使用されており、年はあくまでその一部となります。
</p>
<p><strong>該当する可能性のある要素</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em>WorkType</em>.ReleaseYear
<br /> <em>WorkType</em>.ReleaseDate
<br /> <em>WorkType</em>.ReleaseInfo.ReleaseDate
<br />
<br /> <em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="invalid_image"></a>
<h3>警告: Invalid image
</h3>
<p>「<a href="#image">画像関連のメッセージ</a>」を参照してください。
<br />
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="miniseries"></a>
<h3>警告: MiniSeries is not associated with any MiniSeriesEpisodes
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em>
</p>
<p><strong>問題</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">CDF ファイルには、MiniSeries の項目が存在しますが、エピソードが 1 つも存在しません。空のミニシリーズを選択できる状態となるため、ユーザーエクスペリエンスの低下につながります。これには 2 つの原因が考えられます。1 つは、MiniSeriesEpisode 要素が CDF ファイルに含まれていないことです。もう 1 つは、それらのエピソードが CDF ファイルに存在するものの、指定されているミニシリーズが間違っていることです。
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">その MiniSeries に該当しそうな MiniSeriesEpisode 要素を CDF ファイルから探します。見つかりましたか？
</p>
<ul>
<li><strong>いいえ:</strong> それらを追加する必要があります。</li>
<li> <strong>はい:</strong> 対応する MiniSeries はどのように指定されていますか。MiniSeriesID 要素ですか、それとも MiniSeriesTitle 要素ですか？
<ul>
<li><strong>MiniSeriesID:</strong> MiniSeries.ID の値（詳細メッセージの WorkID）と一致させます。</li>
<li><strong>MiniSeriesTitle:</strong> 大文字と小文字の区別も含め、MiniSeries.Title の値と厳密に一致させます。</li>
</ul></li>
</ul>
<p><strong>該当する可能性のある要素</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">MiniSeries.ID
<br /> MiniSeries.Title
<br /> MiniSeriesEpisodes.MiniSeriesID
<br /> MiniSeriesEpisodes.MiniSeriesTitle
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="castmember"></a>
<h3>警告: Possible invalid string found for optional CastMember Role element
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em> Please confirm that <em>text</em> is a valid Role (character name)
</p>
<p>例:
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><strong>tt123456</strong> Please confirm that Actor is a valid Role (character name)
<br /> <strong>tt123456</strong> Please confirm that Unknown is a valid Role (character name)
</p>
<p><strong>問題</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">この警告が生成される状況は限定されています。現時点では、検出対象となる値は CastMember.Role 要素に含まれる "Unknown" と "Actor" だけです。Role 要素は、作品の中で俳優が演じた役柄の名前（Han Solo など）を指定する目的で存在します。CastMember に指定される項目は当然、俳優（Actor）となります。もっとも、"Actor" や "Unknown" が、役柄の名前として本当に存在するケースもまれに存在します。そのような場合、この警告が逐一レポートに表示されるのを防ぐために、それらの項目の名称を変更することを検討してください（"Actor #1" や "The Unknown" など）。Role 要素を追加したにもかかわらず何も指定しなかった場合は、これとは異なる警告が表示されます。
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">指定された ID の作品要素を CDF ファイルから探してください。その Credits セクションを探します。そこに含まれている CastMember 要素を探し、Role 要素に "Actor" や "Unknown" が含まれていないか確認します。Role 要素は省略可能であるため、役柄の名前がわからない場合は省略してもかまいません。わかっている場合は、役柄の名前を追加してください。
</p>
<p><strong>該当する可能性のある要素</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em>WorkType</em>.Credits.CastMember.Role
<br />
<br /> <em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="quality_dep"></a>
<h3>警告: Quality element in Offer is deprecated in favor of Quality element in LaunchDetails
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em>
</p>
<p><strong>問題</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">CDF スキーマは変更されましたが、以前のスキーマバージョンに由来する要素がファイルに使用されています。このケースでは、CDF バージョン 1.2 以降、各 Offer タイプの Quality 要素が、新しい Offers.<em>OfferType</em>.LaunchDetails 要素の下に移動されましたが、それ以外の点では同じです。ご利用のファイルでは、Quality 要素が、依然として Offers.<em>OfferType</em> の直下に置かれています。
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">技術的な対応は一切不要です。既存の Quality 値が引き続き使用されます。ただし、インジェストレポートを見やすくするために、リソースが許す範囲でファイルを更新してください。
</p>
<ul>
<li> <strong>メディアデータベースから CDF ファイルが自動的に生成された場合</strong>: ご利用のデータベースから情報を取得して CDF 形式にインジェストするスクリプトや変換については更新が必要です。データベース管理者（DBA）に連絡して、Quality の値を今後は Offers.<em>OfferType</em>.Quality にではなく Offers.<em>OfferType</em>.LaunchDetails.Quality 要素にエクスポートするよう依頼してください。DBA の方は、<a href="https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog-13.xsd">カタログデータ形式（CDF）の XSD</a> で LaunchElement の適切な配置を確認できます。</li>
<li><strong>データベースの構造が CDF 形式と一致する場合</strong>: この場合もやはり、変更を DBA が行う必要があります。このケースでは、新しい CDF の構造に合わせてデータベース自体の設計を若干変更する必要があります。</li>
<li> <strong>CDF ファイルを手動で作成した場合</strong>: 該当する ID の作品を CDF ファイルから探してください。対応する Offers 要素を探します。現在 Offers.<em>OfferType</em>.Quality 要素を含んでいる Offer タイプごとに次の手順を実行します。
<ol>
<li>LaunchDetails 要素を追加します。追加する位置に注意してください。SubscriptionOffer タイプや FreeOffer タイプの最後の要素とし、PurchaseOffer タイプと RentalOffer タイプの PriceType 要素の直前に配置してください。</li>
<li>LaunchDetails 要素に Quality 要素を追加します。元の要素で使用されていたものと同じ値（SD、HD、UHD のいずれか）を指定します。</li>
<li>元の Offers.<em>OfferType</em>.Quality 要素を削除します。</li>
</ol></li>
</ul>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">変更の例を次に示します。
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><strong>変更前</strong>
</p>
<table style="margin-left: 30.0px;"> <tbody>
<tr>
<td>
<pre>&lt;Movie&gt;
...
&lt;Offers&gt;|
&lt;FreeOffer&gt;
&lt;Quality&gt;HD&lt;/Quality&gt;
...
&lt;/FreeOffer&gt;
...
&lt;/Offers&gt;
...
&lt;/Movie&gt;</pre> </td>
</tr> </tbody>
</table>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><strong>変更後</strong>
</p>
<table style="margin-left: 30.0px;"> <tbody>
<tr>
<td>
<pre>&lt;Movie&gt;
...
&lt;Offers&gt;|
&lt;FreeOffer&gt;
....
&lt;LaunchDetails&gt;
&lt;Quality&gt;HD&lt;/Quality&gt;
&lt;/LaunchDetails&gt;
&lt;/FreeOffer&gt;
...
&lt;/Offers&gt;
...
&lt;/Movie&gt;</pre> </td>
</tr> </tbody>
</table>
<p><strong>該当する可能性のある要素</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em>WorkType</em>.Offers.<em>OfferType</em>.Quality（非推奨）
<br /> <em>WorkType</em>.Offers.<em>OfferType</em>.LaunchDetails.Quality
<br />
<br /> <em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。
<br /> <em>OfferType</em> は SubscriptionOffer、FreeOffer、PurchaseOffer、RentalOffer のいずれかとなります。
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="releaseinfo_dep"></a>
<h3>警告: ReleaseInfo element is deprecated
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em> Please use the <em>ReleaseDate / OriginalAirDate / ReleaseYear</em> element instead for <em>WorkType</em>
</p>
<p>例:
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><strong>tt123456</strong> Please use the ReleaseDate element instead for ShowType
<br /> <strong>tt45678</strong> Please use the OriginalAirDate element instead for EpisodeType
</p>
<p><strong>問題</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">CDF スキーマは変更されましたが、以前のスキーマバージョンに由来する要素がファイルに使用されています。このケースでは、CDF バージョン 1.3 以降、ReleaseInfo 要素（すべての作品タイプに存在していた）は非推奨となり、今後は作品タイプごとの値が推奨されます。ReleaseInfo には、2 つの子要素が存在していました （ReleaseDate と ReleaseCountry）。今後 ReleaseCountry の情報は使用されません。今後は ReleaseDate の情報が作品タイプに基づいて保存されます（Movie、TvShow、MiniSeries タイプでは ReleaseDate が使用され、TvEpisode、TvSpecial、MiniSeriesEpisode タイプでは OriginalAirDate が使用されます）。
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">技術的な対応は一切不要です。既存の ReleaseInfo.ReleaseDate 値が引き続き使用されます。ただし、インジェストレポートを見やすくするために、リソースが許す範囲でファイルを更新してください。
</p>
<ul>
<li> <strong>メディアデータベースから CDF ファイルが自動的に生成された場合</strong>: ご利用のデータベースから情報を取得して CDF 形式にインジェストするスクリプトや変換については更新が必要です。データベース管理者（DBA）に連絡し、次のことを伝えてください。
<ul>
<li>作品のリリース日は従来、<em>WorkType</em>.ReleaseInfo.ReleaseDate に保存されていましたが、今後は <em>WorkType</em>.OriginalAirDate（TvEpisode、TvSpecial、MiniSeriesEpisode タイプの場合）と <em>WorkType</em>.ReleaseDate（Movie、TvShow、MiniSeries タイプの場合）にエクスポートする必要があります。</li>
<li>ReleaseInfo 要素は削除する必要があります。</li>
</ul>DBA の方は、<a href="https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog.xsd">カタログデータ形式（CDF）の XSD</a> を参照してください。</li>
<li><strong>データベースの構造が CDF 形式と一致する場合</strong>: この場合もやはり、変更を DBA が行う必要があります。このケースでは、新しい CDF の構造に合わせてデータベース自体の設計を若干変更する必要があります。</li>
<li> <strong>CDF ファイルを手動で作成した場合</strong>: 該当する ID の作品を CDF ファイルから探してください。対応する ReleaseInfo 要素を探して ReleaseDate の値をメモします。
<ul>
<li><strong>作品タイプが Movie、TvShow、MiniSeries のいずれかである場合</strong>: その作品の要素の一番最後に ReleaseDate 要素（値を含む）を追加します。</li>
<li><strong>作品タイプが TvEpisode、TvSpecial、MiniSeriesEpisode のいずれかである場合</strong>: その作品の要素の一番最後に OriginalAirDate 要素（値を含む）を追加します。</li>
<li><strong>作品タイプに関係なく:</strong> 新しい要素を設定した後、元の ReleaseInfo 要素を削除します。</li>
</ul></li>
</ul>
<p><strong>該当する可能性のある要素</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em>WorkType</em>.ReleaseInfo（非推奨）
<br /> <em>WorkType</em>.ReleaseInfo.ReleaseDate（非推奨）
<br /> <em>WorkType</em>.ReleaseInfo.ReleaseCountry（非推奨）
<br />
<br /> <em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。
<br />
<br /> Movie.ReleaseDate
<br /> TvShow.ReleaseDate
<br /> MiniSeries.ReleaseDate
<br /> TvEpisode.OriginalAirDate
<br /> TvSpecial.OriginalAirDate
<br /> MiniSeriesEpisode.OriginalAirDate
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="role"></a>
<h3>警告: Role (character name) is optional but should not be blank if supplied
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em> Role (character name) for <em>​person</em> is blank
</p>
<p>例: <strong>tt123456</strong> <span>Role (character name) for Errol Flynn is blank</span>
</p>
<p><strong>問題</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">Role 要素が存在しますが、その情報が指定されていません。Role 要素は、作品の中で俳優が演じた役柄の名前（Han Solo など）を指定する目的で存在します。
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">該当する ID の作品を CDF ファイルから探してください（この例では tt123456）。その Credits セクションを探します。問題となっている人物（この例では Errol Flynn）の CastMember 要素を探し、その人物の Role 要素を特定します。Role は省略可能です。役柄の名前を追加するか、または、役柄の名前がわからない場合は Role 要素を削除してもかまいません。役柄の名前として "Unknown" は使用しないでください。
</p>
<p><strong>該当する可能性のある要素</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em>WorkType</em>.Credits.CastMember.Role
<br />
<br /> <em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="minutes"></a>
<h3>警告: Runtime minutes is not within expected range of 1 to 2880 minutes
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em> Please confirm that <em>nn</em> minutes is the correct runtime
</p>
<p>例: <strong>tt123456</strong> Please confirm that 99999999 minutes is the correct runtime
</p>
<p><strong>問題</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">CDF ファイルに存在する RuntimeMinutes 要素の値が大きすぎるか、小さすぎます。この値が 1 未満であるか、2880 分（48 時間）を超えていると、この警告が生成されます。よほどの理由がなければ、この範囲を下回ったり上回ったりすることはありません。この情報はエンドユーザーからも見えるので、ユーザーエクスペリエンスを損なわないためにも正確な情報を指定する必要があります。
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">該当する ID の作品を CDF ファイルから探してください（この例では tt123456）。対応する RuntimeMinutes 要素を探します。正しい値が指定されていることを確認します。RuntimeMinutes 要素は省略可能であり、削除してもかまいませんが、ユーザーエクスペリエンス上、それはお勧めできません。
</p>
<p><strong>該当する可能性のある要素</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em>WorkType</em>.RuntimeMinutes
<br />
<br /> <em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="shortdesc"></a>
<h3>警告: The ShortDescription should not be the same as the Title
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em>
</p>
<p><strong>問題</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">Title 要素と ShortDescription 要素にまったく同じテキストが指定されており、ユーザーエクスペリエンスを損なう原因となります。ShortDescription 要素は、ユーザーが自分にとって興味深い作品であるかどうかを判断できるよう、作品の概要として 2 ～ 3 行の情報を保持することを目的としています。その時点でユーザーはタイトルを把握済みです。
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">該当する ID の作品を CDF ファイルから探してください。対応する ShortDescription 要素を探します。この要素に指定されている作品の名前を、作品のプロットやテーマについての簡単な（2～3 行の）説明に置き換えてください。ShortDescription 要素は省略できます。説明が不要であれば、要素ごと削除してもかまいません。ただし、少なくとも ShortDescription はすべての作品に付けることをお勧めします。
</p>
<p><strong>該当する可能性のある要素</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em>WorkType</em>.ShortDescription
<br />
<br /> <em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="synopsis_v_shortdesc_1"></a>
<h3>警告: The Synopsis should be longer and more descriptive than the ShortDescription
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em>
</p>
<p><strong>問題</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">この作品についての ShortDescription と Synopsis の両方が CDF ファイルに存在します。内容は異なりますが、ShortDescription よりも短いテキストが Synopsis に使用されています。Synopsis は、2 ～ 3 行の ShortDescription では表現できない、作品の詳しい説明を保持することを目的とした要素です。
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">該当する ID の作品を CDF ファイルから探してください。作品の Synopsis 要素と ShortDescription 要素を探し、その内容を比較します。ユーザーエクスペリエンスを最大限に高めるという意味では、Synopsis の内容を拡充することをお勧めします。ただし、作品に関してそれ以上詳しい情報がないという場合には、Synopsis を省略してもかまいません。Synopsis は省略可能です。同様に shortDescription も省略可能ですが、少なくとも shortDescription は指定することをお勧めします。
</p>
<p><strong>該当する可能性のある要素</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em>WorkType</em>.ShortDescription
<br /> <em>WorkType</em>.Synopsis
<br />
<br /> <em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="synopsis_v_shortdesc_2"></a>
<h3>警告: The Synopsis should not be the same as the ShortDescription
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em>
</p>
<p><strong>問題</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">この作品についての ShortDescription と Synopsis の両方が CDF ファイルに存在し、2 つの要素に含まれているテキストがまったく同じです。Synopsis は、2 ～ 3 行の ShortDescription では表現できない、作品の内容に関する詳しい説明を保持することを目的とした要素です。
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">該当する ID の作品を CDF ファイルから探してください。作品の Synopsis 要素と ShortDescription 要素を探し、その内容を比較します。ShortDescription が 2 ～ 3 行を超えている場合は短くしてください。超えていない場合は、ユーザーエクスペリエンスを最大限に高めるために、Synopsis の内容を拡充します。ただし、作品に関してそれ以上詳しい情報がないという場合には、Synopsis を省略してもかまいません。Synopsis は省略可能です。同様に ShortDescription も省略可能ですが、少なくとも shortDescription は指定することをお勧めします。
</p>
<p><strong>該当する可能性のある要素</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em>WorkType</em>.ShortDescription
<br /> <em>WorkType</em>.Synopsis
<br />
<br /> <em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="synopsis_v_title"></a>
<h3>警告: The Synopsis should not be the same as the Title
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em>
</p>
<p><strong>問題</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">Title 要素と Synopsis 要素にまったく同じテキストが指定されており、ユーザーエクスペリエンスを損なう原因となります。Synopsis は、どのような趣旨の作品であるかをユーザーに伝えるためにコンテンツの概要を保持することを目的とした要素です。その時点でユーザーはタイトルを把握済みです。
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">該当する ID の作品を CDF ファイルから探してください。対応する Synopsis 要素を探します。この要素に指定されている作品の名前を、作品のプロットやテーマについての説明に置き換えてください。Synopsis 要素は省略できます。お勧めはしませんが、説明が不要であれば、要素ごと削除してもかまいません。
</p>
<p><strong>該当する可能性のある要素</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em>WorkType</em>.Synopsis
<br />
<br /> <em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="escaped_text"></a>
<h3>警告: Text contains characters that are escaped more than once
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em> <em>Element</em> contains characters that are escaped more than once
</p>
<p>例:
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><strong>tt123456</strong> MiniSeriesTitle contains characters that are escaped more than once
<br /> <strong>tt234567</strong> SeasonTitle contains characters that are escaped more than once
<br /> <strong>tt345678</strong> ShortDescription contains characters that are escaped more than once
<br /> <strong>tt456789</strong> ShowTitle contains characters that are escaped more than once
<br /> <strong>tt567890</strong> Title contains characters that are escaped more than once
</p>
<p><strong>問題</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">データベースからデータを取得してカタログの XML ファイルに変換するコードでは、XML シリアライザーがよく使用されます。エスケープされた文字に使用されているアンパサンド（&amp;）が、XML シリアライザーよって、アンパサンドのエスケープ表現（&amp;amp;）に置き換えられました。エスケープされた文字は、コードエンティティとしてテキストに存在します。たとえば、全角ダッシュには <em>&amp;mdash;</em> が、アンパサンドには <em>&amp;amp;</em> が使用されます。エスケープ済みの文字をシリアライザーが想定しておらず、プレーンテキストとして処理したために、アンパサンドがすべてエスケープされています。その結果、"&amp;mdash;" が "&amp;amp;mdash;" に変換され、"&amp;mdash;<em>"</em> として表示されています。たとえば、"this &amp; that" と表示されることを期待して "this &amp;amp; that" としても、文字列が "this &amp;amp;amp; that" に変換され、"this &amp;amp; that" と表示されてしまいます。
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">CDF ファイルとソースデータベースの両方について、該当する ID の作品を探し、詳細メッセージに指定されたテキスト要素（Title、ShowTitle、SeasonTitle、ShortDescription、MiniSeriesTitle のいずれか）を探してください。二重にエスケープされた文字がカタログファイルにのみ存在する場合、カタログファイルの作成時の変換に問題があります。元のテキストには、可能な限り、エスケープされていない文字を使用してください。また、場合によっては、エスケープされた文字列を意図した文字として適切に認識するようシリアライザーに命令する必要があります。
</p>
<p><strong>該当する可能性のある要素</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">MiniSeriesEpisode.MiniSeriesTitle
<br /> TvEpisode.SeasonTitle
<br /> TvEpisode.ShowTitle
<br /> TvSeason.ShowTitle
<br /> TvSpecial.ShowTitle
<br /> <em>WorkType</em>.ShortDescription
<br /> <em>WorkType</em>.Title
<br />
<br /> <em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="tvseason_v_episodes"></a>
<h3>警告: TvSeason is not associated with any TvEpisodes
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em>
</p>
<p><strong>問題</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">CDF ファイルには、TvSeason の項目が存在しますが、エピソードが 1 つも存在しません。空のシーズンを選択できる状態となるため、ユーザーエクスペリエンスの低下につながります。これには大きく 2 つの原因が考えられます。1 つは、TvEpisode 要素が CDF ファイルに含まれていないことです。もう 1 つは、それらのエピソードが CDF ファイルに存在するものの、指定されているシーズンが間違っていることです。
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">そのシーズンに該当しそうな TvEpisode 要素を CDF ファイルから探します。見つかりましたか？
</p>
<ul>
<li><strong>いいえ:</strong> それらを追加する必要があります。</li>
<li> <strong>はい:</strong> 対応するシーズンはどのように指定されていますか。SeasonID 要素ですか、それとも SeasonInShow 要素ですか？
<ul>
<li><strong>SeasonID:</strong> TvSeason.ID の値（詳細メッセージの WorkID）と一致させます。</li>
<li><strong>SeasonInShow:</strong> TvSeason.SeasonInShow の値と一致させます。</li>
</ul></li>
</ul>
<p><strong>該当する可能性のある要素</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">TvSeason.ID
<br /> TvEpisode.SeasonTitle
<br /> TvEpisode.SeasonID
<br /> TvEpisode.SeasonInShow
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="tvshow_v_episodes"></a>
<h3>警告: TvShow is not associated with any TvEpisodes or TvSpecials
<br />
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em>
</p>
<p><strong>問題</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">CDF ファイルには、TvShow の項目が存在しますが、エピソードが 1 つも存在しません。空の番組を選択できる状態となるため、ユーザーエクスペリエンスの低下につながります。これには大きく 2 つの原因が考えられます。1 つは、TvEpisode 要素が CDF ファイルに含まれていないことです。もう 1 つは、それらのエピソードが CDF ファイルに存在するものの、指定されている番組が間違っていることです。
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">その番組に該当しそうな TvEpisode 要素を CDF ファイルから探します。見つかりましたか？
</p>
<ul>
<li><strong>いいえ:</strong> それらを追加する必要があります。</li>
<li> <strong>はい:</strong> 対応する番組はどのように指定されていますか。ShowID 要素ですか、それとも ShowTitle 要素ですか？
<ul>
<li><strong>ShowID:</strong> TvShow.ID の値（詳細メッセージの WorkID）と一致させます。</li>
<li><strong>ShowTitle:</strong> 大文字と小文字の区別も含め、TvShow.Title の値と厳密に一致させます。</li>
</ul></li>
</ul>
<p><strong>該当する可能性のある要素</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">TvShow.ID
<br /> TvShow.Title
<br /> TvEpisode.ShowID
<br /> TvEpisode.ShowTitle
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="unsupported_image_link"></a>
<h3>警告: Unsupported image type. Provided image not JPG or PNG format
<br />
</h3>
<p>「<a href="#image">画像関連のメッセージ</a>」を参照してください。
<br />
</p>
<hr />
<hr />


<a class="anchor" name="推奨事項"></a>

<a class="anchor" name="suggestions"></a>

<h2>推奨事項</h2>
<p>指摘された問題が推奨事項であれば、カタログを正常に更新できなくなることはありません（"Invalid image" を除く）。ベストプラクティスを奨励してエンドユーザーの満足度を高めるのが推奨事項の目的です。
</p>
<p><strong>推奨事項</strong>
<br /> <a href="#bad_aspect_ratio_link_warn">Aspect ratio should be between %f and %f (%f to %f preferred.)</a>
<br /> <a href="#image_height_link_warn">Image height must be greater than %d pixels (greater than %d pixels preferred)</a>
<br /> <a href="#no_image">Invalid image</a>
<br /> <a href="#cast_and_crew">Provide cast and crew information for better search and browse integration</a>
<br /> <a href="#one_per_locale">Provide only one <em>ShortDescription/Synopsis</em> per locale</a>
<br /> <a href="#count_for_customerrating">Provide the Count for CustomerRating for better data quality and user experience</a>
</p>
<hr /> <a class="anchor" id="bad_aspect_ratio_link_sugg"></a>
<h3>推奨事項: Aspect ratio should be between %f and %f (%f to %f preferred.)
<br />
</h3>
<p>「<a href="#image">画像関連のメッセージ</a>」を参照してください。このメッセージは重要度に応じて、警告として表示される場合と推奨事項として表示される場合とがあります。
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="image_height_link_sugg"></a>
<h3>推奨事項: Image height must be greater than %d pixels (greater than %d pixels preferred)
<br />
</h3>
<p>「<a href="#image">画像関連のメッセージ</a>」を参照してください。このメッセージは重要度に応じて、警告として表示される場合と推奨事項として表示される場合とがあります。
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="no_image"></a>
<h3>推奨事項: Invalid image
</h3>
<p>「<a href="#image">画像関連のメッセージ</a>」を参照してください。
<br />
</p>
<hr /> <a class="anchor" id="cast_and_crew"></a>
<h3>推奨事項: Provide cast and crew information for better search and browse integration
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em>
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">ご使用の CDF ファイルには、この作品のキャスト情報やクルー情報がまったく含まれていません。この情報を追加すると、ユーザーが作品を見つけやすくなります。たとえば、ユーザーが、ハンフリー・ボガート主演の映画や黒澤明監督の映画を探しているとします。最低でも基本的なキャストとクルー情報がないと、タイトルで検索するか、ブラウズ中に偶然見つける以外、作品を探す手立てがありません。
</p>
<p><strong>該当する要素</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em>WorkType</em>.Credits.CastMember
<br /> <em>WorkType</em>.Credits.CrewMember
<br />
<br /> <em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。
</p>
<hr /> <a class="anchor" id="one_per_locale"></a>
<h3>推奨事項: Provide only one <em>ShortDescription/Synopsis</em> per locale
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em> There is more than one <em>ShortDescription/Synopsis</em> with locale of <em>ss</em>
</p>
<p><strong>例</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em><strong>WorkID</strong></em> There is more than one ShortDescription with locale of en-us
<br /> <em><strong>WorkID</strong></em> There is more than one Synopsis with locale of fr
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">CDF ファイルの ShortDescription と Synopsis またはそのどちらか一方に同じロケールの項目が複数存在します。ShortDescription と Synopsis は、1 つのロケールにつき 1 つしか使用できません。該当する ID の作品を CDF ファイルから探してください。対応する ShortDescription 要素を探します。ShortDescription に複数の項目が存在する場合、同じロケール値を持つ項目を探します。適宜そのロケールの項目を 1 つ残して削除します。Synopsis 要素の場合も手順は同じです。<!-- TODO: In the case of multiple entries for the same locale, which is used? -->
</p>
<p><strong>該当する要素</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em>WorkType</em>.ShortDescription
<br /> <em>WorkType</em>.Synopsis
<br />
<br /> <em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。
</p>
<hr /> <a class="anchor" id="count_for_customerrating"></a>
<h3>推奨事項: Provide the Count for CustomerRating for better data quality and user experience
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em>
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">CDF ファイルの CustomerRating 項目には、Count という省略可能な要素が存在します。Count の目的は、その作品を評価した視聴者数の情報を保持することです。数字の大きい方が評価の信頼性は高くなります。サンプル集合が少ないために生じる分布の非対称性が小さくなる傾向があるためです。その情報を追跡し、カタログを更新するときに都度 Count 値と CustomerRating 値を更新する必要があります。
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">
</p>
<p><strong>該当する要素</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em>WorkType</em>.CustomerRating.Count
<br />
<br /> <em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。
</p>


<a class="anchor" name="画像関連のメッセージ"></a>

<a class="anchor" name="image"></a>

<h2>画像関連のメッセージ</h2>
<p>画像に関連したエラー、警告、推奨事項は、生じる影響が他のメッセージとは異なります。通常、警告や推奨事項が原因でカタログが拒否されることはありません。一方、画像に関連した警告や推奨事項が、登録対象の 50% 超で検出された場合、"<a href="#too_many_invalid_images">Too many invalid images</a>" というエラーになり、カタログが拒否されます。
</p>
<p>画像の問題の多くは CDF ファイルそのものの問題ではなく、そこで参照されている画像の問題です。画像の問題を解決するにあたって、グラフィックデザイン、画像の編集、サーバーのアクセス権が必要になる場合があります。そのような問題については、グラフィック部門や IT 部門に協力を求めてください。
</p>
<p><strong>エラー関連のメッセージ</strong>
<br /> <a href="#too_many_invalid_images_2">エラー:</a> <a href="#too_many_invalid_images_2">Too many invalid images
<br /> </a><a href="#bad_aspect_ratio">警告: Aspect ratio should be between 1:3 and 3:1 (1:2 to 2:1 preferred.)</a>
<br /> <a href="#image_height">警告: Image height must be greater than 240 pixels (greater than 480 pixels preferred)</a>
<br /> 警告: Invalid image
<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#http_empty">We were unable to retrieve an image from <em>url</em>. The HTTP response was empty.</a>
<br /> <a href="#response_invalid">We were unable to retrieve an image from <em>url</em>. The HTTP response was invalid.</a>
<br /> <a href="#http_response">We were unable to retrieve an image from <em>url</em>. The HTTP response was <em>status code</em>, <em>reason</em>.</a>
<br /> <a href="#unsupported_image">警告: Unsupported image type. Provided image not JPG or PNG format.</a>
<br /> <a href="#bad_aspect_ratio">推奨事項: Aspect ratio should be between 1:3 and 3:1 (1:2 to 2:1 preferred.)</a>
<br /> <a href="#image_height">推奨事項: Image height must be greater than 240 pixels (greater than 480 pixels preferred)</a>
<br /> 推奨事項: Invalid image
<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#no_image_provided">No image present for item. Please provide image if available.</a>
</p>
<hr /> <a class="anchor" id="too_many_invalid_images_2"></a>
<h3>エラー: Too many invalid images
</h3>
<p><strong>詳細メッセージ: &nbsp;</strong><em>nn</em>% invalid images or fewer allowed; <em>nn</em>% found.See the warnings and suggestions section for details.
</p>
<p><strong>問題</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">無効な画像（欠落または使用不能）が少数であれば、インジェストエラーは発生しません。そのような場合は、警告や推奨事項として表示されます。一方、無効な画像が多数このカタログに検出された場合は、エラーが発生します。そのしきい値は約 50% です。作品の画像の欠落は無効と見なされるので、カタログ内の作品の 50% 以上で有効な画像が含まれている必要があります。
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">インジェストレポートの警告セクションと推奨事項セクションを参照し、インジェストの過程で発生した画像関連の具体的な問題を確認します。レポートで指摘されている警告と推奨事項に該当する箇所をすべて探して修正してください。
</p><strong>該当する要素</strong>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em>WorkType</em>.ImageUrl
<br />
<br /> <em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="bad_aspect_ratio"></a>
<h3>警告/推奨事項: Aspect ratio should be between 1:3 and 3:1 (1:2 to 2:1 preferred.)
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em> Unsupported aspect ratio <em>nn</em> for image <em>url</em>.Please provide acceptably sized image.
</p>
<p><strong>問題</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">これは CDF ファイルの問題ではなく、そこで参照されている画像の問題です。画像のアスペクト比が現行の要件を逸脱しています。つまり、両側から押しつぶしたように表示されるか、左右に引き伸ばしたように表示されます。
</p>
<p><strong>留意事項</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">縦横比は 1:2 または 2:1 を推奨します。ご使用の画像が 1:3 または 3:1 である場合、自動的に 1:2 または 2:1 にトリミングされ、このメッセージが推奨事項として表示されます。ただし、トリミングによって画像の高さが 240 ピクセル未満になる場合、その画像は使用されません。
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">1:3 から 3:1 の範囲を超えている場合、このメッセージが警告として表示され、無効な画像としてカウントされます。こうして無効な画像の総数が増えていくと、最終的にはカタログが拒否されます。
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">該当する ID（この例では tt123456）の作品を CDF ファイルから探してください。そこに含まれている ImageUrl タグを探します。この URL は、画像ファイルが置かれている場所を示しています。その URL をグラフィック部門に知らせて、画像の縦横比を少なくとも 1:3 ～ 3:1（トリミングを回避するためには 1:2 ～ 2:1）の範囲に収める必要があること、またトリミングした場合でも 480 ピクセル以上を必ず維持するように伝えます。修正済みの画像を受け取ったら、その URL が変更されていないことを確認してください。変更されている場合は、CDF ファイルで ImageUrl の値を更新します。
</p>
<p><strong>該当する可能性のある要素</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em>WorkType</em>.ImageUrl
<br />
<br /> <em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="image_height"></a>
<h3>警告: Image height must be greater than 240 pixels (greater than 480 pixels preferred)
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em> Image height <em>nn</em> is below acceptance criteria for <em>url</em>.Please provide acceptably sized image.
</p>
<p><strong>問題</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">これは CDF ファイルの問題ではなく、そこで参照されている画像の問題です。その作品で参照されている画像の縦横比は適切ですが、高さ 480 ピクセルという要件を下回っています。画像の高さは 480 ピクセル以上を推奨します。画像の高さが 240 ～ 480 ピクセルの範囲内にある場合、このメッセージは推奨事項として表示されます。240 ピクセルを下回っている場合、このメッセージが警告として表示され、無効な画像としてカウントされます。こうして無効な画像の総数が増えていくと、最終的にはカタログが拒否されます。
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">指定された ID の要素を CDF ファイルから探してください。そこに含まれている ImageUrl タグを探します。この URL は、画像ファイルが置かれている場所を示しています。その URL をグラフィック部門に知らせて、画像の高さが 240 ピクセル以上（480 ピクセル以上を推奨）必要で、かつ画像の縦横比を 1:3 ～ 3:1（トリミングを回避するためには 1:2 ～ 2:1）に維持する必要があることを伝えます。修正済みの画像を受け取ったら、その URL が変更されていないことを確認してください。変更されている場合は、CDF ファイルで ImageUrl の値を更新します。
</p>
<p><strong>該当する可能性のある要素</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em>WorkType</em>.ImageUrl
<br />
<br /> <em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="http_empty"></a>
<h3>警告: Invalid image
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em> We were unable to retrieve an image from <em>url</em>.The HTTP response was empty.
</p>
<p><strong>問題</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">画像が保存されているサーバーに画像を要求するリクエストを送信し、成功を示すレスポンスコードが返されましたが、レスポンスにはヘッダーも本文もなく、画像も含まれていませんでした。
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">これは、CDF ファイルの問題ではなく、サーバーとの通信の問題です。今後も同じ問題がレポートで発生する場合は、該当する ID の作品を CDF ファイルから探し、その ImageUrl タグを特定してください。その URL を IT 部門に伝え、画像の取得リクエストで空のレスポンスが返される旨を知らせ、調査を依頼してください。
</p>
<p><strong>該当する可能性のある要素</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em>WorkType</em>.ImageUrl
<br />
<br /> <em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="response_invalid"></a>
<h3>警告: Invalid image
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em> We were unable to retrieve an image from <em>url</em>.The HTTP response was invalid.
</p>
<p><strong>問題</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">画像が保存されているサーバーに画像を要求するリクエストを送信しましたが、返されたレスポンスメッセージに何らかの文字化けが発生しています。
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">これは、CDF ファイルの問題ではなく、サーバーとの通信の問題です。この場合、次回のレポートを待って、問題が再現するかどうかを確認するのも一つの方法です。1 回限りの問題であることも十分に考えられます。画像をリクエストしたときに絶えずこの警告が返される場合は、その画像ファイルの URL を IT 部門に伝え、取得リクエストに対してシステムが有効な HTTP レスポンスを返さない状態が続いている旨を知らせてください。その情報に基づいて詳しく調査してもらうことができます。
</p>
<p><strong>該当する可能性のある要素</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em>WorkType</em>.ImageUrl
<br />
<br /> <em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="http_response"></a>
<h3>警告: Invalid image
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em> We were unable to retrieve an image from <em>url</em>.The HTTP response was <em>status code:</em> <em>reason</em>.
</p>
<p><strong>問題</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">画像が保存されているサーバーに画像を要求するリクエストを送信しましたが、レスポンスコードは問題を示しており、画像は返されませんでした。
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">これは、CDF ファイルの問題ではなく、サーバーとの通信の問題です。画像ファイルの URL とレスポンスのステータスコードおよび理由を IT 部門に伝えてください。その情報に基づいて詳しく調査してもらうことができます。問題の原因としては、さまざまな理由が考えられます（リクエストが無効である、サーバーへのアクセスやファイアウォールに問題がある、ペイロードのサイズに問題がある、サーバーがオフラインであるなど）。
</p>
<p><strong>該当する可能性のある要素</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em>WorkType</em>.ImageUrl
<br />
<br /> <em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。
</p>
<p><strong>関連項目</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">
</p><a title="HTTP/1.1: ステータスコードの定義" target="_blank" href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html">HTTP/1.1: ステータスコードの定義</a><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="unsupported_image"></a>
<h3>警告: Unsupported image type. Provided image not JPG or PNG format.
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em> Unsupported image type <em>ext</em> for <em>url</em>.Images should be in JPG or PNG format.
</p>
<p><strong>問題</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">JPG と PNG 形式以外の画像ファイルが CDF ファイルに指定されています。
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">該当する ID の作品を CDF ファイルから探してください。対応する ImageUrl 要素を探します。この URL は、画像ファイルの場所を示しています。場合によってはグラフィック部門に連絡して、サポートされている形式（JPG または PNG）に画像を変換してもらう必要があります。自分で変換する場合は、グラフィックプログラムでファイルを開き、サポート対象のいずれかの形式で保存してください。一部のファイル形式によっては、変換後に画像が劣化する場合があります。元の形式と変換後の形式とを比較して、問題がないか確認してください。サーバー上の画像を新しい画像で置き換えます。CDF ファイル内の ImageUrl 要素は、新しい画像の名前に合わせて適宜更新してください。
</p>
<p><strong>該当する可能性のある要素</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;"><em>WorkType</em>.ImageUrl
<br />
<br /> <em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。
</p><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- -->
<hr /> <a class="anchor" id="no_image_provided"></a>
<h3>推奨事項: Invalid Image
</h3>
<p><strong>詳細メッセージ:</strong> <em><strong>WorkID</strong></em> No image present for item.Please provide image if available.
</p>
<p><strong>問題</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">この作品の画像が CDF ファイルに指定されていません。
</p>
<p><strong>対処方法</strong>
</p>
<p style="margin-left: 30.0px;" data-mce-style="margin-left: 30.0px;">作品の ImageUrl は必須ではありませんが、作品の全項目中少なくとも 50% は、有効な画像が ImageUrl 要素で指定されている必要があります。その条件を満たしていないと、"
</p><a href="#too_many_invalid_images_2">Too many invalid images</a>" というエラーが発生し、アップロードされたカタログが拒否されます。50% のしきい値は超えているが、作品の画像が含まれていない場合、弊社にて画像の外部ソース（IMDb など）の使用を試みます。そのためには、外部ソースでの照合に十分な情報をその作品に関して追加していただく必要があります。その他、不足している画像については、汎用的なプレースホルダーを用意しておりますが、ユーザーエクスペリエンスの観点からはお勧めできません。
<p><strong>該当する要素</strong>
</p><em>WorkType</em>.ImageUrl
<br />
<br />
<p><em>WorkType</em> は、Movie、TvShow、TvSeason、TvEpisode、TvSpecial、MiniSeries、MiniSeriesEpisode、Extra のいずれかとなります。
</p>


{% include links.html %}
