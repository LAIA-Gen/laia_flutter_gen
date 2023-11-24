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
  final GlobalKey<DefaultWidgetState> coordinatesWidgetKey =
      GlobalKey<DefaultWidgetState>();

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
              fieldName: "id",
              fieldDescription: "This is the id",
              editable: false,
              placeholder: "Type the id",
              value: widget.element.id,
            ),
            StringWidget(
              key: nameWidgetKey,
              fieldName: "name",
              fieldDescription: "This is the name",
              editable: true,
              placeholder: "Type the name",
              value: widget.element.name,
            ),
            StringWidget(
              key: descriptionWidgetKey,
              fieldName: "description",
              fieldDescription: "This is the description",
              editable: true,
              placeholder: "Type the description",
              value: widget.element.description,
            ),
            DefaultWidget(
              key: coordinatesWidgetKey,
              fieldName: "coordinates",
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

          Waypoint updatedWaypoint = widget.element.copyWith(
              id: updatedid,
              name: updatedname,
              description: updateddescription);
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
        color: Styles.primaryColor, // You can choose any color you like
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
        data: (List<Waypoint> waypoints) {
          return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                  width: double.infinity,
                  child: DataTable(
                      columns: const [
                        DataColumn(
                          label: Expanded(
                              child: Text(
                            'name',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 54, 54)),
                            textAlign: TextAlign.center,
                          )),
                        ),
                        DataColumn(
                          label: Expanded(
                              child: Text(
                            'description',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 54, 54)),
                            textAlign: TextAlign.center,
                          )),
                        ),
                        DataColumn(
                          label: Expanded(
                              child: Text(
                            'coordinates',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 54, 54)),
                            textAlign: TextAlign.center,
                          )),
                        ),
                      ],
                      rows: waypoints.map((waypoint) {
                        return DataRow(
                          cells: [
                            DataCell(
                                Center(child: Text(waypoint.name.toString()))),
                            DataCell(Center(
                                child: Text(waypoint.description.toString()))),
                            DataCell(Center(
                                child: Text(waypoint.coordinates.toString()))),
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
                      showCheckboxColumn: false)));
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () =>
                ref.read(waypointPaginationProvider.notifier).decrementPage(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 224, 221, 221),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            child: const Icon(Icons.arrow_back),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () =>
                ref.read(waypointPaginationProvider.notifier).incrementPage(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 224, 221, 221),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            child: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}

class WaypointPaginationNotifier extends StateNotifier<Tuple2<int, int>> {
  WaypointPaginationNotifier() : super(const Tuple2<int, int>(0, 10));

  void incrementPage() => state = Tuple2(state.item1 + 10, state.item2);
  void decrementPage() {
    if (state.item1 != 0) {
      state = Tuple2(state.item1 - 10, state.item2);
    }
  }
}

final waypointPaginationProvider =
    StateNotifierProvider<WaypointPaginationNotifier, Tuple2<int, int>>(
  (ref) => WaypointPaginationNotifier(),
);

// **************************************************************************
// RiverpodCustomGenerator
// **************************************************************************

final getWaypointProvider =
    FutureProvider.autoDispose.family<Waypoint, int>((ref, waypointId) async {
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

final getAllWaypointProvider = FutureProvider.autoDispose
    .family<List<Waypoint>, Tuple2<int, int>>((ref, tuple) async {
  final json = await http.get(
      Uri.parse('$baseURL/waypoints?skip=${tuple.item1}&limit=${tuple.item2}'));
  final jsonData = jsonDecode(json.body) as List;
  return jsonData.map((data) => Waypoint.fromJson(data)).toList();
});
