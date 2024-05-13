// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dronestracking.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DronesTrackingCWProxy {
  DronesTracking altitude(double altitude);

  DronesTracking coordinates(Point coordinates);

  DronesTracking droneId(String droneId);

  DronesTracking flightplanId(String? flightplanId);

  DronesTracking id(String? id);

  DronesTracking name(String name);

  DronesTracking timestamp(DateTime timestamp);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DronesTracking(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DronesTracking(...).copyWith(id: 12, name: "My name")
  /// ````
  DronesTracking call({
    double? altitude,
    Point? coordinates,
    String? droneId,
    String? flightplanId,
    String? id,
    String? name,
    DateTime? timestamp,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDronesTracking.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDronesTracking.copyWith.fieldName(...)`
class _$DronesTrackingCWProxyImpl implements _$DronesTrackingCWProxy {
  final DronesTracking _value;

  const _$DronesTrackingCWProxyImpl(this._value);

  @override
  DronesTracking altitude(double altitude) => this(altitude: altitude);

  @override
  DronesTracking coordinates(Point coordinates) =>
      this(coordinates: coordinates);

  @override
  DronesTracking droneId(String droneId) => this(droneId: droneId);

  @override
  DronesTracking flightplanId(String? flightplanId) =>
      this(flightplanId: flightplanId);

  @override
  DronesTracking id(String? id) => this(id: id);

  @override
  DronesTracking name(String name) => this(name: name);

  @override
  DronesTracking timestamp(DateTime timestamp) => this(timestamp: timestamp);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DronesTracking(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DronesTracking(...).copyWith(id: 12, name: "My name")
  /// ````
  DronesTracking call({
    Object? altitude = const $CopyWithPlaceholder(),
    Object? coordinates = const $CopyWithPlaceholder(),
    Object? droneId = const $CopyWithPlaceholder(),
    Object? flightplanId = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? timestamp = const $CopyWithPlaceholder(),
  }) {
    return DronesTracking(
      altitude: altitude == const $CopyWithPlaceholder() || altitude == null
          ? _value.altitude
          // ignore: cast_nullable_to_non_nullable
          : altitude as double,
      coordinates:
          coordinates == const $CopyWithPlaceholder() || coordinates == null
              ? _value.coordinates
              // ignore: cast_nullable_to_non_nullable
              : coordinates as Point,
      droneId: droneId == const $CopyWithPlaceholder() || droneId == null
          ? _value.droneId
          // ignore: cast_nullable_to_non_nullable
          : droneId as String,
      flightplanId: flightplanId == const $CopyWithPlaceholder()
          ? _value.flightplanId
          // ignore: cast_nullable_to_non_nullable
          : flightplanId as String?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      timestamp: timestamp == const $CopyWithPlaceholder() || timestamp == null
          ? _value.timestamp
          // ignore: cast_nullable_to_non_nullable
          : timestamp as DateTime,
    );
  }
}

extension $DronesTrackingCopyWith on DronesTracking {
  /// Returns a callable class that can be used as follows: `instanceOfDronesTracking.copyWith(...)` or like so:`instanceOfDronesTracking.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DronesTrackingCWProxy get copyWith => _$DronesTrackingCWProxyImpl(this);
}

// **************************************************************************
// ElementWidgetGenerator
// **************************************************************************

class DronesTrackingWidget extends StatefulWidget {
  final DronesTracking? element;
  final bool isEditing;

  const DronesTrackingWidget({this.element, required this.isEditing, Key? key})
      : super(key: key);

  @override
  _DronesTrackingWidgetState createState() => _DronesTrackingWidgetState();
}

class _DronesTrackingWidgetState extends State<DronesTrackingWidget> {
  final GlobalKey<StringWidgetState> nameWidgetKey =
      GlobalKey<StringWidgetState>();

  final GlobalKey<DroneFieldWidgetState> droneIdWidgetKey =
      GlobalKey<DroneFieldWidgetState>();

  final GlobalKey<FlightPlanFieldWidgetState> flightplanIdWidgetKey =
      GlobalKey<FlightPlanFieldWidgetState>();

  final GlobalKey<MapWidgetState> coordinatesWidgetKey =
      GlobalKey<MapWidgetState>();

  final GlobalKey<DoubleWidgetState> altitudeWidgetKey =
      GlobalKey<DoubleWidgetState>();

  final GlobalKey<DateTimeWidgetState> timestampWidgetKey =
      GlobalKey<DateTimeWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DronesTracking'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DronesTrackingListView()),
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
                    fieldDescription: "Name",
                    editable: true,
                    placeholder: "Name",
                    value: widget.element?.name,
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
                    placeholder: "Select the Drone of this position",
                    value: widget.element?.droneId,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 100,
                  child: FlightPlanFieldWidget(
                    key: flightplanIdWidgetKey,
                    fieldName: "FlightPlan",
                    fieldDescription: "This is the FlightPlan",
                    editable: true,
                    placeholder: "Select the FlightPlan of this position",
                    value: widget.element?.flightplanId,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 100,
                  child: MapWidget(
                      key: coordinatesWidgetKey,
                      fieldName: "Coordinates",
                      fieldDescription: "This are the coordinates of the Drone",
                      editable: true,
                      placeholder: "Add the coordinates of the Drone",
                      value: widget.element?.coordinates ??
                          Point(
                              type: "Feature",
                              geometry:
                                  GeometryPoint(coordinates: [], type: "Point"),
                              properties: {}),
                      uspaceMap: true),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 100,
                  child: DoubleWidget(
                    key: altitudeWidgetKey,
                    fieldName: "Altitude",
                    fieldDescription: "Altitude of this position",
                    editable: true,
                    placeholder: "Enter Altitude",
                    value: widget.element?.altitude,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 100,
                  child: DateTimeWidget(
                    key: timestampWidgetKey,
                    fieldName: "Timestamp",
                    fieldDescription: "Timestamp of the Drone position",
                    editable: true,
                    placeholder: "Select a Datetime",
                    value: widget.element?.timestamp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          double? updatedaltitude =
              altitudeWidgetKey.currentState?.getUpdatedValue();

          dynamic updatedcoordinates =
              coordinatesWidgetKey.currentState?.getUpdatedValue();

          updatedcoordinates = Point(
              type: "Feature",
              geometry: GeometryPoint(
                  coordinates: updatedcoordinates.geometry.coordinates,
                  type: updatedcoordinates.geometry.type),
              properties: updatedcoordinates.properties);

          String? updateddroneId =
              droneIdWidgetKey.currentState?.getUpdatedValue();

          String? updatedflightplanId =
              flightplanIdWidgetKey.currentState?.getUpdatedValue();

          String? updatedname = nameWidgetKey.currentState?.getUpdatedValue();

          DateTime? updatedtimestamp =
              timestampWidgetKey.currentState?.getUpdatedValue();

          DronesTracking updatedDronesTracking = widget.element ??
              DronesTracking(
                altitude: updatedaltitude ?? 0.0,
                coordinates: updatedcoordinates ?? '',
                droneId: updateddroneId ?? '',
                flightplanId: updatedflightplanId ?? '',
                name: updatedname ?? '',
                timestamp: updatedtimestamp ?? DateTime.now(),
              );

          updatedDronesTracking = updatedDronesTracking.copyWith(
              altitude: updatedaltitude,
              coordinates: updatedcoordinates,
              droneId: updateddroneId,
              flightplanId: updatedflightplanId,
              name: updatedname,
              timestamp: updatedtimestamp);
          var container = ProviderContainer();
          try {
            if (widget.isEditing) {
              await container.read(updateDronesTrackingProvider(
                  Tuple2(updatedDronesTracking, context)));
              print('DronesTracking updated successfully');
              CustomSnackBar.show(
                  context, 'DronesTracking updated successfully');
            } else {
              await container.read(createDronesTrackingProvider(
                  Tuple2(updatedDronesTracking, context)));
              print('DronesTracking created successfully');
              CustomSnackBar.show(
                  context, 'DronesTracking created successfully');
            }
          } catch (error) {
            print('Failed to update DronesTracking: $error');
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

class DronesTrackingFieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final String? value;

  const DronesTrackingFieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
  }) : super(key: key);

  @override
  DronesTrackingFieldWidgetState createState() =>
      DronesTrackingFieldWidgetState();
}

class DronesTrackingFieldWidgetState extends State<DronesTrackingFieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late String? initialValue;
  late String currentValue;
  late List<DronesTracking> options;

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  Future<void> initializeValues() async {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue ?? '';
    DronesTracking dronestracking =
        await container.read(getDronesTrackingProvider(widget.value!).future);
    _typeAheadController.text =
        '${dronestracking.name} <id: ${dronestracking.id}>';
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
                          child: TypeAheadField<DronesTracking>(
                            controller: _typeAheadController,
                            suggestionsCallback: (String pattern) async {
                              final dronestrackingPaginationData =
                                  await container.read(
                                      getAllDronesTrackingProvider(container.read(
                                              dronestrackingPaginationProvider))
                                          .future);
                              final options =
                                  dronestrackingPaginationData.items;
                              return options
                                  .where((dronestracking) =>
                                      dronestracking.name!
                                          .toLowerCase()
                                          .contains(pattern.toLowerCase()) ||
                                      dronestracking.id
                                          .toString()
                                          .contains(pattern.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, dronestracking) {
                              return ListTile(
                                title: Text(
                                    '${dronestracking.name} <id: ${dronestracking.id}>'),
                              );
                            },
                            onSelected: (DronesTracking value) {
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
                DronesTracking dronestracking = await container
                    .read(getDronesTrackingProvider(widget.value!).future);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DronesTrackingWidget(
                        element: dronestracking, isEditing: true),
                  ),
                );
              } catch (error) {
                print('Failed to fetch dronestracking: $error');
              }
            },
            child: const Text('View DronesTracking'),
          ),
        ),
      ],
    );
  }
}

class DronesTrackingMultiFieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final List<String>? values;

  const DronesTrackingMultiFieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.values,
  }) : super(key: key);

  @override
  DronesTrackingMultiFieldWidgetState createState() =>
      DronesTrackingMultiFieldWidgetState();
}

class DronesTrackingMultiFieldWidgetState
    extends State<DronesTrackingMultiFieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late List<String> initialValues = [];
  late List<String> currentValues = [];
  late List<DronesTracking> options = [];

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
      List<DronesTracking> dronestrackingList = await Future.wait(
        (widget.values ?? []).where((value) => value != '').map((value) async {
          return await container.read(getDronesTrackingProvider(value).future);
        }),
      );
      String concatenatedText = '${dronestrackingList.map((dronestracking) {
        return '${dronestracking.name} <id: ${dronestracking.id}>';
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
                          child: TypeAheadField<DronesTracking>(
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
                                  .read(
                                      dronestrackingPaginationProvider.notifier)
                                  .setFilters({
                                'id': {'\$nin': currentValues}
                              });
                              final dronestrackingPaginationData =
                                  await container.read(
                                      getAllDronesTrackingProvider(container.read(
                                              dronestrackingPaginationProvider))
                                          .future);
                              final options =
                                  dronestrackingPaginationData.items;
                              return options
                                  .where((dronestracking) =>
                                      dronestracking.name!
                                          .toLowerCase()
                                          .contains(inputParts.toLowerCase()) ||
                                      dronestracking.id
                                          .toString()
                                          .toLowerCase()
                                          .contains(inputParts.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, dronestracking) {
                              return ListTile(
                                title: Text(
                                    '${dronestracking.name} <id: ${dronestracking.id}>'),
                              );
                            },
                            onSelected: (DronesTracking value) async {
                              isValueChanged =
                                  !initialValues.contains(value.id);
                              currentValues.add(value.id!);

                              List<DronesTracking> dronestrackingList =
                                  await Future.wait((currentValues)
                                      .where((value) => value != '')
                                      .map((value) async {
                                return await container.read(
                                    getDronesTrackingProvider(value).future);
                              }));
                              String concatenatedText =
                                  '${dronestrackingList.map((dronestracking) {
                                return '${dronestracking.name} <id: ${dronestracking.id}>';
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
                        DronesTrackingListView(extraFilters: query),
                  ),
                );
              } catch (error) {
                print('Failed to fetch dronestrackings: $error');
              }
            },
            child: const Text('View DronesTrackings'),
          ),
        ),
      ],
    );
  }
}

