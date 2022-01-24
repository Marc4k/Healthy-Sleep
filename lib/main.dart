
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthy_sleep_finish/screens/Home.dart';
import 'package:healthy_sleep_finish/screens/information.dart';
import 'package:healthy_sleep_finish/screens/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('de', 'DE')],
        path: 'lang', // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),
        startLocale: Locale('en', 'US'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: HomeView(),
      routes: {
        "/home": (context) => HomeView(),
        "/settings": (context) => Settings(),
        "/information": (context) => Information(),
      },
    );
  }
}
