// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// HomeWidgetGenerator
// **************************************************************************

Widget dashboardWidget() {
  int crossAxisCount = _isMobile() ? 2 : 4;

  return GridView.count(
    primary: false,
    physics: const ScrollPhysics(),
    padding: const EdgeInsets.all(20),
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    crossAxisCount: crossAxisCount,
    shrinkWrap: true,
    children: const [
      WaypointHomeWidget(),
      UserHomeWidget(),
      DroneHomeWidget(),
      FlightPlanHomeWidget(),
    ],
  );
}

bool _isMobile() {
  return (defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.android);
}
