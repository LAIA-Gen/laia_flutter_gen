// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drone.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DroneCWProxy {
  Drone description(String? description);

  Drone flightplans(List<String> flightplans);

  Drone id(String? id);

  Drone name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Drone(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Drone(...).copyWith(id: 12, name: "My name")
  /// ````
  Drone call({
    String? description,
    List<String>? flightplans,
    String? id,
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDrone.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDrone.copyWith.fieldName(...)`
class _$DroneCWProxyImpl implements _$DroneCWProxy {
  final Drone _value;

  const _$DroneCWProxyImpl(this._value);

  @override
  Drone description(String? description) => this(description: description);

  @override
  Drone flightplans(List<String> flightplans) => this(flightplans: flightplans);

  @override
  Drone id(String? id) => this(id: id);

  @override
  Drone name(String name) => this(name: name);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Drone(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Drone(...).copyWith(id: 12, name: "My name")
  /// ````
  Drone call({
    Object? description = const $CopyWithPlaceholder(),
    Object? flightplans = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return Drone(
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      flightplans:
          flightplans == const $CopyWithPlaceholder() || flightplans == null
              ? _value.flightplans
              // ignore: cast_nullable_to_non_nullable
              : flightplans as List<String>,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
    );
  }
}

extension $DroneCopyWith on Drone {
  /// Returns a callable class that can be used as follows: `instanceOfDrone.copyWith(...)` or like so:`instanceOfDrone.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DroneCWProxy get copyWith => _$DroneCWProxyImpl(this);
}

// **************************************************************************
// ElementWidgetGenerator
// **************************************************************************

class DroneWidget extends StatefulWidget {
  final Drone? element;
  final bool isEditing;

  const DroneWidget({this.element, required this.isEditing, Key? key})
      : super(key: key);

  @override
  _DroneWidgetState createState() => _DroneWidgetState();
}

class _DroneWidgetState extends State<DroneWidget> {
  final GlobalKey<StringWidgetState> descriptionWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<FlightPlanMultiFieldWidgetState> flightplansWidgetKey =
      GlobalKey<FlightPlanMultiFieldWidgetState>();
  final GlobalKey<StringWidgetState> idWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<StringWidgetState> nameWidgetKey =
      GlobalKey<StringWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drone'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            StringWidget(
              key: descriptionWidgetKey,
              fieldName: "Description",
              fieldDescription: "This is the Drone Description",
              editable: true,
              placeholder: "Write short description of your Drone",
              value: widget.element?.description,
            ),
            FlightPlanMultiFieldWidget(
              key: flightplansWidgetKey,
              fieldName: "FlightPlans",
              fieldDescription: "These are the Drone's FlightPlans",
              editable: true,
              placeholder: "List the Drone's FlightPlans",
              values: widget.element?.flightplans,
            ),
            StringWidget(
              key: idWidgetKey,
              fieldName: "id",
              fieldDescription: "This is the id",
              editable: true,
              placeholder: "Type the id",
              value: widget.element?.id,
            ),
            StringWidget(
              key: nameWidgetKey,
              fieldName: "Name",
              fieldDescription: "This is the Drone Name",
              editable: true,
              placeholder: "Write the Name of your Drone",
              value: widget.element?.name,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? updateddescription =
              descriptionWidgetKey.currentState?.getUpdatedValue();

          List<String>? updatedflightplans =
              flightplansWidgetKey.currentState?.getUpdatedValue();

          String? updatedid = idWidgetKey.currentState?.getUpdatedValue();

          String? updatedname = nameWidgetKey.currentState?.getUpdatedValue();

          Drone updatedDrone = widget.element ??
              Drone(
                description: updateddescription ?? '',
                flightplans: updatedflightplans ?? [''],
                id: updatedid ?? '',
                name: updatedname ?? '',
              );

          updatedDrone = updatedDrone.copyWith(
              description: updateddescription,
              flightplans: updatedflightplans,
              id: updatedid,
              name: updatedname);
          var container = ProviderContainer();
          try {
            if (widget.isEditing) {
              await container
                  .read(updateDroneProvider(Tuple2(updatedDrone, context)));
              print('Drone updated successfully');
            } else {
              await container
                  .read(createDroneProvider(Tuple2(updatedDrone, context)));
              print('Drone created successfully');
            }
          } catch (error) {
            print('Failed to update Drone: $error');
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

class DroneFieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final String? value;

  const DroneFieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
  }) : super(key: key);

  @override
  DroneFieldWidgetState createState() => DroneFieldWidgetState();
}

class DroneFieldWidgetState extends State<DroneFieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late String? initialValue;
  late String currentValue;
  late List<Drone> options;

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  Future<void> initializeValues() async {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue ?? '';
    Drone drone = await container.read(getDroneProvider(widget.value!).future);
    _typeAheadController.text = '${drone.name} <id: ${drone.id}>';
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
                          child: TypeAheadField<Drone>(
                            controller: _typeAheadController,
                            suggestionsCallback: (String pattern) async {
                              final dronePaginationData = await container.read(
                                  getAllDroneProvider(container
                                          .read(dronePaginationProvider))
                                      .future);
                              final options = dronePaginationData.items;
                              return options
                                  .where((drone) =>
                                      drone.name!
                                          .toLowerCase()
                                          .contains(pattern.toLowerCase()) ||
                                      drone.id
                                          .toString()
                                          .contains(pattern.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, drone) {
                              return ListTile(
                                title: Text('${drone.name} <id: ${drone.id}>'),
                              );
                            },
                            onSelected: (Drone value) {
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
                Drone drone = await container
                    .read(getDroneProvider(widget.value!).future);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DroneWidget(element: drone, isEditing: true),
                  ),
                );
              } catch (error) {
                print('Failed to fetch drone: $error');
              }
            },
            child: const Text('View Drone'),
          ),
        ),
      ],
    );
  }
}

class DroneMultiFieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final List<String>? values;

  const DroneMultiFieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.values,
  }) : super(key: key);

  @override
  DroneMultiFieldWidgetState createState() => DroneMultiFieldWidgetState();
}

class DroneMultiFieldWidgetState extends State<DroneMultiFieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late List<String> initialValues = [];
  late List<String> currentValues = [];
  late List<Drone> options = [];

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
      List<Drone> droneList = await Future.wait(
        (widget.values ?? []).where((value) => value != '').map((value) async {
          return await container.read(getDroneProvider(value).future);
        }),
      );
      String concatenatedText = '${droneList.map((drone) {
        return '${drone.name} <id: ${drone.id}>';
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
                          child: TypeAheadField<Drone>(
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
                                  .read(dronePaginationProvider.notifier)
                                  .setFilters({
                                'id': {'\$nin': currentValues}
                              });
                              final dronePaginationData = await container.read(
                                  getAllDroneProvider(container
                                          .read(dronePaginationProvider))
                                      .future);
                              final options = dronePaginationData.items;
                              return options
                                  .where((drone) =>
                                      drone.name!
                                          .toLowerCase()
                                          .contains(inputParts.toLowerCase()) ||
                                      drone.id
                                          .toString()
                                          .toLowerCase()
                                          .contains(inputParts.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, drone) {
                              return ListTile(
                                title: Text('${drone.name} <id: ${drone.id}>'),
                              );
                            },
                            onSelected: (Drone value) async {
                              isValueChanged =
                                  !initialValues.contains(value.id);
                              currentValues.add(value.id!);

                              List<Drone> droneList = await Future.wait(
                                  (currentValues)
                                      .where((value) => value != '')
                                      .map((value) async {
                                return await container
                                    .read(getDroneProvider(value).future);
                              }));
                              String concatenatedText =
                                  '${droneList.map((drone) {
                                return '${drone.name} <id: ${drone.id}>';
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
                    builder: (context) => DroneListView(extraFilters: query),
                  ),
                );
              } catch (error) {
                print('Failed to fetch drones: $error');
              }
            },
            child: const Text('View Drones'),
          ),
        ),
      ],
    );
  }
}

