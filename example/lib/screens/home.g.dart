// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// HomeWidgetGenerator
// **************************************************************************

Widget dashboardWidget(BuildContext context) {
  int crossAxisCount = _isMobile(MediaQuery.of(context)) ? 3 : 5;

  return CustomScrollView(
    slivers: [
      SliverPadding(
        padding: const EdgeInsets.all(20),
        sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return _dashboardWidgets[index];
            },
            childCount: _dashboardWidgets.length,
          ),
        ),
      ),
    ],
  );
}

bool _isMobile(MediaQueryData mediaQuery) {
  final Size screenSize = mediaQuery.size;
  return (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android) ||
      screenSize.width < screenSize.height;
}

List<Widget> _dashboardWidgets = [
  DroneHomeWidget(),
];
