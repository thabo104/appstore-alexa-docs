---
title: Fire TV カタログ統合のよくある質問（FAQ）
permalink: fire-tv-catalog-integration-faqs.html
sidebar: catalog_ja
product: Fire TV Catalog
toc-style: kramdown
github: true
---

<h2>はじめに</h2>
<p>このページでは、Fire TV カタログ統合（ユニバーサル閲覧・検索ともいいます）に関連するよくある質問（FAQ）を紹介します。</p>


<a class="anchor" name="Fire TV カタログのインジェストの準備"></a>

<h2>Fire TV カタログのインジェストの準備</h2>
<ol>
<li><strong>Q:</strong>Fire TV カタログ統合とは何ですか。<strong><br>
A:</strong> カタログを統合すると、開発者様のカタログメタデータを Fire TV プラットフォームの他のカタログデータとまとめることができます。ユーザーが Fire TV のユーザーインターフェイスでメディアを検索したり、特定のアイテムを閲覧したりする際に、開発者様のコンテンツが Amazon や他のコンテンツプロバイダーのコンテンツと並んで表示され、直接再生することもできます。カタログ統合によって、ユーザーがより簡単にコンテンツを見つけて視聴できるようになります。<br>
<br></li>
<li>
<strong>Q</strong>:カタログと Fire TV を統合する際の標準的な手順を教えてください。 <strong><br>
A:</strong>アプリは一般的に、以下のプロセスによってカタログを Fire TV と統合します。
<ol type="a">
<li>データベースからデータをエクスポートし、そのデータをカタログデータ形式（CDF）スキーマに準拠した有効な XML ファイルに変換します。詳細については、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-cdf-overview">カタログデータ形式（CDF）について</a>」および「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference" class="external-link" rel="nofollow">カタログデータ形式（CDF）リファレンス</a>」を参照し、次の XSD スキーマファイルをダウンロードしてください: <a href="https://s3.amazonaws.com/com.amazon.aftb.cdf/catalog-13.xsd" class="external-link" rel="nofollow">CDF スキーマ定義</a>（何らかの理由により、プログラムで CDF ファイルを生成できない場合は、CDF スキーマをファイル作成のテンプレートとして使用し、手動で XML ファイルを作成することもできます。手動による CDF ファイルの作成が必要な場合、Amazon では、XML の取り扱いに慣れた担当者にこの作業を割り当てることを推奨しています）。
</li>
<li>CDF XML ファイルを Amazon の AWS S3 サービスにアップロードします。「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-upload" class="external-link" rel="nofollow">カタログのアップロード</a>」を参照してください。
</li>
<li>アップロードしたカタログを使用するように Fire TV のホーム画面ランチャーを設定します。この手順では、アプリにも多少の変更を加えます。「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/launcher-integration" class="external-link" rel="nofollow">ランチャー統合</a>」を参照してください。<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/testing-launcher-integration-with-adb" class="external-link" rel="nofollow">Android Debug Bridge（ADB）を使用する</a>か<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/testing-launcher-integration-with-the-test-app" class="external-link" rel="nofollow">ランチャーテストアプリを使用</a>して、ランチャー統合をテストできます。
</li>
</ol><br>
</li>
<li><strong>Q:</strong>このカタログ更新プロセスはどのくらいの頻度で実施する必要がありますか。<br>
<strong>A:</strong>Amazon では、カタログのエクスポートとアップロードのプロセスの自動化にエンジニアまたは開発者を １ 名割り当てることを推奨しています。自動化が完了した後は、カタログ更新の有無にかかわらず、このプロセスが毎週実行されるように設定してください。<br>
<br></li>
<li><strong>Q</strong>:このプロセスにはかなり専門的な作業が含まれているようですが、組織内のどのような人物が担当すべきでしょうか。 <strong><br>
A:</strong>CDF ファイルの作成およびアップロードの担当者としては、エンジニアか IT プロフェッショナルが適しています。Amazon では、エンジニアにこのプロセスの自動化作業を割り当てることを強く推奨しています。エンジニアが確保できない場合は、XML の取り扱いとコマンドラインインターフェイスを使用したコマンドの実行に慣れている担当者が、CDF ファイルの作成およびアップロードを担当することが推奨されます。</li>
</ol>


