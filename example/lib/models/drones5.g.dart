// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drones5.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$Drones5CWProxy {
  Drones5 description(String? description);

  Drones5 flightplan(MultiLineString flightplan);

  Drones5 id(String? id);

  Drones5 name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Drones5(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Drones5(...).copyWith(id: 12, name: "My name")
  /// ````
  Drones5 call({
    String? description,
    MultiLineString? flightplan,
    String? id,
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDrones5.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDrones5.copyWith.fieldName(...)`
class _$Drones5CWProxyImpl implements _$Drones5CWProxy {
  final Drones5 _value;

  const _$Drones5CWProxyImpl(this._value);

  @override
  Drones5 description(String? description) => this(description: description);

  @override
  Drones5 flightplan(MultiLineString flightplan) =>
      this(flightplan: flightplan);

  @override
  Drones5 id(String? id) => this(id: id);

  @override
  Drones5 name(String name) => this(name: name);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Drones5(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Drones5(...).copyWith(id: 12, name: "My name")
  /// ````
  Drones5 call({
    Object? description = const $CopyWithPlaceholder(),
    Object? flightplan = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return Drones5(
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      flightplan:
          flightplan == const $CopyWithPlaceholder() || flightplan == null
              ? _value.flightplan
              // ignore: cast_nullable_to_non_nullable
              : flightplan as MultiLineString,
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

extension $Drones5CopyWith on Drones5 {
  /// Returns a callable class that can be used as follows: `instanceOfDrones5.copyWith(...)` or like so:`instanceOfDrones5.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$Drones5CWProxy get copyWith => _$Drones5CWProxyImpl(this);
}

// **************************************************************************
// ElementWidgetGenerator
// **************************************************************************

class Drones5Widget extends StatefulWidget {
  final Drones5? element;
  final bool isEditing;

  const Drones5Widget({this.element, required this.isEditing, Key? key})
      : super(key: key);

  @override
  _Drones5WidgetState createState() => _Drones5WidgetState();
}

class _Drones5WidgetState extends State<Drones5Widget> {
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
        title: const Text('Drones5'),
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
                  MultiLineString(
                      type: "Feature",
                      geometry: GeometryMultiLineString(
                          coordinates: [], type: "MultiLineString"),
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

          updatedflightplan = MultiLineString(
              type: "Feature",
              geometry: GeometryMultiLineString(
                  coordinates: updatedflightplan.geometry.coordinates,
                  type: updatedflightplan.geometry.type),
              properties: updatedflightplan.properties);

          String? updatedid = idWidgetKey.currentState?.getUpdatedValue();

          String? updatedname = nameWidgetKey.currentState?.getUpdatedValue();

          Drones5 updatedDrones5 = widget.element ??
              Drones5(
                description: updateddescription ?? '',
                flightplan: updatedflightplan ?? '',
                id: updatedid ?? '',
                name: updatedname ?? '',
              );

          updatedDrones5 = updatedDrones5.copyWith(
              description: updateddescription,
              flightplan: updatedflightplan,
              id: updatedid,
              name: updatedname);
          var container = ProviderContainer();
          try {
            if (widget.isEditing) {
              await container.read(updateDrones5Provider(updatedDrones5));
              print('Drones5 updated successfully');
            } else {
              await container.read(createDrones5Provider(updatedDrones5));
              print('Drones5 created successfully');
            }
          } catch (error) {
            print('Failed to update Drones5: $error');
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

class Drones5FieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final String? value;

  const Drones5FieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
  }) : super(key: key);

  @override
  Drones5FieldWidgetState createState() => Drones5FieldWidgetState();
}

class Drones5FieldWidgetState extends State<Drones5FieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late String? initialValue;
  late String currentValue;
  late List<Drones5> options;

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  Future<void> initializeValues() async {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue ?? '';
    Drones5 drones5 =
        await container.read(getDrones5Provider(widget.value!).future);
    _typeAheadController.text = '${drones5.name} <id: ${drones5.id}>';
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
                          child: TypeAheadField<Drones5>(
                            controller: _typeAheadController,
                            suggestionsCallback: (String pattern) async {
                              final drones5PaginationData = await container
                                  .read(getAllDrones5Provider(container
                                          .read(drones5PaginationProvider))
                                      .future);
                              final options = drones5PaginationData.items;
                              return options
                                  .where((drones5) =>
                                      drones5.name
                                          .toLowerCase()
                                          .contains(pattern.toLowerCase()) ||
                                      drones5.id
                                          .toString()
                                          .contains(pattern.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, drones5) {
                              return ListTile(
                                title:
                                    Text('${drones5.name} <id: ${drones5.id}>'),
                              );
                            },
                            onSelected: (Drones5 value) {
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
                Drones5 drones5 = await container
                    .read(getDrones5Provider(widget.value!).future);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Drones5Widget(element: drones5, isEditing: true),
                  ),
                );
              } catch (error) {
                print('Failed to fetch drones5: $error');
              }
            },
            child: const Text('View Drones5'),
          ),
        ),
      ],
    );
  }
}

