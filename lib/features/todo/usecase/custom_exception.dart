/// coreやutilなどのフォルダを作成し、そこにexceptionに関するファイルを格納した方が良いです。
/// 今回は単純なアプリなので、エラー処理を行っているUsecase層に定義しています。
class CustomException implements Exception {
  final String message;

  CustomException(this.message);
}
