// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drones.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$Drones2CWProxy {
  Drones2 description(String? description);

  Drones2 flightplan(LineString flightplan);

  Drones2 id(String? id);

  Drones2 name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Drones2(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Drones2(...).copyWith(id: 12, name: "My name")
  /// ````
  Drones2 call({
    String? description,
    LineString? flightplan,
    String? id,
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDrones2.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDrones2.copyWith.fieldName(...)`
class _$Drones2CWProxyImpl implements _$Drones2CWProxy {
  final Drones2 _value;

  const _$Drones2CWProxyImpl(this._value);

  @override
  Drones2 description(String? description) => this(description: description);

  @override
  Drones2 flightplan(LineString flightplan) => this(flightplan: flightplan);

  @override
  Drones2 id(String? id) => this(id: id);

  @override
  Drones2 name(String name) => this(name: name);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Drones2(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Drones2(...).copyWith(id: 12, name: "My name")
  /// ````
  Drones2 call({
    Object? description = const $CopyWithPlaceholder(),
    Object? flightplan = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return Drones2(
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      flightplan:
          flightplan == const $CopyWithPlaceholder() || flightplan == null
              ? _value.flightplan
              // ignore: cast_nullable_to_non_nullable
              : flightplan as LineString,
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

extension $Drones2CopyWith on Drones2 {
  /// Returns a callable class that can be used as follows: `instanceOfDrones2.copyWith(...)` or like so:`instanceOfDrones2.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$Drones2CWProxy get copyWith => _$Drones2CWProxyImpl(this);
}

// **************************************************************************
// ElementWidgetGenerator
// **************************************************************************

class Drones2Widget extends StatefulWidget {
  final Drones2? element;
  final bool isEditing;

  const Drones2Widget({this.element, required this.isEditing, Key? key})
      : super(key: key);

  @override
  _Drones2WidgetState createState() => _Drones2WidgetState();
}

class _Drones2WidgetState extends State<Drones2Widget> {
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
        title: const Text('Drones2'),
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
                  LineString(
                      type: "Feature",
                      geometry: GeometryLineString(
                          coordinates: [], type: "LineString"),
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

          updatedflightplan = LineString(
              type: "Feature",
              geometry: GeometryLineString(
                  coordinates: updatedflightplan.geometry.coordinates,
                  type: updatedflightplan.geometry.type),
              properties: updatedflightplan.properties);

          String? updatedid = idWidgetKey.currentState?.getUpdatedValue();

          String? updatedname = nameWidgetKey.currentState?.getUpdatedValue();

          Drones2 updatedDrones2 = widget.element ??
              Drones2(
                description: updateddescription ?? '',
                flightplan: updatedflightplan ?? '',
                id: updatedid ?? '',
                name: updatedname ?? '',
              );

          updatedDrones2 = updatedDrones2.copyWith(
              description: updateddescription,
              flightplan: updatedflightplan,
              id: updatedid,
              name: updatedname);
          var container = ProviderContainer();
          try {
            if (widget.isEditing) {
              await container.read(updateDrones2Provider(updatedDrones2));
              print('Drones2 updated successfully');
            } else {
              await container.read(createDrones2Provider(updatedDrones2));
              print('Drones2 created successfully');
            }
          } catch (error) {
            print('Failed to update Drones2: $error');
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

class Drones2FieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final String? value;

  const Drones2FieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
  }) : super(key: key);

  @override
  Drones2FieldWidgetState createState() => Drones2FieldWidgetState();
}

class Drones2FieldWidgetState extends State<Drones2FieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late String? initialValue;
  late String currentValue;
  late List<Drones2> options;

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  Future<void> initializeValues() async {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue ?? '';
    Drones2 drones2 =
        await container.read(getDrones2Provider(widget.value!).future);
    _typeAheadController.text = '${drones2.name} <id: ${drones2.id}>';
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
                          child: TypeAheadField<Drones2>(
                            controller: _typeAheadController,
                            suggestionsCallback: (String pattern) async {
                              final drones2PaginationData = await container
                                  .read(getAllDrones2Provider(container
                                          .read(drones2PaginationProvider))
                                      .future);
                              final options = drones2PaginationData.items;
                              return options
                                  .where((drones2) =>
                                      drones2.name
                                          .toLowerCase()
                                          .contains(pattern.toLowerCase()) ||
                                      drones2.id
                                          .toString()
                                          .contains(pattern.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, drones2) {
                              return ListTile(
                                title:
                                    Text('${drones2.name} <id: ${drones2.id}>'),
                              );
                            },
                            onSelected: (Drones2 value) {
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
                Drones2 drones2 = await container
                    .read(getDrones2Provider(widget.value!).future);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Drones2Widget(element: drones2, isEditing: true),
                  ),
                );
              } catch (error) {
                print('Failed to fetch drones2: $error');
              }
            },
            child: const Text('View Drones2'),
          ),
        ),
      ],
    );
  }
}

