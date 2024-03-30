// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drones6.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$Drones6CWProxy {
  Drones6 description(String? description);

  Drones6 flightplan(MultiPolygon flightplan);

  Drones6 id(String? id);

  Drones6 name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Drones6(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Drones6(...).copyWith(id: 12, name: "My name")
  /// ````
  Drones6 call({
    String? description,
    MultiPolygon? flightplan,
    String? id,
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDrones6.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDrones6.copyWith.fieldName(...)`
class _$Drones6CWProxyImpl implements _$Drones6CWProxy {
  final Drones6 _value;

  const _$Drones6CWProxyImpl(this._value);

  @override
  Drones6 description(String? description) => this(description: description);

  @override
  Drones6 flightplan(MultiPolygon flightplan) => this(flightplan: flightplan);

  @override
  Drones6 id(String? id) => this(id: id);

  @override
  Drones6 name(String name) => this(name: name);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Drones6(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Drones6(...).copyWith(id: 12, name: "My name")
  /// ````
  Drones6 call({
    Object? description = const $CopyWithPlaceholder(),
    Object? flightplan = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return Drones6(
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      flightplan:
          flightplan == const $CopyWithPlaceholder() || flightplan == null
              ? _value.flightplan
              // ignore: cast_nullable_to_non_nullable
              : flightplan as MultiPolygon,
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

extension $Drones6CopyWith on Drones6 {
  /// Returns a callable class that can be used as follows: `instanceOfDrones6.copyWith(...)` or like so:`instanceOfDrones6.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$Drones6CWProxy get copyWith => _$Drones6CWProxyImpl(this);
}

// **************************************************************************
// ElementWidgetGenerator
// **************************************************************************

class Drones6Widget extends StatefulWidget {
  final Drones6? element;
  final bool isEditing;

  const Drones6Widget({this.element, required this.isEditing, Key? key})
      : super(key: key);

  @override
  _Drones6WidgetState createState() => _Drones6WidgetState();
}

class _Drones6WidgetState extends State<Drones6Widget> {
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
        title: const Text('Drones6'),
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
                    MultiPolygon(
                        type: "Feature",
                        geometry: GeometryMultiPolygon(
                            coordinates: [], type: "MultiPolygon"),
                        properties: {}),
                uspaceMap: true),
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

          updatedflightplan = MultiPolygon(
              type: "Feature",
              geometry: GeometryMultiPolygon(
                  coordinates: updatedflightplan.geometry.coordinates,
                  type: updatedflightplan.geometry.type),
              properties: updatedflightplan.properties);

          String? updatedid = idWidgetKey.currentState?.getUpdatedValue();

          String? updatedname = nameWidgetKey.currentState?.getUpdatedValue();

          Drones6 updatedDrones6 = widget.element ??
              Drones6(
                description: updateddescription ?? '',
                flightplan: updatedflightplan ?? '',
                id: updatedid ?? '',
                name: updatedname ?? '',
              );

          updatedDrones6 = updatedDrones6.copyWith(
              description: updateddescription,
              flightplan: updatedflightplan,
              id: updatedid,
              name: updatedname);
          var container = ProviderContainer();
          try {
            if (widget.isEditing) {
              await container.read(updateDrones6Provider(updatedDrones6));
              print('Drones6 updated successfully');
            } else {
              await container.read(createDrones6Provider(updatedDrones6));
              print('Drones6 created successfully');
            }
          } catch (error) {
            print('Failed to update Drones6: $error');
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

class Drones6FieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final String? value;

  const Drones6FieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
  }) : super(key: key);

  @override
  Drones6FieldWidgetState createState() => Drones6FieldWidgetState();
}

class Drones6FieldWidgetState extends State<Drones6FieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late String? initialValue;
  late String currentValue;
  late List<Drones6> options;

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  Future<void> initializeValues() async {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue ?? '';
    Drones6 drones6 =
        await container.read(getDrones6Provider(widget.value!).future);
    _typeAheadController.text = '${drones6.name} <id: ${drones6.id}>';
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
                          child: TypeAheadField<Drones6>(
                            controller: _typeAheadController,
                            suggestionsCallback: (String pattern) async {
                              final drones6PaginationData = await container
                                  .read(getAllDrones6Provider(container
                                          .read(drones6PaginationProvider))
                                      .future);
                              final options = drones6PaginationData.items;
                              return options
                                  .where((drones6) =>
                                      drones6.name
                                          .toLowerCase()
                                          .contains(pattern.toLowerCase()) ||
                                      drones6.id
                                          .toString()
                                          .contains(pattern.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, drones6) {
                              return ListTile(
                                title:
                                    Text('${drones6.name} <id: ${drones6.id}>'),
                              );
                            },
                            onSelected: (Drones6 value) {
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
                Drones6 drones6 = await container
                    .read(getDrones6Provider(widget.value!).future);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Drones6Widget(element: drones6, isEditing: true),
                  ),
                );
              } catch (error) {
                print('Failed to fetch drones6: $error');
              }
            },
            child: const Text('View Drones6'),
          ),
        ),
      ],
    );
  }
}

