// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flightplanroute.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FlightPlanRouteCWProxy {
  FlightPlanRoute drone_id(String drone_id);

  FlightPlanRoute end_time(DateTime end_time);

  FlightPlanRoute id(String id);

  FlightPlanRoute route(List<Map<String, dynamic>> route);

  FlightPlanRoute start_time(DateTime start_time);

  FlightPlanRoute user_id(String user_id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FlightPlanRoute(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FlightPlanRoute(...).copyWith(id: 12, name: "My name")
  /// ````
  FlightPlanRoute call({
    String? drone_id,
    DateTime? end_time,
    String? id,
    List<Map<String, dynamic>>? route,
    DateTime? start_time,
    String? user_id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFlightPlanRoute.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFlightPlanRoute.copyWith.fieldName(...)`
class _$FlightPlanRouteCWProxyImpl implements _$FlightPlanRouteCWProxy {
  final FlightPlanRoute _value;

  const _$FlightPlanRouteCWProxyImpl(this._value);

  @override
  FlightPlanRoute drone_id(String drone_id) => this(drone_id: drone_id);

  @override
  FlightPlanRoute end_time(DateTime end_time) => this(end_time: end_time);

  @override
  FlightPlanRoute id(String id) => this(id: id);

  @override
  FlightPlanRoute route(List<Map<String, dynamic>> route) => this(route: route);

  @override
  FlightPlanRoute start_time(DateTime start_time) =>
      this(start_time: start_time);

  @override
  FlightPlanRoute user_id(String user_id) => this(user_id: user_id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FlightPlanRoute(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FlightPlanRoute(...).copyWith(id: 12, name: "My name")
  /// ````
  FlightPlanRoute call({
    Object? drone_id = const $CopyWithPlaceholder(),
    Object? end_time = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? route = const $CopyWithPlaceholder(),
    Object? start_time = const $CopyWithPlaceholder(),
    Object? user_id = const $CopyWithPlaceholder(),
  }) {
    return FlightPlanRoute(
      drone_id: drone_id == const $CopyWithPlaceholder() || drone_id == null
          ? _value.drone_id
          // ignore: cast_nullable_to_non_nullable
          : drone_id as String,
      end_time: end_time == const $CopyWithPlaceholder() || end_time == null
          ? _value.end_time
          // ignore: cast_nullable_to_non_nullable
          : end_time as DateTime,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      route: route == const $CopyWithPlaceholder() || route == null
          ? _value.route
          // ignore: cast_nullable_to_non_nullable
          : route as List<Map<String, dynamic>>,
      start_time:
          start_time == const $CopyWithPlaceholder() || start_time == null
              ? _value.start_time
              // ignore: cast_nullable_to_non_nullable
              : start_time as DateTime,
      user_id: user_id == const $CopyWithPlaceholder() || user_id == null
          ? _value.user_id
          // ignore: cast_nullable_to_non_nullable
          : user_id as String,
    );
  }
}

extension $FlightPlanRouteCopyWith on FlightPlanRoute {
  /// Returns a callable class that can be used as follows: `instanceOfFlightPlanRoute.copyWith(...)` or like so:`instanceOfFlightPlanRoute.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FlightPlanRouteCWProxy get copyWith => _$FlightPlanRouteCWProxyImpl(this);
}

// **************************************************************************
// ElementWidgetGenerator
// **************************************************************************

class FlightPlanRouteWidget extends StatefulWidget {
  final FlightPlanRoute element;

  const FlightPlanRouteWidget(this.element, {Key? key}) : super(key: key);

  @override
  _FlightPlanRouteWidgetState createState() => _FlightPlanRouteWidgetState();
}

class _FlightPlanRouteWidgetState extends State<FlightPlanRouteWidget> {
  final GlobalKey<StringWidgetState> idWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<StringWidgetState> drone_idWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<StringWidgetState> user_idWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<DateTimeWidgetState> start_timeWidgetKey =
      GlobalKey<DateTimeWidgetState>();
  final GlobalKey<DateTimeWidgetState> end_timeWidgetKey =
      GlobalKey<DateTimeWidgetState>();
  final GlobalKey<MapWidgetState> routeWidgetKey = GlobalKey<MapWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlightPlanRoute'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            StringWidget(
              key: idWidgetKey,
              fieldName: "Id",
              fieldDescription: "This is the id",
              editable: false,
              placeholder: "Type the id",
              value: widget.element.id,
            ),
            StringWidget(
              key: drone_idWidgetKey,
              fieldName: "Drone",
              fieldDescription: "This is the drone_id",
              editable: true,
              placeholder: "Type the drone_id",
              value: widget.element.drone_id,
            ),
            StringWidget(
              key: user_idWidgetKey,
              fieldName: "User",
              fieldDescription: "This is the user_id",
              editable: true,
              placeholder: "Type the user_id",
              value: widget.element.user_id,
            ),
            DateTimeWidget(
              key: start_timeWidgetKey,
              fieldName: "Departure time",
              fieldDescription: "This is the start_time",
              editable: true,
              placeholder: "Type the start_time",
              value: widget.element.start_time,
            ),
            DateTimeWidget(
              key: end_timeWidgetKey,
              fieldName: "Arrival time",
              fieldDescription: "This is the end_time",
              editable: true,
              placeholder: "Type the end_time",
              value: widget.element.end_time,
            ),
            MapWidget(
              key: routeWidgetKey,
              fieldName: "Route",
              fieldDescription: "This is the route",
              editable: true,
              placeholder: "Type the route",
              value: widget.element.route,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? updatedid = idWidgetKey.currentState?.getUpdatedValue();

          String? updateddrone_id =
              drone_idWidgetKey.currentState?.getUpdatedValue();

          String? updateduser_id =
              user_idWidgetKey.currentState?.getUpdatedValue();

          DateTime? updatedstart_time =
              start_timeWidgetKey.currentState?.getUpdatedValue();

          DateTime? updatedend_time =
              end_timeWidgetKey.currentState?.getUpdatedValue();

          dynamic updatedroute = routeWidgetKey.currentState?.getUpdatedValue();

          FlightPlanRoute updatedFlightPlanRoute = widget.element.copyWith(
              id: updatedid,
              drone_id: updateddrone_id,
              user_id: updateduser_id,
              start_time: updatedstart_time,
              end_time: updatedend_time,
              route: updatedroute);
          var container = ProviderContainer();
          try {
            await container
                .read(updateFlightPlanRouteProvider(updatedFlightPlanRoute));
            print('FlightPlanRoute updated successfully');
          } catch (error) {
            print('Failed to update FlightPlanRoute: $error');
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

class FlightPlanRouteFieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final String? value;

  const FlightPlanRouteFieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
  }) : super(key: key);

  @override
  FlightPlanRouteFieldWidgetState createState() =>
      FlightPlanRouteFieldWidgetState();
}

class FlightPlanRouteFieldWidgetState
    extends State<FlightPlanRouteFieldWidget> {
  TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late String? initialValue;
  late String currentValue;
  late List<FlightPlanRoute> options;

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  Future<void> initializeValues() async {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue ?? '';
    FlightPlanRoute flightplanroute =
        await container.read(getFlightPlanRouteProvider(widget.value!).future);
    _typeAheadController.text =
        '<id: ${flightplanroute.id}>';
  }

  String? getUpdatedValue() {
    return isValueChanged ? currentValue : initialValue;
  }

  var container = ProviderContainer();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Styles.secondaryColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.fieldName}:",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    widget.fieldDescription,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.editable
                      ? Expanded(
                          child: TypeAheadField<FlightPlanRoute>(
                            controller: _typeAheadController,
                            suggestionsCallback: (String pattern) async {
                              options = await container.read(
                                  getAllFlightPlanRouteProvider(container.read(
                                          flightplanroutePaginationProvider))
                                      .future);
                              print(options);
                              return options
                                  .where((flightplanroute) =>
                                      flightplanroute.id
                                          .toString()
                                          .contains(pattern.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, flightplanroute) {
                              return ListTile(
                                title: Text(
                                    '<id: ${flightplanroute.id}>'),
                              );
                            },
                            onSelected: (FlightPlanRoute value) {
                              setState(() {
                                isValueChanged = value.id != initialValue;
                                currentValue = value.id;
                                _typeAheadController.text =
                                    '<id: ${value.id}>';
                              });
                            },
                          ),
                        )
                      : Text(widget.value ?? widget.placeholder),
                ],
              ),
            ],
          ),
        ),
        if (isValueChanged)
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange,
              ),
            ),
          ),
        Positioned(
          top: 0,
          right: 0,
          child: ElevatedButton(
            onPressed: () async {
              try {
                FlightPlanRoute flightplanroute = await container
                    .read(getFlightPlanRouteProvider(widget.value!).future);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FlightPlanRouteWidget(flightplanroute),
                  ),
                );
              } catch (error) {
                print('Failed to fetch flightplanroute: $error');
              }
            },
            child: const Text('View FlightPlanRoute'),
          ),
        ),
      ],
    );
  }
}

