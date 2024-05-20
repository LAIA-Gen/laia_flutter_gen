// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dronetype.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DroneTypeCWProxy {
  DroneType description(String? description);

  DroneType id(String? id);

  DroneType name(String? name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DroneType(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DroneType(...).copyWith(id: 12, name: "My name")
  /// ````
  DroneType call({
    String? description,
    String? id,
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDroneType.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDroneType.copyWith.fieldName(...)`
class _$DroneTypeCWProxyImpl implements _$DroneTypeCWProxy {
  final DroneType _value;

  const _$DroneTypeCWProxyImpl(this._value);

  @override
  DroneType description(String? description) => this(description: description);

  @override
  DroneType id(String? id) => this(id: id);

  @override
  DroneType name(String? name) => this(name: name);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DroneType(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DroneType(...).copyWith(id: 12, name: "My name")
  /// ````
  DroneType call({
    Object? description = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return DroneType(
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
    );
  }
}

extension $DroneTypeCopyWith on DroneType {
  /// Returns a callable class that can be used as follows: `instanceOfDroneType.copyWith(...)` or like so:`instanceOfDroneType.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DroneTypeCWProxy get copyWith => _$DroneTypeCWProxyImpl(this);
}

// **************************************************************************
// ElementWidgetGenerator
// **************************************************************************

class DroneTypeWidget extends StatefulWidget {
  final DroneType? element;
  final bool isEditing;

  const DroneTypeWidget({this.element, required this.isEditing, Key? key})
      : super(key: key);

  @override
  _DroneTypeWidgetState createState() => _DroneTypeWidgetState();
}

class _DroneTypeWidgetState extends State<DroneTypeWidget> {
  final GlobalKey<StringWidgetState> descriptionWidgetKey =
      GlobalKey<StringWidgetState>();

  final GlobalKey<StringWidgetState> idWidgetKey =
      GlobalKey<StringWidgetState>();

  final GlobalKey<StringWidgetState> nameWidgetKey =
      GlobalKey<StringWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DroneType'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DroneTypeListView()),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            StringWidget(
              key: descriptionWidgetKey,
              fieldName: "Description",
              fieldDescription: "Description of the drone type",
              editable: true,
              placeholder: "Provide a description of the drone type",
              value: widget.element?.description,
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
              fieldDescription: "This is the name of the drone type",
              editable: true,
              placeholder: "Enter the name of the drone type",
              value: widget.element?.name,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? updateddescription =
              descriptionWidgetKey.currentState?.getUpdatedValue();

          String? updatedid = idWidgetKey.currentState?.getUpdatedValue();

          String? updatedname = nameWidgetKey.currentState?.getUpdatedValue();

          DroneType updatedDroneType = widget.element ??
              DroneType(
                description: updateddescription ?? '',
                id: updatedid ?? '',
                name: updatedname ?? '',
              );

          updatedDroneType = updatedDroneType.copyWith(
              description: updateddescription,
              id: updatedid,
              name: updatedname);
          var container = ProviderContainer();
          try {
            if (widget.isEditing) {
              await container.read(
                  updateDroneTypeProvider(Tuple2(updatedDroneType, context)));
              print('DroneType updated successfully');
              CustomSnackBar.show(context, 'DroneType updated successfully');
            } else {
              await container.read(
                  createDroneTypeProvider(Tuple2(updatedDroneType, context)));
              print('DroneType created successfully');
              CustomSnackBar.show(context, 'DroneType created successfully');
            }
          } catch (error) {
            print('Failed to update DroneType: $error');
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

class DroneTypeFieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final String? value;

  const DroneTypeFieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
  }) : super(key: key);

  @override
  DroneTypeFieldWidgetState createState() => DroneTypeFieldWidgetState();
}

class DroneTypeFieldWidgetState extends State<DroneTypeFieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late String? initialValue;
  late String currentValue;
  late List<DroneType> options;

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  Future<void> initializeValues() async {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue ?? '';
    DroneType dronetype =
        await container.read(getDroneTypeProvider(widget.value!).future);
    _typeAheadController.text = '${dronetype.name} <id: ${dronetype.id}>';
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
                          child: TypeAheadField<DroneType>(
                            controller: _typeAheadController,
                            suggestionsCallback: (String pattern) async {
                              final dronetypePaginationData = await container
                                  .read(getAllDroneTypeProvider(container
                                          .read(dronetypePaginationProvider))
                                      .future);
                              final options = dronetypePaginationData.items;
                              return options
                                  .where((dronetype) =>
                                      dronetype.name!
                                          .toLowerCase()
                                          .contains(pattern.toLowerCase()) ||
                                      dronetype.id
                                          .toString()
                                          .contains(pattern.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, dronetype) {
                              return ListTile(
                                title: Text(
                                    '${dronetype.name} <id: ${dronetype.id}>'),
                              );
                            },
                            onSelected: (DroneType value) {
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
                DroneType dronetype = await container
                    .read(getDroneTypeProvider(widget.value!).future);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DroneTypeWidget(element: dronetype, isEditing: true),
                  ),
                );
              } catch (error) {
                print('Failed to fetch dronetype: $error');
              }
            },
            child: const Text('View DroneType'),
          ),
        ),
      ],
    );
  }
}

class DroneTypeMultiFieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final List<String>? values;

  const DroneTypeMultiFieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.values,
  }) : super(key: key);

  @override
  DroneTypeMultiFieldWidgetState createState() =>
      DroneTypeMultiFieldWidgetState();
}

class DroneTypeMultiFieldWidgetState extends State<DroneTypeMultiFieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late List<String> initialValues = [];
  late List<String> currentValues = [];
  late List<DroneType> options = [];

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
      List<DroneType> dronetypeList = await Future.wait(
        (widget.values ?? []).where((value) => value != '').map((value) async {
          return await container.read(getDroneTypeProvider(value).future);
        }),
      );
      String concatenatedText = '${dronetypeList.map((dronetype) {
        return '${dronetype.name} <id: ${dronetype.id}>';
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
                          child: TypeAheadField<DroneType>(
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
                                  .read(dronetypePaginationProvider.notifier)
                                  .setFilters({
                                'id': {'\$nin': currentValues}
                              });
                              final dronetypePaginationData = await container
                                  .read(getAllDroneTypeProvider(container
                                          .read(dronetypePaginationProvider))
                                      .future);
                              final options = dronetypePaginationData.items;
                              return options
                                  .where((dronetype) =>
                                      dronetype.name!
                                          .toLowerCase()
                                          .contains(inputParts.toLowerCase()) ||
                                      dronetype.id
                                          .toString()
                                          .toLowerCase()
                                          .contains(inputParts.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, dronetype) {
                              return ListTile(
                                title: Text(
                                    '${dronetype.name} <id: ${dronetype.id}>'),
                              );
                            },
                            onSelected: (DroneType value) async {
                              isValueChanged =
                                  !initialValues.contains(value.id);
                              currentValues.add(value.id!);

                              List<DroneType> dronetypeList = await Future.wait(
                                  (currentValues)
                                      .where((value) => value != '')
                                      .map((value) async {
                                return await container
                                    .read(getDroneTypeProvider(value).future);
                              }));
                              String concatenatedText =
                                  '${dronetypeList.map((dronetype) {
                                return '${dronetype.name} <id: ${dronetype.id}>';
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
                        DroneTypeListView(extraFilters: query),
                  ),
                );
              } catch (error) {
                print('Failed to fetch dronetypes: $error');
              }
            },
            child: const Text('View DroneTypes'),
          ),
        ),
      ],
    );
  }
}

// **************************************************************************
// HomeWidgetElementGenerator
// **************************************************************************

