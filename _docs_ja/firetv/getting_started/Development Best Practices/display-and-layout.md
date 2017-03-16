---
title: 表示とレイアウト
permalink: display-and-layout.html
sidebar: firetv
product: Fire TV
toc: false
github: true
---

テレビに正しく表示される (またはタブレットとテレビの両方で正しく動作する) Androidアプリを実装するには、ユーザーインターフェースのレイアウトに注意が必要です。

このドキュメントでは、Amazon Fire TVプラットフォームでUIレイアウトを作成するための技術情報について説明します。テレビ向けのデザインに関する一般的なガイドラインについては、「[TVプラットフォーム向けのデザインとユーザーエクスペリエンスのガイドライン][design-and-user-experience-guidelines]」を参照してください。

* TOC
{:toc}

## 画面のサイズと解像度

Fireタブレットをはじめとする多くのAndroid端末は、物理サイズが固定されており、解像度も 1 種類だけです。一方、Amazon Fire TV端末は、任意のサイズの画面に接続して、720pまたは 1080pの解像度を利用することができます。

Androidのメカニズムでは、ビデオの出力解像度にかかわらず、絶対座標でアクティビティレイアウトを指定するために、密度非依存ピクセル単位 (dp) を使用します。画面の解像度がいくつであっても、Androidではグラフィックリソースを拡張してサイズが一定に保たれます。

次の表に、Amazon Fire TV端末に接続される各種ビデオ出力のピクセルサイズ、密度、ディスプレイ解像度を示します。

<table>
   <colgroup>
      <col width="14%" />
      <col width="14%" />
      <col width="14%" />
      <col width="14%" />
      <col width="14%" />
      <col width="14%" />
      <col width="16%" />
   </colgroup>
  <thead>
    <tr>
      <th>テレビの設定</th>
      <th>出力解像度 (ピクセル)</th>
      <th>レンダリングサーフェス (ピクセル)</th>
      <th>密度識別子</th>
      <th>画面密度 (dp)</th>
      <th>ディスプレイ解像度 (dp)</th>
      <th>画面サイズ識別子</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1080p</td>
      <td>1920 x 1080</td>
      <td>1920 x 1080</td>
      <td><code>xhdpi</code></td>
      <td>320</td>
      <td>960x540</td>
      <td><code>large</code></td>
    </tr>
    <tr>
      <td>720p</td>
      <td>1280 x 720</td>
      <td>1920 x 1080</td>
      <td><code>xhdpi</code></td>
      <td>320</td>
      <td>960x540</td>
      <td><code>large</code></td>
    </tr>
    <tr>
      <td>480p</td>
      <td>640 x 480</td>
      <td>1920 x 1080</td>
      <td><code>xhdpi</code></td>
      <td>320</td>
      <td>960x540</td>
      <td><code>large</code></td>
    </tr>
  </tbody>
</table>


## 画面表示の向き

Amazon Fire TV端末の画面表示の向きは、横向きに固定されています。回転または向きの変更を端末に求める要求に対しては、次の結果が返されます。

<table>
   <colgroup>
      <col width="30%" />
      <col width="70%" />
   </colgroup>
  <thead>
    <tr>
      <th>メソッド</th>
      <th>結果</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="http://developer.android.com/reference/android/view/Display.html#getRotation%28%29"><code>Display.getRotation()</code></a></td>
      <td>0 (<code>ROTATION_0</code>)</td>
    </tr>
    <tr>
      <td><a href="http://developer.android.com/reference/android/view/Display.html#getOrientation%28%29"><code>Display.getOrientation()</code></a> (廃止)</td>
      <td>0 (<code>ORIENTATION_UNDEFINED</code>)</td>
    </tr>
  </tbody>
</table>

## リソース設定

タブレットなど、Amazon Fire TV以外のプラットフォームで実行するアプリを設計する場合は、プラットフォームごとに異なるレイアウトとドローアブルを作成し、各種プラットフォームや端末の設定用に名前を付けたres/のサブディレクトリに保存できます。これらリソース設定の使用方法の詳細については、Androidのベストプラクティスガイドの「[複数の画面のサポート](http://developer.android.com/guide/practices/screens_support.html)」を参照してください。

次の表に、Amazon Fire TVプラットフォームで使用可能なリソース設定を示します。

<table>
   <colgroup>
      <col width="30%" />
      <col width="70%" />
   </colgroup>
  <thead>
    <tr>
      <th>設定</th>
      <th>値</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>最小幅</td>
      <td><code>sw540dp</code></td>
    </tr>
    <tr>
      <td>使用可能な幅</td>
      <td><code>w960dp</code></td>
    </tr>
    <tr>
      <td>使用可能な高さ</td>
      <td><code>h540dp</code></td>
    </tr>
    <tr>
      <td>画面サイズ</td>
      <td><code>large</code></td>
    </tr>
    <tr>
      <td>画面アスペクト比</td>
      <td><code>long</code></td>
    </tr>
    <tr>
      <td>画面の向き</td>
      <td><code>land</code> (TVアプリは常に横向きです)</td>
    </tr>
    <tr>
      <td>UIモード</td>
      <td><code>television</code></td>
    </tr>
    <tr>
      <td>ナイトモード</td>
      <td><code>notnight</code></td>
    </tr>
    <tr>
      <td>画面ピクセル密度</td>
      <td><code>xhdpi</code></td>
    </tr>
    <tr>
      <td>タッチスクリーンタイプ</td>
      <td><code>notouch</code></td>
    </tr>
    <tr>
      <td>キーボードの使用可能状況</td>
      <td><code>keyssoft</code></td>
    </tr>
    <tr>
      <td>主なテキスト入力方法</td>
      <td><code>nokeys</code></td>
    </tr>
    <tr>
      <td>ナビゲーションキーの使用可否</td>
      <td><code>navexposed</code></td>
    </tr>
    <tr>
      <td>タップ以外の主なナビゲーション方法</td>
      <td><code>dpad</code></td>
    </tr>
    <tr>
      <td>プラットフォームバージョン</td>
      <td><code>v17</code></td>
    </tr>
  </tbody>
</table>

{% include links.html %}