// **************************************************************************
// HomeWidgetElementGenerator
// **************************************************************************

class FlightPlanRouteHomeWidget extends StatelessWidget {
  const FlightPlanRouteHomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FlightPlanRouteListView()),
        );
      },
      child: Container(
        width: 100.0,
        height: 100.0,
        color: Styles.primaryColor, // You can choose any color you like
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/flightplanroute.png',
              width: 40.0,
              height: 40.0,
              color: Colors.white,
            ),
            const SizedBox(height: 8.0),
            const Text(
              "FlightPlanRoute",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightPlanRoute _$FlightPlanRouteFromJson(Map<String, dynamic> json) =>
    FlightPlanRoute(
      id: json['id'] as String,
      drone_id: json['drone_id'] as String,
      user_id: json['user_id'] as String,
      start_time: DateTime.parse(json['start_time'] as String),
      end_time: DateTime.parse(json['end_time'] as String),
      route: (json['route'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$FlightPlanRouteToJson(FlightPlanRoute instance) =>
    <String, dynamic>{
      'id': instance.id,
      'drone_id': instance.drone_id,
      'user_id': instance.user_id,
      'start_time': instance.start_time.toIso8601String(),
      'end_time': instance.end_time.toIso8601String(),
      'route': instance.route,
    };

// **************************************************************************
// ListWidgetGenerator
// **************************************************************************

class FlightPlanRouteListView extends ConsumerWidget {
  const FlightPlanRouteListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paginationState = ref.watch(flightplanroutePaginationProvider);
    final flightplanroutesAsyncValue =
        ref.watch(getAllFlightPlanRouteProvider(paginationState));

    return Scaffold(
      appBar: AppBar(
        title: const Text('FlightPlanRoute List'),
      ),
      body: flightplanroutesAsyncValue.when(
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text('Error: $error'),
        data: (List<FlightPlanRoute> flightplanroutes) {
          return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                  width: double.infinity,
                  child: DataTable(
                      columns: const [
                        DataColumn(
                          label: Expanded(
                              child: Text(
                            'Drone',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 54, 54)),
                            textAlign: TextAlign.center,
                          )),
                        ),
                        DataColumn(
                          label: Expanded(
                              child: Text(
                            'User',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 54, 54)),
                            textAlign: TextAlign.center,
                          )),
                        ),
                        DataColumn(
                          label: Expanded(
                              child: Text(
                            'Departure time',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 54, 54)),
                            textAlign: TextAlign.center,
                          )),
                        ),
                        DataColumn(
                          label: Expanded(
                              child: Text(
                            'Arrival time',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 54, 54)),
                            textAlign: TextAlign.center,
                          )),
                        ),
                        DataColumn(
                          label: Expanded(
                              child: Text(
                            'Route',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 54, 54)),
                            textAlign: TextAlign.center,
                          )),
                        ),
                      ],
                      rows: flightplanroutes.map((flightplanroute) {
                        return DataRow(
                          cells: [
                            DataCell(Center(
                                child:
                                    Text(flightplanroute.drone_id.toString()))),
                            DataCell(Center(
                                child:
                                    Text(flightplanroute.user_id.toString()))),
                            DataCell(Center(
                                child: Text(
                                    flightplanroute.start_time.toString()))),
                            DataCell(Center(
                                child:
                                    Text(flightplanroute.end_time.toString()))),
                            DataCell(Center(
                                child: Text(flightplanroute.route.toString()))),
                          ],
                          onSelectChanged: (selected) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FlightPlanRouteWidget(flightplanroute)),
                            );
                          },
                        );
                      }).toList(),
                      showCheckboxColumn: false)));
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => ref
                .read(flightplanroutePaginationProvider.notifier)
                .decrementPage(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 224, 221, 221),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            child: const Icon(Icons.arrow_back),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () => ref
                .read(flightplanroutePaginationProvider.notifier)
                .incrementPage(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 224, 221, 221),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            child: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}

