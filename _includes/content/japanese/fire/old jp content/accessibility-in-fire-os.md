このページでは、Fire OSのユーザー補助機能の実装に関連する概念と用語について説明します。  

{% include note.html content="こちらの前に、ユーザー補助に関するAndroidのドキュメントを読み、用語と概念をよく理解しておくことをお勧めします。「[Making Applications More Accessible](https://developer.android.com/guide/topics/ui/accessibility/apps.html)」を参照してください。"%}

* TOC
{:toc}

## Fire OSのユーザー補助に関するオブジェクトとイベント

このセクションでは、アプリにユーザー補助機能を実装する際に使用するオブジェクトとイベントに関する用語とその定義を紹介します。

### AccessibilityEvent

`AccessibilityEvent`は、UIで何かが行われたことを表す、アプリケーションからユーザー補助機能へのメッセージです。ユーザー補助イベントをトリガーするUIの変化には、フォーカスの変化、ウィンドウの表示や非表示、画面上のオブジェクトの位置の変化などがあります。

[`AccessibilityEvents`](https://developer.android.com/reference/android/view/accessibility/AccessibilityEvent.html)に関するAndroidのドキュメントも参照してください。

### AccessibilityNodeInfo

`AccessibilityNodeInfo`は、画面上のコンポーネントに関するユーザー補助情報のスナップショットです。ほとんどの場合、アプリケーションからユーザー補助機能への一方向の通信です。ごくまれですが、ユーザー補助アクションを介してユーザー補助機能からアプリケーションに情報が返されることもあります。

アプリケーションによって`AccessibilityNodeInfo`が作成されて返されると、それ以降はユーザー補助機能とアクセシビリティフレームワークで当該ノードに対する変更が確認されなくなるため、その時点でノードを破棄できます。ノードが表す基礎オブジェクトが変更された場合は、変更を示す適切なユーザー補助イベントを送信してください。その際、`createAccessibilityNodeInfo`または`onInitializeAccessibilityNodeInfo`への次の呼び出しで返されるノード内のオブジェクトを確認し、特性の更新内容をイベントに反映してください。

アプリケーションでは、サーバー側でのノードの参照に、Androidビューと仮想子孫番号を組み合わせて使用してください。ノードがビュー自体を表している場合、仮想子孫番号は`-1 (AccessibilityNodeProvider.HOST_VIEW_ID)` になります。

アプリケーションでは、`AccessibilityNodeInfo`オブジェクトに関する説明情報をそのオブジェクトの`getExtras` Bundleに追加できます。VoiceViewは、[AccessibilityNodeInfo.getExtras()](https://developer.android.com/reference/android/view/accessibility/AccessibilityNodeInfo.html#getExtras%28%29)を呼び出して、この情報を読み取ることができます。

[`AccessibilityNodeInfo`](https://developer.android.com/reference/android/view/accessibility/AccessibilityNodeInfo.html)に関するAndroidのドキュメントも参照してください。

### AccessibilityNodeProvider

`AccessibilityNodeProvider`は、あるビューの`AccessibilityNodeInfo`、またはあるビューの仮想的にアクセス可能な子孫の`AccessibilityNodeInfo`を作成するインターフェースです。

[`AccessibilityNodeProvider`](https://developer.android.com/reference/android/view/accessibility/AccessibilityNodeProvider.html)に関するAndroidのドキュメントも参照してください。

### AccessibilityDelegate

`AccessibilityDelegate`は、イベント、ビューのノード、または仮想的にアクセス可能な子孫を初期化できるインターフェースです。`AccessibilityDelegates`を使用すると、あるビューのユーザー補助情報を別のビューで代替や補完として利用することができます。たとえば、親リストでリスト項目のユーザー補助情報を提供できます。

[`AccessibilityDelegate`](https://developer.android.com/reference/android/view/View.AccessibilityDelegate.html)に関するAndroidのドキュメントも参照してください。

## ユーザー補助イベントのパス

このセクションでは、標準ビューやカスタムビューのユーザー補助イベントのパスについて説明します。  

### 標準ビュー

Fire OSアプリのユーザーインターフェースを構成する視覚的要素をビューと呼びます。たとえば、1 つのテキスト要素を持つ (`TextView`で "hello world" というテキストを表示する) 簡単なアプリがあるとします。このとき、`TextView`は`RelativeLayout`の子であるとします。`RelativeLayout`は、常にアプリのビュー階層のルートとなるクラス`ViewRootImpl`の子です。`TextView`は標準のAndroidビューであるため、`TextView`は、デフォルトの動作として、実行時に適切なユーザー補助イベントを送信します。

以下のプロセスは、このシンプルなアプリ内で作成されるユーザー補助イベントの流れを表しています。

1.  アプリを開いてから数秒後に、アプリのコードが`textView.setText("new text")` を呼び出します。
2.  `TextView`が`TYPE_WINDOW_CONTENT_CHANGED`という`AccessibilityEvent`を作成し、このイベントを送信するよう親の`RelativeLayout`にリクエストします。
3.  `RelativeLayout`がイベントを親の`ViewRootImpl`に渡し、フレームワークに送信するようリクエストします。
4.  `ViewRootImpl`が、`AccessibilityManager`の`sendAccessibilityEvent()` を呼び出して、イベントをアクセシビリティフレームワークに送信します。
5.  `AccessibilityManager`がイベントを`AccessibilityManagerService`に渡します。`AccessibilityManagerService`はアクセシビリティフレームワークからVoiceViewにイベントを渡します。
6.  VoiceViewは`TYPE_WINDOW_CONTENT_CHANGED AccessibilityEvent`を処理する際に、イベントオブジェクトの`getSource()` メソッドを呼び出します。
7.  このメソッドがトリガーとなり、アクセシビリティフレームワークが`TextView`の`createAccessibilityNodeInfo()` メソッドを呼び出します。このメソッドは、"new text" が含まれた`AccessibilityNodeInfo`オブジェクトを返します。
8.  アクセシビリティフレームワークが、`AccessibilityNodeInfo`オブジェクトをVoiceViewに返します。
9.  最後に、`TextView`が "hello world" から "new text" に変更されたことを、VoiceViewが認識します。ユーザーがリニアナビゲーションを使用して`TextView`のテキストを読み上げさせると、VoiceViewは "new text" を正しく読み上げます。

### カスタムビュー

アプリで標準ビューの代わりにカスタムビューを使用する場合、VoiceViewにウィジェットの状態を通知するためのパターンを守る必要があります。通知する際、`AccessibilityNodeInfo`オブジェクトをVoiceViewに送信したり、アプリ内の`AccessibilityNodeInfo`のローカルコピーを更新したりしないでください。これらの方法は機能しません。

カスタムウィジェットの状態を変更する際は、以下の点に注意してください。

**必須事項**

*   カスタムビューの親の`requestSendAccessibilityEvent()` を呼び出し、`AccessibilityEvent`を送信してください。
*   カスタムビューの`createAccessibilityNodeInfo()` 関数内で参照されている変数に、更新された値が含まれていることを確認してください。VoiceViewは`AccessibilityEvent`を受け取ると、`createAccessibilityNodeInfo()` を呼び出します。

**禁止事項**

*   VoiceViewに`AccessibilityNodeInfo`を送信しないでください。
*   `AccessibilityNodeInfo`オブジェクトへの参照が`createAccessibilityNodeInfo()` 関数に含まれていない状態で、このオブジェクトを更新しないでください。VoiceViewにはこのオブジェクトを参照する手段がないため、このオブジェクトの更新を確認できません。

Androidのドキュメントで、`AccessibilityDelegate`クラスと、`createAccessibilityNodeInfo()` 関数が実装されているAccessibilityNodeProviderクラスの正しい使い方を示したコード例を確認してください。

## ビューの重要度を設定する

ユーザー補助イベントが適切に処理されるように、Androidビューごとにユーザー補助の重要度を設定してください。 

ユーザー補助におけるビューの重要度は、XMLレイアウトで`android:importantForAccessibility`属性を使用するか、プログラムで`View.setImportantForAccessibility`メソッドを使用して設定します。設定できる値は、`yes`、`no`、`no_hide_descendants`、`auto` (デフォルト) です。重要でない値が設定されたビューには、対応するユーザー補助ノードが作成されません。また、そのビューから送信されたユーザー補助イベントは、フレームワークによって破棄されます。

ビューが適切なユーザー補助イベントを送信していても、VoiceViewが正しく応答していないと思われる場合は、ビューがユーザー補助で重要であると設定されているかどうかを確認してください。

## AccessibilityNodeInfoオブジェクトを管理する

`AccessibilityNodeInfo`オブジェクトの管理は、Fire OSとAndroidのユーザー補助における重要な要素の 1 つです。アプリのプロセスで実行されるAndroidアクセシビリティフレームワークは、特定のノードに対するリクエストを受信すると、まずそのノードがキャッシュ内に存在するかを確認します。

*   ノードがキャッシュに存在する場合は、ノードが返され、アプリに対するノード作成の呼び出しは行われません。そのため、コンポーネントに関するユーザー補助情報が変更されるたびに、アプリはフレームワークとユーザー補助機能に通知する必要があります。通知しない場合、フレームワークは古い情報をユーザー補助機能に返します。
*   ノードが変更されて無効になったことを示すには、`AccessibilityEvent.TYPE_WINDOW_CONTENT_CHANGED`タイプのユーザー補助イベントを送信します。
*   ノードがまだキャッシュにない場合は、リクエストされた方法に応じてノードが作成されます。以下に示すように、`AccessibilityNodeInfo`オブジェクトの作成をトリガーする可能性のある、ユーザー補助機能によるアクションは複数あります。
    *   ユーザー補助イベントを受信してそのソースをリクエストする
    *   アクティブなウィンドウのルートノードをリクエストする
    *   特定のノードの親ノードまたは子ノードをリクエストする

## 仮想的にアクセス可能な子孫ビューを実装する

このセクションでは、仮想的にアクセス可能な子孫ビューの実装方法について説明します。

### 仮想的にアクセス可能な子孫ビューを作成する

`AccessibilityDelegate`と`AccessibilityNodeProvider`はどちらも、基盤のビューで表現されない画面コンポーネントにユーザー補助機能を提供できます。このようなコンポーネントの例には、キーがキャンバス上に描画されるAOSPのオンスクリーンキーボードがあります。仮想ノードツリーを実装すると、Androidが提供する`ExploreByTouchHelper`サポートライブラリが期待どおりに動作しないことがあります。

アプリは、ノードをホストしているビューと仮想ビューIDを使用して`AccessibilityNodeInfo`オブジェクトを参照します。仮想ビューIDが`-1 (AccessibilityNodeProvider.HOST_VIEW_ID)` の場合は、ホストビュー自体が参照されます。ノードを作成する際に仮想子ビューを追加するには、`AccessibilityNodeInfo.addChild()` メソッドを使用し、ホストビューと、仮想子ビューの仮想ビューIDを指定します。同様に、子ノードを作成する際に仮想親ビューを設定するには、`AccessibilityNodeInfo.setParent()` の呼び出しでホストビューと親仮想ビューIDを指定します。

### 仮想的にアクセス可能な子孫ビューを管理する

仮想ビューは、最初の作成直後は、自身のIDでのみ参照され、関連するユーザー補助情報 (テキスト、コンテンツの説明など) を持っていません。アクセシビリティフレームワークがアプリに対して適切なノードを作成するようリクエストすると、対応するユーザー補助情報が`AccessibilityNodeInfo`に入力されます。そのため、どの仮想ビューIDがカスタムウィジェットのどの部分を表しているかをアプリが追跡するようにしてください。

子ノードまたは親ノードのIDを追加すると、フレームワークがアプリケーションに対して実際にこれらのノードを作成するようリクエストします。コンテナノードに子ノードを追加しないでください。

## Fire OSのユーザー補助に関するベストプラクティス

アプリのユーザーエクスペリエンスを最大限に向上できるよう、以下のガイドラインに従ってください。

*   **AccessibilityNodeInfoのテキスト**: `AccessibilityNodeInfo`のテキストは、オブジェクトの画面上のテキストだけを返すようにします。
*   **画面上のアイテムのラベル**: 画面上の重要なアイテムには、すべてラベルを付けてください。VoiceViewをテストするときは、すべての画面上のアイテムをタップして、適切な説明が読み上げられるかを確認してください。説明が欠けている場合は、適切なテキストやコンテンツの説明をアイテムの`AccessibilityNodeInfo`に追加する必要があります。
*   **コンテンツの説明**: 画面上のテキストがないアイテムには、コンテンツの説明 (画像の代替テキストなど) を使用してください。または、画面上のテキストを補完するために、追加の文脈情報をユーザーに提供することもできます。ただし、ユーザーが困惑するほど多くの情報をコンテンツの説明に加えないようにしてください。*   **ユーザー補助イベントの使用**: 画面上のアクティビティを伝えために、`AccessibilityEvent.TYPE_ANNOUNCEMENT`イベントタイプを使用しないでください。画面上の変化に関する情報を伝える方法としては、相当する変更を`AccessibilityNodeInfo`に加えてユーザー補助イベントと組み合わせることが推奨されます。
