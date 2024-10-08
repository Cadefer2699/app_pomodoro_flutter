import 'package:app_pomodoro/pomodoroScreen.dart';
import 'package:app_pomodoro/widgets/timerservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
    runApp(
      ChangeNotifierProvider<TimeService>(
      create: (_) => TimeService(), 
      child: MyApp(),
      )
    ); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Pomodoro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Pomodoroscreen(), 
    );
  }
}