class FlightPlanRoutePaginationNotifier
    extends StateNotifier<Tuple2<int, int>> {
  FlightPlanRoutePaginationNotifier() : super(const Tuple2<int, int>(0, 10));

  void incrementPage() => state = Tuple2(state.item1 + 10, state.item2);
  void decrementPage() {
    if (state.item1 != 0) {
      state = Tuple2(state.item1 - 10, state.item2);
    }
  }
}

final flightplanroutePaginationProvider =
    StateNotifierProvider<FlightPlanRoutePaginationNotifier, Tuple2<int, int>>(
  (ref) => FlightPlanRoutePaginationNotifier(),
);

// **************************************************************************
// RiverpodCustomGenerator
// **************************************************************************

final getFlightPlanRouteProvider = FutureProvider.autoDispose
    .family<FlightPlanRoute, String>((ref, flightplanrouteId) async {
  final json =
      await http.get(Uri.parse('$baseURL/flightplanroutes/$flightplanrouteId'));
  final jsonData = jsonDecode(json.body);
  return FlightPlanRoute.fromJson(jsonData);
});

final createFlightPlanRouteProvider = FutureProvider.autoDispose
    .family<void, FlightPlanRoute>((ref, flightplanrouteInstance) async {
  final response = await http.post(
    Uri.parse('$baseURL/flightplanroutes'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(flightplanrouteInstance.toJson()),
  );
  if (response.statusCode != 201) {
    throw Exception('Failed to create FlightPlanRoute');
  }
});

final updateFlightPlanRouteProvider = FutureProvider.autoDispose
    .family<void, FlightPlanRoute>((ref, flightplanrouteInstance) async {
  final response = await http.put(
    Uri.parse('$baseURL/flightplanroutes/${flightplanrouteInstance.id}'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(flightplanrouteInstance.toJson()),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to update FlightPlanRoute');
  }
});

final deleteFlightPlanRouteProvider = FutureProvider.autoDispose
    .family<void, int>((ref, flightplanrouteId) async {
  final response = await http.delete(
    Uri.parse('$baseURL/flightplanroutes/$flightplanrouteId'),
  );
  if (response.statusCode != 204) {
    throw Exception('Failed to delete FlightPlanRoute');
  }
});

final getAllFlightPlanRouteProvider = FutureProvider.autoDispose
    .family<List<FlightPlanRoute>, Tuple2<int, int>>((ref, tuple) async {
  final json = await http.post(Uri.parse(
      '$baseURL/flightplanroutes/all?skip=${tuple.item1}&limit=${tuple.item2}'));
  final jsonData = jsonDecode(json.body) as List;
  return jsonData.map((data) => FlightPlanRoute.fromJson(data)).toList();
});
