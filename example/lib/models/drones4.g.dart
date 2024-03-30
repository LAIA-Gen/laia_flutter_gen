// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drones4.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$Drones4CWProxy {
  Drones4 description(String? description);

  Drones4 flightplan(MultiPoint flightplan);

  Drones4 id(String? id);

  Drones4 name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Drones4(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Drones4(...).copyWith(id: 12, name: "My name")
  /// ````
  Drones4 call({
    String? description,
    MultiPoint? flightplan,
    String? id,
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDrones4.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDrones4.copyWith.fieldName(...)`
class _$Drones4CWProxyImpl implements _$Drones4CWProxy {
  final Drones4 _value;

  const _$Drones4CWProxyImpl(this._value);

  @override
  Drones4 description(String? description) => this(description: description);

  @override
  Drones4 flightplan(MultiPoint flightplan) => this(flightplan: flightplan);

  @override
  Drones4 id(String? id) => this(id: id);

  @override
  Drones4 name(String name) => this(name: name);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Drones4(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Drones4(...).copyWith(id: 12, name: "My name")
  /// ````
  Drones4 call({
    Object? description = const $CopyWithPlaceholder(),
    Object? flightplan = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return Drones4(
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      flightplan:
          flightplan == const $CopyWithPlaceholder() || flightplan == null
              ? _value.flightplan
              // ignore: cast_nullable_to_non_nullable
              : flightplan as MultiPoint,
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

extension $Drones4CopyWith on Drones4 {
  /// Returns a callable class that can be used as follows: `instanceOfDrones4.copyWith(...)` or like so:`instanceOfDrones4.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$Drones4CWProxy get copyWith => _$Drones4CWProxyImpl(this);
}

// **************************************************************************
// ElementWidgetGenerator
// **************************************************************************

class Drones4Widget extends StatefulWidget {
  final Drones4? element;
  final bool isEditing;

  const Drones4Widget({this.element, required this.isEditing, Key? key})
      : super(key: key);

  @override
  _Drones4WidgetState createState() => _Drones4WidgetState();
}

class _Drones4WidgetState extends State<Drones4Widget> {
  final GlobalKey<StringWidgetState> descriptionWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<MapWidgetState> flightplanWidgetKey =
      GlobalKey<MapWidgetState>();
  final GlobalKey<StringWidgetState> idWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<StringWidgetState> nameWidgetKey =
      GlobalKey<StringWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drones4'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            StringWidget(
              key: descriptionWidgetKey,
              fieldName: "description",
              fieldDescription: "This is the description",
              editable: true,
              placeholder: "Type the description",
              value: widget.element?.description,
            ),
            MapWidget(
              key: flightplanWidgetKey,
              fieldName: "flightplan",
              fieldDescription: "This is the flightplan",
              editable: true,
              placeholder: "Type the flightplan",
              value: widget.element?.flightplan ??
                  MultiPoint(
                      type: "Feature",
                      geometry: GeometryMultiPoint(
                          coordinates: [], type: "MultiPoint"),
                      properties: {}),
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
              fieldName: "name",
              fieldDescription: "This is the name",
              editable: true,
              placeholder: "Type the name",
              value: widget.element?.name,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? updateddescription =
              descriptionWidgetKey.currentState?.getUpdatedValue();

          dynamic updatedflightplan =
              flightplanWidgetKey.currentState?.getUpdatedValue();

          updatedflightplan = MultiPoint(
              type: "Feature",
              geometry: GeometryMultiPoint(
                  coordinates: updatedflightplan.geometry.coordinates,
                  type: updatedflightplan.geometry.type),
              properties: updatedflightplan.properties);

          String? updatedid = idWidgetKey.currentState?.getUpdatedValue();

          String? updatedname = nameWidgetKey.currentState?.getUpdatedValue();

          Drones4 updatedDrones4 = widget.element ??
              Drones4(
                description: updateddescription ?? '',
                flightplan: updatedflightplan ?? '',
                id: updatedid ?? '',
                name: updatedname ?? '',
              );

          updatedDrones4 = updatedDrones4.copyWith(
              description: updateddescription,
              flightplan: updatedflightplan,
              id: updatedid,
              name: updatedname);
          var container = ProviderContainer();
          try {
            if (widget.isEditing) {
              await container.read(updateDrones4Provider(updatedDrones4));
              print('Drones4 updated successfully');
            } else {
              await container.read(createDrones4Provider(updatedDrones4));
              print('Drones4 created successfully');
            }
          } catch (error) {
            print('Failed to update Drones4: $error');
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

class Drones4FieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final String? value;

  const Drones4FieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
  }) : super(key: key);

  @override
  Drones4FieldWidgetState createState() => Drones4FieldWidgetState();
}

class Drones4FieldWidgetState extends State<Drones4FieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late String? initialValue;
  late String currentValue;
  late List<Drones4> options;

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  Future<void> initializeValues() async {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue ?? '';
    Drones4 drones4 =
        await container.read(getDrones4Provider(widget.value!).future);
    _typeAheadController.text = '${drones4.name} <id: ${drones4.id}>';
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
                          child: TypeAheadField<Drones4>(
                            controller: _typeAheadController,
                            suggestionsCallback: (String pattern) async {
                              final drones4PaginationData = await container
                                  .read(getAllDrones4Provider(container
                                          .read(drones4PaginationProvider))
                                      .future);
                              final options = drones4PaginationData.items;
                              return options
                                  .where((drones4) =>
                                      drones4.name
                                          .toLowerCase()
                                          .contains(pattern.toLowerCase()) ||
                                      drones4.id
                                          .toString()
                                          .contains(pattern.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, drones4) {
                              return ListTile(
                                title:
                                    Text('${drones4.name} <id: ${drones4.id}>'),
                              );
                            },
                            onSelected: (Drones4 value) {
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
                Drones4 drones4 = await container
                    .read(getDrones4Provider(widget.value!).future);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Drones4Widget(element: drones4, isEditing: true),
                  ),
                );
              } catch (error) {
                print('Failed to fetch drones4: $error');
              }
            },
            child: const Text('View Drones4'),
          ),
        ),
      ],
    );
  }
}