class Drones6MultiFieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final List<String>? values;

  const Drones6MultiFieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.values,
  }) : super(key: key);

  @override
  Drones6MultiFieldWidgetState createState() => Drones6MultiFieldWidgetState();
}

class Drones6MultiFieldWidgetState extends State<Drones6MultiFieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late List<String> initialValues = [];
  late List<String> currentValues = [];
  late List<Drones6> options = [];

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
      List<Drones6> drones6List = await Future.wait(
        (widget.values ?? []).where((value) => value != '').map((value) async {
          return await container.read(getDrones6Provider(value).future);
        }),
      );
      String concatenatedText = '${drones6List.map((drones6) {
        return '${drones6.name} <id: ${drones6.id}>';
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
                          child: TypeAheadField<Drones6>(
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
                                  .read(drones6PaginationProvider.notifier)
                                  .setFilters({
                                'id': {'\$nin': currentValues}
                              });
                              final drones6PaginationData = await container
                                  .read(getAllDrones6Provider(container
                                          .read(drones6PaginationProvider))
                                      .future);
                              final options = drones6PaginationData.items;
                              return options
                                  .where((drones6) =>
                                      drones6.name
                                          .toLowerCase()
                                          .contains(inputParts.toLowerCase()) ||
                                      drones6.id
                                          .toString()
                                          .toLowerCase()
                                          .contains(inputParts.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, drones6) {
                              return ListTile(
                                title:
                                    Text('${drones6.name} <id: ${drones6.id}>'),
                              );
                            },
                            onSelected: (Drones6 value) async {
                              isValueChanged =
                                  !initialValues.contains(value.id);
                              currentValues.add(value.id!);

                              List<Drones6> drones6List = await Future.wait(
                                  (currentValues)
                                      .where((value) => value != '')
                                      .map((value) async {
                                return await container
                                    .read(getDrones6Provider(value).future);
                              }));
                              String concatenatedText =
                                  '${drones6List.map((drones6) {
                                return '${drones6.name} <id: ${drones6.id}>';
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
                    builder: (context) => Drones6ListView(extraFilters: query),
                  ),
                );
              } catch (error) {
                print('Failed to fetch drones6s: $error');
              }
            },
            child: const Text('View Drones6s'),
          ),
        ),
      ],
    );
  }
}

// **************************************************************************
// HomeWidgetElementGenerator
// **************************************************************************