// **************************************************************************
// HomeWidgetElementGenerator
// **************************************************************************

class DroneHomeWidget extends StatelessWidget {
  const DroneHomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DroneListView()),
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
              'assets/drone.png',
              width: 40.0,
              height: 40.0,
              color: Colors.white,
            ),
            const SizedBox(height: 8.0),
            const Text(
              "Drone",
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

Drone _$DroneFromJson(Map<String, dynamic> json) => Drone(
      description: json['description'] as String?,
      flightplans: (json['flightplans'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      id: json['id'] as String?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$DroneToJson(Drone instance) => <String, dynamic>{
      'description': instance.description,
      'flightplans': instance.flightplans,
      'id': instance.id,
      'name': instance.name,
    };

// **************************************************************************
// ListWidgetGenerator
// **************************************************************************

class DroneListView extends ConsumerStatefulWidget {
  final Map<String, dynamic>? extraFilters;
  final Map<String, dynamic> currentFilters = {};

  DroneListView({Key? key, this.extraFilters}) : super(key: key);

  @override
  _DroneListViewState createState() => _DroneListViewState();
}

class _DroneListViewState extends ConsumerState<DroneListView> {
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
          .read(dronePaginationProvider.notifier)
          .setFilters(widget.extraFilters!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final paginationState = ref.watch(dronePaginationProvider);

    final dronesAsyncValue = ref.watch(getAllDroneProvider(paginationState));

    final Map<String, int> columnSortStates =
        ref.watch(dronePaginationProvider.notifier).getOrders();

    final Map<String, dynamic> fieldsFilterStates =
        ref.watch(dronePaginationProvider.notifier).getFilters();

    void onSort(String columnName) {
      var state = columnSortStates[columnName];
      if (state == 0 || state == null) {
        columnSortStates[columnName] = 1;
      } else if (state == 1) {
        columnSortStates[columnName] = -1;
      } else if (state == -1) {
        columnSortStates.remove(columnName);
      }
      ref.read(dronePaginationProvider.notifier).setOrders(columnSortStates);
    }

    void onFilter(String fieldName, dynamic filterValue) {
      widget.currentFilters[fieldName] = filterValue;
      ref
          .read(dronePaginationProvider.notifier)
          .setFilters(widget.currentFilters);
    }

    void onFilterRemove(String fieldName, dynamic filterValue) {
      if (widget.currentFilters.containsKey(fieldName)) {
        widget.currentFilters.remove(fieldName);
      }
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
          title: const Text('Drone List'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DroneWidget(
                      isEditing: false,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: dronesAsyncValue.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
          data: (DronePaginationData data) {
            final drones = data.items;
            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomSearchBar(
                    fields: const {
                      'description': 'String?',
                      'flightplans': 'List<String>',
                      'id': 'String?',
                      'name': 'String'
                    },
                    filters: fieldsFilterStates,
                    onFilterChanged: onFilter,
                    onFilterRemove: onFilterRemove,
                  ),
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
                                                'Description',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates[
                                                      'description'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates[
                                                              'description'] ==
                                                          1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('description') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('description')},
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'FlightPlans',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates[
                                                      'flightplans'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates[
                                                              'flightplans'] ==
                                                          1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('flightplans') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('flightplans')},
                                      ),
                                    ],
                                    rows: drones.map((drone) {
                                      return DataRow(
                                        cells: [
                                          DataCell(Center(
                                              child:
                                                  Text(drone.name.toString()))),
                                          DataCell(Center(
                                              child: Text(drone.description
                                                  .toString()))),
                                          DataCell(
                                            Center(
                                              child: FutureBuilder<
                                                  List<FlightPlan>>(
                                                future: fetchFlightPlanList(
                                                    drone.flightplans),
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
                                          ),
                                        ],
                                        onSelectChanged: (selected) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DroneWidget(
                                                        element: drone,
                                                        isEditing: true)),
                                          );
                                        },
                                      );
                                    }).toList(),
                                    showCheckboxColumn: false,
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
      DronePaginationState paginationState, int maxPages) {
    if (pageNumber <= maxPages) {
      ref.read(dronePaginationProvider.notifier).setPage(pageNumber);
    }
  }
}

class DronePaginationState {
  final Tuple2<int, int> pagination;
  final Map<String, int> orders;
  final Map<String, dynamic> filters;

  DronePaginationState({
    required this.pagination,
    required this.orders,
    required this.filters,
  });
}

class DronePaginationNotifier extends StateNotifier<DronePaginationState> {
  DronePaginationNotifier()
      : super(DronePaginationState(
          pagination: const Tuple2<int, int>(0, 10),
          orders: {},
          filters: {},
        ));

  void setPage(int page) {
    state = DronePaginationState(
      pagination: Tuple2(page * state.pagination.item2 - state.pagination.item2,
          state.pagination.item2),
      orders: state.orders,
      filters: state.filters,
    );
  }

  void setOrders(Map<String, int> newOrders) {
    state = DronePaginationState(
      pagination: Tuple2(state.pagination.item1, state.pagination.item2),
      orders: newOrders,
      filters: state.filters,
    );
  }

  void setFilters(Map<String, dynamic> newFilters) {
    state = DronePaginationState(
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

final dronePaginationProvider =
    StateNotifierProvider<DronePaginationNotifier, DronePaginationState>(
  (ref) => DronePaginationNotifier(),
);

// **************************************************************************
// RiverpodCustomGenerator
// **************************************************************************

final getDroneProvider =
    FutureProvider.autoDispose.family<Drone, String>((ref, droneId) async {
  final json = await http.get(Uri.parse('$baseURL/drone/$droneId'));
  final jsonData = jsonDecode(json.body);
  return Drone.fromJson(jsonData);
});

final createDroneProvider = FutureProvider.autoDispose
    .family<void, Tuple2<Drone, BuildContext>>((ref, tuple) async {
  Drone droneInstance = tuple.item1;
  BuildContext context = tuple.item2;

  final response = await http.post(
    Uri.parse('$baseURL/drone'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(droneInstance.toJson()),
  );
  if (response.statusCode != 201) {
    CustomSnackBar.show(context, jsonDecode(response.body)['detail']);
  }
});

final updateDroneProvider = FutureProvider.autoDispose
    .family<void, Tuple2<Drone, BuildContext>>((ref, tuple) async {
  Drone droneInstance = tuple.item1;
  BuildContext context = tuple.item2;

  final response = await http.put(
    Uri.parse('$baseURL/drone/${droneInstance.id}'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(droneInstance.toJson()),
  );
  if (response.statusCode != 200) {
    CustomSnackBar.show(context, jsonDecode(response.body)['detail']);
  }
});

final deleteDroneProvider =
    FutureProvider.autoDispose.family<void, int>((ref, droneId) async {
  final response = await http.delete(
    Uri.parse('$baseURL/drone/$droneId'),
  );
  if (response.statusCode != 204) {
    throw Exception('Failed to delete Drone');
  }
});

class DronePaginationData {
  final List<Drone> items;
  final int currentPage;
  final int maxPages;

  DronePaginationData({
    required this.items,
    required this.currentPage,
    required this.maxPages,
  });
}

final getAllDroneProvider = FutureProvider.autoDispose
    .family<DronePaginationData, DronePaginationState>((ref, state) async {
  final fixedQuery = {
    if (state.orders.isNotEmpty) 'orders': state.orders,
    if (state.filters.isNotEmpty)
      'filters': Map.from(state.filters)
        ..removeWhere((key, value) => value == null || value == ''),
  };

  final json = await http.post(
      Uri.parse(
          '$baseURL/drones?skip=${state.pagination.item1}&limit=${state.pagination.item2}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(fixedQuery));
  final jsonData = jsonDecode(json.body);

  return DronePaginationData(
    items: (jsonData['items'] as List)
        .map((data) => Drone.fromJson(data))
        .toList(),
    currentPage: jsonData['current_page'],
    maxPages: jsonData['max_pages'],
  );
});