<a class="anchor" name="ユーザーエクスペリエンス"></a>

<h2>ユーザーエクスペリエンス</h2>
<ol>
<li>
<strong>Q:</strong>カタログを統合すると、アプリへのトラフィックはどのように促進されますか。 <strong><br>
A:</strong> アプリのカタログを Fire TV に統合することで、以下のような複数の方法でアプリへのトラフィックを促進できます。
<ul>
<li>新規ユーザーにアプリのダウンロードと、無料試用登録（該当する場合）を促す。</li>
<li>閲覧と検索を通じて開発者様のコンテンツがユーザーの目に留まる機会を増やす。</li>
<li>現在の登録者の好みに応じて優先順位が設定された閲覧結果や検索結果によって既存ユーザーを維持する。</li>
</ul><br>
カタログ統合による利点の詳細については、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/understanding-fire-tv-catalog-integration">Fire TV カタログ統合について</a>」を参照してください。<br>
<br>
</li>
<li><strong>Q</strong>:ユーザーが閲覧または検索を通じてエピソードやシリーズを選択したとき、再生はどこから開始するべきですか。<br>
<strong>A:</strong> 良好なユーザーエクスペリエンスを提供するために、検索結果や閲覧結果からエピソードやシリーズへのディープリンクによって直接再生を開始する必要があります。アプリのホーム画面など他の場所にユーザーを転送しないようにしてください。<br>
<br></li>
<li><strong>Q</strong>:ユーザーがエピソードやシリーズを選択したとき、どのくらいすぐに再生を開始するべきですか。 <strong><br>
A</strong>:再生時間はアプリのバッファー処理などの要因によって変化しますが、再生は中間処理を介さず、選択された直後に開始する必要があります。再生を開始する前にユーザーをアプリのホーム画面など他の場所にリダイレクトすることは避けてください。<br>
<br></li>
<li><strong>Q</strong>:再生が終了したら、ユーザーに何を表示するべきですか。<br>
<strong>A</strong>:アプリ経由でコンテンツにアクセスした場合にユーザーが期待すると思われるものを、統合されたカタログからアクセスした場合にも表示する必要があります。たとえば、アプリによっては次のエピソードの再生が自動的に開始されます。また別のアプリでは、ユーザーへのおすすめコンテンツの画面が表示されます。いずれにせよ、コンテンツに Fire TV 経由でアクセスしたかアプリ内からアクセスしたかにかかわらず、ユーザーエクスペリエンスの一貫性が保たれるようにしてください。</li>
</ol>


<a class="anchor" name="CDF ファイルの作成"></a>

<h2>CDF ファイルの作成</h2>
<ol>
<li>
<strong>Q</strong>:CDF ファイルの作成方法を教えてください。 <strong><br>
A:</strong>このファイルの理想的な作成方法は、プログラム的に、メタデータを CDF 形式に準拠した XML ファイルにエクスポートする方法です。CDF ファイルの作成方法の詳細については、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-integration" class="external-link" rel="nofollow">Fire TV カタログ統合の準備</a>」および「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-cdf-overview">カタログデータ形式（CDF）について</a>」を参照してください。<br>
<br>
</li>
<li><strong>Q</strong>:CDF ファイルを作成しました。次は何をすればいいですか。このまま AWS S3 にアップロードできますか。 <strong><br>
A:</strong>Amazon では、AWS S3 にアップロードする前に CDF ファイル内の XML を検証することを強く推奨しています。CDF に不完全または無効な XML が含まれていると、そのファイルは拒否されます。<br>
<br></li>
<li>
<strong>Q</strong>:XML の検証方法を教えてください。アップロード前のファイルチェックに使用できるユーティリティは提供されていますか。 <strong><br>
A:</strong>Amazon では CDF ファイルの検証用ユーティリティは提供していませんが、このようなユーティリティには、簡単に入手できるものが数多くあります。Mac または Linux をお使いの場合は、<a href="http://xmlsoft.org/xmllint.html" class="external-link" rel="nofollow">xmllint</a> を使用して CDF ファイルを検証してください。このユーティリティは通常、お使いの OS にあらかじめインストールされています。Windows の場合は、Google プロジェクトバージョンの xmllint （<a href="https://code.google.com/p/xmllint/" class="external-link" rel="nofollow">https://code.google.com/p/xmllint/</a>）を使用して検証できます。
</li>
</ol>


