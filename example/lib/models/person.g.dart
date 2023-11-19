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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PersonListView()),
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
              'assets/person.png',
              width: 40.0,
              height: 40.0,
              color: Colors.white,
            ),
            const SizedBox(height: 8.0),
            const Text(
              "Person",
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
// ListWidgetGenerator
// **************************************************************************

class PersonListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person List'),
      ),
      body: FutureBuilder(
        future: getAllPersonProvider(0,
            limit: 10), // Example: Fetch the first 10 items
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Person> personList = snapshot.data;
            return ListView.builder(
              itemCount: personList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      'Person ${index + 1}: ${personList[index].toString()}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}

// **************************************************************************
// RiverpodCustomGenerator
// **************************************************************************

final getPersonProvider =
    FutureProvider.autoDispose.family<Person, int>((ref, personId) async {
  final json = await http.get(Uri.parse('$baseURL/persons/$personId'));
  final jsonData = jsonDecode(json.body);
  return Person.fromJson(jsonData);
});

final createPersonProvider = FutureProvider.autoDispose
    .family<void, Person>((ref, personInstance) async {
  final response = await http.post(
    Uri.parse('$baseURL/persons'),
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
    Uri.parse('$baseURL/persons/${personInstance.id}'),
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
    Uri.parse('$baseURL/persons/$personId'),
  );
  if (response.statusCode != 204) {
    throw Exception('Failed to delete Person');
  }
});

final getAllPersonProvider = FutureProvider.autoDispose
    .family<List<Person>, dynamic>((ref, params) async {
  final json = await http.get(Uri.parse(
      '$baseURL/persons?skip=${params['skip'] ?? 0}&limit=${params['limit'] ?? 10}'));
  final jsonData = jsonDecode(json.body) as List;
  return jsonData.map((data) => Person.fromJson(data)).toList();
});
