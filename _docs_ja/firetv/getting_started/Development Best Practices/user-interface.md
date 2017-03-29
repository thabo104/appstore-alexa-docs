---
title: AndroidのMenuとActionBarウィジェット
permalink: user-interface.html
sidebar: firetv
product: Fire TV
toc-style: kramdown
github: true
---

このページでは、AndroidのMenuとActionBarウィジェットをFire TV対応アプリで動作するよう変更する方法について説明します。

Amazon Fire TVプラットフォームでは、既存のAndroid UIフレームワーク (`android.widget.*`) の大部分を変更せずに使用できますが、 [Menu][1]と[ActionBar][2]は例外です。それ以外のAndroidウィジェットはすべてそのままで機能します。ただし、Fire TVユーザーインターフェースでは、外観が変わることがあります。

## メニューと操作バー

アプリでAndroidの[ActionBar][3]を使用する場合は、操作バーのアイテムが画面に表示されない点に注意する必要があります。これは、ユーザーインターフェースが雑然とするのを避けるための仕様です。代わりに、ユーザーがFire TVリモコンまたはFireゲームコントローラーの [メニュー] ボタンを押すと、操作バーのアイテムがモーダルダイアログボックスに表示されます。ユーザーはダイアログから、操作アイテムまたはナビゲーションタブを選択できます。

現時点では、操作バーの操作アイテム、タブ、オプションメニュー、およびサブメニューのみが処理されます。デフォルトでは、アプリケーションまたはアクティビティの起動時に操作バーは表示されません。[メニュー] ボタンを押すとダイアログウィンドウが開き、最大で 2 列に並んだリストビューが表示されます。左のリストビューにはすべてのタブが表示され、右のリストビューには操作アイテムが表示されます。

リモコンのナビゲーションボタンやゲームコントローラーの方向ボタンで、リスト間やリスト内を移動できます。アイテムにサブメニューがある場合は、アイテムを選択すると、親リストに代わってサブメニューがリスト表示されます。この実装では、メニュー階層とナビゲーション状態の遷移は追跡されません。どの状態でも、[戻る] を押すとダイアログウィンドウが閉じます。

操作バーのハンドルを取得するには、アクティビティ用の[`onCreate(Bundle)`][5]メソッドで[`getActionBar()`][4] メソッドを使用します。アクティビティでは[API][6]のすべての機能を利用できます。

ドロップダウンリストと操作ビューは、Amazon Fire TVプラットフォームではサポートされていないため注意してください。

[1]: http://developer.android.com/reference/android/view/Menu.html
[2]: http://developer.android.com/reference/android/app/ActionBar.html
[3]: http://developer.android.com/guide/topics/ui/actionbar.html
[4]: http://developer.android.com/reference/android/app/Activity.html#getActionBar%28%29
[5]: http://developer.android.com/reference/android/app/Activity.html#onCreate%28android.os.Bundle%29
[6]: http://developer.android.com/reference/android/app/Activity.html

{% include links.html %}