<a class="anchor" name="CDF ファイルのアップロードと発行"></a>

<h2>CDF ファイルのアップロードと発行</h2>
<ol>
<li>
<strong>Q</strong>:検証した CDF ファイルを Amazon にアップロードする方法を教えてください。 <strong><br>
A</strong>:CDF ファイルをアップロードする方法については、「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-upload" class="external-link" rel="nofollow">Amzon へのカタログのアップロード</a>」を参照してください。<br>
<br>
</li>
<li><strong>Q</strong>:CDF ファイルを AWS S3 バケットに発行する頻度の上限はどれくらいですか。<strong><br>
A</strong>:Amazon では、アップロードされるファイルのボリュームに応じてインジェストパイプラインを調整しているため、発行頻度に上限を設けていません。<br>
<br></li>
<li><strong>Q:</strong>S3 バケットへのアップロード後、CDF ファイルはどのくらいの時間でインジェストされますか。 <strong><br>
A:</strong>Amazon では、アップロードされた新しいカタログを　4 時間ごとにパートナー S3 バケットから取得しています。CDF ファイルが正常にインジェストされる状態であれば、このタイミングでインジェストされます。インジェストに失敗した場合は、CDF ファイルを修正し、再度アップロードして、4 時間後のインジェストのタイミングまで待つ必要があります。これより早くカタログを更新する必要がある場合は、Amazon の担当者にご相談ください。また、この 4 時間のインジェスト間隔は変更される可能性があります。<br>
<br></li>
<li><strong>Q:</strong>CDF ファイルのアップロードからコンテンツが Fire TV 端末で利用可能になるまでの時間はどのくらいですか。 <strong><br>
A:</strong>通常は、カタログがインジェストされてから 2～4 時間以内にコンテンツが利用可能になります。ただし、一部のアプリでは、キャッシュなどの条件によって、この時間が 72 時間になる可能性もあります。<br>
<br></li>
<li><strong>Q</strong>:更新のたびに完全な CDF ファイルをアップロードする必要がありますか。新しいデータや更新済みのデータのみを含む CDF ファイルをアップロードすることはできますか。 <strong><br>
A:</strong>アップロードのたびに完全な CDF ファイルを提供する必要があります。Amazon では、削除が必要な部分を算出するために完全なファイルを使用しています。また、完全なファイルを使用すると、時間の経過とともに Amazon のカタログが開発者様のカタログから分岐するのを防ぐこともできます。<br>
<br></li>
<li><strong>Q</strong>:更新した CDF ファイルを連続して送信した場合はどうなりますか。Amazon での処理が終わる前に新しい CDF 更新ファイルを作成した場合はどうなりますか。<strong><br>
A</strong>:Amazon での処理が終わる前に新しい CDF 更新ファイルをアップロードした場合、Amazon では古いファイルを無視して最新バージョンのファイルを使用します。つまり、多数のカタログを S3 システムにアップロードすることで Amazon のシステムに過剰な負荷をかける可能性はありません。<br>
<br></li>
<li>
<strong>Q</strong>:Amazon ではカタログ統合をテストするためのツールを提供していますか。 <strong><br>
A:</strong>Android Debug Bridge（ADB）を使用して、アプリと Amazon のホーム画面ランチャーとの統合をテストできます。「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/testing-launcher-integration-with-adb" class="external-link" rel="nofollow">ADB を使用したランチャー統合テスト</a>」を参照してください。また、Amazon のテストアプリをダウンロードしてお試しいただくこともできます。このテストアプリには Amazon のホーム画面ランチャーによるリクエストのシミュレーション機能があり、アプリとランチャーの統合をテストするために使用できます。「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/testing-launcher-integration-with-the-test-app" class="external-link" rel="nofollow">テストアプリを使用したランチャー統合テスト</a>」を参照してください。ご要望があれば、開発者様のテストをサポートするために、特定の　FIre TV 端末をホワイトリストに登録することもできます。<br>
<br>
</li>
<li><strong>Q</strong>:新しいバージョンの CDF ファイルを S3 にアップロードする場合は、ファイル名を毎回変更する必要がありますか。S3 バケットに複数のファイルが格納されている場合、Amazon ではどのようにして使用する CDF ファイルを決めているのですか。 <strong><br>
A:</strong>Amazon ではタイムスタンプを使用して最新バージョンの CDF ファイルを判定し、常に最新のバージョンをインジェストして使用しています。 <span><br></span></li>
</ol>


