Fire OSは、AmazonのFire TVやFireタブレットなどのデバイスで動作するオペレーティングシステムです。Fire OSはAndroid 5.1 (Lollipop、APIレベル 22) のフォークです。そのため、ほとんどのAndroidアプリはAmazonのFireデバイスでそのまま動作します。

Androidコードを一切調整しなくても、アプリをAmazonのプラットフォームで公開できる場合があります。[こちら][app-testing-service-understanding]のページを参考にテストすることで、問題なくアプリが動くかどうかを確認できます。

* TOC
{:toc}

## サービスの違い

Fire OSとAndroidの違いは、サービスにあります。Fire OSでは、ブラウズ、位置情報、メッセージング、支払いなどのアクティビティにGoogleのサービスではなくAmazonのサービスが使用されます。最も大きな違いは、アプリを掲載するために、GoogleではGoogle Playを利用するのに対し、AmazonではAmazonアプリストアを利用することです。

AndroidアプリでGoogleのサービスのエコシステムに接続している場合は、AndroidアプリをFire OSプラットフォームに移植する際、Amazonのサービスのエコシステムを利用する必要があります。また、Fire OSではAndroid Lollipop (APIレベル 22) のみをサポートしています。

アプリを開発する際は、標準の[Androidのドキュメント](https://developer.android.com/)に記載された内容に従ってください。注意が必要なAmazonのFire OSプラットフォームとの違いが、こちらのサイトのドキュメントで説明されています。

Fire OSでは、開発者の方が開発プラットフォームについて新たに学習したり、既存のAndroidアプリを変更したりする必要がないように、可能な限りAndroidと同等のサービス (Googleのサービスを除く) を提供することを目標としています。

## 端末とFire OSのバージョン

ほとんどのFireデバイスは、無線でアップデートを受信し、Fire OSの最新バージョンを自動で取得します。すべてのFireデバイスが、同じFire OSのバージョンのプッシュを同時に受信するわけではありません。デバイスごとに異なるタイミングでアップデートがロールアウトされることもあります。ただし、基本的には、ほとんどのFireデバイスで同じバージョンが実行されます。

{% include tip.html content="Android TVの開発とFire TVの開発の違いの詳細については、「[Fire TV開発とAndroid TV開発の違い][amazon-fire-tv-differences-from-android-tv-development]」を参照してください。" %}