class Drones5MultiFieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final List<String>? values;

  const Drones5MultiFieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.values,
  }) : super(key: key);

  @override
  Drones5MultiFieldWidgetState createState() => Drones5MultiFieldWidgetState();
}

class Drones5MultiFieldWidgetState extends State<Drones5MultiFieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late List<String> initialValues = [];
  late List<String> currentValues = [];
  late List<Drones5> options = [];

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
      List<Drones5> drones5List = await Future.wait(
        (widget.values ?? []).where((value) => value != '').map((value) async {
          return await container.read(getDrones5Provider(value).future);
        }),
      );
      String concatenatedText = '${drones5List.map((drones5) {
        return '${drones5.name} <id: ${drones5.id}>';
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
                          child: TypeAheadField<Drones5>(
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
                                  .read(drones5PaginationProvider.notifier)
                                  .setFilters({
                                'id': {'\$nin': currentValues}
                              });
                              final drones5PaginationData = await container
                                  .read(getAllDrones5Provider(container
                                          .read(drones5PaginationProvider))
                                      .future);
                              final options = drones5PaginationData.items;
                              return options
                                  .where((drones5) =>
                                      drones5.name
                                          .toLowerCase()
                                          .contains(inputParts.toLowerCase()) ||
                                      drones5.id
                                          .toString()
                                          .toLowerCase()
                                          .contains(inputParts.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, drones5) {
                              return ListTile(
                                title:
                                    Text('${drones5.name} <id: ${drones5.id}>'),
                              );
                            },
                            onSelected: (Drones5 value) async {
                              isValueChanged =
                                  !initialValues.contains(value.id);
                              currentValues.add(value.id!);

                              List<Drones5> drones5List = await Future.wait(
                                  (currentValues)
                                      .where((value) => value != '')
                                      .map((value) async {
                                return await container
                                    .read(getDrones5Provider(value).future);
                              }));
                              String concatenatedText =
                                  '${drones5List.map((drones5) {
                                return '${drones5.name} <id: ${drones5.id}>';
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
                    builder: (context) => Drones5ListView(extraFilters: query),
                  ),
                );
              } catch (error) {
                print('Failed to fetch drones5s: $error');
              }
            },
            child: const Text('View Drones5s'),
          ),
        ),
      ],
    );
  }
}

// **************************************************************************
// HomeWidgetElementGenerator
// **************************************************************************