<a class="anchor" name="シーズン、エピソード、およびその他のコンテンツタイプ"></a>

<h2>シーズン、エピソード、およびその他のコンテンツタイプ</h2>
<ol>
<li><strong><strong>Q:</strong></strong> シーズンとエピソードを含む TV 番組があるのですが、この番組の分類にはどのコンテンツタイプを使用するべきですか。 <strong>
<br /> A:</strong> <code>TVShow</code>、<code>TVSeason</code>、および <code>TVEpisode</code> を使用してください。
<br />
<br /></li>
<li><strong>Q:</strong>連続したエピソードを含む TV 番組がありますが、シーズンはありません。どのコンテンツタイプを使用すべきですか。 <strong>
<br /> A:</strong><code>MiniSeries</code> および <code>MiniSeriesEpisode</code> タイプを使用してください。エピソードの順序を表すために <code>EpisodeInSeries</code> の値を指定する必要があります。
<br />
<br /></li>
<li><strong>Q:</strong>連続エピソードを含む TV 番組があるのですが、シーケンス番号が付いていません。各エピソードは、シーケンス番号の代わりに放送日で順序付けされています。この場合もコンテンツタイプとして <code>MiniSeries</code> を使用できますか。使用できない場合、どのコンテンツタイプを使用すべきですか。 <strong>
<br /> A:</strong><code>TVShow</code> および <code>TVSpecial</code> タイプを使用してください。<code>TVSpecial</code> 内で、<code>ShowID</code> または <code>ShowTitle</code> フィールドを使用して <code>TVShow</code> にリンクし、さらに必須の放送日を追加してください。
<br />
<br /></li>
<li><strong>Q:</strong>ニュースタイプのコンテンツがあるのですが、エピソードにはシーズンがなく、放送日があります。どのコンテンツタイプを使用すべきですか。 <strong>
<br /> A:</strong><code>TVShow</code> および <code>TVSpecial</code> タイプを使用してください。<code>TVSpecial</code> 内で、<code>ShowID</code> または <code>ShowTitle</code> フィールドを使用して <code>TVShow</code> にリンクし、さらに必須の放送日を追加してください。
<br />
<br /></li>
<li><strong>Q:</strong>シーズンを含む番組がありますが、シーズンには値がありません。どうすればいいですか。 <strong>
<br /> A:</strong>シーズンを含む番組にはシーズン値が必要であり、これによってユーザーエクスペリエンスの低下を防止しています。シーズン情報を取得するには、IMDb のような権威のあるカタログを確認してください。Amazon では通常、シーズン値のないシーズンベースのコンテンツについては、その番組を別のコンテンツタイプに適合させるのではなく、除外することを推奨しています。このようなコンテンツを除外することで、ユーザーの視聴体験を良好なものに保つことができます。
<br />
<br /></li>
<li><strong>Q:</strong>シリーズのシーズン情報やエピソード情報がありません。どうすればいいですか。仮の値を用意すべきですか。 <strong>
<br /> A:</strong>仮の <code>Season</code> 番号や <code>Episode</code> 番号をカタログに指定しないようにしてください。代わりに、<code>TvEpisode</code> エントリタイプではなく <code>TvSpecial</code> を使用してください。各エントリ（<code>TvSpecials</code>）は <code>TVShow</code> に関連付けてください。これにより、各エントリが <code>TvShow</code> を介して相互に関連付けられます。ただし、<code>TvSpecials</code> 内の <code>OriginalAirDate</code> は必須フィールドなので注意してください。このフィールドによって、<code>TvShow</code> 内のエピソードを適切にマッチングしたり（さらに、他の情報源を使用して Season 番号と Episode 番号を特定したり）、正しい順序に並べたりすることができます。
<br />
<br /></li>
<li><strong>Q:</strong>覚えるべきルールが多すぎるように感じます。どのようにすれば、細かいルールを覚えずに何をするべきかを判断できますか。 <strong>
<br /> A:</strong>一般には、ユーザーが何を期待しているかに基づいて判断してください。たとえば、毎晩放送されるトーク番組の TV シリーズの場合、おそらくユーザーはそのシリーズにシーズンがあるとは考えないでしょう。この場合は、放送日が最も重要です。しかし、ユーザーが一気に視聴することの多い人気シリーズの場合、そのような視聴者層にとってはシーズン番号やエピソード番号がより重要になるはずです。</li>
</ol>


