import 'package:example/models/person.dart';
import 'package:example/models/pet.dart';
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
      title: 'LAIA',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color:  Color.fromARGB(255, 255, 255, 255),
        ), 
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.brown),
        scaffoldBackgroundColor: const Color.fromARGB(244, 255, 255, 255),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<bool> tokenVerificationResult = ref.watch(verifyTokenPersonProvider);

    return Scaffold(
      body: tokenVerificationResult.when(
        data: (isValid) {
          if (isValid) {
            return Home();
          } else {
            return DynamicLogInScreen(widgetMap: const { 'Person': PersonLoginWidget(), 'Pet': PetLoginWidget() });
          }
        },
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) {
          return Container();
        },
      ),
    );
  }
}
