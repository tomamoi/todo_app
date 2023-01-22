# TODO アプリ

このアプリは Flutter を使用した TODO アプリです。
Flutter の開発で必要な基本知識の習得に役立てそうなリポジトリです。

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

このアプリでは [Riverpod](https://pub.dev/packages/flutter_riverpod)を使用した状態管理をしています。Riverpod の基本的な使い方を取り入れているつもりです。Reverpod 2.0 系に対応しています。

### 2. GoRouter

画面遷移には[GoRouter](https://pub.dev/packages/go_router)を使用しています。宣言的な遷移を実現でき、Flutter の公式パッケージとなっています。応用的な取り扱いはしていないため、基礎を習得するレベルとなります。

### 3. Isar

ローカルのデータベースには[Isar Database](https://pub.dev/packages/isar)を使用しています。ドキュメントも充実しており、使い方もシンプルでおすすめです。作成、更新、読取、削除の基本的な扱い方はこのアプリ内で使用されています。残念なところは Freezed と併用することができず、実装には少し工夫が必要です。

### 4. logger

ログの取得には[logger](https://pub.dev/packages/logger)を使用しています。print 関数は基本的に使用することを避けています。ログ出力関連のパッケージは他にも存在していますが、オーソドックスのものを使用しています。

### 5. Freezed

immutable なプログラミングを実施する上で、必要な[Freezed](https://pub.dev/packages/freezed)を使用しています。本アプリではデータモデルの作成に利用していますが、ドメイン知識のロジックについては method にも定義するようにしています(DDD 的な考え方を利用)。

### 6. Dart Code Metrics

lint のルールを増やしたり、不要なファイルなどを教えてくれる[Dart Code Metrics](https://pub.dev/packages/dart_code_metrics)を使用しています。[flutter_lints](https://pub.dev/packages/flutter_lints)と併用させており、コードの書き方を統一させることができるため、推奨したいパッケージです。

## ドメイン駆動開発の手法を取り入れた実装

このアプリではドメイン駆動開発(DDD)の思想を取り入れています。ただ、全ての要素を取り入れているわけではなく、重要だと思われるところを取り入れています。**Flutter の設計において「これだ！」という設計手法は存在しない**ため、参考程度に見ていただくのが良いと思います。

### ・ドメイン知識はドメインのクラスに記述する

個人的にドメイン駆動開発において最も重要な点と考えています。ViewModel に相当する部分(Notifier や AsyncNotifier を使用している箇所)のコードが肥大化することがしばしば見られます。これはアプリケーションロジック(状態変化をさせるコードなど)とドメイン由来のロジック(ドメインモデルを使った計算、ドメインモデルを使った判断)が混在するためです。

例えば、以下のようなコードがあるとします。

```dart
@freezed
class TodoList with _$TodoList {
  const factory TodoList({
    required List<TodoItem> items,
    @Default(false) bool hasReachedMax,
  }) = _TodoList;
}
```

これはメモのリストを保持するクラスです。プロパティを定義しているものの、ドメイン由来のロジックは記述されていません。このようなコードはドメインに関するロジックは ViewModel 側で記述されることになります。一方、次のコードだとドメインに関するロジックが含まれています。

```dart
@freezed
class TodoList with _$TodoList {
  const TodoList._();

  const factory TodoList({
    required List<TodoItem> items,
    @Default(false) bool hasReachedMax,
  }) = _TodoList;

  TodoList fetch(List<TodoItem> todoItemList) {
    final hasReachedMax = todoItemList.length < page;

    return copyWith(
      items: [...items, ...todoItemList],
      hasReachedMax: hasReachedMax,
    );
  }

  int get length => items.length;

  TodoList add(TodoItem item) => copyWith(items: [item, ...items]);

  TodoList edit(TodoItem todoItem) {
    final index = items.map((item) => item.id).toList().indexOf(todoItem.id);

    final editedItem = List.of(items)
      ..removeAt(index)
      ..insert(0, todoItem);

    return copyWith(items: editedItem);
  }

  TodoList remove(TodoItem todoItem) {
    final index = items.map((item) => item.id).toList().indexOf(todoItem.id);
    final removedItem = List.of(items)..removeAt(index);

    return copyWith(items: removedItem);
  }

  TodoList insert(TodoItem todoItem, int index) {
    final insertedItem = List.of(items)..insert(index, todoItem);

    return copyWith(items: insertedItem);
  }
}
```

このように記述することで、ViewModel 側のコード肥大を防ぐことができるだけでなく、あちこちにドメインに由来するロジックが散らばることも防ぐことができます。

### ・適切にディレクトリ構成を分ける

今回は基本的な４つの層にディレクトリを分けています。**必ず全ての層を利用しなければならないこともなく**、この辺りは層を分ける理由を明確にしておくことが重要です。本アプリでは、以下のような構成にしています。

<dl>
  <dt>Presentation層</dt>
  <dd>画面表示部分を表します。ViewModelもこちらに記載します。</dd>
  <br>
  <dt>ドメイン層</dt>
  <dd>アプリで必要なモデル情報を記述しています。ドメインに関するロジックもこちらに含めています。</dd>
  <br>
  <dt>Usecase層</dt>
  <dd>エラー処理とアプリケーションロジックを記載しています。アプリケーションロジックがなく、エラー処理だけの場合もあります。</dd>
  <br>
  <dt>Infrastructure層</dt>
  <dd>データの永続化などを行います。Isarパッケージの影響によりDTO(データ転送用のオブジェクト)もこちらに含めています。
  </dd>
  <br>
</dl>

### ・他の DDD 的手法

他にはファーストクラスオブジェクト、前項で記述した DTO(Data Transfer Object)なども取り入れています。他にも DDD の要素はあると思いますが、アプリの規模・フレームワーク上の都合に合わせて適切に使用すれば良いと個人的には思います。
