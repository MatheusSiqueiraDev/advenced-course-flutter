import 'package:value_notifier/presation/pages/my_home_page.dart';
import 'package:value_notifier/presation/provider/theme_controller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

ThemeController providerTheme = ThemeController();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: providerTheme,
      builder: (context, value, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: value ? ThemeData.dark() : ThemeData.light(),
          home: const MyHomePage(title: 'Value Notifier'),
        );
      }
    );
  }
}