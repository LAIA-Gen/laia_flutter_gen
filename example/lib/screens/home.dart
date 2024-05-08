import 'package:example/config/styles.dart';
import 'package:laia_annotations/laia_annotations.dart';
import 'package:example/models/accessright.dart';
import 'package:example/models/drone.dart';
import 'package:example/models/dronetype.dart';
import 'package:example/models/manufacturer.dart';
import 'package:example/models/flightplan.dart';
import 'package:example/models/operator.dart';
import 'package:example/models/role.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'home.g.dart';

@homeWidget
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('LAIA'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: dashboardWidget(context),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_sharp),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        onTap: _onItemTapped,
      ),
    );
  }
}
