広告IDは、ユーザーによるリセットが可能な一意の匿名識別子で、広告配信とユーザー分析に使用します。ユーザーは、広告IDをリセットしたり、関心に基づいて広告を配信するためのトラッキングをオプトアウトしたりすることができます。現時点では、広告IDはFire OS 5.1 以降を実行しているタブレット端末と、Fire OS 5.2.1.1 以降を実行しているTV端末で利用できます。
{% if include.device == "firetablets" %}
Fireタブレットでは、[**設定**] > [**アプリとゲーム**] > [**広告ID**] の順に移動して、広告IDを管理できます。
{% endif %}

{% if include.device == "firetv" %}
Fire TVでは、[**設定**] > [**端末**] > [**広告ID**] の順に移動して、広告IDを管理できます。
{% endif %}

* TOC
{:toc}

## 広告IDを使用する状況

アプリで以下のことを実行する際に、広告IDが必要です (端末が対応している場合に限ります)。

*  広告を表示する
*  ユーザー分析のためにデータを収集する
*  広告配信のために、または関心に基づく広告でユーザーをターゲットにするためにユーザープロファイルを作成する

広告IDを利用できる場合は、他のIDに優先して使用してください。アプリでサードパーティの広告サービスを使用する場合は、そのサービスがユーザーの選択に関する要件を満たしているかを確認してください。

## 開発者に期待されること

広告IDを使用する際は、以下の 3 つの原則に従ってください。

*  広告IDは広告配信とユーザー分析の目的にのみ使用してください。
*  ユーザーが関心に基づく広告をオプトアウトした場合でも、広告IDを引き続き使用できますが、開発者はユーザーの選択を尊重してください。広告配信または関心に基づく広告表示の目的で、ユーザーの行動に関する情報を収集してユーザープロファイルを作成することはしないでください。コード内に、広告IDを取得する呼び出しの前に、ユーザーのオプトアウトの選択を確認する呼び出しを記述してください。許可されるアクティビティは、コンテキスト広告、フリークエンシーキャップ、コンバージョン追跡、レポート作成、およびセキュリティと不正検出です。
*  ユーザーが明示的に同意した場合を除き、永続的な端末IDや個人を特定できる情報を広告IDと関連付けないでください。
*  ユーザーが広告IDをリセットした場合、ユーザーが明示的に同意した場合を除き、以前のデータを新しい広告IDに組み込んだり、新しいIDと古いIDを関連付けたりしないでください。

詳細については、「[App Distribution and Services Agreement](https://developer.amazon.com/public/support/legal/da#advertising_Id_schedule)」を参照してください。

## 広告IDに関するユーザーの選択を確認して対応する

広告IDに関するユーザーの選択は、Androidの[*Settings.Secure*](http://developer.android.com/reference/android/provider/Settings.Secure.html)クラスの[*getInt*](http://developer.android.com/reference/android/provider/Settings.Secure.html#getInt%28android.content.ContentResolver,%20java.lang.String%29)メソッドと[*getString*](http://developer.android.com/reference/android/provider/Settings.Secure.html#getString%28android.content.ContentResolver,%20java.lang.String%29)メソッドを通じて公開されています。以下のJavaの例は、ユーザーの設定を確認し、広告IDを取得する (取得可能な場合) ロジックを示しています。

```java
import android.content.ContentResolver;
import android.provider.Settings.Secure;
import android.provider.Settings.SettingNotFoundException;

String advertisingID = "";
boolean limitAdTracking = false;

try {
    ContentResolver cr = getContentResolver();

    // ユーザーのトラッキング設定を取得
    limitAdTracking = (Secure.getInt(cr, "limit\_ad\_tracking") == 0) ? false : true;

    // 広告IDを取得
    advertisingID = Secure.getString(cr, "advertising\_id");
} catch (SettingNotFoundException ex) {
    // サポートされていない場合

}
```

このコードは最初にユーザーの広告トラッキング設定を取得します。広告トラッキングの値に応じて、以下が行われます。

{% if include.device == "firetablets" %}

*  ユーザーが広告トラッキングを許可している場合、`limit_ad_tracking`の値は`false`になります。
*  ユーザーが広告トラッキングを無効にしている場合、`limit_ad_tracking`の値は`true`になります。 
*  広告IDは`advertisingID`変数に格納されます。広告IDの値は、`df07c7dc-cea7-4a89-b328-810ff5acb15d`などです(子プロファイルの場合、`advertisingID`は`00000000-0000-0000-0000-00000000000`になります)。
*  `limit_ad_tracking`の値が返されない場合 (Fire OS以外の端末や古いバージョンのFire OSを実行しているFireデバイスなど)、`SettingNotFoundException`がスローされます。この例外は必要に応じて処理できます。

{% endif %}

{% if include.device == "firetv" %}

*  ユーザーが広告トラッキングを許可している場合、`limit_ad_tracking`の値は`false`になります。
*  ユーザーが広告トラッキングを無効にしている場合、`limit_ad_tracking`の値は`00000000-0000-0000-0000-000000000000`になります(注意: これはバグです。将来的には、Fireタブレットの戻り値と同様に、この値は`true`になります)。
*  広告IDは`advertisingID`変数に格納されます。広告IDの値は、`df07c7dc-cea7-4a89-b328-810ff5acb15d`などです(子プロファイルの場合、`advertisingID`は`00000000-0000-0000-0000-00000000000`になります)。*  `limit_ad_tracking`の値が返されない場合 (Fire OS以外の端末や古いバージョンのFire OSを実行しているFireデバイスなど)、`SettingNotFoundException`がスローされます。この例外は必要に応じて処理できます。*  ユーザーが関心に基づく広告のオプトアウトの値を変更した場合 (有効から無効、またはその反対)、広告IDは新しい値に設定されます(注意: これはバグです。将来的には、Fireタブレットでの動作と同様に、同じ広告IDが返されるようになります)。

{% endif %}