class Drones4MultiFieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final List<String>? values;

  const Drones4MultiFieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.values,
  }) : super(key: key);

  @override
  Drones4MultiFieldWidgetState createState() => Drones4MultiFieldWidgetState();
}

class Drones4MultiFieldWidgetState extends State<Drones4MultiFieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late List<String> initialValues = [];
  late List<String> currentValues = [];
  late List<Drones4> options = [];

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
      List<Drones4> drones4List = await Future.wait(
        (widget.values ?? []).where((value) => value != '').map((value) async {
          return await container.read(getDrones4Provider(value).future);
        }),
      );
      String concatenatedText = '${drones4List.map((drones4) {
        return '${drones4.name} <id: ${drones4.id}>';
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
                          child: TypeAheadField<Drones4>(
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
                                  .read(drones4PaginationProvider.notifier)
                                  .setFilters({
                                'id': {'\$nin': currentValues}
                              });
                              final drones4PaginationData = await container
                                  .read(getAllDrones4Provider(container
                                          .read(drones4PaginationProvider))
                                      .future);
                              final options = drones4PaginationData.items;
                              return options
                                  .where((drones4) =>
                                      drones4.name
                                          .toLowerCase()
                                          .contains(inputParts.toLowerCase()) ||
                                      drones4.id
                                          .toString()
                                          .toLowerCase()
                                          .contains(inputParts.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, drones4) {
                              return ListTile(
                                title:
                                    Text('${drones4.name} <id: ${drones4.id}>'),
                              );
                            },
                            onSelected: (Drones4 value) async {
                              isValueChanged =
                                  !initialValues.contains(value.id);
                              currentValues.add(value.id!);

                              List<Drones4> drones4List = await Future.wait(
                                  (currentValues)
                                      .where((value) => value != '')
                                      .map((value) async {
                                return await container
                                    .read(getDrones4Provider(value).future);
                              }));
                              String concatenatedText =
                                  '${drones4List.map((drones4) {
                                return '${drones4.name} <id: ${drones4.id}>';
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
                    builder: (context) => Drones4ListView(extraFilters: query),
                  ),
                );
              } catch (error) {
                print('Failed to fetch drones4s: $error');
              }
            },
            child: const Text('View Drones4s'),
          ),
        ),
      ],
    );
  }
}

// **************************************************************************
// HomeWidgetElementGenerator
// **************************************************************************

