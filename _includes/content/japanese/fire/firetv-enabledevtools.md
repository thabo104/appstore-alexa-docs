開発者ツールメニューを起動するには、下記のいくつかの方法があります。

*   [リモコンを用いる場合][amazon-fire-tv-remote-input]: D-pad（ナビゲーションボタン）上で、 **選択ボタン（中央）** と **下** を同時に５秒長押ししてください。その後、リモコンの **メニュー** ボタンを押してください。*   [Amazonのゲームコントローラーを用いる場合][amazon-fire-game-controller-input]:  **A ボタン** と **Y ボタン** を同時に５秒長押ししてください。その後、コントローラーの **メニュー** ボタンを押してください。
*   [ADBを用いてAmazon Fire TVに接続している場合](connecting-adb-to-fire-tv-device):　接続中のコンピュータ上で、下記のコマンドを実行してください。ダイアログボックスが立ち上がります。 

`adb shell am start com.amazon.ssm/com.amazon.ssm.ControlPanel`