class Drones6HomeWidget extends StatelessWidget {
  const Drones6HomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Drones6ListView()),
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
              'assets/drones6.png',
              width: 40.0,
              height: 40.0,
              color: Colors.white,
            ),
            const SizedBox(height: 8.0),
            const Text(
              "Drones6",
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

Drones6 _$Drones6FromJson(Map<String, dynamic> json) => Drones6(
      description: json['description'] as String?,
      flightplan:
          MultiPolygon.fromJson(json['flightplan'] as Map<String, dynamic>),
      id: json['id'] as String?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$Drones6ToJson(Drones6 instance) => <String, dynamic>{
      'description': instance.description,
      'flightplan': instance.flightplan,
      'id': instance.id,
      'name': instance.name,
    };

// **************************************************************************
// ListWidgetGenerator
// **************************************************************************

class Drones6ListView extends ConsumerStatefulWidget {
  final Map<String, dynamic>? extraFilters;
  final Map<String, dynamic> currentFilters = {};

  Drones6ListView({Key? key, this.extraFilters}) : super(key: key);

  @override
  _Drones6ListViewState createState() => _Drones6ListViewState();
}

class _Drones6ListViewState extends ConsumerState<Drones6ListView> {
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
          .read(drones6PaginationProvider.notifier)
          .setFilters(widget.extraFilters!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final paginationState = ref.watch(drones6PaginationProvider);

    final drones6sAsyncValue =
        ref.watch(getAllDrones6Provider(paginationState));

    final Map<String, int> columnSortStates =
        ref.watch(drones6PaginationProvider.notifier).getOrders();

    final Map<String, dynamic> fieldsFilterStates =
        ref.watch(drones6PaginationProvider.notifier).getFilters();

    void onSort(String columnName) {
      var state = columnSortStates[columnName];
      if (state == 0 || state == null) {
        columnSortStates[columnName] = 1;
      } else if (state == 1) {
        columnSortStates[columnName] = -1;
      } else if (state == -1) {
        columnSortStates.remove(columnName);
      }
      ref.read(drones6PaginationProvider.notifier).setOrders(columnSortStates);
    }

    void onFilter(String fieldName, dynamic filterValue) {
      widget.currentFilters[fieldName] = filterValue;
      ref
          .read(drones6PaginationProvider.notifier)
          .setFilters(widget.currentFilters);
    }

    void onFilterRemove(String fieldName, dynamic filterValue) {
      if (widget.currentFilters.containsKey(fieldName)) {
        widget.currentFilters.remove(fieldName);
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Drones6 List'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Drones6Widget(
                      isEditing: false,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: drones6sAsyncValue.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
          data: (Drones6PaginationData data) {
            final drones6s = data.items;
            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomSearchBar(
                    fields: const {
                      'description': 'String?',
                      'flightplan': 'MultiPolygon',
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
                                  rows: drones6s.map((drones6) {
                                    return DataRow(
                                      cells: [
                                        DataCell(Center(
                                            child: Text(drones6.description
                                                .toString()))),
                                        DataCell(Center(
                                            child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MapScreenView(
                                                        MultiPolygonView(
                                                            drones6
                                                                .flightplan
                                                                .geometry
                                                                .coordinates,
                                                            drones6.flightplan
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
                                            "MultiPolygon",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ))),
                                        DataCell(Center(
                                            child:
                                                Text(drones6.id.toString()))),
                                        DataCell(Center(
                                            child:
                                                Text(drones6.name.toString()))),
                                      ],
                                      onSelectChanged: (selected) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Drones6Widget(
                                                      element: drones6,
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
      Drones6PaginationState paginationState, int maxPages) {
    if (pageNumber <= maxPages) {
      ref.read(drones6PaginationProvider.notifier).setPage(pageNumber);
    }
  }
}

class Drones6PaginationState {
  final Tuple2<int, int> pagination;
  final Map<String, int> orders;
  final Map<String, dynamic> filters;

  Drones6PaginationState({
    required this.pagination,
    required this.orders,
    required this.filters,
  });
}

class Drones6PaginationNotifier extends StateNotifier<Drones6PaginationState> {
  Drones6PaginationNotifier()
      : super(Drones6PaginationState(
          pagination: const Tuple2<int, int>(0, 10),
          orders: {},
          filters: {},
        ));

  void setPage(int page) {
    state = Drones6PaginationState(
      pagination: Tuple2(page * state.pagination.item2 - state.pagination.item2,
          state.pagination.item2),
      orders: state.orders,
      filters: state.filters,
    );
  }

  void setOrders(Map<String, int> newOrders) {
    state = Drones6PaginationState(
      pagination: Tuple2(state.pagination.item1, state.pagination.item2),
      orders: newOrders,
      filters: state.filters,
    );
  }

  void setFilters(Map<String, dynamic> newFilters) {
    state = Drones6PaginationState(
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

final drones6PaginationProvider =
    StateNotifierProvider<Drones6PaginationNotifier, Drones6PaginationState>(
  (ref) => Drones6PaginationNotifier(),
);

// **************************************************************************
// RiverpodCustomGenerator
// **************************************************************************

final getDrones6Provider =
    FutureProvider.autoDispose.family<Drones6, String>((ref, drones6Id) async {
  final json = await http.get(Uri.parse('$baseURL/drones6/$drones6Id'));
  final jsonData = jsonDecode(json.body);
  return Drones6.fromJson(jsonData);
});

final createDrones6Provider = FutureProvider.autoDispose
    .family<void, Drones6>((ref, drones6Instance) async {
  final response = await http.post(
    Uri.parse('$baseURL/drones6'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(drones6Instance.toJson()),
  );
  if (response.statusCode != 201) {
    throw Exception('Failed to create Drones6');
  }
});

final updateDrones6Provider = FutureProvider.autoDispose
    .family<void, Drones6>((ref, drones6Instance) async {
  final response = await http.put(
    Uri.parse('$baseURL/drones6/${drones6Instance.id}'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(drones6Instance.toJson()),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to update Drones6');
  }
});

final deleteDrones6Provider =
    FutureProvider.autoDispose.family<void, int>((ref, drones6Id) async {
  final response = await http.delete(
    Uri.parse('$baseURL/drones6/$drones6Id'),
  );
  if (response.statusCode != 204) {
    throw Exception('Failed to delete Drones6');
  }
});

class Drones6PaginationData {
  final List<Drones6> items;
  final int currentPage;
  final int maxPages;

  Drones6PaginationData({
    required this.items,
    required this.currentPage,
    required this.maxPages,
  });
}

final getAllDrones6Provider = FutureProvider.autoDispose
    .family<Drones6PaginationData, Drones6PaginationState>((ref, state) async {
  final fixedQuery = {
    if (state.orders.isNotEmpty) 'orders': state.orders,
    if (state.filters.isNotEmpty)
      'filters': Map.from(state.filters)
        ..removeWhere((key, value) => value == null || value == ''),
  };

  final json = await http.post(
      Uri.parse(
          '$baseURL/drones6s?skip=${state.pagination.item1}&limit=${state.pagination.item2}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(fixedQuery));
  final jsonData = jsonDecode(json.body);

  return Drones6PaginationData(
    items: (jsonData['items'] as List)
        .map((data) => Drones6.fromJson(data))
        .toList(),
    currentPage: jsonData['current_page'],
    maxPages: jsonData['max_pages'],
  );
});
