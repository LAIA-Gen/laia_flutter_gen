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
  AccessRightHomeWidget(),
  RoleHomeWidget(),
  DroneTypeHomeWidget(),
  OperatorHomeWidget(),
  FlightPlanHomeWidget(),
  ManufacturerHomeWidget(),
  DroneHomeWidget(),
];

class DynamicLogInScreen extends StatelessWidget {
  final Map<String, StatefulWidget> widgetMap;

  DynamicLogInScreen({required this.widgetMap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LAIA'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgetMap.entries
              .map((entry) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => entry.value,
                          ),
                        );
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 32)),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Styles.buttonPrimaryColorHover;
                          }
                          return Styles.buttonPrimaryColor;
                        }),
                      ),
                      child: Text(entry.key),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
