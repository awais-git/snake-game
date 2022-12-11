import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snake_game/controller/snake.controller.dart';
import 'package:snake_game/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SnakeController(),
      child: const MaterialApp(
        themeMode: ThemeMode.system,
        title: 'Snake game',
        home: HomeView(),
      ),
    );
  }
}