// **************************************************************************
// HomeWidgetElementGenerator
// **************************************************************************

class DronesTrackingHomeWidget extends StatelessWidget {
  const DronesTrackingHomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DronesTrackingListView()),
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
              'assets/dronestracking.png',
              width: 40.0,
              height: 40.0,
              color: Colors.white,
            ),
            const SizedBox(height: 8.0),
            const Text(
              "DronesTracking",
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

DronesTracking _$DronesTrackingFromJson(Map<String, dynamic> json) =>
    DronesTracking(
      altitude: (json['altitude'] as num).toDouble(),
      coordinates: Point.fromJson(json['coordinates'] as Map<String, dynamic>),
      droneId: json['droneId'] as String,
      flightplanId: json['flightplanId'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$DronesTrackingToJson(DronesTracking instance) =>
    <String, dynamic>{
      'altitude': instance.altitude,
      'coordinates': instance.coordinates,
      'droneId': instance.droneId,
      'flightplanId': instance.flightplanId,
      'id': instance.id,
      'name': instance.name,
      'timestamp': instance.timestamp.toIso8601String(),
    };

// **************************************************************************
// ListWidgetGenerator
// **************************************************************************

class DronesTrackingListView extends ConsumerStatefulWidget {
  final Map<String, dynamic>? extraFilters;
  final Map<String, dynamic> currentFilters = {};
  late bool _initialized = false;
  late List<bool> selectedStates;

  DronesTrackingListView({Key? key, this.extraFilters}) : super(key: key);

  @override
  _DronesTrackingListViewState createState() => _DronesTrackingListViewState();
}

class _DronesTrackingListViewState
    extends ConsumerState<DronesTrackingListView> {
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
          .read(dronestrackingPaginationProvider.notifier)
          .setFilters(widget.extraFilters!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final paginationState = ref.watch(dronestrackingPaginationProvider);

    final dronestrackingsAsyncValue =
        ref.watch(getAllDronesTrackingProvider(paginationState));

    final Map<String, int> columnSortStates =
        ref.watch(dronestrackingPaginationProvider.notifier).getOrders();

    final Map<String, dynamic> fieldsFilterStates =
        ref.watch(dronestrackingPaginationProvider.notifier).getFilters();

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
          .read(dronestrackingPaginationProvider.notifier)
          .setOrders(columnSortStates);
    }

    void onFilter(String fieldName, dynamic filterValue) {
      widget.currentFilters[fieldName] = filterValue;
      ref
          .read(dronestrackingPaginationProvider.notifier)
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

    Future<List<FlightPlan>> fetchFlightPlanList(List<String>? ids) async {
      if (ids == null || ids.isEmpty) {
        return [];
      }
      final nonEmptyIds = ids.where((id) => id.isNotEmpty).toList();
      List<FlightPlan> flightplanList = await Future.wait(
        nonEmptyIds.map((id) async {
          return await ref.read(getFlightPlanProvider(id).future);
        }),
      );
      return flightplanList;
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('DronesTracking List'),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DronesTrackingWidget(
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
                child: const Text('Create DronesTracking'),
              ),
            ),
          ],
        ),
        body: dronestrackingsAsyncValue.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
          data: (DronesTrackingPaginationData data) {
            final dronestrackings = data.items;

            if (!widget._initialized) {
              widget.selectedStates =
                  List.generate(dronestrackings.length, (index) => false);
              widget._initialized = true;
            }

            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomSearchBar(
                    fields: const {
                      'altitude': 'double',
                      'coordinates': 'Point',
                      'droneId': 'String',
                      'flightplanId': 'String?',
                      'id': 'String?',
                      'name': 'String',
                      'timestamp': 'DateTime'
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
                            .read(dronestrackingPaginationProvider.notifier)
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

                                List<DronesTracking> selectedDronesTrackings =
                                    selectedIndices
                                        .map((index) => dronestrackings[index])
                                        .toList();
                                _onDeleteElement(selectedDronesTrackings, ref,
                                    paginationState);
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
                                                'FlightPlan',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates[
                                                      'flightplanId'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates[
                                                              'flightplanId'] ==
                                                          1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('flightplanId') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('flightplanId')},
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Coordinates',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates[
                                                      'coordinates'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates[
                                                              'coordinates'] ==
                                                          1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('coordinates') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('coordinates')},
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Altitude',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates[
                                                      'altitude'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates[
                                                              'altitude'] ==
                                                          1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('altitude') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('altitude')},
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Timestamp',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates[
                                                      'timestamp'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates[
                                                              'timestamp'] ==
                                                          1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('timestamp') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('timestamp')},
                                      ),
                                    ],
                                    rows: List<DataRow>.generate(
                                        dronestrackings.length, (index) {
                                      var dronestracking =
                                          dronestrackings[index];

                                      return DataRow(
                                        selected: widget.selectedStates[index],
                                        cells: [
                                          DataCell(
                                            Center(
                                                child: Text(dronestracking.name
                                                    .toString())),
                                            onTap: () => {
                                              _navigateElement(dronestracking)
                                            },
                                          ),
                                          DataCell(
                                            Center(
                                              child: FutureBuilder<List<Drone>>(
                                                future: fetchDroneList([
                                                  dronestracking.droneId ?? ''
                                                ]),
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
                                            onTap: () => {
                                              _navigateElement(dronestracking)
                                            },
                                          ),
                                          DataCell(
                                            Center(
                                              child: FutureBuilder<
                                                  List<FlightPlan>>(
                                                future: fetchFlightPlanList([
                                                  dronestracking.flightplanId ??
                                                      ''
                                                ]),
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
                                                          .map((flightplan) {
                                                        return ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        FlightPlanWidget(
                                                                  element:
                                                                      flightplan,
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
                                                            flightplan.name!,
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
                                            onTap: () => {
                                              _navigateElement(dronestracking)
                                            },
                                          ),
                                          DataCell(
                                            Center(
                                                child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        MapScreenView(PointView(
                                                            dronestracking
                                                                .coordinates!
                                                                .geometry
                                                                .coordinates,
                                                            dronestracking
                                                                .coordinates!
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
                                                "Point",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            )),
                                            onTap: () => {
                                              _navigateElement(dronestracking)
                                            },
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text(dronestracking
                                                    .altitude
                                                    .toString())),
                                            onTap: () => {
                                              _navigateElement(dronestracking)
                                            },
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text(dronestracking
                                                    .timestamp
                                                    .toString())),
                                            onTap: () => {
                                              _navigateElement(dronestracking)
                                            },
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
      DronesTrackingPaginationState paginationState, int maxPages) {
    if (pageNumber <= maxPages) {
      ref.read(dronestrackingPaginationProvider.notifier).setPage(pageNumber);
    }
  }

  void _navigateElement(DronesTracking dronestracking) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              DronesTrackingWidget(element: dronestracking, isEditing: true)),
    );
  }

  void _onDeleteElement(List<DronesTracking> dronestrackings, WidgetRef ref,
      DronesTrackingPaginationState paginationState) {
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
                _deleteRecords(dronestrackings, ref, paginationState);
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

  Future<void> _deleteRecords(List<DronesTracking> dronestrackings,
      WidgetRef ref, DronesTrackingPaginationState paginationState) async {
    for (var dronestracking in dronestrackings) {
      await ref.read(deleteDronesTrackingProvider(dronestracking.id!).future);
    }
    setState(() {
      widget._initialized = false;
    });
    ref.read(dronestrackingPaginationProvider.notifier).setPage(1);
  }
}

class DronesTrackingPaginationState {
  final Tuple2<int, int> pagination;
  final Map<String, int> orders;
  final Map<String, dynamic> filters;

  DronesTrackingPaginationState({
    required this.pagination,
    required this.orders,
    required this.filters,
  });
}

class DronesTrackingPaginationNotifier
    extends StateNotifier<DronesTrackingPaginationState> {
  DronesTrackingPaginationNotifier()
      : super(DronesTrackingPaginationState(
          pagination: const Tuple2<int, int>(0, 10),
          orders: {},
          filters: {},
        ));

  void setPage(int page) {
    state = DronesTrackingPaginationState(
      pagination: Tuple2(page * state.pagination.item2 - state.pagination.item2,
          state.pagination.item2),
      orders: state.orders,
      filters: state.filters,
    );
  }

  void setOrders(Map<String, int> newOrders) {
    state = DronesTrackingPaginationState(
      pagination: Tuple2(state.pagination.item1, state.pagination.item2),
      orders: newOrders,
      filters: state.filters,
    );
  }

  void setFilters(Map<String, dynamic> newFilters) {
    state = DronesTrackingPaginationState(
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

final dronestrackingPaginationProvider = StateNotifierProvider<
    DronesTrackingPaginationNotifier, DronesTrackingPaginationState>(
  (ref) => DronesTrackingPaginationNotifier(),
);

// **************************************************************************
// RiverpodCustomGenerator
// **************************************************************************

final getDronesTrackingProvider = FutureProvider.autoDispose
    .family<DronesTracking, String>((ref, dronestrackingId) async {
  final json =
      await http.get(Uri.parse('$baseURL/dronestracking/$dronestrackingId'));
  final jsonData = jsonDecode(json.body);
  return DronesTracking.fromJson(jsonData);
});

final createDronesTrackingProvider = FutureProvider.autoDispose
    .family<void, Tuple2<DronesTracking, BuildContext>>((ref, tuple) async {
  DronesTracking dronestrackingInstance = tuple.item1;
  BuildContext context = tuple.item2;

  final response = await http.post(
    Uri.parse('$baseURL/dronestracking'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(dronestrackingInstance.toJson()),
  );
  if (response.statusCode != 200) {
    CustomSnackBar.show(context, jsonDecode(response.body)['detail']);
  }
});

final updateDronesTrackingProvider = FutureProvider.autoDispose
    .family<void, Tuple2<DronesTracking, BuildContext>>((ref, tuple) async {
  DronesTracking dronestrackingInstance = tuple.item1;
  BuildContext context = tuple.item2;

  final response = await http.put(
    Uri.parse('$baseURL/dronestracking/${dronestrackingInstance.id}'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(dronestrackingInstance.toJson()),
  );
  if (response.statusCode != 200) {
    CustomSnackBar.show(context, jsonDecode(response.body)['detail']);
  }
});

final deleteDronesTrackingProvider = FutureProvider.autoDispose
    .family<void, String>((ref, dronestrackingId) async {
  final response = await http.delete(
    Uri.parse('$baseURL/dronestracking/$dronestrackingId'),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to delete DronesTracking');
  }
});

class DronesTrackingPaginationData {
  final List<DronesTracking> items;
  final int currentPage;
  final int maxPages;

  DronesTrackingPaginationData({
    required this.items,
    required this.currentPage,
    required this.maxPages,
  });
}

final getAllDronesTrackingProvider = FutureProvider.autoDispose
    .family<DronesTrackingPaginationData, DronesTrackingPaginationState>(
        (ref, state) async {
  final fixedQuery = {
    if (state.orders.isNotEmpty) 'orders': state.orders,
    if (state.filters.isNotEmpty)
      'filters': Map.from(state.filters)
        ..removeWhere((key, value) => value == null || value == ''),
  };

  final json = await http.post(
      Uri.parse(
          '$baseURL/dronestrackings?skip=${state.pagination.item1}&limit=${state.pagination.item2}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(fixedQuery));
  final jsonData = jsonDecode(json.body);

  return DronesTrackingPaginationData(
    items: (jsonData['items'] as List)
        .map((data) => DronesTracking.fromJson(data))
        .toList(),
    currentPage: jsonData['current_page'],
    maxPages: jsonData['max_pages'],
  );
});
