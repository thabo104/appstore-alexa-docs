---
title: Unityによるコントローラー入力
permalink: controller-input-with-unity.html
sidebar: firetv
product: Fire TV
toc: false
---

[Unity開発ツール](http://unity3d.com/unity)を使用すれば、Android端末用のアプリやゲームを作成するのと同様に、Amazon Fire TV用のアプリやゲームを作成できます。

Fire TV開発用のUnityプラグインは提供されていませんが、ゲームコントローラーをサポートするためのパッケージがUnity Asset Storeにあります。特に[Gallant GamesのInControl](http://www.gallantgames.com/incontrol)には、Amazonの開発者も大きな恩恵を受けています。InControlは、広く利用されている各種コントローラーの制御マッピングを標準化する、Unity3Dのクロスプラットフォームインプットマネージャーです。

Unityインプットマネージャーを使って、ゲームのコントローラー入力を設定することもできます。Amazon Fire TVリモコン/ゲームコントローラーのボタンとUnityインプットマネージャーのボタン/軸との対応関係については、以下の表を参照してください。

{% include note.html content="このドキュメントの入力リファレンスはUnity 4.3.x以降に適用されますが、今後のUnityのリリースで変更される可能性があります。" %}

* TOC
{:toc}

## リモコン入力

Unityの以下の値を使用して、Amazon Fire TVリモコンとAmazon Fire TV音声認識リモコンの両方でボタンをマップします。Unity KeyCodeの値の詳細については、「<a href="http://docs.unity3d.com/ScriptReference/KeyCode.html">KeyCode</a>」を参照してください。

{% include image.html title="Unityリモコン" file="firetv/getting_started/images/remote-unity" type="png" %}

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
  <thead>
    <tr>
      <th>ボタン</th>
      <th>Unityインプットマネージャーの値</th>
      <th>Unity KeyCodeの値</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>ホーム</td>
      <td>1 (システムイベント) </td>
      <td>なし (システムイベント)</td>
    </tr>
    <tr>
      <td>バック</td>
      <td>なし (非サポート)</td>
      <td><code>KeyCode.Escape</code></td>
    </tr>
    <tr>
      <td>メニュー</td>
      <td>なし (非サポート)</td>
      <td><code>KeyCode.Menu</code></td>
    </tr>
    <tr>
      <td>マイク (検索)</td>
      <td>なし (システムイベント)</td>
      <td>なし (システムイベント)</td>
    </tr>
    <tr>
      <td>選択 (D-pad (ナビゲーション) の [選択])</td>
      <td>Joystick Button 0</td>
      <td><code>KeyCode.JoystickButton0</code></td>
    </tr>
    <tr>
      <td>左 (D-pad)</td>
      <td>5th Axis</td>
      <td><code>KeyCode.LeftArrow</code></td>
    </tr>
    <tr>
      <td>右 (D-pad)</td>
      <td>5th Axis</td>
      <td><code>KeyCode.RightArrow</code></td>
    </tr>
    <tr>
      <td>上 (D-pad)</td>
      <td>6th Axis</td>
      <td><code>KeyCode.UpArrow</code></td>
    </tr>
    <tr>
      <td>下 (D-pad)</td>
      <td>6th Axis</td>
      <td><code>KeyCode.DownArrow</code></td>
    </tr>
    <tr>
      <td>再生/一時停止</td>
      <td>なし (非サポート)</td>
      <td>なし (非サポート)</td>
    </tr>
    <tr>
      <td>早戻し</td>
      <td>なし (非サポート)</td>
      <td>なし (非サポート)</td>
    </tr>
    <tr>
      <td>早送り</td>
      <td>なし (非サポート)</td>
      <td>なし (非サポート)</td>
    </tr>
  </tbody>
</table>


## ゲームコントローラー入力

Unityの以下の値を使って、Amazon Fire Game Controllerでボタンをマップします。Unity KeyCodeの値の詳細については、「<a href="http://docs.unity3d.com/ScriptReference/KeyCode.html">KeyCode</a>」を参照してください。

{% include image.html title="ゲームコントローラーUnity" file="firetv/getting_started/images/gamecontrollr-unity" type="png" %}

{% include image.html title="ゲームコントローラーUnity" file="firetv/getting_started/images/gamecontrollr-unity-second-view" type="png" %}

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
  <thead>
    <tr>
      <th>ゲームコントローラーボタン</th>
      <th>Unityインプットマネージャーの値</th>
      <th>Unity KeyCodeの値</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>ホーム</td>
      <td>なし (システムイベント)</td>
      <td>なし (システムイベント)</td>
    </tr>
    <tr>
      <td>バック</td>
      <td>なし (システムイベント)</td>
      <td><code>KeyCode.Escape</code></td>
    </tr>
    <tr>
      <td>メニュー</td>
      <td>なし (システムイベント)</td>
      <td><code>KeyCode.Menu</code></td>
    </tr>
    <tr>
      <td>GameCircle</td>
      <td>なし (システムイベント)</td>
      <td>なし (システムイベント)</td>
    </tr>
    <tr>
      <td>A</td>
      <td>Joystick Button 0</td>
      <td><code>KeyCode.JoystickButton0</code></td>
    </tr>
    <tr>
      <td>B</td>
      <td>Joystick Button 1</td>
      <td><code>KeyCode.JoystickButton1</code></td>
    </tr>
    <tr>
      <td>X</td>
      <td>Joystick Button 2</td>
      <td><code>KeyCode.JoystickButton2</code></td>
    </tr>
    <tr>
      <td>Y</td>
      <td>Joystick Button 3</td>
      <td><code>KeyCode.JoystickButton3</code></td>
    </tr>
    <tr>
      <td>左 (D-pad (十字キー))</td>
      <td>5th Axis</td>
      <td>なし</td>
    </tr>
    <tr>
      <td>右 (D-pad)</td>
      <td>5th Axis</td>
      <td>なし</td>
    </tr>
    <tr>
      <td>上 (D-pad)</td>
      <td>6th Axis</td>
      <td>なし</td>
    </tr>
    <tr>
      <td>下 (D-pad)</td>
      <td>6th Axis</td>
      <td>なし</td>
    </tr>
    <tr>
      <td>左アナログスティック (左/右)</td>
      <td>1st Axis / X Axis</td>
      <td>なし</td>
    </tr>
    <tr>
      <td>左アナログスティック (上/下)</td>
      <td>2st Axis / Y Axis</td>
      <td>なし</td>
    </tr>
    <tr>
      <td>左アナログスティックの押し下げ</td>
      <td>Joystick Button 8</td>
      <td><code>KeyCode.JoystickButton8</code></td>
    </tr>
    <tr>
      <td>右アナログスティック (左/右)</td>
      <td>3rd Axis</td>
      <td>なし</td>
    </tr>
    <tr>
      <td>右アナログスティック (上/下)</td>
      <td>4th Axis</td>
      <td>なし</td>
    </tr>
    <tr>
      <td>右アナログスティックの押し下げ</td>
      <td>Joystick Button 9</td>
      <td><code>KeyCode.JoystickButton9</code></td>
    </tr>
    <tr>
      <td>再生/一時停止</td>
      <td>なし (非サポート)</td>
      <td>なし (非サポート)</td>
    </tr>
    <tr>
      <td>早戻し</td>
      <td>なし (非サポート)</td>
      <td>なし (非サポート)</td>
    </tr>
    <tr>
      <td>早送り</td>
      <td>なし (非サポート)</td>
      <td>なし (非サポート)</td>
    </tr>
    <tr>
      <td>L2トリガー </td>
      <td>13th Axis</td>
      <td>なし</td>
    </tr>
    <tr>
      <td>L1ショルダーボタン</td>
      <td>Joystick Button 4</td>
      <td><code>KeyCode.LeftShift KeyCode.JoystickButton4</code></td>
    </tr>
    <tr>
      <td>R2トリガー</td>
      <td>12th Axis</td>
      <td>なし</td>
    </tr>
    <tr>
      <td>R1ショルダーボタン</td>
      <td>Joystick Button 5</td>
      <td><code>KeyCode.RightShift KeyCode.JoystickButton5</code></td>
    </tr>
  </tbody>
</table>


## コントローラーの名前

Unityでは、[`Input.GetJoystickNames()`](http://docs.unity3d.com/ScriptReference/Input.GetJoystickNames.html) メソッドでコントローラーの名前を使用できます。各コントローラーに使用する値は次の通りです。

*   リモコン: `"Amazon Fire TV Remote"`
*   音声認識リモコン: `"Amazon Fire TV Remote"`
*   ゲームコントローラー: `"Amazon Fire Game Controller"`

{% include links.html %}
