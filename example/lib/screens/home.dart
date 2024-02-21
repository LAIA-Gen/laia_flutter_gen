import 'package:annotations/annotations.dart';
import 'package:example/models/drone.dart';
import 'package:example/models/user.dart';
import 'package:example/models/waypoint.dart';
import 'package:example/models/flightplanroute.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'home.g.dart';

@homeWidget
class Home extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('This is your APP :)'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          dashboardWidget(),
          /*const Flexible(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: EnaireMap(),
            ),
          ),*/
        ],
      ),
    );
  }
}