// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flightplan.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FlightPlanCWProxy {
  FlightPlan approved(bool? approved);

  FlightPlan arrival_time(DateTime? arrival_time);

  FlightPlan departure_time(DateTime? departure_time);

  FlightPlan droneId(String? droneId);

  FlightPlan id(String? id);

  FlightPlan mission_details(String? mission_details);

  FlightPlan name(String name);

  FlightPlan route(LineString? route);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FlightPlan(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FlightPlan(...).copyWith(id: 12, name: "My name")
  /// ````
  FlightPlan call({
    bool? approved,
    DateTime? arrival_time,
    DateTime? departure_time,
    String? droneId,
    String? id,
    String? mission_details,
    String? name,
    LineString? route,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFlightPlan.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFlightPlan.copyWith.fieldName(...)`
class _$FlightPlanCWProxyImpl implements _$FlightPlanCWProxy {
  final FlightPlan _value;

  const _$FlightPlanCWProxyImpl(this._value);

  @override
  FlightPlan approved(bool? approved) => this(approved: approved);

  @override
  FlightPlan arrival_time(DateTime? arrival_time) =>
      this(arrival_time: arrival_time);

  @override
  FlightPlan departure_time(DateTime? departure_time) =>
      this(departure_time: departure_time);

  @override
  FlightPlan droneId(String? droneId) => this(droneId: droneId);

  @override
  FlightPlan id(String? id) => this(id: id);

  @override
  FlightPlan mission_details(String? mission_details) =>
      this(mission_details: mission_details);

  @override
  FlightPlan name(String name) => this(name: name);

  @override
  FlightPlan route(LineString? route) => this(route: route);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FlightPlan(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FlightPlan(...).copyWith(id: 12, name: "My name")
  /// ````
  FlightPlan call({
    Object? approved = const $CopyWithPlaceholder(),
    Object? arrival_time = const $CopyWithPlaceholder(),
    Object? departure_time = const $CopyWithPlaceholder(),
    Object? droneId = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? mission_details = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? route = const $CopyWithPlaceholder(),
  }) {
    return FlightPlan(
      approved: approved == const $CopyWithPlaceholder()
          ? _value.approved
          // ignore: cast_nullable_to_non_nullable
          : approved as bool?,
      arrival_time: arrival_time == const $CopyWithPlaceholder()
          ? _value.arrival_time
          // ignore: cast_nullable_to_non_nullable
          : arrival_time as DateTime?,
      departure_time: departure_time == const $CopyWithPlaceholder()
          ? _value.departure_time
          // ignore: cast_nullable_to_non_nullable
          : departure_time as DateTime?,
      droneId: droneId == const $CopyWithPlaceholder()
          ? _value.droneId
          // ignore: cast_nullable_to_non_nullable
          : droneId as String?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      mission_details: mission_details == const $CopyWithPlaceholder()
          ? _value.mission_details
          // ignore: cast_nullable_to_non_nullable
          : mission_details as String?,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      route: route == const $CopyWithPlaceholder()
          ? _value.route
          // ignore: cast_nullable_to_non_nullable
          : route as LineString?,
    );
  }
}

extension $FlightPlanCopyWith on FlightPlan {
  /// Returns a callable class that can be used as follows: `instanceOfFlightPlan.copyWith(...)` or like so:`instanceOfFlightPlan.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FlightPlanCWProxy get copyWith => _$FlightPlanCWProxyImpl(this);
}

// **************************************************************************
// ElementWidgetGenerator
// **************************************************************************

class FlightPlanWidget extends StatefulWidget {
  final FlightPlan? element;
  final bool isEditing;

  const FlightPlanWidget({this.element, required this.isEditing, Key? key})
      : super(key: key);

  @override
  _FlightPlanWidgetState createState() => _FlightPlanWidgetState();
}

class _FlightPlanWidgetState extends State<FlightPlanWidget> {
  final GlobalKey<StringWidgetState> nameWidgetKey =
      GlobalKey<StringWidgetState>();

  final GlobalKey<StringWidgetState> mission_detailsWidgetKey =
      GlobalKey<StringWidgetState>();

  final GlobalKey<DateTimeWidgetState> departure_timeWidgetKey =
      GlobalKey<DateTimeWidgetState>();

  final GlobalKey<DateTimeWidgetState> arrival_timeWidgetKey =
      GlobalKey<DateTimeWidgetState>();

  final GlobalKey<DroneFieldWidgetState> droneIdWidgetKey =
      GlobalKey<DroneFieldWidgetState>();

  final GlobalKey<flightplanApprovedWidgetState> approvedWidgetKey =
      GlobalKey<flightplanApprovedWidgetState>();

  final GlobalKey<MapWidgetState> routeWidgetKey = GlobalKey<MapWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlightPlan'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => FlightPlanListView()),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 100,
                  child: StringWidget(
                    key: nameWidgetKey,
                    fieldName: "Name",
                    fieldDescription: "This is the name of the Flight Plan",
                    editable: true,
                    placeholder: "Write the Name of the Flight Plan",
                    value: widget.element?.name,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 100,
                  child: StringWidget(
                    key: mission_detailsWidgetKey,
                    fieldName: "Mission Details",
                    fieldDescription: "Mission details of the Flight Plan",
                    editable: true,
                    placeholder: "Provide the mission details",
                    value: widget.element?.mission_details,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 100,
                  child: DateTimeWidget(
                    key: departure_timeWidgetKey,
                    fieldName: "Departure Time",
                    fieldDescription: "Departure Datetime of the FlightPlan",
                    editable: true,
                    placeholder: "Select a Datetime",
                    value: widget.element?.departure_time,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 100,
                  child: DateTimeWidget(
                    key: arrival_timeWidgetKey,
                    fieldName: "Arrival Time",
                    fieldDescription: "Arrival Datetime of the FlightPlan",
                    editable: true,
                    placeholder: "Select a Datetime",
                    value: widget.element?.arrival_time,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 100,
                  child: DroneFieldWidget(
                    key: droneIdWidgetKey,
                    fieldName: "Drone",
                    fieldDescription: "This is the Drone",
                    editable: true,
                    placeholder: "Select the Drone of this FlightPlan",
                    value: widget.element?.droneId,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 100,
                  child: flightplanApprovedWidget(
                    key: approvedWidgetKey,
                    fieldName: "Approved",
                    fieldDescription: "Status of the Flightplan approval",
                    editable: true,
                    placeholder: "Toggle the Approving status",
                    value: widget.element?.approved,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 100,
                  child: MapWidget(
                      key: routeWidgetKey,
                      fieldName: "Route",
                      fieldDescription: "This is Route of the FlightPlan",
                      editable: true,
                      placeholder: "Add the coordinates for the Route",
                      value: widget.element?.route ??
                          LineString(
                              type: "Feature",
                              geometry: GeometryLineString(
                                  coordinates: [], type: "LineString"),
                              properties: {}),
                      uspaceMap: true),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? updatedapproved =
              approvedWidgetKey.currentState?.getUpdatedValue();

          DateTime? updatedarrival_time =
              arrival_timeWidgetKey.currentState?.getUpdatedValue();

          DateTime? updateddeparture_time =
              departure_timeWidgetKey.currentState?.getUpdatedValue();

          String? updateddroneId =
              droneIdWidgetKey.currentState?.getUpdatedValue();

          String? updatedmission_details =
              mission_detailsWidgetKey.currentState?.getUpdatedValue();

          String? updatedname = nameWidgetKey.currentState?.getUpdatedValue();

          dynamic updatedroute = routeWidgetKey.currentState?.getUpdatedValue();

          updatedroute = LineString(
              type: "Feature",
              geometry: GeometryLineString(
                  coordinates: updatedroute.geometry.coordinates,
                  type: updatedroute.geometry.type),
              properties: updatedroute.properties);

          FlightPlan updatedFlightPlan = widget.element ??
              FlightPlan(
                approved: updatedapproved ?? false,
                arrival_time: updatedarrival_time ?? DateTime.now(),
                departure_time: updateddeparture_time ?? DateTime.now(),
                droneId: updateddroneId ?? '',
                mission_details: updatedmission_details ?? '',
                name: updatedname ?? '',
                route: updatedroute ?? '',
              );

          updatedFlightPlan = updatedFlightPlan.copyWith(
              approved: updatedapproved,
              arrival_time: updatedarrival_time,
              departure_time: updateddeparture_time,
              droneId: updateddroneId,
              mission_details: updatedmission_details,
              name: updatedname,
              route: updatedroute);
          var container = ProviderContainer();
          try {
            if (widget.isEditing) {
              await container.read(
                  updateFlightPlanProvider(Tuple2(updatedFlightPlan, context)));
              print('FlightPlan updated successfully');
              CustomSnackBar.show(context, 'FlightPlan updated successfully');
            } else {
              await container.read(
                  createFlightPlanProvider(Tuple2(updatedFlightPlan, context)));
              print('FlightPlan created successfully');
              CustomSnackBar.show(context, 'FlightPlan created successfully');
            }
          } catch (error) {
            print('Failed to update FlightPlan: $error');
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

class FlightPlanFieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final String? value;

  const FlightPlanFieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
  }) : super(key: key);

  @override
  FlightPlanFieldWidgetState createState() => FlightPlanFieldWidgetState();
}

class FlightPlanFieldWidgetState extends State<FlightPlanFieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late String? initialValue;
  late String currentValue;
  late List<FlightPlan> options;

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  Future<void> initializeValues() async {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue ?? '';
    FlightPlan flightplan =
        await container.read(getFlightPlanProvider(widget.value!).future);
    _typeAheadController.text = '${flightplan.name} <id: ${flightplan.id}>';
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
                          child: TypeAheadField<FlightPlan>(
                            controller: _typeAheadController,
                            suggestionsCallback: (String pattern) async {
                              final flightplanPaginationData = await container
                                  .read(getAllFlightPlanProvider(container
                                          .read(flightplanPaginationProvider))
                                      .future);
                              final options = flightplanPaginationData.items;
                              return options
                                  .where((flightplan) =>
                                      flightplan.name!
                                          .toLowerCase()
                                          .contains(pattern.toLowerCase()) ||
                                      flightplan.id
                                          .toString()
                                          .contains(pattern.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, flightplan) {
                              return ListTile(
                                title: Text(
                                    '${flightplan.name} <id: ${flightplan.id}>'),
                              );
                            },
                            onSelected: (FlightPlan value) {
                              setState(() {
                                isValueChanged = value.id != initialValue;
                                currentValue = value.id!;
                                _typeAheadController.text =
                                    '${value.name} <id: ${value.id}>';
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
                FlightPlan flightplan = await container
                    .read(getFlightPlanProvider(widget.value!).future);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FlightPlanWidget(element: flightplan, isEditing: true),
                  ),
                );
              } catch (error) {
                print('Failed to fetch flightplan: $error');
              }
            },
            child: const Text('View FlightPlan'),
          ),
        ),
      ],
    );
  }
}

class FlightPlanMultiFieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final List<String>? values;

  const FlightPlanMultiFieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.values,
  }) : super(key: key);

  @override
  FlightPlanMultiFieldWidgetState createState() =>
      FlightPlanMultiFieldWidgetState();
}

class FlightPlanMultiFieldWidgetState
    extends State<FlightPlanMultiFieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late List<String> initialValues = [];
  late List<String> currentValues = [];
  late List<FlightPlan> options = [];

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  Future<void> initializeValues() async {
    super.initState();
    initialValues = widget.values ?? [];
    currentValues = initialValues;
    if (widget.values != null) {
      List<FlightPlan> flightplanList = await Future.wait(
        (widget.values ?? []).where((value) => value != '').map((value) async {
          return await container.read(getFlightPlanProvider(value).future);
        }),
      );
      String concatenatedText = '${flightplanList.map((flightplan) {
        return '${flightplan.name} <id: ${flightplan.id}>';
      }).join(', ')}, ';
      _typeAheadController.text = concatenatedText;
    } else {
      _typeAheadController.text = '';
    }
  }

  List<String>? getUpdatedValue() {
    return isValueChanged ? currentValues : initialValues;
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
                          child: TypeAheadField<FlightPlan>(
                            controller: _typeAheadController,
                            suggestionsCallback: (String pattern) async {
                              final idRegex =
                                  RegExp(r'<id:\s*([a-fA-F0-9]+)\s*>');
                              final matches = idRegex.allMatches(pattern);
                              final ids = <String>[];

                              for (final match in matches) {
                                ids.add(match.group(1)!);
                              }
                              currentValues = ids;
                              Function eq = const ListEquality().equals;
                              bool previusValue = isValueChanged;
                              isValueChanged = !eq(
                                  currentValues,
                                  initialValues
                                      .where((value) => value.isNotEmpty)
                                      .toList());
                              if (previusValue != isValueChanged) {
                                setState(() {
                                  _typeAheadController.text =
                                      _typeAheadController.text;
                                });
                              }
                              final inputParts = pattern.split(',').last.trim();
                              container
                                  .read(flightplanPaginationProvider.notifier)
                                  .setFilters({
                                'id': {'\$nin': currentValues}
                              });
                              final flightplanPaginationData = await container
                                  .read(getAllFlightPlanProvider(container
                                          .read(flightplanPaginationProvider))
                                      .future);
                              final options = flightplanPaginationData.items;
                              return options
                                  .where((flightplan) =>
                                      flightplan.name!
                                          .toLowerCase()
                                          .contains(inputParts.toLowerCase()) ||
                                      flightplan.id
                                          .toString()
                                          .toLowerCase()
                                          .contains(inputParts.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, flightplan) {
                              return ListTile(
                                title: Text(
                                    '${flightplan.name} <id: ${flightplan.id}>'),
                              );
                            },
                            onSelected: (FlightPlan value) async {
                              isValueChanged =
                                  !initialValues.contains(value.id);
                              currentValues.add(value.id!);

                              List<FlightPlan> flightplanList =
                                  await Future.wait((currentValues)
                                      .where((value) => value != '')
                                      .map((value) async {
                                return await container
                                    .read(getFlightPlanProvider(value).future);
                              }));
                              String concatenatedText =
                                  '${flightplanList.map((flightplan) {
                                return '${flightplan.name} <id: ${flightplan.id}>';
                              }).join(', ')}, ';

                              setState(() {
                                _typeAheadController.text = concatenatedText;
                              });
                            },
                          ),
                        )
                      : Text(widget.values.toString()),
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
                final query = {
                  'id': {
                    '\$in': currentValues
                        .where((value) => value.isNotEmpty)
                        .toList()
                  }
                };
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FlightPlanListView(extraFilters: query),
                  ),
                );
              } catch (error) {
                print('Failed to fetch flightplans: $error');
              }
            },
            child: const Text('View FlightPlans'),
          ),
        ),
      ],
    );
  }
}

