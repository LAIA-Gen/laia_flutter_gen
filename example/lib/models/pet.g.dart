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
    return Column(
      children: [
        intWidget("id", element.id),
        stringWidget("name", element.name),
        stringWidget("animalType", element.animalType),
        doubleWidget("weight", element.weight),
        defaultWidget("date", element.date),
        intWidget("ownerId", element.ownerId),
      ],
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
    return Container(
      width: 100.0,
      height: 100.0,
      color: Colors.blue, // You can choose any color you like
      child: const Center(
        child: Text(
          "Pet",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
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
// RiverpodCustomGenerator
// **************************************************************************

final getPetProvider =
    FutureProvider.autoDispose.family<Pet, int>((ref, petId) async {
  final json = await http.get(Uri.parse('http://localhost:8000/pets/$petId'));
  final jsonData = jsonDecode(json.body);
  return Pet.fromJson(jsonData);
});

final createPetProvider =
    FutureProvider.autoDispose.family<void, Pet>((ref, petInstance) async {
  final response = await http.post(
    Uri.parse('http://localhost:8000/pets'),
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
    Uri.parse('http://localhost:8000/pets/${petInstance.id}'),
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
    Uri.parse('http://localhost:8000/pets/$petId'),
  );
  if (response.statusCode != 204) {
    throw Exception('Failed to delete Pet');
  }
});
