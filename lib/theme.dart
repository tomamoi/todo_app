import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = Provider<ThemeData>((ref) {
  return _theme;
});

/// このアプリ全体に適用させるカラーとテキストスタイルを規定します。
final _theme = ThemeData.from(colorScheme: _colorScheme, textTheme: _textTheme);

/// プロパティで表示されている12個のカラーの詳細はURLを参照してください。
///
/// https://m2.material.io/design/material-theming/implementing-your-theme.html#color
const _colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColor.baseColor,
  onPrimary: Colors.white,
  secondary: AppColor.baseColor,
  onSecondary: Colors.white,
  error: Color(0xffE80000),
  onError: Colors.white,
  background: AppColor.backgroundColor,
  onBackground: Color(0xff2D2D2D),
  surface: Colors.white,
  onSurface: Color(0xff2D2D2D),
);

/// テキストスタイルについての詳細はURLを参照してください。
///
/// https://m2.material.io/design/material-theming/implementing-your-theme.html#typography
final _textTheme = const TextTheme().apply(
  displayColor: AppColor.baseTextColor,
  bodyColor: AppColor.baseTextColor,
);

/// このアプリで使用するカラーの種類
class AppColor {
  static const Color baseColor = Color(0xff759896);

  static const Color backgroundColor = Color(0xffE0E0E0);

  static const Color buttonBackgroundColor = Color(0xffF2F2F2);

  static const Color greyColor = Color(0xffB7B7B7);

  static const Color baseTextColor = Color(0xff2D2D2D);

  static const Color paleTextColor = Color(0xff676767);

  static const Color redTextColor = Color(0xffE80000);

  static const Color greyTextColor = Color(0xff626262);
}