class DroneTypeHomeWidget extends StatelessWidget {
  const DroneTypeHomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DroneTypeListView()),
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
              'assets/dronetype.png',
              width: 40.0,
              height: 40.0,
              color: Colors.white,
            ),
            const SizedBox(height: 8.0),
            const Text(
              "DroneType",
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

DroneType _$DroneTypeFromJson(Map<String, dynamic> json) => DroneType(
      description: json['description'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DroneTypeToJson(DroneType instance) => <String, dynamic>{
      'description': instance.description,
      'id': instance.id,
      'name': instance.name,
    };

// **************************************************************************
// ListWidgetGenerator
// **************************************************************************

class DroneTypeListView extends ConsumerStatefulWidget {
  final Map<String, dynamic>? extraFilters;
  final Map<String, dynamic> currentFilters = {};
  late bool _initialized = false;
  late List<bool> selectedStates;

  DroneTypeListView({Key? key, this.extraFilters}) : super(key: key);

  @override
  _DroneTypeListViewState createState() => _DroneTypeListViewState();
}

class _DroneTypeListViewState extends ConsumerState<DroneTypeListView> {
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
          .read(dronetypePaginationProvider.notifier)
          .setFilters(widget.extraFilters!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final paginationState = ref.watch(dronetypePaginationProvider);

    final dronetypesAsyncValue =
        ref.watch(getAllDroneTypeProvider(paginationState));

    final Map<String, int> columnSortStates =
        ref.watch(dronetypePaginationProvider.notifier).getOrders();

    final Map<String, dynamic> fieldsFilterStates =
        ref.watch(dronetypePaginationProvider.notifier).getFilters();

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
          .read(dronetypePaginationProvider.notifier)
          .setOrders(columnSortStates);
    }

    void onFilter(String fieldName, dynamic filterValue) {
      widget.currentFilters[fieldName] = filterValue;
      ref
          .read(dronetypePaginationProvider.notifier)
          .setFilters(widget.currentFilters);
    }

    void onFilterRemove(String fieldName, dynamic filterValue) {
      if (widget.currentFilters.containsKey(fieldName)) {
        widget.currentFilters.remove(fieldName);
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('DroneType List'),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DroneTypeWidget(
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
                child: const Text('Create DroneType'),
              ),
            ),
          ],
        ),
        body: dronetypesAsyncValue.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
          data: (DroneTypePaginationData data) {
            final dronetypes = data.items;

            if (!widget._initialized) {
              widget.selectedStates =
                  List.generate(dronetypes.length, (index) => false);
              widget._initialized = true;
            }

            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomSearchBar(
                    fields: const {
                      'description': 'String?',
                      'id': 'String?',
                      'name': 'String?'
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
                            .read(dronetypePaginationProvider.notifier)
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

                                List<DroneType> selectedDroneTypes =
                                    selectedIndices
                                        .map((index) => dronetypes[index])
                                        .toList();
                                _onDeleteElement(
                                    selectedDroneTypes, ref, paginationState);
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
                                    ],
                                    rows: List<DataRow>.generate(
                                        dronetypes.length, (index) {
                                      var dronetype = dronetypes[index];

                                      return DataRow(
                                        selected: widget.selectedStates[index],
                                        cells: [
                                          DataCell(
                                            Center(
                                                child: Text(
                                                    dronetype.name.toString())),
                                            onTap: () =>
                                                {_navigateElement(dronetype)},
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text(dronetype
                                                    .description
                                                    .toString())),
                                            onTap: () =>
                                                {_navigateElement(dronetype)},
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
      DroneTypePaginationState paginationState, int maxPages) {
    if (pageNumber <= maxPages) {
      ref.read(dronetypePaginationProvider.notifier).setPage(pageNumber);
    }
  }

  void _navigateElement(DroneType dronetype) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              DroneTypeWidget(element: dronetype, isEditing: true)),
    );
  }

  void _onDeleteElement(List<DroneType> dronetypes, WidgetRef ref,
      DroneTypePaginationState paginationState) {
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
                _deleteRecords(dronetypes, ref, paginationState);
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

  Future<void> _deleteRecords(List<DroneType> dronetypes, WidgetRef ref,
      DroneTypePaginationState paginationState) async {
    for (var dronetype in dronetypes) {
      await ref.read(deleteDroneTypeProvider(dronetype.id!).future);
    }
    setState(() {
      widget._initialized = false;
    });
    ref.read(dronetypePaginationProvider.notifier).setPage(1);
  }
}

class DroneTypePaginationState {
  final Tuple2<int, int> pagination;
  final Map<String, int> orders;
  final Map<String, dynamic> filters;

  DroneTypePaginationState({
    required this.pagination,
    required this.orders,
    required this.filters,
  });
}

class DroneTypePaginationNotifier
    extends StateNotifier<DroneTypePaginationState> {
  DroneTypePaginationNotifier()
      : super(DroneTypePaginationState(
          pagination: const Tuple2<int, int>(0, 10),
          orders: {},
          filters: {},
        ));

  void setPage(int page) {
    state = DroneTypePaginationState(
      pagination: Tuple2(page * state.pagination.item2 - state.pagination.item2,
          state.pagination.item2),
      orders: state.orders,
      filters: state.filters,
    );
  }

  void setOrders(Map<String, int> newOrders) {
    state = DroneTypePaginationState(
      pagination: Tuple2(state.pagination.item1, state.pagination.item2),
      orders: newOrders,
      filters: state.filters,
    );
  }

  void setFilters(Map<String, dynamic> newFilters) {
    state = DroneTypePaginationState(
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

final dronetypePaginationProvider = StateNotifierProvider<
    DroneTypePaginationNotifier, DroneTypePaginationState>(
  (ref) => DroneTypePaginationNotifier(),
);

// **************************************************************************
// RiverpodCustomGenerator
// **************************************************************************

final getDroneTypeProvider = FutureProvider.autoDispose
    .family<DroneType, String>((ref, dronetypeId) async {
  final json = await http.get(Uri.parse('$baseURL/dronetype/$dronetypeId'));
  final jsonData = jsonDecode(json.body);
  return DroneType.fromJson(jsonData);
});

final createDroneTypeProvider = FutureProvider.autoDispose
    .family<void, Tuple2<DroneType, BuildContext>>((ref, tuple) async {
  DroneType dronetypeInstance = tuple.item1;
  BuildContext context = tuple.item2;

  final response = await http.post(
    Uri.parse('$baseURL/dronetype'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(dronetypeInstance.toJson()),
  );
  if (response.statusCode != 200) {
    CustomSnackBar.show(context, jsonDecode(response.body)['detail']);
  }
});

final updateDroneTypeProvider = FutureProvider.autoDispose
    .family<void, Tuple2<DroneType, BuildContext>>((ref, tuple) async {
  DroneType dronetypeInstance = tuple.item1;
  BuildContext context = tuple.item2;

  final response = await http.put(
    Uri.parse('$baseURL/dronetype/${dronetypeInstance.id}'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(dronetypeInstance.toJson()),
  );
  if (response.statusCode != 200) {
    CustomSnackBar.show(context, jsonDecode(response.body)['detail']);
  }
});

final deleteDroneTypeProvider =
    FutureProvider.autoDispose.family<void, String>((ref, dronetypeId) async {
  final response = await http.delete(
    Uri.parse('$baseURL/dronetype/$dronetypeId'),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to delete DroneType');
  }
});

class DroneTypePaginationData {
  final List<DroneType> items;
  final int currentPage;
  final int maxPages;

  DroneTypePaginationData({
    required this.items,
    required this.currentPage,
    required this.maxPages,
  });
}

final getAllDroneTypeProvider = FutureProvider.autoDispose
    .family<DroneTypePaginationData, DroneTypePaginationState>(
        (ref, state) async {
  final fixedQuery = {
    if (state.orders.isNotEmpty) 'orders': state.orders,
    if (state.filters.isNotEmpty)
      'filters': Map.from(state.filters)
        ..removeWhere((key, value) => value == null || value == ''),
  };

  final json = await http.post(
      Uri.parse(
          '$baseURL/dronetypes?skip=${state.pagination.item1}&limit=${state.pagination.item2}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(fixedQuery));
  final jsonData = jsonDecode(json.body);

  return DroneTypePaginationData(
    items: (jsonData['items'] as List)
        .map((data) => DroneType.fromJson(data))
        .toList(),
    currentPage: jsonData['current_page'],
    maxPages: jsonData['max_pages'],
  );
});