class Drones2MultiFieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final List<String>? values;

  const Drones2MultiFieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.values,
  }) : super(key: key);

  @override
  Drones2MultiFieldWidgetState createState() => Drones2MultiFieldWidgetState();
}

class Drones2MultiFieldWidgetState extends State<Drones2MultiFieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late List<String> initialValues = [];
  late List<String> currentValues = [];
  late List<Drones2> options = [];

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
      List<Drones2> drones2List = await Future.wait(
        (widget.values ?? []).where((value) => value != '').map((value) async {
          return await container.read(getDrones2Provider(value).future);
        }),
      );
      String concatenatedText = '${drones2List.map((drones2) {
        return '${drones2.name} <id: ${drones2.id}>';
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
                          child: TypeAheadField<Drones2>(
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
                                  .read(drones2PaginationProvider.notifier)
                                  .setFilters({
                                'id': {'\$nin': currentValues}
                              });
                              final drones2PaginationData = await container
                                  .read(getAllDrones2Provider(container
                                          .read(drones2PaginationProvider))
                                      .future);
                              final options = drones2PaginationData.items;
                              return options
                                  .where((drones2) =>
                                      drones2.name
                                          .toLowerCase()
                                          .contains(inputParts.toLowerCase()) ||
                                      drones2.id
                                          .toString()
                                          .toLowerCase()
                                          .contains(inputParts.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, drones2) {
                              return ListTile(
                                title:
                                    Text('${drones2.name} <id: ${drones2.id}>'),
                              );
                            },
                            onSelected: (Drones2 value) async {
                              isValueChanged =
                                  !initialValues.contains(value.id);
                              currentValues.add(value.id!);

                              List<Drones2> drones2List = await Future.wait(
                                  (currentValues)
                                      .where((value) => value != '')
                                      .map((value) async {
                                return await container
                                    .read(getDrones2Provider(value).future);
                              }));
                              String concatenatedText =
                                  '${drones2List.map((drones2) {
                                return '${drones2.name} <id: ${drones2.id}>';
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
                    builder: (context) => Drones2ListView(extraFilters: query),
                  ),
                );
              } catch (error) {
                print('Failed to fetch drones2s: $error');
              }
            },
            child: const Text('View Drones2s'),
          ),
        ),
      ],
    );
  }
}

// **************************************************************************
// HomeWidgetElementGenerator
// **************************************************************************