// **************************************************************************
// HomeWidgetElementGenerator
// **************************************************************************

class FlightPlanHomeWidget extends StatelessWidget {
  const FlightPlanHomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FlightPlanListView()),
        );
      },
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: Styles.dashboardBlock,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/flightplan.png',
              width: 40.0,
              height: 40.0,
              color: Colors.white,
            ),
            const SizedBox(height: 8.0),
            const Text(
              "FlightPlan",
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

FlightPlan _$FlightPlanFromJson(Map<String, dynamic> json) => FlightPlan(
      approved: json['approved'] as bool?,
      arrival_time: json['arrival_time'] == null
          ? null
          : DateTime.parse(json['arrival_time'] as String),
      departure_time: json['departure_time'] == null
          ? null
          : DateTime.parse(json['departure_time'] as String),
      droneId: json['droneId'] as String?,
      id: json['id'] as String?,
      mission_details: json['mission_details'] as String?,
      name: json['name'] as String,
      route: json['route'] == null
          ? null
          : LineString.fromJson(json['route'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FlightPlanToJson(FlightPlan instance) =>
    <String, dynamic>{
      'approved': instance.approved,
      'arrival_time': instance.arrival_time?.toIso8601String(),
      'departure_time': instance.departure_time?.toIso8601String(),
      'droneId': instance.droneId,
      'id': instance.id,
      'mission_details': instance.mission_details,
      'name': instance.name,
      'route': instance.route,
    };

// **************************************************************************
// ListWidgetGenerator
// **************************************************************************

class FlightPlanListView extends ConsumerStatefulWidget {
  final Map<String, dynamic>? extraFilters;
  final Map<String, dynamic> currentFilters = {};
  late bool _initialized = false;
  late List<bool> selectedStates;

  FlightPlanListView({Key? key, this.extraFilters}) : super(key: key);

  @override
  _FlightPlanListViewState createState() => _FlightPlanListViewState();
}

class _FlightPlanListViewState extends ConsumerState<FlightPlanListView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.extraFilters != null) {
        widget.extraFilters!.forEach((key, value) {
          widget.currentFilters[key] = value;
        });
      }
      ref
          .read(flightplanPaginationProvider.notifier)
          .setFilters(widget.extraFilters!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final paginationState = ref.watch(flightplanPaginationProvider);

    final flightplansAsyncValue =
        ref.watch(getAllFlightPlanProvider(paginationState));

    final Map<String, int> columnSortStates =
        ref.watch(flightplanPaginationProvider.notifier).getOrders();

    final Map<String, dynamic> fieldsFilterStates =
        ref.watch(flightplanPaginationProvider.notifier).getFilters();

    void onSort(String columnName) {
      var state = columnSortStates[columnName];
      if (state == 0 || state == null) {
        columnSortStates[columnName] = 1;
      } else if (state == 1) {
        columnSortStates[columnName] = -1;
      } else if (state == -1) {
        columnSortStates.remove(columnName);
      }
      ref
          .read(flightplanPaginationProvider.notifier)
          .setOrders(columnSortStates);
    }

    void onFilter(String fieldName, dynamic filterValue) {
      widget.currentFilters[fieldName] = filterValue;
      ref
          .read(flightplanPaginationProvider.notifier)
          .setFilters(widget.currentFilters);
    }

    void onFilterRemove(String fieldName, dynamic filterValue) {
      if (widget.currentFilters.containsKey(fieldName)) {
        widget.currentFilters.remove(fieldName);
      }
    }

    Future<List<Drone>> fetchDroneList(List<String>? ids) async {
      if (ids == null || ids.isEmpty) {
        return [];
      }
      final nonEmptyIds = ids.where((id) => id.isNotEmpty).toList();
      List<Drone> droneList = await Future.wait(
        nonEmptyIds.map((id) async {
          return await ref.read(getDroneProvider(id).future);
        }),
      );
      return droneList;
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('FlightPlan List'),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FlightPlanWidget(
                        isEditing: false,
                      ),
                    ),
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Styles.buttonPrimaryColor),
                  elevation:
                      MaterialStateProperty.resolveWith<double>((states) {
                    if (states.contains(MaterialState.hovered) ||
                        states.contains(MaterialState.pressed)) {
                      return 0;
                    }
                    return 0;
                  }),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  overlayColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.hovered)) {
                      return Styles.buttonPrimaryColorHover;
                    }
                    return Colors.transparent;
                  }),
                ),
                child: const Text('Create FlightPlan'),
              ),
            ),
          ],
        ),
        body: flightplansAsyncValue.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
          data: (FlightPlanPaginationData data) {
            final flightplans = data.items;

            if (!widget._initialized) {
              widget.selectedStates =
                  List.generate(flightplans.length, (index) => false);
              widget._initialized = true;
            }

            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomSearchBar(
                    fields: const {
                      'approved': 'bool?',
                      'arrival_time': 'DateTime?',
                      'departure_time': 'DateTime?',
                      'droneId': 'String?',
                      'id': 'String?',
                      'mission_details': 'String?',
                      'name': 'String',
                      'route': 'LineString?'
                    },
                    filters: fieldsFilterStates,
                    onFilterChanged: onFilter,
                    onFilterRemove: onFilterRemove,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    IconButton(
                      icon: const Icon(Icons.refresh, color: Colors.grey),
                      onPressed: () {
                        ref
                            .read(flightplanPaginationProvider.notifier)
                            .setPage(1);
                      },
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(right: 10, left: 10, bottom: 5),
                      child: ElevatedButton(
                        onPressed: widget.selectedStates.contains(true)
                            ? () {
                                List<int> selectedIndices = List.generate(
                                  widget.selectedStates.length,
                                  (index) =>
                                      widget.selectedStates[index] ? index : -1,
                                ).where((index) => index != -1).toList();

                                List<FlightPlan> selectedFlightPlans =
                                    selectedIndices
                                        .map((index) => flightplans[index])
                                        .toList();
                                _onDeleteElement(
                                    selectedFlightPlans, ref, paginationState);
                              }
                            : null,
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              widget.selectedStates.contains(true)
                                  ? const Color.fromARGB(255, 224, 210, 210)
                                  : const Color.fromARGB(255, 202, 202, 202)),
                          elevation: MaterialStateProperty.resolveWith<double>(
                              (states) {
                            if (states.contains(MaterialState.hovered) ||
                                states.contains(MaterialState.pressed)) {
                              return 0;
                            }
                            return 0;
                          }),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                            if (states.contains(MaterialState.hovered)) {
                              return const Color.fromARGB(255, 194, 165, 165);
                            }
                            return Colors.transparent;
                          }),
                        ),
                        child: const Text('Delete'),
                      ),
                    ),
                  ]),
                  Expanded(
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width > 1500
                                          ? MediaQuery.of(context).size.width
                                          : 1500,
                                  child: DataTable(
                                    columns: [
                                      DataColumn(
                                        label: Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Name',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates['name'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates['name'] == 1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('name') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('name')},
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Mission Details',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates[
                                                      'mission_details'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates[
                                                              'mission_details'] ==
                                                          1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('mission_details') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('mission_details')},
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Route',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates['route'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates['route'] == 1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('route') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('route')},
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Departure Time',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates[
                                                      'departure_time'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates[
                                                              'departure_time'] ==
                                                          1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('departure_time') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('departure_time')},
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Arrival Time',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates[
                                                      'arrival_time'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates[
                                                              'arrival_time'] ==
                                                          1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('arrival_time') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('arrival_time')},
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Drone',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates['droneId'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates['droneId'] ==
                                                          1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('droneId') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('droneId')},
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Approved',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates[
                                                      'approved'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates[
                                                              'approved'] ==
                                                          1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('approved') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('approved')},
                                      ),
                                    ],
                                    rows: List<DataRow>.generate(
                                        flightplans.length, (index) {
                                      var flightplan = flightplans[index];

                                      return DataRow(
                                        selected: widget.selectedStates[index],
                                        cells: [
                                          DataCell(
                                            Center(
                                                child: Text(flightplan.name
                                                    .toString())),
                                            onTap: () =>
                                                {_navigateElement(flightplan)},
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text(flightplan
                                                    .mission_details
                                                    .toString())),
                                            onTap: () =>
                                                {_navigateElement(flightplan)},
                                          ),
                                          DataCell(
                                            Center(
                                                child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        MapScreenView(
                                                            LineStringView(
                                                                flightplan
                                                                    .route!
                                                                    .geometry
                                                                    .coordinates,
                                                                flightplan
                                                                    .route!
                                                                    .properties,
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height,
                                                                true)),
                                                  ),
                                                );
                                              },
                                              style: ButtonStyle(
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                ),
                                                padding: MaterialStateProperty
                                                    .all<EdgeInsetsGeometry>(
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 1,
                                                      vertical: 1),
                                                ),
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .all<Color>(Styles
                                                            .buttonPrimaryColor),
                                                elevation: MaterialStateProperty
                                                    .resolveWith<double>(
                                                        (states) {
                                                  if (states.contains(
                                                          MaterialState
                                                              .hovered) ||
                                                      states.contains(
                                                          MaterialState
                                                              .pressed)) {
                                                    return 0;
                                                  }
                                                  return 0;
                                                }),
                                                foregroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.white),
                                                overlayColor:
                                                    MaterialStateProperty
                                                        .resolveWith<Color>(
                                                            (states) {
                                                  if (states.contains(
                                                      MaterialState.hovered)) {
                                                    return Styles
                                                        .buttonPrimaryColorHover;
                                                  }
                                                  return Colors.transparent;
                                                }),
                                              ),
                                              child: const Text(
                                                "LineString?",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            )),
                                            onTap: () =>
                                                {_navigateElement(flightplan)},
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text(flightplan
                                                    .departure_time
                                                    .toString())),
                                            onTap: () =>
                                                {_navigateElement(flightplan)},
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text(flightplan
                                                    .arrival_time
                                                    .toString())),
                                            onTap: () =>
                                                {_navigateElement(flightplan)},
                                          ),
                                          DataCell(
                                            Center(
                                              child: FutureBuilder<List<Drone>>(
                                                future: fetchDroneList(
                                                    [flightplan.droneId ?? '']),
                                                builder: (context, snapshot) {
                                                  if (snapshot.connectionState ==
                                                          ConnectionState
                                                              .waiting ||
                                                      snapshot.data == null) {
                                                    return const CircularProgressIndicator();
                                                  } else {
                                                    return Wrap(
                                                      spacing: 4,
                                                      children: snapshot.data!
                                                          .map((drone) {
                                                        return ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        DroneWidget(
                                                                  element:
                                                                      drone,
                                                                  isEditing:
                                                                      true,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          style: ButtonStyle(
                                                            shape: MaterialStateProperty
                                                                .all<
                                                                    RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                              ),
                                                            ),
                                                            padding:
                                                                MaterialStateProperty
                                                                    .all<
                                                                        EdgeInsetsGeometry>(
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          1,
                                                                      vertical:
                                                                          1),
                                                            ),
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all<Color>(
                                                                        Styles
                                                                            .buttonPrimaryColor),
                                                            elevation: MaterialStateProperty
                                                                .resolveWith<
                                                                        double>(
                                                                    (states) {
                                                              if (states.contains(
                                                                      MaterialState
                                                                          .hovered) ||
                                                                  states.contains(
                                                                      MaterialState
                                                                          .pressed)) {
                                                                return 0;
                                                              }
                                                              return 0;
                                                            }),
                                                            foregroundColor:
                                                                MaterialStateProperty
                                                                    .all<Color>(
                                                                        Colors
                                                                            .white),
                                                            overlayColor:
                                                                MaterialStateProperty
                                                                    .resolveWith<
                                                                            Color>(
                                                                        (states) {
                                                              if (states.contains(
                                                                  MaterialState
                                                                      .hovered)) {
                                                                return Styles
                                                                    .buttonPrimaryColorHover;
                                                              }
                                                              return Colors
                                                                  .transparent;
                                                            }),
                                                          ),
                                                          child: Text(
                                                            drone.name!,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        );
                                                      }).toList(),
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                            onTap: () =>
                                                {_navigateElement(flightplan)},
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text(flightplan.approved
                                                    .toString())),
                                            onTap: () =>
                                                {_navigateElement(flightplan)},
                                          ),
                                        ],
                                        onSelectChanged: (selected) {
                                          setState(() {
                                            widget.selectedStates[index] =
                                                selected!;
                                          });
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CustomPagination(
                    currentPage: data.currentPage,
                    maxPages: data.maxPages,
                    onPageSelected: (pageNumber) => _onPageButtonPressed(
                        pageNumber, ref, paginationState, data.maxPages),
                  )
                ]);
          },
        ));
  }

  void _onPageButtonPressed(int pageNumber, WidgetRef ref,
      FlightPlanPaginationState paginationState, int maxPages) {
    if (pageNumber <= maxPages) {
      ref.read(flightplanPaginationProvider.notifier).setPage(pageNumber);
    }
  }

  void _navigateElement(FlightPlan flightplan) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              FlightPlanWidget(element: flightplan, isEditing: true)),
    );
  }

  void _onDeleteElement(List<FlightPlan> flightplans, WidgetRef ref,
      FlightPlanPaginationState paginationState) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete these records?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _deleteRecords(flightplans, ref, paginationState);
                Navigator.of(context).pop();
                setState(() {});
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteRecords(List<FlightPlan> flightplans, WidgetRef ref,
      FlightPlanPaginationState paginationState) async {
    for (var flightplan in flightplans) {
      await ref.read(deleteFlightPlanProvider(flightplan.id!).future);
    }
    setState(() {
      widget._initialized = false;
    });
    ref.read(flightplanPaginationProvider.notifier).setPage(1);
  }
}