class Drones5HomeWidget extends StatelessWidget {
  const Drones5HomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Drones5ListView()),
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
              'assets/drones5.png',
              width: 40.0,
              height: 40.0,
              color: Colors.white,
            ),
            const SizedBox(height: 8.0),
            const Text(
              "Drones5",
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

Drones5 _$Drones5FromJson(Map<String, dynamic> json) => Drones5(
      description: json['description'] as String?,
      flightplan:
          MultiLineString.fromJson(json['flightplan'] as Map<String, dynamic>),
      id: json['id'] as String?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$Drones5ToJson(Drones5 instance) => <String, dynamic>{
      'description': instance.description,
      'flightplan': instance.flightplan,
      'id': instance.id,
      'name': instance.name,
    };

// **************************************************************************
// ListWidgetGenerator
// **************************************************************************

class Drones5ListView extends ConsumerStatefulWidget {
  final Map<String, dynamic>? extraFilters;
  final Map<String, dynamic> currentFilters = {};

  Drones5ListView({Key? key, this.extraFilters}) : super(key: key);

  @override
  _Drones5ListViewState createState() => _Drones5ListViewState();
}

class _Drones5ListViewState extends ConsumerState<Drones5ListView> {
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
          .read(drones5PaginationProvider.notifier)
          .setFilters(widget.extraFilters!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final paginationState = ref.watch(drones5PaginationProvider);

    final drones5sAsyncValue =
        ref.watch(getAllDrones5Provider(paginationState));

    final Map<String, int> columnSortStates =
        ref.watch(drones5PaginationProvider.notifier).getOrders();

    final Map<String, dynamic> fieldsFilterStates =
        ref.watch(drones5PaginationProvider.notifier).getFilters();

    void onSort(String columnName) {
      var state = columnSortStates[columnName];
      if (state == 0 || state == null) {
        columnSortStates[columnName] = 1;
      } else if (state == 1) {
        columnSortStates[columnName] = -1;
      } else if (state == -1) {
        columnSortStates.remove(columnName);
      }
      ref.read(drones5PaginationProvider.notifier).setOrders(columnSortStates);
    }

    void onFilter(String fieldName, dynamic filterValue) {
      widget.currentFilters[fieldName] = filterValue;
      ref
          .read(drones5PaginationProvider.notifier)
          .setFilters(widget.currentFilters);
    }

    void onFilterRemove(String fieldName, dynamic filterValue) {
      if (widget.currentFilters.containsKey(fieldName)) {
        widget.currentFilters.remove(fieldName);
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Drones5 List'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Drones5Widget(
                      isEditing: false,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: drones5sAsyncValue.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
          data: (Drones5PaginationData data) {
            final drones5s = data.items;
            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomSearchBar(
                    fields: const {
                      'description': 'String?',
                      'flightplan': 'MultiLineString',
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
                                  rows: drones5s.map((drones5) {
                                    return DataRow(
                                      cells: [
                                        DataCell(Center(
                                            child: Text(drones5.description
                                                .toString()))),
                                        DataCell(Center(
                                            child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MapScreenView(
                                                        MultiLineStringView(
                                                            drones5
                                                                .flightplan
                                                                .geometry
                                                                .coordinates,
                                                            drones5.flightplan
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
                                            "MultiLineString",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ))),
                                        DataCell(Center(
                                            child:
                                                Text(drones5.id.toString()))),
                                        DataCell(Center(
                                            child:
                                                Text(drones5.name.toString()))),
                                      ],
                                      onSelectChanged: (selected) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Drones5Widget(
                                                      element: drones5,
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
      Drones5PaginationState paginationState, int maxPages) {
    if (pageNumber <= maxPages) {
      ref.read(drones5PaginationProvider.notifier).setPage(pageNumber);
    }
  }
}

class Drones5PaginationState {
  final Tuple2<int, int> pagination;
  final Map<String, int> orders;
  final Map<String, dynamic> filters;

  Drones5PaginationState({
    required this.pagination,
    required this.orders,
    required this.filters,
  });
}

class Drones5PaginationNotifier extends StateNotifier<Drones5PaginationState> {
  Drones5PaginationNotifier()
      : super(Drones5PaginationState(
          pagination: const Tuple2<int, int>(0, 10),
          orders: {},
          filters: {},
        ));

  void setPage(int page) {
    state = Drones5PaginationState(
      pagination: Tuple2(page * state.pagination.item2 - state.pagination.item2,
          state.pagination.item2),
      orders: state.orders,
      filters: state.filters,
    );
  }

  void setOrders(Map<String, int> newOrders) {
    state = Drones5PaginationState(
      pagination: Tuple2(state.pagination.item1, state.pagination.item2),
      orders: newOrders,
      filters: state.filters,
    );
  }

  void setFilters(Map<String, dynamic> newFilters) {
    state = Drones5PaginationState(
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

final drones5PaginationProvider =
    StateNotifierProvider<Drones5PaginationNotifier, Drones5PaginationState>(
  (ref) => Drones5PaginationNotifier(),
);

// **************************************************************************
// RiverpodCustomGenerator
// **************************************************************************

final getDrones5Provider =
    FutureProvider.autoDispose.family<Drones5, String>((ref, drones5Id) async {
  final json = await http.get(Uri.parse('$baseURL/drones5/$drones5Id'));
  final jsonData = jsonDecode(json.body);
  return Drones5.fromJson(jsonData);
});

final createDrones5Provider = FutureProvider.autoDispose
    .family<void, Drones5>((ref, drones5Instance) async {
  final response = await http.post(
    Uri.parse('$baseURL/drones5'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(drones5Instance.toJson()),
  );
  if (response.statusCode != 201) {
    throw Exception('Failed to create Drones5');
  }
});

final updateDrones5Provider = FutureProvider.autoDispose
    .family<void, Drones5>((ref, drones5Instance) async {
  final response = await http.put(
    Uri.parse('$baseURL/drones5/${drones5Instance.id}'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(drones5Instance.toJson()),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to update Drones5');
  }
});

final deleteDrones5Provider =
    FutureProvider.autoDispose.family<void, int>((ref, drones5Id) async {
  final response = await http.delete(
    Uri.parse('$baseURL/drones5/$drones5Id'),
  );
  if (response.statusCode != 204) {
    throw Exception('Failed to delete Drones5');
  }
});

class Drones5PaginationData {
  final List<Drones5> items;
  final int currentPage;
  final int maxPages;

  Drones5PaginationData({
    required this.items,
    required this.currentPage,
    required this.maxPages,
  });
}

final getAllDrones5Provider = FutureProvider.autoDispose
    .family<Drones5PaginationData, Drones5PaginationState>((ref, state) async {
  final fixedQuery = {
    if (state.orders.isNotEmpty) 'orders': state.orders,
    if (state.filters.isNotEmpty)
      'filters': Map.from(state.filters)
        ..removeWhere((key, value) => value == null || value == ''),
  };

  final json = await http.post(
      Uri.parse(
          '$baseURL/drones5s?skip=${state.pagination.item1}&limit=${state.pagination.item2}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(fixedQuery));
  final jsonData = jsonDecode(json.body);

  return Drones5PaginationData(
    items: (jsonData['items'] as List)
        .map((data) => Drones5.fromJson(data))
        .toList(),
    currentPage: jsonData['current_page'],
    maxPages: jsonData['max_pages'],
  );
});
