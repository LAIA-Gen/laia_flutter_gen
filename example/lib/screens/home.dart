import 'package:annotations/annotations.dart';
import 'package:example/models/drone.dart';
import 'package:example/models/flight_plan.dart';
import 'package:example/models/user.dart';
import 'package:example/models/waypoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'home.g.dart';

@homeWidget
class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final AsyncValue<Person> personAsyncValue = ref.watch(getPersonProvider(1));

    return Scaffold(
        appBar: AppBar(
          title: const Text('This is your APP :)'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('This is the Home!'),
            dashboardWidget(),
            /*
            personAsyncValue.when(
              loading: () => const CircularProgressIndicator(), 
              data: (Person data) => PersonWidget(data), 
              error: (Object error, StackTrace stackTrace) => Text('Error loading person: $error'),
            ),*/
          ],
        ),
    );
  }
}