class FlightPlanPaginationState {
  final Tuple2<int, int> pagination;
  final Map<String, int> orders;
  final Map<String, dynamic> filters;

  FlightPlanPaginationState({
    required this.pagination,
    required this.orders,
    required this.filters,
  });
}

class FlightPlanPaginationNotifier
    extends StateNotifier<FlightPlanPaginationState> {
  FlightPlanPaginationNotifier()
      : super(FlightPlanPaginationState(
          pagination: const Tuple2<int, int>(0, 10),
          orders: {},
          filters: {},
        ));

  void setPage(int page) {
    state = FlightPlanPaginationState(
      pagination: Tuple2(page * state.pagination.item2 - state.pagination.item2,
          state.pagination.item2),
      orders: state.orders,
      filters: state.filters,
    );
  }

  void setOrders(Map<String, int> newOrders) {
    state = FlightPlanPaginationState(
      pagination: Tuple2(state.pagination.item1, state.pagination.item2),
      orders: newOrders,
      filters: state.filters,
    );
  }

  void setFilters(Map<String, dynamic> newFilters) {
    state = FlightPlanPaginationState(
      pagination: Tuple2(state.pagination.item1, state.pagination.item2),
      orders: state.orders,
      filters: newFilters,
    );
  }

  Map<String, int> getOrders() {
    return state.orders;
  }

  Map<String, dynamic> getFilters() {
    return state.filters;
  }
}

