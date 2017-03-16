Fireデバイスでアプリがインストールされる場所は、Androidマニフェストファイルの設定で決まります。場所として設定できるストレージは、2 つあります。

* 外部ストレージ (SDカードなど)
* 内部ストレージ (デバイスのメモリを使用)

{% if include.device == "firetv" %}
Fire TV Stickには外部ストレージがありませんが、Fire TV (セットトップボックス) には、メモリカードスロットを使用した外部ストレージオプションが用意されています。
{% endif %} 

{% if include.device == "firetablets" %}
古いFireタブレットには外部ストレージがありませんが、新しいFireタブレットには、メモリカードスロットを使用した外部ストレージオプションが用意されています。
{% endif %} 

一般的に、アプリでは、デフォルトのインストール場所として外部ストレージを指定する必要があります。

* TOC
{:toc}

## ベストプラクティス

ほとんどのアプリでは、Androidマニフェストファイルの`installLocation`に`preferExternal`を指定することが推奨されます。指定しないと、アプリは内部ストレージにインストールされます。

内部ストレージがいっぱいになると、最終的に次のようになる可能性があります。

* インストールできるアプリの数が減る
* アプリの評価が下がる
* ユーザーエクスペリエンスが低下する

ユーザーによっては、外部ストレージに使用可能な領域が十分ある場合でも、アプリのマニフェストで`preferExternal`を指定しないと、アプリが内部にインストールされることがあります。その結果、ユーザーにストレージが不足しているという警告が表示されたり、アプリをまったくインストールできなくなったりするため、ユーザーの不満を招くことになります。

`preferExternal`を指定すれば、アプリのユーザー基盤を最大限に拡大し、Fireデバイスのユーザーエクスペリエンスを向上する効果を期待できます。

## 外部ストレージを指定する方法

アプリの`AndroidManifest.xml`の` <manifest>` タグ内に`installLocation`属性を追加し、値を`preferExternal`に設定します。次に、例を示します。

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    android:installLocation="preferExternal" ... >
    ...
