// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drone.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DroneCWProxy {
  Drone capabilities(String capabilities);

  Drone id(String? id);

  Drone manufacturer(String? manufacturer);

  Drone model(String model);

  Drone name(String name);

  Drone operatorId(String? operatorId);

  Drone type(String type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Drone(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Drone(...).copyWith(id: 12, name: "My name")
  /// ````
  Drone call({
    String? capabilities,
    String? id,
    String? manufacturer,
    String? model,
    String? name,
    String? operatorId,
    String? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDrone.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDrone.copyWith.fieldName(...)`
class _$DroneCWProxyImpl implements _$DroneCWProxy {
  final Drone _value;

  const _$DroneCWProxyImpl(this._value);

  @override
  Drone capabilities(String capabilities) => this(capabilities: capabilities);

  @override
  Drone id(String? id) => this(id: id);

  @override
  Drone manufacturer(String? manufacturer) => this(manufacturer: manufacturer);

  @override
  Drone model(String model) => this(model: model);

  @override
  Drone name(String name) => this(name: name);

  @override
  Drone operatorId(String? operatorId) => this(operatorId: operatorId);

  @override
  Drone type(String type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Drone(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Drone(...).copyWith(id: 12, name: "My name")
  /// ````
  Drone call({
    Object? capabilities = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? manufacturer = const $CopyWithPlaceholder(),
    Object? model = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? operatorId = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return Drone(
      capabilities:
          capabilities == const $CopyWithPlaceholder() || capabilities == null
              ? _value.capabilities
              // ignore: cast_nullable_to_non_nullable
              : capabilities as String,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      manufacturer: manufacturer == const $CopyWithPlaceholder()
          ? _value.manufacturer
          // ignore: cast_nullable_to_non_nullable
          : manufacturer as String?,
      model: model == const $CopyWithPlaceholder() || model == null
          ? _value.model
          // ignore: cast_nullable_to_non_nullable
          : model as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      operatorId: operatorId == const $CopyWithPlaceholder()
          ? _value.operatorId
          // ignore: cast_nullable_to_non_nullable
          : operatorId as String?,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String,
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
  final GlobalKey<StringWidgetState> capabilitiesWidgetKey =
      GlobalKey<StringWidgetState>();

  final GlobalKey<StringWidgetState> idWidgetKey =
      GlobalKey<StringWidgetState>();

  final GlobalKey<ManufacturerFieldWidgetState> manufacturerWidgetKey =
      GlobalKey<ManufacturerFieldWidgetState>();

  final GlobalKey<StringWidgetState> modelWidgetKey =
      GlobalKey<StringWidgetState>();

  final GlobalKey<StringWidgetState> nameWidgetKey =
      GlobalKey<StringWidgetState>();

  final GlobalKey<OperatorFieldWidgetState> operatorIdWidgetKey =
      GlobalKey<OperatorFieldWidgetState>();

  final GlobalKey<DroneTypeFieldWidgetState> typeWidgetKey =
      GlobalKey<DroneTypeFieldWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drone'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DroneListView()),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            StringWidget(
              key: capabilitiesWidgetKey,
              fieldName: "Capabilities",
              fieldDescription: "These are the Capabilities of the Drone",
              editable: true,
              placeholder: "Describe the Capabilities of the Drone",
              value: widget.element?.capabilities,
            ),
            StringWidget(
              key: idWidgetKey,
              fieldName: "id",
              fieldDescription: "This is the id",
              editable: true,
              placeholder: "Type the id",
              value: widget.element?.id,
            ),
            ManufacturerFieldWidget(
              key: manufacturerWidgetKey,
              fieldName: "Manufacturer",
              fieldDescription: "This is the drone Manufacturer",
              editable: true,
              placeholder: "Select the Manufacturer",
              value: widget.element?.manufacturer,
            ),
            StringWidget(
              key: modelWidgetKey,
              fieldName: "Model",
              fieldDescription: "This is the Model of the Drone",
              editable: true,
              placeholder: "Enter the Model of the Drone",
              value: widget.element?.model,
            ),
            StringWidget(
              key: nameWidgetKey,
              fieldName: "Name",
              fieldDescription: "This is the Drone Name",
              editable: true,
              placeholder: "Write the Name of your Drone",
              value: widget.element?.name,
            ),
            OperatorFieldWidget(
              key: operatorIdWidgetKey,
              fieldName: "Operator",
              fieldDescription: "This is the Operator of the Drone",
              editable: true,
              placeholder: "Select the Operator of the Drone",
              value: widget.element?.operatorId,
            ),
            DroneTypeFieldWidget(
              key: typeWidgetKey,
              fieldName: "Drone Type",
              fieldDescription: "This is the Type of the Drone",
              editable: true,
              placeholder: "Select the Type of the Drone",
              value: widget.element?.type,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var initialDrone = widget.element;
          Map<String, dynamic> updates = {};
          updates['id'] = widget.element?.id;

          updates['capabilities'] = widget.element?.capabilities;
          String? updatedcapabilities =
              capabilitiesWidgetKey.currentState?.getUpdatedValue();

          if (updatedcapabilities != initialDrone?.capabilities) {
            updates['capabilities'] = updatedcapabilities;
          }

          String? updatedid = idWidgetKey.currentState?.getUpdatedValue();

          updates['id'] = updatedid;
          String? updatedmanufacturer =
              manufacturerWidgetKey.currentState?.getUpdatedValue();

          if (updatedmanufacturer != initialDrone?.manufacturer) {
            updates['manufacturer'] = updatedmanufacturer;
          }

          updates['model'] = widget.element?.model;
          String? updatedmodel = modelWidgetKey.currentState?.getUpdatedValue();

          if (updatedmodel != initialDrone?.model) {
            updates['model'] = updatedmodel;
          }

          updates['name'] = widget.element?.name;
          String? updatedname = nameWidgetKey.currentState?.getUpdatedValue();

          if (updatedname != initialDrone?.name) {
            updates['name'] = updatedname;
          }

          String? updatedoperatorId =
              operatorIdWidgetKey.currentState?.getUpdatedValue();

          if (updatedoperatorId != initialDrone?.operatorId) {
            updates['operatorId'] = updatedoperatorId;
          }

          updates['type'] = widget.element?.type;
          String? updatedtype = typeWidgetKey.currentState?.getUpdatedValue();

          if (updatedtype != initialDrone?.type) {
            updates['type'] = updatedtype;
          }

          Drone updatedDrone = widget.element ??
              Drone(
                capabilities: updatedcapabilities ?? '',
                id: updatedid ?? '',
                manufacturer: updatedmanufacturer ?? '',
                model: updatedmodel ?? '',
                name: updatedname ?? '',
                operatorId: updatedoperatorId ?? '',
                type: updatedtype ?? '',
              );

          updatedDrone = updatedDrone.copyWith(
              capabilities: updatedcapabilities,
              id: updatedid,
              manufacturer: updatedmanufacturer,
              model: updatedmodel,
              name: updatedname,
              operatorId: updatedoperatorId,
              type: updatedtype);
          var container = ProviderContainer();
          try {
            if (widget.isEditing) {
              if (updates.isNotEmpty) {
                await container
                    .read(updateDroneProvider(Tuple2(updates, context)));
              } else {
                CustomSnackBar.show(context, "No changes were detected");
              }
            } else {
              await container
                  .read(createDroneProvider(Tuple2(updatedDrone, context)));
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
      capabilities: json['capabilities'] as String,
      id: json['id'] as String?,
      manufacturer: json['manufacturer'] as String?,
      model: json['model'] as String,
      name: json['name'] as String,
      operatorId: json['operatorId'] as String?,
      type: json['type'] as String,
    );

Map<String, dynamic> _$DroneToJson(Drone instance) => <String, dynamic>{
      'capabilities': instance.capabilities,
      'id': instance.id,
      'manufacturer': instance.manufacturer,
      'model': instance.model,
      'name': instance.name,
      'operatorId': instance.operatorId,
      'type': instance.type,
    };

// **************************************************************************
// ListWidgetGenerator
// **************************************************************************

class DroneListView extends ConsumerStatefulWidget {
  final Map<String, dynamic>? extraFilters;
  final Map<String, dynamic> currentFilters = {};
  late bool _initialized = false;
  late List<bool> selectedStates;

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

    Future<List<Manufacturer>> fetchManufacturerList(List<String>? ids) async {
      if (ids == null || ids.isEmpty) {
        return [];
      }
      final nonEmptyIds = ids.where((id) => id.isNotEmpty).toList();
      List<Manufacturer> manufacturerList = await Future.wait(
        nonEmptyIds.map((id) async {
          return await ref.read(getManufacturerProvider(id).future);
        }),
      );
      return manufacturerList;
    }

    Future<List<Operator>> fetchOperatorList(List<String>? ids) async {
      if (ids == null || ids.isEmpty) {
        return [];
      }
      final nonEmptyIds = ids.where((id) => id.isNotEmpty).toList();
      List<Operator> operatorList = await Future.wait(
        nonEmptyIds.map((id) async {
          return await ref.read(getOperatorProvider(id).future);
        }),
      );
      return operatorList;
    }

    Future<List<DroneType>> fetchDroneTypeList(List<String>? ids) async {
      if (ids == null || ids.isEmpty) {
        return [];
      }
      final nonEmptyIds = ids.where((id) => id.isNotEmpty).toList();
      List<DroneType> dronetypeList = await Future.wait(
        nonEmptyIds.map((id) async {
          return await ref.read(getDroneTypeProvider(id).future);
        }),
      );
      return dronetypeList;
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Drone List'),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DroneWidget(
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
                child: const Text('Create Drone'),
              ),
            ),
          ],
        ),
        body: dronesAsyncValue.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Center(
            child: Text('You have no access to these records...'),
          ),
          data: (DronePaginationData data) {
            final drones = data.items;

            if (!widget._initialized) {
              widget.selectedStates =
                  List.generate(drones.length, (index) => false);
              widget._initialized = true;
            }

            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomSearchBar(
                    fields: const {
                      'capabilities': 'String',
                      'id': 'String?',
                      'manufacturer': 'String?',
                      'model': 'String',
                      'name': 'String',
                      'operatorId': 'String?',
                      'type': 'String'
                    },
                    filters: fieldsFilterStates,
                    onFilterChanged: onFilter,
                    onFilterRemove: onFilterRemove,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    IconButton(
                      icon: const Icon(Icons.refresh, color: Colors.grey),
                      onPressed: () {
                        ref.read(dronePaginationProvider.notifier).setPage(1);
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

                                List<Drone> selectedDrones = selectedIndices
                                    .map((index) => drones[index])
                                    .toList();
                                _onDeleteElement(
                                    selectedDrones, ref, paginationState);
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
                                                'Drone Type',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates['type'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates['type'] == 1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('type') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('type')},
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
                                                'Capabilities',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates[
                                                      'capabilities'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates[
                                                              'capabilities'] ==
                                                          1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('capabilities') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('capabilities')},
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Manufacturer',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates[
                                                      'manufacturer'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates[
                                                              'manufacturer'] ==
                                                          1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('manufacturer') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('manufacturer')},
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Operator',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates[
                                                      'operatorId'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates[
                                                              'operatorId'] ==
                                                          1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('operatorId') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('operatorId')},
                                      ),
                                    ],
                                    rows: List<DataRow>.generate(drones.length,
                                        (index) {
                                      var drone = drones[index];

                                      return DataRow(
                                        selected: widget.selectedStates[index],
                                        cells: [
                                          DataCell(
                                            Center(
                                                child: Text(
                                                    drone.name.toString())),
                                            onTap: () =>
                                                {_navigateElement(drone)},
                                          ),
                                          DataCell(
                                            Center(
                                              child: FutureBuilder<
                                                  List<DroneType>>(
                                                future: fetchDroneTypeList(
                                                    [drone.type ?? '']),
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
                                                          .map((dronetype) {
                                                        return ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        DroneTypeWidget(
                                                                  element:
                                                                      dronetype,
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
                                                            dronetype.name!,
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
                                                {_navigateElement(drone)},
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text(
                                                    drone.model.toString())),
                                            onTap: () =>
                                                {_navigateElement(drone)},
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text(drone.capabilities
                                                    .toString())),
                                            onTap: () =>
                                                {_navigateElement(drone)},
                                          ),
                                          DataCell(
                                            Center(
                                              child: FutureBuilder<
                                                  List<Manufacturer>>(
                                                future: fetchManufacturerList(
                                                    [drone.manufacturer ?? '']),
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
                                                          .map((manufacturer) {
                                                        return ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        ManufacturerWidget(
                                                                  element:
                                                                      manufacturer,
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
                                                            manufacturer.name!,
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
                                                {_navigateElement(drone)},
                                          ),
                                          DataCell(
                                            Center(
                                              child:
                                                  FutureBuilder<List<Operator>>(
                                                future: fetchOperatorList(
                                                    [drone.operatorId ?? '']),
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
                                                          .map((operator) {
                                                        return ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        OperatorWidget(
                                                                  element:
                                                                      operator,
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
                                                            operator.name!,
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
                                                {_navigateElement(drone)},
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
      DronePaginationState paginationState, int maxPages) {
    if (pageNumber <= maxPages) {
      ref.read(dronePaginationProvider.notifier).setPage(pageNumber);
    }
  }

  void _navigateElement(Drone drone) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => DroneWidget(element: drone, isEditing: true)),
    );
  }

  void _onDeleteElement(
      List<Drone> drones, WidgetRef ref, DronePaginationState paginationState) {
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
                _deleteRecords(drones, ref, paginationState);
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

  Future<void> _deleteRecords(List<Drone> drones, WidgetRef ref,
      DronePaginationState paginationState) async {
    for (var drone in drones) {
      await ref.read(deleteDroneProvider(drone.id!).future);
    }
    setState(() {
      widget._initialized = false;
    });
    ref.read(dronePaginationProvider.notifier).setPage(1);
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
  final headers = await getHeaders();
  final json =
      await http.get(Uri.parse('$baseURL/drone/$droneId'), headers: headers);
  final jsonData = jsonDecode(json.body);
  return Drone.fromJson(jsonData);
});

final createDroneProvider = FutureProvider.autoDispose
    .family<void, Tuple2<Drone, BuildContext>>((ref, tuple) async {
  final headers = await getHeaders();
  Drone droneInstance = tuple.item1;
  BuildContext context = tuple.item2;

  final response = await http.post(
    Uri.parse('$baseURL/drone'),
    headers: headers,
    body: jsonEncode(droneInstance.toJson()),
  );
  if (response.statusCode != 200) {
    CustomSnackBar.show(context, jsonDecode(response.body)['detail']);
  } else {
    CustomSnackBar.show(context, 'Drone created successfully');
  }
});

final updateDroneProvider = FutureProvider.autoDispose
    .family<void, Tuple2<Map<String, dynamic>, BuildContext>>(
        (ref, tuple) async {
  final headers = await getHeaders();
  Map<String, dynamic> droneInstance = tuple.item1;
  BuildContext context = tuple.item2;

  final response = await http.put(
    Uri.parse('$baseURL/drone/${droneInstance['id']}'),
    headers: headers,
    body: jsonEncode(droneInstance),
  );
  if (response.statusCode != 200) {
    CustomSnackBar.show(context, jsonDecode(response.body)['detail']);
  } else {
    CustomSnackBar.show(context, 'Drone updated successfully');
  }
});

final deleteDroneProvider =
    FutureProvider.autoDispose.family<void, String>((ref, droneId) async {
  final headers = await getHeaders();
  final response =
      await http.delete(Uri.parse('$baseURL/drone/$droneId'), headers: headers);
  if (response.statusCode != 200) {
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
  final headers = await getHeaders();
  final fixedQuery = {
    if (state.orders.isNotEmpty) 'orders': state.orders,
    if (state.filters.isNotEmpty)
      'filters': Map.from(state.filters)
        ..removeWhere((key, value) => value == null || value == ''),
  };

  final json = await http.post(
      Uri.parse(
          '$baseURL/drones?skip=${state.pagination.item1}&limit=${state.pagination.item2}'),
      headers: headers,
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