final flightplanPaginationProvider = StateNotifierProvider<
    FlightPlanPaginationNotifier, FlightPlanPaginationState>(
  (ref) => FlightPlanPaginationNotifier(),
);

// **************************************************************************
// RiverpodCustomGenerator
// **************************************************************************

final getFlightPlanProvider = FutureProvider.autoDispose
    .family<FlightPlan, String>((ref, flightplanId) async {
  final json = await http.get(Uri.parse('$baseURL/flightplan/$flightplanId'));
  final jsonData = jsonDecode(json.body);
  return FlightPlan.fromJson(jsonData);
});

final createFlightPlanProvider = FutureProvider.autoDispose
    .family<void, Tuple2<FlightPlan, BuildContext>>((ref, tuple) async {
  FlightPlan flightplanInstance = tuple.item1;
  BuildContext context = tuple.item2;

  final response = await http.post(
    Uri.parse('$baseURL/flightplan'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(flightplanInstance.toJson()),
  );
  if (response.statusCode != 200) {
    CustomSnackBar.show(context, jsonDecode(response.body)['detail']);
  }
});

final updateFlightPlanProvider = FutureProvider.autoDispose
    .family<void, Tuple2<FlightPlan, BuildContext>>((ref, tuple) async {
  FlightPlan flightplanInstance = tuple.item1;
  BuildContext context = tuple.item2;

  final response = await http.put(
    Uri.parse('$baseURL/flightplan/${flightplanInstance.id}'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(flightplanInstance.toJson()),
  );
  if (response.statusCode != 200) {
    CustomSnackBar.show(context, jsonDecode(response.body)['detail']);
  }
});

final deleteFlightPlanProvider =
    FutureProvider.autoDispose.family<void, String>((ref, flightplanId) async {
  final response = await http.delete(
    Uri.parse('$baseURL/flightplan/$flightplanId'),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to delete FlightPlan');
  }
});

class FlightPlanPaginationData {
  final List<FlightPlan> items;
  final int currentPage;
  final int maxPages;

  FlightPlanPaginationData({
    required this.items,
    required this.currentPage,
    required this.maxPages,
  });
}

final getAllFlightPlanProvider = FutureProvider.autoDispose
    .family<FlightPlanPaginationData, FlightPlanPaginationState>(
        (ref, state) async {
  final fixedQuery = {
    if (state.orders.isNotEmpty) 'orders': state.orders,
    if (state.filters.isNotEmpty)
      'filters': Map.from(state.filters)
        ..removeWhere((key, value) => value == null || value == ''),
  };

  final json = await http.post(
      Uri.parse(
          '$baseURL/flightplans?skip=${state.pagination.item1}&limit=${state.pagination.item2}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(fixedQuery));
  final jsonData = jsonDecode(json.body);

  return FlightPlanPaginationData(
    items: (jsonData['items'] as List)
        .map((data) => FlightPlan.fromJson(data))
        .toList(),
    currentPage: jsonData['current_page'],
    maxPages: jsonData['max_pages'],
  );
});