<a class="anchor" name="インジェストレポート"></a>

<h2>インジェストレポート</h2>
<ol>
<li> <strong>Q:</strong>インジェストレポートとは何ですか。 <strong>
<br /> A:</strong>このレポートでは、カタログが Fire TV のユニバーサル閲覧・検索機能に正常に統合されたかどうか、また失敗した場合はその理由は何かを確認できます。最新のカタログをアップロードした後、通常は 4 時間以内にレポートの新しいコピーが <em>report.html</em> として S3 バケットに追加されます。このレポートを使用すると、カタログファイル内の問題のトラブルシューティングができます。レポートにはインジェスト（統合）の成功または失敗ステータスに加え、エラー、警告、および推奨事項が記載されています。「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/receiving-and-understanding-the-catalog-ingestion-report">カタログインジェストレポートの取得とその内容</a>」を参照してください。
<br />
<br /></li>
<li><strong>Q:</strong>アップロードしたカタログファイルがシステムに統合されたかどうかは、どうすればわかりますか。 <strong>
<br /> A:</strong>オプトインメールによってインジェストの結果を受け取ることができます。このメールには、詳細なレポートをダウンロードできるリンクも記載されています。
<br />
<br /></li>
<li> <strong>Q:</strong>カタログのインジェスト結果のメール配信リストに登録するにはどうすればいいですか。 <strong>
<br /> A:</strong><a href="mailto:p11-catalog-subscriptions@amazon.com" class="external-link" rel="nofollow">p11-catalog-subscriptions@ amazon.com</a> に登録依頼のメールを送信してください。成功と失敗のメールレポートはメールリストが別なので、両方のリストへの登録を依頼してください。
<br />
<br /></li>
<li> <strong>Q:</strong>カタログのインジェストに失敗しました。次に何をすればいいですか。 <strong>
<br /> A:</strong>インジェストレポートで、失敗を引き起こした特定のエラーを確認します。インジェストレポートのドキュメントには、各エラーの説明とフォローアップの指示が記載されています。必要に応じて、担当の Amazon ビジネス開発マネージャーがカタログの問題への対処をお手伝いします。「<a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-ingestion-report-messages">カタログデータ形式インジェストレポートのメッセージ</a>」を参照してください。
<br /></li>
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
<li> <strong>Fire TV カタログ統合の FAQ</strong>:カタログ統合についてのよくある質問。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/migrating-a-cdf-file-to-the-latest-version">カタログデータ形式（CDF）ファイルの最新バージョンへの移行</a>:カタログで最新バージョンの CDF スキーマが使用されるようにする方法。</li>
<li> <a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/catalog-data-format-schema-reference">カタログデータ形式（CDF）スキーマリファレンス</a>:すべての CDF 要素の定義、要件、サンプル。</li>
<li><a href="https://developer.amazon.com/public/ja/solutions/devices/fire-tv/docs/catalog/test-cases-for-verifying-deep-links-from-your-fire-tv-catalog">Fire TV のディープリンクを確認するためのテストケース</a>: アプリのランチャー統合を確認するために実行するテストケースについて。</li>

</ul>

{% include links.html %}
