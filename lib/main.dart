import 'package:flutter/material.dart';
import 'package:flutter_figma_pomodoro/home_app.dart';
import 'package:flutter_figma_pomodoro/provider/timer_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => TimerProvider(),
          )
        ],
        child: const MaterialApp(
          home: HomeApp(),
        ));
  }
}
