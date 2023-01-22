# TODO アプリ

このアプリは Flutter を使用した TODO アプリです。
Flutter の開発で必要な基本知識の習得に役立てるリポジトリです。

## このアプリの特徴

本アプリでは以下の特徴を持っています。

- メモの追加、編集、削除、取得
- アーカイブ機能（ゴミ箱）
- メモのページング機能
- ゴミ箱に存在しているメモの自動削除機能
- SnackBar の表示、取消機能

![todo_demo](https://user-images.githubusercontent.com/62784463/213902973-4a278e61-57e1-416b-a333-bc62ff51ba8b.gif)

## アプリで使用したパッケージ

### 1. Riverpod

このアプリでは [Riverpod](https://pub.dev/packages/flutter_riverpod)を使用した状態管理をしています。Riverpod の基本的な使い方は全て取り入れているため、基本的な使い方を理解することができます。

### 2. GoRouter

画面遷移には[GoRouter](https://pub.dev/packages/go_router)を使用しています。宣言的な遷移を実現でき、Flutter の公式パッケージとなっています。応用的な取り扱いはしていないため、基礎を習得するレベルとなります。

### 3. Isar

ローカルのデータベースには[Isar Database](https://pub.dev/packages/isar)を使用しています。ドキュメントも充実しており、使い方もシンプルでおすすめです。作成、更新、読み取り、削除の基本的な扱い方はこのアプリ内で使用されています。

### 4. logger

ログの取得力は[logger](https://pub.dev/packages/logger)を使用しています。print 関数は基本的に使用することを避けています。様々なロガーパッケージは存在していますが、オーソドックスのものを使用しています。

### 5. Freezed

immutable なプログラミングを実施する上で、必要な[Freezed](https://pub.dev/packages/freezed)を使用しています。本アプリではデータモデルの作成に利用していますが、モデルに関わる method も定義するようにしています(DDD 的な考え方を利用)。

### 6. Dart Code Metrics

lint のルールを増やしたり、不要なファイルなどを教えてくれる[Dart Code Metrics](https://pub.dev/packages/dart_code_metrics)を使用しています。[flutter_lints](https://pub.dev/packages/flutter_lints)と併用させており、コードの書き方を統一させることができるため、推奨したいパッケージです。
