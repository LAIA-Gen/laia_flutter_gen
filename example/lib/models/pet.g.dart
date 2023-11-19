// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// ElementWidgetGenerator
// **************************************************************************

class PetWidget extends StatelessWidget {
  final Pet element;
  const PetWidget(this.element, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet'),
      ),
      body: Column(
        children: [
          intWidget("id", "This is a description", true, "This is a placeholder", element.id),
          stringWidget("name", element.name),
          stringWidget("animalType", element.animalType),
          doubleWidget("weight", element.weight),
          defaultWidget("date", element.date),
          intWidget("id", "This is a description", true, "This is a placeholder", element.ownerId),
        ],
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