class Drones4HomeWidget extends StatelessWidget {
  const Drones4HomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Drones4ListView()),
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
              'assets/drones4.png',
              width: 40.0,
              height: 40.0,
              color: Colors.white,
            ),
            const SizedBox(height: 8.0),
            const Text(
              "Drones4",
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

Drones4 _$Drones4FromJson(Map<String, dynamic> json) => Drones4(
      description: json['description'] as String?,
      flightplan:
          MultiPoint.fromJson(json['flightplan'] as Map<String, dynamic>),
      id: json['id'] as String?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$Drones4ToJson(Drones4 instance) => <String, dynamic>{
      'description': instance.description,
      'flightplan': instance.flightplan,
      'id': instance.id,
      'name': instance.name,
    };

// **************************************************************************
// ListWidgetGenerator
// **************************************************************************

class Drones4ListView extends ConsumerStatefulWidget {
  final Map<String, dynamic>? extraFilters;
  final Map<String, dynamic> currentFilters = {};

  Drones4ListView({Key? key, this.extraFilters}) : super(key: key);

  @override
  _Drones4ListViewState createState() => _Drones4ListViewState();
}

class _Drones4ListViewState extends ConsumerState<Drones4ListView> {
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
          .read(drones4PaginationProvider.notifier)
          .setFilters(widget.extraFilters!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final paginationState = ref.watch(drones4PaginationProvider);

    final drones4sAsyncValue =
        ref.watch(getAllDrones4Provider(paginationState));

    final Map<String, int> columnSortStates =
        ref.watch(drones4PaginationProvider.notifier).getOrders();

    final Map<String, dynamic> fieldsFilterStates =
        ref.watch(drones4PaginationProvider.notifier).getFilters();

    void onSort(String columnName) {
      var state = columnSortStates[columnName];
      if (state == 0 || state == null) {
        columnSortStates[columnName] = 1;
      } else if (state == 1) {
        columnSortStates[columnName] = -1;
      } else if (state == -1) {
        columnSortStates.remove(columnName);
      }
      ref.read(drones4PaginationProvider.notifier).setOrders(columnSortStates);
    }

    void onFilter(String fieldName, dynamic filterValue) {
      widget.currentFilters[fieldName] = filterValue;
      ref
          .read(drones4PaginationProvider.notifier)
          .setFilters(widget.currentFilters);
    }

    void onFilterRemove(String fieldName, dynamic filterValue) {
      if (widget.currentFilters.containsKey(fieldName)) {
        widget.currentFilters.remove(fieldName);
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Drones4 List'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Drones4Widget(
                      isEditing: false,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: drones4sAsyncValue.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
          data: (Drones4PaginationData data) {
            final drones4s = data.items;
            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomSearchBar(
                    fields: const {
                      'description': 'String?',
                      'flightplan': 'MultiPoint',
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
                                              'description',
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
                                              'flightplan',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 94, 54, 54)),
                                              textAlign: TextAlign.center,
                                            ),
                                            if (columnSortStates[
                                                    'flightplan'] !=
                                                null) ...[
                                              Icon(
                                                columnSortStates[
                                                            'flightplan'] ==
                                                        1
                                                    ? Icons
                                                        .arrow_drop_up_rounded
                                                    : Icons
                                                        .arrow_drop_down_rounded,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                '${columnSortStates.keys.toList().indexOf('flightplan') + 1}',
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      onSort: (columnIndex, ascending) =>
                                          {onSort('flightplan')},
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'id',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 94, 54, 54)),
                                              textAlign: TextAlign.center,
                                            ),
                                            if (columnSortStates['id'] !=
                                                null) ...[
                                              Icon(
                                                columnSortStates['id'] == 1
                                                    ? Icons
                                                        .arrow_drop_up_rounded
                                                    : Icons
                                                        .arrow_drop_down_rounded,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                '${columnSortStates.keys.toList().indexOf('id') + 1}',
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      onSort: (columnIndex, ascending) =>
                                          {onSort('id')},
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'name',
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
                                  ],
                                  rows: drones4s.map((drones4) {
                                    return DataRow(
                                      cells: [
                                        DataCell(Center(
                                            child: Text(drones4.description
                                                .toString()))),
                                        DataCell(Center(
                                            child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MapScreenView(
                                                        MultiPointView(
                                                            drones4
                                                                .flightplan
                                                                .geometry
                                                                .coordinates,
                                                            drones4.flightplan
                                                                .properties,
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height)),
                                              ),
                                            );
                                          },
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                            padding: MaterialStateProperty.all<
                                                EdgeInsetsGeometry>(
                                              const EdgeInsets.symmetric(
                                                  horizontal: 1, vertical: 1),
                                            ),
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                        Color>(
                                                    Styles.buttonPrimaryColor),
                                            elevation: MaterialStateProperty
                                                .resolveWith<double>((states) {
                                              if (states.contains(
                                                      MaterialState.hovered) ||
                                                  states.contains(
                                                      MaterialState.pressed)) {
                                                return 0;
                                              }
                                              return 0;
                                            }),
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.white),
                                            overlayColor: MaterialStateProperty
                                                .resolveWith<Color>((states) {
                                              if (states.contains(
                                                  MaterialState.hovered)) {
                                                return Styles
                                                    .buttonPrimaryColorHover;
                                              }
                                              return Colors.transparent;
                                            }),
                                          ),
                                          child: const Text(
                                            "MultiPoint",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ))),
                                        DataCell(Center(
                                            child:
                                                Text(drones4.id.toString()))),
                                        DataCell(Center(
                                            child:
                                                Text(drones4.name.toString()))),
                                      ],
                                      onSelectChanged: (selected) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Drones4Widget(
                                                      element: drones4,
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
      Drones4PaginationState paginationState, int maxPages) {
    if (pageNumber <= maxPages) {
      ref.read(drones4PaginationProvider.notifier).setPage(pageNumber);
    }
  }
}

class Drones4PaginationState {
  final Tuple2<int, int> pagination;
  final Map<String, int> orders;
  final Map<String, dynamic> filters;

  Drones4PaginationState({
    required this.pagination,
    required this.orders,
    required this.filters,
  });
}

class Drones4PaginationNotifier extends StateNotifier<Drones4PaginationState> {
  Drones4PaginationNotifier()
      : super(Drones4PaginationState(
          pagination: const Tuple2<int, int>(0, 10),
          orders: {},
          filters: {},
        ));

  void setPage(int page) {
    state = Drones4PaginationState(
      pagination: Tuple2(page * state.pagination.item2 - state.pagination.item2,
          state.pagination.item2),
      orders: state.orders,
      filters: state.filters,
    );
  }

  void setOrders(Map<String, int> newOrders) {
    state = Drones4PaginationState(
      pagination: Tuple2(state.pagination.item1, state.pagination.item2),
      orders: newOrders,
      filters: state.filters,
    );
  }

  void setFilters(Map<String, dynamic> newFilters) {
    state = Drones4PaginationState(
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

final drones4PaginationProvider =
    StateNotifierProvider<Drones4PaginationNotifier, Drones4PaginationState>(
  (ref) => Drones4PaginationNotifier(),
);

// **************************************************************************
// RiverpodCustomGenerator
// **************************************************************************

final getDrones4Provider =
    FutureProvider.autoDispose.family<Drones4, String>((ref, drones4Id) async {
  final json = await http.get(Uri.parse('$baseURL/drones4/$drones4Id'));
  final jsonData = jsonDecode(json.body);
  return Drones4.fromJson(jsonData);
});

final createDrones4Provider = FutureProvider.autoDispose
    .family<void, Drones4>((ref, drones4Instance) async {
  final response = await http.post(
    Uri.parse('$baseURL/drones4'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(drones4Instance.toJson()),
  );
  if (response.statusCode != 201) {
    throw Exception('Failed to create Drones4');
  }
});

final updateDrones4Provider = FutureProvider.autoDispose
    .family<void, Drones4>((ref, drones4Instance) async {
  final response = await http.put(
    Uri.parse('$baseURL/drones4/${drones4Instance.id}'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(drones4Instance.toJson()),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to update Drones4');
  }
});

final deleteDrones4Provider =
    FutureProvider.autoDispose.family<void, int>((ref, drones4Id) async {
  final response = await http.delete(
    Uri.parse('$baseURL/drones4/$drones4Id'),
  );
  if (response.statusCode != 204) {
    throw Exception('Failed to delete Drones4');
  }
});

class Drones4PaginationData {
  final List<Drones4> items;
  final int currentPage;
  final int maxPages;

  Drones4PaginationData({
    required this.items,
    required this.currentPage,
    required this.maxPages,
  });
}

final getAllDrones4Provider = FutureProvider.autoDispose
    .family<Drones4PaginationData, Drones4PaginationState>((ref, state) async {
  final fixedQuery = {
    if (state.orders.isNotEmpty) 'orders': state.orders,
    if (state.filters.isNotEmpty)
      'filters': Map.from(state.filters)
        ..removeWhere((key, value) => value == null || value == ''),
  };

  final json = await http.post(
      Uri.parse(
          '$baseURL/drones4s?skip=${state.pagination.item1}&limit=${state.pagination.item2}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(fixedQuery));
  final jsonData = jsonDecode(json.body);

  return Drones4PaginationData(
    items: (jsonData['items'] as List)
        .map((data) => Drones4.fromJson(data))
        .toList(),
    currentPage: jsonData['current_page'],
    maxPages: jsonData['max_pages'],
  );
});
