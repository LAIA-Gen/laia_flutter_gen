// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PetCWProxy {
  Pet animalType(String animalType);

  Pet date(DateTime date);

  Pet id(int id);

  Pet name(String name);

  Pet ownerId(int? ownerId);

  Pet weight(double weight);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Pet(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Pet(...).copyWith(id: 12, name: "My name")
  /// ````
  Pet call({
    String? animalType,
    DateTime? date,
    int? id,
    String? name,
    int? ownerId,
    double? weight,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPet.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPet.copyWith.fieldName(...)`
class _$PetCWProxyImpl implements _$PetCWProxy {
  final Pet _value;

  const _$PetCWProxyImpl(this._value);

  @override
  Pet animalType(String animalType) => this(animalType: animalType);

  @override
  Pet date(DateTime date) => this(date: date);

  @override
  Pet id(int id) => this(id: id);

  @override
  Pet name(String name) => this(name: name);

  @override
  Pet ownerId(int? ownerId) => this(ownerId: ownerId);

  @override
  Pet weight(double weight) => this(weight: weight);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Pet(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Pet(...).copyWith(id: 12, name: "My name")
  /// ````
  Pet call({
    Object? animalType = const $CopyWithPlaceholder(),
    Object? date = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? ownerId = const $CopyWithPlaceholder(),
    Object? weight = const $CopyWithPlaceholder(),
  }) {
    return Pet(
      animalType:
          animalType == const $CopyWithPlaceholder() || animalType == null
              ? _value.animalType
              // ignore: cast_nullable_to_non_nullable
              : animalType as String,
      date: date == const $CopyWithPlaceholder() || date == null
          ? _value.date
          // ignore: cast_nullable_to_non_nullable
          : date as DateTime,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      ownerId: ownerId == const $CopyWithPlaceholder()
          ? _value.ownerId
          // ignore: cast_nullable_to_non_nullable
          : ownerId as int?,
      weight: weight == const $CopyWithPlaceholder() || weight == null
          ? _value.weight
          // ignore: cast_nullable_to_non_nullable
          : weight as double,
    );
  }
}

extension $PetCopyWith on Pet {
  /// Returns a callable class that can be used as follows: `instanceOfPet.copyWith(...)` or like so:`instanceOfPet.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PetCWProxy get copyWith => _$PetCWProxyImpl(this);
}

// **************************************************************************
// ElementWidgetGenerator
// **************************************************************************

class PetWidget extends StatefulWidget {
  final Pet element;

  const PetWidget(this.element, {Key? key}) : super(key: key);

  @override
  _PetWidgetState createState() => _PetWidgetState();
}

class _PetWidgetState extends State<PetWidget> {
  final GlobalKey<IntWidgetState> idWidgetKey = GlobalKey<IntWidgetState>();
  final GlobalKey<IntWidgetState> ownerIdWidgetKey =
      GlobalKey<IntWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet'),
      ),
      body: Column(
        children: [
          IntWidget(
            key: idWidgetKey,
            fieldName: "id",
            fieldDescription: "This is a description",
            editable: true,
            placeholder: "This is a placeholder",
            value: widget.element.id,
          ),
          stringWidget("name", widget.element.name),
          stringWidget("animalType", widget.element.animalType),
          doubleWidget("weight", widget.element.weight),
          defaultWidget("date", widget.element.date),
          IntWidget(
            key: ownerIdWidgetKey,
            fieldName: "ownerId",
            fieldDescription: "This is a description",
            editable: true,
            placeholder: "This is a placeholder",
            value: widget.element.ownerId,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          int? updatedid = idWidgetKey.currentState?.getUpdatedValue();

          int? updatedownerId =
              ownerIdWidgetKey.currentState?.getUpdatedValue();

          Pet updatedPet =
              widget.element.copyWith(id: updatedid, ownerId: updatedownerId);
          var container = ProviderContainer();
          try {
            await container.read(updatePetProvider(updatedPet));
            print('Pet updated successfully');
          } catch (error) {
            print('Failed to update Pet: $error');
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

class PetHomeWidget extends StatelessWidget {
  const PetHomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PetListView()),
        );
      },
      child: Container(
        width: 100.0,
        height: 100.0,
        color: Colors.blue, // You can choose any color you like
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/pet.png',
              width: 40.0,
              height: 40.0,
              color: Colors.white,
            ),
            const SizedBox(height: 8.0),
            const Text(
              "Pet",
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

Pet _$PetFromJson(Map<String, dynamic> json) => Pet(
      id: json['id'] as int,
      name: json['name'] as String,
      animalType: json['animalType'] as String,
      weight: (json['weight'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      ownerId: json['ownerId'] as int?,
    );

Map<String, dynamic> _$PetToJson(Pet instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'animalType': instance.animalType,
      'weight': instance.weight,
      'date': instance.date.toIso8601String(),
      'ownerId': instance.ownerId,
    };

// **************************************************************************
// ListWidgetGenerator
// **************************************************************************

class PetListView extends ConsumerWidget {
  const PetListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paginationState = ref.watch(petPaginationProvider);
    final petsAsyncValue = ref.watch(getAllPetProvider(paginationState));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet List'),
      ),
      body: petsAsyncValue.when(
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text('Error: $error'),
        data: (List<Pet> pets) {
          return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                  width: double.infinity,
                  child: DataTable(
                      columns: const [
                        DataColumn(
                          label: Expanded(
                              child: Text(
                            'id',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 54, 54)),
                            textAlign: TextAlign.center,
                          )),
                        ),
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
                            'animalType',
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
                            'date',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 54, 54)),
                            textAlign: TextAlign.center,
                          )),
                        ),
                        DataColumn(
                          label: Expanded(
                              child: Text(
                            'ownerId',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 54, 54)),
                            textAlign: TextAlign.center,
                          )),
                        ),
                      ],
                      rows: pets.map((pet) {
                        return DataRow(
                          cells: [
                            DataCell(Center(child: Text(pet.id.toString()))),
                            DataCell(Center(child: Text(pet.name.toString()))),
                            DataCell(
                                Center(child: Text(pet.animalType.toString()))),
                            DataCell(
                                Center(child: Text(pet.weight.toString()))),
                            DataCell(Center(child: Text(pet.date.toString()))),
                            DataCell(
                                Center(child: Text(pet.ownerId.toString()))),
                          ],
                          onSelectChanged: (selected) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PetWidget(pet)),
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
                ref.read(petPaginationProvider.notifier).decrementPage(),
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
                ref.read(petPaginationProvider.notifier).incrementPage(),
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

class PetPaginationNotifier extends StateNotifier<Tuple2<int, int>> {
  PetPaginationNotifier() : super(const Tuple2<int, int>(0, 10));

  void incrementPage() => state = Tuple2(state.item1 + 10, state.item2);
  void decrementPage() {
    if (state.item1 != 0) {
      state = Tuple2(state.item1 - 10, state.item2);
    }
  }
}

final petPaginationProvider =
    StateNotifierProvider<PetPaginationNotifier, Tuple2<int, int>>(
  (ref) => PetPaginationNotifier(),
);

// **************************************************************************
// RiverpodCustomGenerator
// **************************************************************************

final getPetProvider =
    FutureProvider.autoDispose.family<Pet, int>((ref, petId) async {
  final json = await http.get(Uri.parse('$baseURL/pets/$petId'));
  final jsonData = jsonDecode(json.body);
  return Pet.fromJson(jsonData);
});

final createPetProvider =
    FutureProvider.autoDispose.family<void, Pet>((ref, petInstance) async {
  final response = await http.post(
    Uri.parse('$baseURL/pets'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(petInstance.toJson()),
  );
  if (response.statusCode != 201) {
    throw Exception('Failed to create Pet');
  }
});

final updatePetProvider =
    FutureProvider.autoDispose.family<void, Pet>((ref, petInstance) async {
  final response = await http.put(
    Uri.parse('$baseURL/pets/${petInstance.id}'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(petInstance.toJson()),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to update Pet');
  }
});

final deletePetProvider =
    FutureProvider.autoDispose.family<void, int>((ref, petId) async {
  final response = await http.delete(
    Uri.parse('$baseURL/pets/$petId'),
  );
  if (response.statusCode != 204) {
    throw Exception('Failed to delete Pet');
  }
});

final getAllPetProvider = FutureProvider.autoDispose
    .family<List<Pet>, Tuple2<int, int>>((ref, tuple) async {
  final json = await http
      .get(Uri.parse('$baseURL/pets?skip=${tuple.item1}&limit=${tuple.item2}'));
  final jsonData = jsonDecode(json.body) as List;
  return jsonData.map((data) => Pet.fromJson(data)).toList();
});