class Drones2HomeWidget extends StatelessWidget {
  const Drones2HomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Drones2ListView()),
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
              'assets/drones2.png',
              width: 40.0,
              height: 40.0,
              color: Colors.white,
            ),
            const SizedBox(height: 8.0),
            const Text(
              "Drones2",
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

Drones2 _$Drones2FromJson(Map<String, dynamic> json) => Drones2(
      description: json['description'] as String?,
      flightplan:
          LineString.fromJson(json['flightplan'] as Map<String, dynamic>),
      id: json['id'] as String?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$Drones2ToJson(Drones2 instance) => <String, dynamic>{
      'description': instance.description,
      'flightplan': instance.flightplan,
      'id': instance.id,
      'name': instance.name,
    };

// **************************************************************************
// ListWidgetGenerator
// **************************************************************************

class Drones2ListView extends ConsumerStatefulWidget {
  final Map<String, dynamic>? extraFilters;
  final Map<String, dynamic> currentFilters = {};

  Drones2ListView({Key? key, this.extraFilters}) : super(key: key);

  @override
  _Drones2ListViewState createState() => _Drones2ListViewState();
}

class _Drones2ListViewState extends ConsumerState<Drones2ListView> {
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
          .read(drones2PaginationProvider.notifier)
          .setFilters(widget.extraFilters!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final paginationState = ref.watch(drones2PaginationProvider);

    final drones2sAsyncValue =
        ref.watch(getAllDrones2Provider(paginationState));

    final Map<String, int> columnSortStates =
        ref.watch(drones2PaginationProvider.notifier).getOrders();

    final Map<String, dynamic> fieldsFilterStates =
        ref.watch(drones2PaginationProvider.notifier).getFilters();

    void onSort(String columnName) {
      var state = columnSortStates[columnName];
      if (state == 0 || state == null) {
        columnSortStates[columnName] = 1;
      } else if (state == 1) {
        columnSortStates[columnName] = -1;
      } else if (state == -1) {
        columnSortStates.remove(columnName);
      }
      ref.read(drones2PaginationProvider.notifier).setOrders(columnSortStates);
    }

    void onFilter(String fieldName, dynamic filterValue) {
      widget.currentFilters[fieldName] = filterValue;
      ref
          .read(drones2PaginationProvider.notifier)
          .setFilters(widget.currentFilters);
    }

    void onFilterRemove(String fieldName, dynamic filterValue) {
      if (widget.currentFilters.containsKey(fieldName)) {
        widget.currentFilters.remove(fieldName);
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Drones2 List'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Drones2Widget(
                      isEditing: false,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: drones2sAsyncValue.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
          data: (Drones2PaginationData data) {
            final drones2s = data.items;
            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomSearchBar(
                    fields: const {
                      'description': 'String?',
                      'flightplan': 'LineString',
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
                                  rows: drones2s.map((drones2) {
                                    return DataRow(
                                      cells: [
                                        DataCell(Center(
                                            child: Text(drones2.description
                                                .toString()))),
                                        DataCell(Center(
                                            child: Text(drones2.flightplan
                                                .toString()))),
                                        DataCell(Center(
                                            child:
                                                Text(drones2.id.toString()))),
                                        DataCell(Center(
                                            child:
                                                Text(drones2.name.toString()))),
                                      ],
                                      onSelectChanged: (selected) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Drones2Widget(
                                                      element: drones2,
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
      Drones2PaginationState paginationState, int maxPages) {
    if (pageNumber <= maxPages) {
      ref.read(drones2PaginationProvider.notifier).setPage(pageNumber);
    }
  }
}

class Drones2PaginationState {
  final Tuple2<int, int> pagination;
  final Map<String, int> orders;
  final Map<String, dynamic> filters;

  Drones2PaginationState({
    required this.pagination,
    required this.orders,
    required this.filters,
  });
}

class Drones2PaginationNotifier extends StateNotifier<Drones2PaginationState> {
  Drones2PaginationNotifier()
      : super(Drones2PaginationState(
          pagination: const Tuple2<int, int>(0, 10),
          orders: {},
          filters: {},
        ));

  void setPage(int page) {
    state = Drones2PaginationState(
      pagination: Tuple2(page * state.pagination.item2 - state.pagination.item2,
          state.pagination.item2),
      orders: state.orders,
      filters: state.filters,
    );
  }

  void setOrders(Map<String, int> newOrders) {
    state = Drones2PaginationState(
      pagination: Tuple2(state.pagination.item1, state.pagination.item2),
      orders: newOrders,
      filters: state.filters,
    );
  }

  void setFilters(Map<String, dynamic> newFilters) {
    state = Drones2PaginationState(
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

final drones2PaginationProvider =
    StateNotifierProvider<Drones2PaginationNotifier, Drones2PaginationState>(
  (ref) => Drones2PaginationNotifier(),
);

// **************************************************************************
// RiverpodCustomGenerator
// **************************************************************************

final getDrones2Provider =
    FutureProvider.autoDispose.family<Drones2, String>((ref, drones2Id) async {
  final json = await http.get(Uri.parse('$baseURL/drones2/$drones2Id'));
  final jsonData = jsonDecode(json.body);
  return Drones2.fromJson(jsonData);
});

final createDrones2Provider = FutureProvider.autoDispose
    .family<void, Drones2>((ref, drones2Instance) async {
  final response = await http.post(
    Uri.parse('$baseURL/drones2'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(drones2Instance.toJson()),
  );
  if (response.statusCode != 201) {
    throw Exception('Failed to create Drones2');
  }
});

final updateDrones2Provider = FutureProvider.autoDispose
    .family<void, Drones2>((ref, drones2Instance) async {
  final response = await http.put(
    Uri.parse('$baseURL/drones2/${drones2Instance.id}'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(drones2Instance.toJson()),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to update Drones2');
  }
});

final deleteDrones2Provider =
    FutureProvider.autoDispose.family<void, int>((ref, drones2Id) async {
  final response = await http.delete(
    Uri.parse('$baseURL/drones2/$drones2Id'),
  );
  if (response.statusCode != 204) {
    throw Exception('Failed to delete Drones2');
  }
});

class Drones2PaginationData {
  final List<Drones2> items;
  final int currentPage;
  final int maxPages;

  Drones2PaginationData({
    required this.items,
    required this.currentPage,
    required this.maxPages,
  });
}

final getAllDrones2Provider = FutureProvider.autoDispose
    .family<Drones2PaginationData, Drones2PaginationState>((ref, state) async {
  final fixedQuery = {
    if (state.orders.isNotEmpty) 'orders': state.orders,
    if (state.filters.isNotEmpty)
      'filters': Map.from(state.filters)
        ..removeWhere((key, value) => value == null || value == ''),
  };

  final json = await http.post(
      Uri.parse(
          '$baseURL/drones2s?skip=${state.pagination.item1}&limit=${state.pagination.item2}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(fixedQuery));
  final jsonData = jsonDecode(json.body);

  return Drones2PaginationData(
    items: (jsonData['items'] as List)
        .map((data) => Drones2.fromJson(data))
        .toList(),
    currentPage: jsonData['current_page'],
    maxPages: jsonData['max_pages'],
  );
});