</manifest>
```

`installLocation`パラメータに指定できる値は複数あります。

<table class="grid">
    <colgroup>
        <col width="30%" />
        <col width="70%" />
    </colgroup>
    <thead>
        <tr>
            <th>installLocationの値</th>
            <th>説明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td markdown="span">
                `preferExternal`
            </td>
            <td markdown="span">
                **ほとんどのアプリで推奨される値です**。利用できる場合は外部ストレージにアプリをインストールします。外部ストレージに空き容量がない場合は、内部ストレージにアプリがインストールされます (空き容量がある場合)。ユーザーは後からこのアプリを手動で移動できます。その際は、[設定] > [アプリケーション] > [インストール済アプリケーションを管理] でアプリを選択します。</td>
        </tr>
        <tr>
            <td markdown="span">
                `internalOnly`
            </td>
            <td align="left" markdown="span">
                アプリを内部ストレージのみにインストールします。内部ストレージに十分な空き容量がない場合、インストールは失敗します。ユーザーがアプリを後から手動で移動することはできません。ほとんどのアプリでは推奨されません。このオプションは、[次のセクション](#internalStorage)で説明するアプリの種類に対してのみ選択してください。
            </td>
        </tr>
        <tr>
            <td markdown="span">
                `auto`
            </td>
            <td align="left" markdown="span">
                デフォルトでは、内部ストレージにアプリをインストールします。ただし、内部ストレージに空き容量がない場合は、アプリを外部ストレージにインストールします (外部ストレージが利用可能である場合)。ユーザーは後からこのアプリを手動で移動できます。その際は、[設定] > [アプリケーション] > [インストール済アプリケーションを管理] でアプリを選択します。</td>
        </tr>
    </tbody>
</table>

APKファイルが外部ストレージにインストールされていても、データベース、プライベートユーザーデータ、最適化された.dexファイル、抽出されたネイティブコードはすべて、内部ストレージに保存される点に注意してください。

詳細については、Androidドキュメントの「[App Install Location](http://developer.android.com/guide/topics/data/install-location.html)」を参照してください。

## 内部ストレージを選択するタイミング {#internalStorage}

ほとんどのアプリでは、`installLocation`に`preferExternal`を選択してください。ただし、DRM保護されたメディアアプリは例外です。                                                                  

* アプリがDRM保護されたメディアを再生する場合、USBストレージが使用できなくなるとDRMリソースが不安定になることがあります。
* アプリがDRM保護されたメディアを再生する場合は、`installLocation`を含めないか、値を`internalOnly`に設定してください。

DRM保護されたメディアアプリ以外にも、次の種類のアプリケーションは外部ストレージにインストールしないでください。

*  サービス
*  アラームサービス
*  入力メソッドエンジン
*  アカウントマネージャー
*  同期アダプター
*  デバイスアドミニストレータ
*  "ブート完了" のメッセージをリッスンするブロードキャストレシーバー
*  ライブ壁紙 (Fire OSでは未サポート)
*  アプリウィジェット (Fire OSでは未サポート)

詳細については、Androidドキュメントの「[App Install Location](http://developer.android.com/guide/topics/data/install-location.html)」を参照してください。

{% if include.device == "firetv" %}
## Fire TVの外部ストレージの設定

Fire TV (第 1 世代) ではUSB外部ストレージがサポートされており、Fire TV (第 2 世代) には外部ストレージ用のmicroSDスロットが搭載されています。これらの端末には、接続された外部ストレージをユーザーが管理するための設定が用意されています。

{% include image.html file="firetv/getting_started/images/installlocation9" type="png" %}

ユーザーは、内部に保存されているアプリをSDカードに移動することもできます。

{% include image.html file="firetv/getting_started/images/installlocation11" type="png" %}
{% endif %}

{% if include.device == "firetablets" %}
## Fireタブレットの外部ストレージの設定

Fire OS 5 タブレットで外部ストレージカードが検出されると、[設定] の [ストレージ] ページに [サポートされているアプリをSDカードにインストール] オプションが表示されます。デフォルトでは "オン" になっています。

{% include image.html file="firetv/getting_started/images/installlocation5" type="png" %}

この設定をオンにすると、実質的にはAndroidの標準の動作`installLocation="auto"` が反転され、Amazon端末では`auto`が`preferExternal`として機能します。これは、Amazon端末のユーザーにとってはメリットですが、すべてのAndroid端末 (Amazonが提供する端末を含む) にとって最良の選択は、マニフェストで`preferExternal`を指定することです。

他の最新のAndroid端末と同様、Fire OSタブレットでも、ユーザーは内部ストレージと外部ストレージの間でアプリを移動できます。次の例では、アプリを外部ストレージに移動した後も内部ストレージでアプリのフットプリントを確認できます。

{% include image.html file="firetv/getting_started/images/installlocation7" type="png" %}

{% endif %}

## アプリで 2 次ダウンロードを処理する

初めての実行時や別のタイミングで 2 次ダウンロードを自ら実行するアプリの場合、ダウンロードされたファイルは通常、端末のAPKファイルがインストールされている場所に保存されます。アプリが外部ストレージにインストールされた場合は、APKファイルが外部ストレージに存在することになります。

アプリケーションによっては (特にゲーム)、追加のテクスチャやレベルなどのアセットファイルが含まれた 2 次ダウンロードが使用されることがあります。初回実行時の初期化中に行うなど、アプリのコード内でこのダウンロードを処理する場合は、Androidの[PackageManager getApplicationInfo](https://developer.android.com/reference/android/content/Context.html#getApplicationInfo())メソッドを使用して、`ApplicationInfo`クラスを取得します。

`ApplicationInfo`クラスには、APKの場所 (`sourceDir`) と、リソースとマニフェストが格納されたソースディレクトリのパブリックな部分 (`publicSourceDir`) が含まれています。アプリが外部ストレージにインストールされている場合、これらのパスはその場所を指し、ユーザーが追加でダウンロードしたコンテンツをインストールする場所を示しています。

アプリが`installLocation="preferExternal"` に従って 40 MBのAPKを外部ストレージにインストールしても、その後で、ダウンロードした 1 GBのデータファイルをアプリが`ApplicationInfo dataDir`のパスに基づいて内部ストレージに保存すると、外部ストレージを使用する意図に反し、端末の内部ストレージがすぐにいっぱいになるため、ユーザーの不満を招くことになります。そのため、2 次ダウンロードではダウンロードパスに`sourceDir`を使用するようにしてください。

## Unityを使用してインストール場所を指定する

Unityは、Amazonアプリストア用にゲームを作成するための人気のあるツールの 1 つです。Unityでは、Android用Player Settingsインスペクターを使用したインストール場所の設定がサポートされています。外部ストレージのアプリのインストール場所を構成するには:

1.  Unityプロジェクトで、[**File-Build Settings…**] をクリックします。
2.  [**Build Settings**] ダイアログで、[Platform] リストの [**Android**] を選択し、[**Player Settings…**] ボタンをクリックしてインスペクターを表示します。

    {% include image.html file="firetv/getting_started/images/installlocation1" type="png" %}

3.  [**Other Settings**] セクションを開き、[**Install Location**] の設定を探します。通常は`preferExternal`がデフォルトです。これは、ほとんどの場合に最適な選択肢です。

    {% include image.html file="firetv/getting_started/images/installlocation3" type="png" %}

YoYo GamesのGamemaker:Studioでも、Androidプロジェクトにはデフォルトとして`preferExternal`が使用されています。このデフォルト値は手動で変更できますが、そのままにしておくことをお勧めします。

他のエンジンや開発フレームワークでも、同様のオプションが用意されています。APKマニフェストで`installLocation`を`preferExternal`に設定するよう構成されていることを確認する方法については、使用しているツールのドキュメントを参照してください。
