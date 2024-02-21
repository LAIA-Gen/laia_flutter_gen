// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drone.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DroneCWProxy {
  Drone id(String id);

  Drone max_altitude(double max_altitude);

  Drone max_speed(double max_speed);

  Drone model(String model);

  Drone name(String name);

  Drone user_id(String user_id);

  Drone weight(double weight);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Drone(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Drone(...).copyWith(id: 12, name: "My name")
  /// ````
  Drone call({
    String? id,
    double? max_altitude,
    double? max_speed,
    String? model,
    String? name,
    String? user_id,
    double? weight,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDrone.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDrone.copyWith.fieldName(...)`
class _$DroneCWProxyImpl implements _$DroneCWProxy {
  final Drone _value;

  const _$DroneCWProxyImpl(this._value);

  @override
  Drone id(String id) => this(id: id);

  @override
  Drone max_altitude(double max_altitude) => this(max_altitude: max_altitude);

  @override
  Drone max_speed(double max_speed) => this(max_speed: max_speed);

  @override
  Drone model(String model) => this(model: model);

  @override
  Drone name(String name) => this(name: name);

  @override
  Drone user_id(String user_id) => this(user_id: user_id);

  @override
  Drone weight(double weight) => this(weight: weight);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Drone(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Drone(...).copyWith(id: 12, name: "My name")
  /// ````
  Drone call({
    Object? id = const $CopyWithPlaceholder(),
    Object? max_altitude = const $CopyWithPlaceholder(),
    Object? max_speed = const $CopyWithPlaceholder(),
    Object? model = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? user_id = const $CopyWithPlaceholder(),
    Object? weight = const $CopyWithPlaceholder(),
  }) {
    return Drone(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      max_altitude:
          max_altitude == const $CopyWithPlaceholder() || max_altitude == null
              ? _value.max_altitude
              // ignore: cast_nullable_to_non_nullable
              : max_altitude as double,
      max_speed: max_speed == const $CopyWithPlaceholder() || max_speed == null
          ? _value.max_speed
          // ignore: cast_nullable_to_non_nullable
          : max_speed as double,
      model: model == const $CopyWithPlaceholder() || model == null
          ? _value.model
          // ignore: cast_nullable_to_non_nullable
          : model as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      user_id: user_id == const $CopyWithPlaceholder() || user_id == null
          ? _value.user_id
          // ignore: cast_nullable_to_non_nullable
          : user_id as String,
      weight: weight == const $CopyWithPlaceholder() || weight == null
          ? _value.weight
          // ignore: cast_nullable_to_non_nullable
          : weight as double,
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
  final GlobalKey<StringWidgetState> idWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<StringWidgetState> nameWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<UserFieldWidgetState> user_idWidgetKey =
      GlobalKey<UserFieldWidgetState>();
  final GlobalKey<StringWidgetState> modelWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<DoubleWidgetState> weightWidgetKey =
      GlobalKey<DoubleWidgetState>();
  final GlobalKey<DoubleWidgetState> max_altitudeWidgetKey =
      GlobalKey<DoubleWidgetState>();
  final GlobalKey<DoubleWidgetState> max_speedWidgetKey =
      GlobalKey<DoubleWidgetState>();

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
              key: idWidgetKey,
              fieldName: "Id",
              fieldDescription: "This is the id",
              editable: false,
              placeholder: "Type the id",
              value: widget.element?.id,
            ),
            StringWidget(
              key: nameWidgetKey,
              fieldName: "Name",
              fieldDescription: "This is the name",
              editable: true,
              placeholder: "Type the name",
              value: widget.element?.name,
            ),
            UserFieldWidget(
              key: user_idWidgetKey,
              fieldName: "User",
              fieldDescription: "This is the user_id",
              editable: true,
              placeholder: "Type the user_id",
              value: widget.element?.user_id,
            ),
            StringWidget(
              key: modelWidgetKey,
              fieldName: "Model",
              fieldDescription: "This is the model",
              editable: true,
              placeholder: "Type the model",
              value: widget.element?.model,
            ),
            DoubleWidget(
              key: weightWidgetKey,
              fieldName: "Weight",
              fieldDescription: "This is the weight",
              editable: true,
              placeholder: "Type the weight",
              value: widget.element?.weight,
            ),
            DoubleWidget(
              key: max_altitudeWidgetKey,
              fieldName: "Maximum altitude",
              fieldDescription: "This is the max_altitude",
              editable: true,
              placeholder: "Type the max_altitude",
              value: widget.element?.max_altitude,
            ),
            DoubleWidget(
              key: max_speedWidgetKey,
              fieldName: "Maximum speed",
              fieldDescription: "This is the max_speed",
              editable: true,
              placeholder: "Type the max_speed",
              value: widget.element?.max_speed,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? updatedid = idWidgetKey.currentState?.getUpdatedValue();

          String? updatedname = nameWidgetKey.currentState?.getUpdatedValue();

          String? updateduser_id =
              user_idWidgetKey.currentState?.getUpdatedValue();

          String? updatedmodel = modelWidgetKey.currentState?.getUpdatedValue();

          double? updatedweight =
              weightWidgetKey.currentState?.getUpdatedValue();

          double? updatedmax_altitude =
              max_altitudeWidgetKey.currentState?.getUpdatedValue();

          double? updatedmax_speed =
              max_speedWidgetKey.currentState?.getUpdatedValue();

          Drone updatedDrone = widget.element ??
              Drone(
                id: updatedid ?? '',
                name: updatedname ?? '',
                user_id: updateduser_id ?? '',
                model: updatedmodel ?? '',
                weight: updatedweight ?? 0.0,
                max_altitude: updatedmax_altitude ?? 0.0,
                max_speed: updatedmax_speed ?? 0.0,
              );

          updatedDrone = updatedDrone.copyWith(
              id: updatedid,
              name: updatedname,
              user_id: updateduser_id,
              model: updatedmodel,
              weight: updatedweight,
              max_altitude: updatedmax_altitude,
              max_speed: updatedmax_speed);
          var container = ProviderContainer();
          try {
            if (widget.isEditing) {
              await container.read(updateDroneProvider(updatedDrone));
              print('Drone updated successfully');
            } else {
              await container.read(createDroneProvider(updatedDrone));
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
                                      drone.name
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
                                currentValue = value.id;
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
          MaterialPageRoute(builder: (context) => const DroneListView()),
        );
      },
      child: Container(
        width: 100.0,
        height: 100.0,
        color: Styles.primaryColor,
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
      id: json['id'] as String,
      name: json['name'] as String,
      user_id: json['user_id'] as String,
      model: json['model'] as String,
      weight: (json['weight'] as num).toDouble(),
      max_altitude: (json['max_altitude'] as num).toDouble(),
      max_speed: (json['max_speed'] as num).toDouble(),
    );

Map<String, dynamic> _$DroneToJson(Drone instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'user_id': instance.user_id,
      'model': instance.model,
      'weight': instance.weight,
      'max_altitude': instance.max_altitude,
      'max_speed': instance.max_speed,
    };

// **************************************************************************
// ListWidgetGenerator
// **************************************************************************

class DroneListView extends ConsumerWidget {
  const DroneListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      fieldsFilterStates[fieldName] = filterValue;
      ref.read(dronePaginationProvider.notifier).setFilters(fieldsFilterStates);
    }

    void onFilterRemove(String fieldName, dynamic filterValue) {
      if (fieldsFilterStates.containsKey(fieldName)) {
        fieldsFilterStates.remove(fieldName);
      }
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
                      'id': 'String',
                      'name': 'String',
                      'user_id': 'String',
                      'model': 'String',
                      'weight': 'double',
                      'max_altitude': 'double',
                      'max_speed': 'double'
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
                              child: SizedBox(
                                width: double.infinity,
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
                                              'User',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 94, 54, 54)),
                                              textAlign: TextAlign.center,
                                            ),
                                            if (columnSortStates['user_id'] !=
                                                null) ...[
                                              Icon(
                                                columnSortStates['user_id'] == 1
                                                    ? Icons
                                                        .arrow_drop_up_rounded
                                                    : Icons
                                                        .arrow_drop_down_rounded,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                '${columnSortStates.keys.toList().indexOf('user_id') + 1}',
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      onSort: (columnIndex, ascending) =>
                                          {onSort('user_id')},
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Model',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 94, 54, 54)),
                                              textAlign: TextAlign.center,
                                            ),
                                            if (columnSortStates['model'] !=
                                                null) ...[
                                              Icon(
                                                columnSortStates['model'] == 1
                                                    ? Icons
                                                        .arrow_drop_up_rounded
                                                    : Icons
                                                        .arrow_drop_down_rounded,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                '${columnSortStates.keys.toList().indexOf('model') + 1}',
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      onSort: (columnIndex, ascending) =>
                                          {onSort('model')},
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Weight',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 94, 54, 54)),
                                              textAlign: TextAlign.center,
                                            ),
                                            if (columnSortStates['weight'] !=
                                                null) ...[
                                              Icon(
                                                columnSortStates['weight'] == 1
                                                    ? Icons
                                                        .arrow_drop_up_rounded
                                                    : Icons
                                                        .arrow_drop_down_rounded,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                '${columnSortStates.keys.toList().indexOf('weight') + 1}',
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      onSort: (columnIndex, ascending) =>
                                          {onSort('weight')},
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Maximum altitude',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 94, 54, 54)),
                                              textAlign: TextAlign.center,
                                            ),
                                            if (columnSortStates[
                                                    'max_altitude'] !=
                                                null) ...[
                                              Icon(
                                                columnSortStates[
                                                            'max_altitude'] ==
                                                        1
                                                    ? Icons
                                                        .arrow_drop_up_rounded
                                                    : Icons
                                                        .arrow_drop_down_rounded,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                '${columnSortStates.keys.toList().indexOf('max_altitude') + 1}',
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      onSort: (columnIndex, ascending) =>
                                          {onSort('max_altitude')},
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Maximum speed',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 94, 54, 54)),
                                              textAlign: TextAlign.center,
                                            ),
                                            if (columnSortStates['max_speed'] !=
                                                null) ...[
                                              Icon(
                                                columnSortStates['max_speed'] ==
                                                        1
                                                    ? Icons
                                                        .arrow_drop_up_rounded
                                                    : Icons
                                                        .arrow_drop_down_rounded,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                '${columnSortStates.keys.toList().indexOf('max_speed') + 1}',
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      onSort: (columnIndex, ascending) =>
                                          {onSort('max_speed')},
                                    ),
                                  ],
                                  rows: drones.map((drone) {
                                    return DataRow(
                                      cells: [
                                        DataCell(Center(
                                            child:
                                                Text(drone.name.toString()))),
                                        DataCell(Center(
                                            child: Text(
                                                drone.user_id.toString()))),
                                        DataCell(Center(
                                            child:
                                                Text(drone.model.toString()))),
                                        DataCell(Center(
                                            child:
                                                Text(drone.weight.toString()))),
                                        DataCell(Center(
                                            child: Text(drone.max_altitude
                                                .toString()))),
                                        DataCell(Center(
                                            child: Text(
                                                drone.max_speed.toString()))),
                                      ],
                                      onSelectChanged: (selected) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DroneWidget(
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
          pagination: const Tuple2<int, int>(0, 20),
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

final createDroneProvider =
    FutureProvider.autoDispose.family<void, Drone>((ref, droneInstance) async {
  final response = await http.post(
    Uri.parse('$baseURL/drone'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(droneInstance.toJson()),
  );
  if (response.statusCode != 201) {
    throw Exception('Failed to create Drone');
  }
});

final updateDroneProvider =
    FutureProvider.autoDispose.family<void, Drone>((ref, droneInstance) async {
  final response = await http.put(
    Uri.parse('$baseURL/drone/${droneInstance.id}'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(droneInstance.toJson()),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to update Drone');
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
