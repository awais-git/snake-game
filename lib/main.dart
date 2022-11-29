import 'package:flutter/material.dart';
import 'package:snake_game/theme/theme.dart';
import 'package:snake_game/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: customDarkTheme(),
      theme: customLightTheme(),
      themeMode: ThemeMode.system,
      title: 'Snake game',
      home: const HomeView(),
    );
  }
}
