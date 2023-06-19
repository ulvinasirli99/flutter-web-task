import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/common/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:task_list_app/riverpod/langauge_riverpod.dart';
import 'package:url_strategy/url_strategy.dart';

import 'common/constants.dart';
import 'generated/l10n.dart';

void main() {
  setPathUrlStrategy();
  router.go(RouteRoads.tasks);
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef langRef) {
    Locale locale = langRef.watch(langNotifer);
    return MaterialApp.router(
      title: 'Task list App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      routerConfig: router,
      locale: locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],
    );
  }
}
