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
  final Drone element;

  const DroneWidget(this.element, {Key? key}) : super(key: key);

  @override
  _DroneWidgetState createState() => _DroneWidgetState();
}

class _DroneWidgetState extends State<DroneWidget> {
  final GlobalKey<StringWidgetState> idWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<StringWidgetState> user_idWidgetKey =
      GlobalKey<StringWidgetState>();
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
              fieldName: "id",
              fieldDescription: "This is the id",
              editable: false,
              placeholder: "Type the id",
              value: widget.element.id,
            ),
            StringWidget(
              key: user_idWidgetKey,
              fieldName: "user_id",
              fieldDescription: "This is the user_id",
              editable: true,
              placeholder: "Type the user_id",
              value: widget.element.user_id,
            ),
            StringWidget(
              key: modelWidgetKey,
              fieldName: "model",
              fieldDescription: "This is the model",
              editable: true,
              placeholder: "Type the model",
              value: widget.element.model,
            ),
            DoubleWidget(
              key: weightWidgetKey,
              fieldName: "weight",
              fieldDescription: "This is the weight",
              editable: true,
              placeholder: "Type the weight",
              value: widget.element.weight,
            ),
            DoubleWidget(
              key: max_altitudeWidgetKey,
              fieldName: "max_altitude",
              fieldDescription: "This is the max_altitude",
              editable: true,
              placeholder: "Type the max_altitude",
              value: widget.element.max_altitude,
            ),
            DoubleWidget(
              key: max_speedWidgetKey,
              fieldName: "max_speed",
              fieldDescription: "This is the max_speed",
              editable: true,
              placeholder: "Type the max_speed",
              value: widget.element.max_speed,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? updatedid = idWidgetKey.currentState?.getUpdatedValue();

          String? updateduser_id =
              user_idWidgetKey.currentState?.getUpdatedValue();

          String? updatedmodel = modelWidgetKey.currentState?.getUpdatedValue();

          Drone updatedDrone = widget.element.copyWith(
              id: updatedid, user_id: updateduser_id, model: updatedmodel);
          var container = ProviderContainer();
          try {
            await container.read(updateDroneProvider(updatedDrone));
            print('Drone updated successfully');
          } catch (error) {
            print('Failed to update Drone: $error');
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
        color: Styles.primaryColor, // You can choose any color you like
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
      user_id: json['user_id'] as String,
      model: json['model'] as String,
      weight: (json['weight'] as num).toDouble(),
      max_altitude: (json['max_altitude'] as num).toDouble(),
      max_speed: (json['max_speed'] as num).toDouble(),
    );

Map<String, dynamic> _$DroneToJson(Drone instance) => <String, dynamic>{
      'id': instance.id,
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Drone List'),
      ),
      body: dronesAsyncValue.when(
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text('Error: $error'),
        data: (List<Drone> drones) {
          return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                  width: double.infinity,
                  child: DataTable(
                      columns: const [
                        DataColumn(
                          label: Expanded(
                              child: Text(
                            'user_id',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 54, 54)),
                            textAlign: TextAlign.center,
                          )),
                        ),
                        DataColumn(
                          label: Expanded(
                              child: Text(
                            'model',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 54, 54)),
                            textAlign: TextAlign.center,
                          )),
                        ),
                        DataColumn(
                          label: Expanded(
                              child: Text(
                            'weight',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 54, 54)),
                            textAlign: TextAlign.center,
                          )),
                        ),
                        DataColumn(
                          label: Expanded(
                              child: Text(
                            'max_altitude',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 54, 54)),
                            textAlign: TextAlign.center,
                          )),
                        ),
                        DataColumn(
                          label: Expanded(
                              child: Text(
                            'max_speed',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 54, 54)),
                            textAlign: TextAlign.center,
                          )),
                        ),
                      ],
                      rows: drones.map((drone) {
                        return DataRow(
                          cells: [
                            DataCell(
                                Center(child: Text(drone.user_id.toString()))),
                            DataCell(
                                Center(child: Text(drone.model.toString()))),
                            DataCell(
                                Center(child: Text(drone.weight.toString()))),
                            DataCell(Center(
                                child: Text(drone.max_altitude.toString()))),
                            DataCell(Center(
                                child: Text(drone.max_speed.toString()))),
                          ],
                          onSelectChanged: (selected) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DroneWidget(drone)),
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
                ref.read(dronePaginationProvider.notifier).decrementPage(),
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
                ref.read(dronePaginationProvider.notifier).incrementPage(),
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

class DronePaginationNotifier extends StateNotifier<Tuple2<int, int>> {
  DronePaginationNotifier() : super(const Tuple2<int, int>(0, 10));

  void incrementPage() => state = Tuple2(state.item1 + 10, state.item2);
  void decrementPage() {
    if (state.item1 != 0) {
      state = Tuple2(state.item1 - 10, state.item2);
    }
  }
}

final dronePaginationProvider =
    StateNotifierProvider<DronePaginationNotifier, Tuple2<int, int>>(
  (ref) => DronePaginationNotifier(),
);

// **************************************************************************
// RiverpodCustomGenerator
// **************************************************************************

final getDroneProvider =
    FutureProvider.autoDispose.family<Drone, int>((ref, droneId) async {
  final json = await http.get(Uri.parse('$baseURL/drones/$droneId'));
  final jsonData = jsonDecode(json.body);
  return Drone.fromJson(jsonData);
});

final createDroneProvider =
    FutureProvider.autoDispose.family<void, Drone>((ref, droneInstance) async {
  final response = await http.post(
    Uri.parse('$baseURL/drones'),
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
    Uri.parse('$baseURL/drones/${droneInstance.id}'),
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
    Uri.parse('$baseURL/drones/$droneId'),
  );
  if (response.statusCode != 204) {
    throw Exception('Failed to delete Drone');
  }
});

final getAllDroneProvider = FutureProvider.autoDispose
    .family<List<Drone>, Tuple2<int, int>>((ref, tuple) async {
  final json = await http.get(
      Uri.parse('$baseURL/drones?skip=${tuple.item1}&limit=${tuple.item2}'));
  final jsonData = jsonDecode(json.body) as List;
  return jsonData.map((data) => Drone.fromJson(data)).toList();
});
