import 'package:example/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color:  Color.fromARGB(244, 224, 224, 214),
        ), 
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.brown),
        scaffoldBackgroundColor: const Color.fromARGB(244, 245, 245, 239),
      ),
      home: const Home(),
    );
  }
}
