// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// ElementWidgetGenerator
// **************************************************************************

class PersonWidget extends StatelessWidget {
  final Person element;
  const PersonWidget(this.element, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        intWidget("id", element.id),
        stringWidget("name", element.name),
        stringWidget("surname", element.surname),
        stringWidget("address", element.address),
        defaultWidget("date", element.date),
      ],
    );
  }
}

// **************************************************************************
// HomeWidgetElementGenerator
// **************************************************************************

class PersonHomeWidget extends StatelessWidget {
  const PersonHomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      color: Colors.blue, // You can choose any color you like
      child: const Center(
        child: Text(
          "Person",
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

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      id: json['id'] as int,
      name: json['name'] as String,
      surname: json['surname'] as String,
      address: json['address'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'address': instance.address,
      'date': instance.date.toIso8601String(),
    };

// **************************************************************************
// RiverpodCustomGenerator
// **************************************************************************

final getPersonProvider =
    FutureProvider.autoDispose.family<Person, int>((ref, personId) async {
  final json =
      await http.get(Uri.parse('http://localhost:8000/persons/$personId'));
  final jsonData = jsonDecode(json.body);
  return Person.fromJson(jsonData);
});

final createPersonProvider = FutureProvider.autoDispose
    .family<void, Person>((ref, personInstance) async {
  final response = await http.post(
    Uri.parse('http://localhost:8000/persons'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(personInstance.toJson()),
  );
  if (response.statusCode != 201) {
    throw Exception('Failed to create Person');
  }
});

final updatePersonProvider = FutureProvider.autoDispose
    .family<void, Person>((ref, personInstance) async {
  final response = await http.put(
    Uri.parse('http://localhost:8000/persons/${personInstance.id}'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(personInstance.toJson()),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to update Person');
  }
});

final deletePersonProvider =
    FutureProvider.autoDispose.family<void, int>((ref, personId) async {
  final response = await http.delete(
    Uri.parse('http://localhost:8000/persons/$personId'),
  );
  if (response.statusCode != 204) {
    throw Exception('Failed to delete Person');
  }
});
