import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:todo/features/todo/infrastructure/dto/todo_dto.dart';
import 'package:todo/features/todo/infrastructure/todo_repository.dart';
import 'package:todo/router.dart';
import 'package:todo/theme.dart';

Future<void> main() async {
  final todoIsar = await Isar.open([TodoDtoSchema]);
  runApp(ProviderScope(
    overrides: [todoIsarProvider.overrideWithValue(todoIsar)],
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const locale = Locale("ja", "JP");

    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      theme: ref.watch(themeProvider),
      locale: locale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        locale,
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
