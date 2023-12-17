// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waypoint.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WaypointCWProxy {
  Waypoint coordinates(Map<String, dynamic> coordinates);

  Waypoint description(String description);

  Waypoint id(String id);

  Waypoint name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Waypoint(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Waypoint(...).copyWith(id: 12, name: "My name")
  /// ````
  Waypoint call({
    Map<String, dynamic>? coordinates,
    String? description,
    String? id,
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWaypoint.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWaypoint.copyWith.fieldName(...)`
class _$WaypointCWProxyImpl implements _$WaypointCWProxy {
  final Waypoint _value;

  const _$WaypointCWProxyImpl(this._value);

  @override
  Waypoint coordinates(Map<String, dynamic> coordinates) =>
      this(coordinates: coordinates);

  @override
  Waypoint description(String description) => this(description: description);

  @override
  Waypoint id(String id) => this(id: id);

  @override
  Waypoint name(String name) => this(name: name);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Waypoint(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Waypoint(...).copyWith(id: 12, name: "My name")
  /// ````
  Waypoint call({
    Object? coordinates = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return Waypoint(
      coordinates:
          coordinates == const $CopyWithPlaceholder() || coordinates == null
              ? _value.coordinates
              // ignore: cast_nullable_to_non_nullable
              : coordinates as Map<String, dynamic>,
      description:
          description == const $CopyWithPlaceholder() || description == null
              ? _value.description
              // ignore: cast_nullable_to_non_nullable
              : description as String,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
    );
  }
}

extension $WaypointCopyWith on Waypoint {
  /// Returns a callable class that can be used as follows: `instanceOfWaypoint.copyWith(...)` or like so:`instanceOfWaypoint.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WaypointCWProxy get copyWith => _$WaypointCWProxyImpl(this);
}

// **************************************************************************
// ElementWidgetGenerator
// **************************************************************************

class WaypointWidget extends StatefulWidget {
  final Waypoint element;

  const WaypointWidget(this.element, {Key? key}) : super(key: key);

  @override
  _WaypointWidgetState createState() => _WaypointWidgetState();
}

class _WaypointWidgetState extends State<WaypointWidget> {
  final GlobalKey<StringWidgetState> idWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<StringWidgetState> nameWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<StringWidgetState> descriptionWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<MapWidgetState> coordinatesWidgetKey =
      GlobalKey<MapWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Waypoint'),
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
              value: widget.element.id,
            ),
            StringWidget(
              key: nameWidgetKey,
              fieldName: "Name",
              fieldDescription: "This is the name",
              editable: true,
              placeholder: "Type the name",
              value: widget.element.name,
            ),
            StringWidget(
              key: descriptionWidgetKey,
              fieldName: "Description",
              fieldDescription: "This is the description",
              editable: true,
              placeholder: "Type the description",
              value: widget.element.description,
            ),
            MapWidget(
              key: coordinatesWidgetKey,
              fieldName: "Coordinates",
              fieldDescription: "This is the coordinates",
              editable: true,
              placeholder: "Type the coordinates",
              value: widget.element.coordinates,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? updatedid = idWidgetKey.currentState?.getUpdatedValue();

          String? updatedname = nameWidgetKey.currentState?.getUpdatedValue();

          String? updateddescription =
              descriptionWidgetKey.currentState?.getUpdatedValue();

          dynamic updatedcoordinates =
              coordinatesWidgetKey.currentState?.getUpdatedValue();

          Waypoint updatedWaypoint = widget.element.copyWith(
              id: updatedid,
              name: updatedname,
              description: updateddescription,
              coordinates: updatedcoordinates);
          var container = ProviderContainer();
          try {
            await container.read(updateWaypointProvider(updatedWaypoint));
            print('Waypoint updated successfully');
          } catch (error) {
            print('Failed to update Waypoint: $error');
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

class WaypointFieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final String? value;

  const WaypointFieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
  }) : super(key: key);

  @override
  WaypointFieldWidgetState createState() => WaypointFieldWidgetState();
}

class WaypointFieldWidgetState extends State<WaypointFieldWidget> {
  TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late String? initialValue;
  late String currentValue;
  late List<Waypoint> options;

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  Future<void> initializeValues() async {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue ?? '';
    Waypoint waypoint =
        await container.read(getWaypointProvider(widget.value!).future);
    _typeAheadController.text = '${waypoint.name} <id: ${waypoint.id}>';
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
                          child: TypeAheadField<Waypoint>(
                            controller: _typeAheadController,
                            suggestionsCallback: (String pattern) async {
                              final waypointPaginationData = await container
                                  .read(getAllWaypointProvider(container
                                          .read(waypointPaginationProvider))
                                      .future);
                              final options = waypointPaginationData.items;
                              return options
                                  .where((waypoint) =>
                                      waypoint.name
                                          .toLowerCase()
                                          .contains(pattern.toLowerCase()) ||
                                      waypoint.id
                                          .toString()
                                          .contains(pattern.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, waypoint) {
                              return ListTile(
                                title: Text(
                                    '${waypoint.name} <id: ${waypoint.id}>'),
                              );
                            },
                            onSelected: (Waypoint value) {
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
                Waypoint waypoint = await container
                    .read(getWaypointProvider(widget.value!).future);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WaypointWidget(waypoint),
                  ),
                );
              } catch (error) {
                print('Failed to fetch waypoint: $error');
              }
            },
            child: const Text('View Waypoint'),
          ),
        ),
      ],
    );
  }
}

