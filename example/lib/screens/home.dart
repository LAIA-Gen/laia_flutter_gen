import 'package:annotations/annotations.dart';
import 'package:example/models/person.dart';
import 'package:example/models/pet.dart';
import 'package:flutter/material.dart';

part 'home.g.dart';

@homeWidget
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('This is your APP :)'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('This is the Home!'),
            dashboardWidget(),
          ],
        ),
      ),
    );
  }
}