// **************************************************************************
// HomeWidgetElementGenerator
// **************************************************************************

class WaypointHomeWidget extends StatelessWidget {
  const WaypointHomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WaypointListView()),
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
              'assets/waypoint.png',
              width: 40.0,
              height: 40.0,
              color: Colors.white,
            ),
            const SizedBox(height: 8.0),
            const Text(
              "Waypoint",
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

Waypoint _$WaypointFromJson(Map<String, dynamic> json) => Waypoint(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      coordinates: json['coordinates'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$WaypointToJson(Waypoint instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'coordinates': instance.coordinates,
    };

// **************************************************************************
// ListWidgetGenerator
// **************************************************************************

class WaypointListView extends ConsumerWidget {
  const WaypointListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paginationState = ref.watch(waypointPaginationProvider);
    final waypointsAsyncValue =
        ref.watch(getAllWaypointProvider(paginationState));

    return Scaffold(
        appBar: AppBar(
          title: const Text('Waypoint List'),
        ),
        body: waypointsAsyncValue.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
          data: (WaypointPaginationData data) {
            final waypoints = data.items;
            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                                  columns: const [
                                    DataColumn(
                                      label: Expanded(
                                          child: Text(
                                        'Name',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 94, 54, 54)),
                                        textAlign: TextAlign.center,
                                      )),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                          child: Text(
                                        'Description',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 94, 54, 54)),
                                        textAlign: TextAlign.center,
                                      )),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                          child: Text(
                                        'Coordinates',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 94, 54, 54)),
                                        textAlign: TextAlign.center,
                                      )),
                                    ),
                                  ],
                                  rows: waypoints.map((waypoint) {
                                    return DataRow(
                                      cells: [
                                        DataCell(Center(
                                            child: Text(
                                                waypoint.name.toString()))),
                                        DataCell(Center(
                                            child: Text(waypoint.description
                                                .toString()))),
                                        DataCell(Center(
                                            child: Text(waypoint.coordinates
                                                .toString()))),
                                      ],
                                      onSelectChanged: (selected) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  WaypointWidget(waypoint)),
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
      Tuple2<int, int> paginationState, int maxPages) {
    if (pageNumber <= maxPages) {
      ref.read(waypointPaginationProvider.notifier).setPage(pageNumber);
    }
  }
}

class WaypointPaginationNotifier extends StateNotifier<Tuple2<int, int>> {
  WaypointPaginationNotifier() : super(const Tuple2<int, int>(0, 10));

  void setPage(int page) {
    state = Tuple2(page * state.item2 - state.item2, state.item2);
  }
}

final waypointPaginationProvider =
    StateNotifierProvider<WaypointPaginationNotifier, Tuple2<int, int>>(
  (ref) => WaypointPaginationNotifier(),
);

// **************************************************************************
// RiverpodCustomGenerator
// **************************************************************************

final getWaypointProvider = FutureProvider.autoDispose
    .family<Waypoint, String>((ref, waypointId) async {
  final json = await http.get(Uri.parse('$baseURL/waypoints/$waypointId'));
  final jsonData = jsonDecode(json.body);
  return Waypoint.fromJson(jsonData);
});

final createWaypointProvider = FutureProvider.autoDispose
    .family<void, Waypoint>((ref, waypointInstance) async {
  final response = await http.post(
    Uri.parse('$baseURL/waypoints'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(waypointInstance.toJson()),
  );
  if (response.statusCode != 201) {
    throw Exception('Failed to create Waypoint');
  }
});

final updateWaypointProvider = FutureProvider.autoDispose
    .family<void, Waypoint>((ref, waypointInstance) async {
  final response = await http.put(
    Uri.parse('$baseURL/waypoints/${waypointInstance.id}'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(waypointInstance.toJson()),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to update Waypoint');
  }
});

final deleteWaypointProvider =
    FutureProvider.autoDispose.family<void, int>((ref, waypointId) async {
  final response = await http.delete(
    Uri.parse('$baseURL/waypoints/$waypointId'),
  );
  if (response.statusCode != 204) {
    throw Exception('Failed to delete Waypoint');
  }
});

class WaypointPaginationData {
  final List<Waypoint> items;
  final int currentPage;
  final int maxPages;

  WaypointPaginationData({
    required this.items,
    required this.currentPage,
    required this.maxPages,
  });
}

final getAllWaypointProvider = FutureProvider.autoDispose
    .family<WaypointPaginationData, Tuple2<int, int>>((ref, tuple) async {
  final json = await http.post(Uri.parse(
      '$baseURL/waypoints/all?skip=${tuple.item1}&limit=${tuple.item2}'));
  final jsonData = jsonDecode(json.body);

  return WaypointPaginationData(
    items: (jsonData['items'] as List)
        .map((data) => Waypoint.fromJson(data))
        .toList(),
    currentPage: jsonData['current_page'],
    maxPages: jsonData['max_pages'],
  );
});
