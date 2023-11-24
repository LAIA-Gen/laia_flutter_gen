// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PersonCWProxy {
  Person address(String address);

  Person date(DateTime date);

  Person id(int id);

  Person name(String name);

  Person surname(String surname);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Person(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Person(...).copyWith(id: 12, name: "My name")
  /// ````
  Person call({
    String? address,
    DateTime? date,
    int? id,
    String? name,
    String? surname,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPerson.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPerson.copyWith.fieldName(...)`
class _$PersonCWProxyImpl implements _$PersonCWProxy {
  final Person _value;

  const _$PersonCWProxyImpl(this._value);

  @override
  Person address(String address) => this(address: address);

  @override
  Person date(DateTime date) => this(date: date);

  @override
  Person id(int id) => this(id: id);

  @override
  Person name(String name) => this(name: name);

  @override
  Person surname(String surname) => this(surname: surname);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Person(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Person(...).copyWith(id: 12, name: "My name")
  /// ````
  Person call({
    Object? address = const $CopyWithPlaceholder(),
    Object? date = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? surname = const $CopyWithPlaceholder(),
  }) {
    return Person(
      address: address == const $CopyWithPlaceholder() || address == null
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as String,
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
      surname: surname == const $CopyWithPlaceholder() || surname == null
          ? _value.surname
          // ignore: cast_nullable_to_non_nullable
          : surname as String,
    );
  }
}

extension $PersonCopyWith on Person {
  /// Returns a callable class that can be used as follows: `instanceOfPerson.copyWith(...)` or like so:`instanceOfPerson.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PersonCWProxy get copyWith => _$PersonCWProxyImpl(this);
}

// **************************************************************************
// ElementWidgetGenerator
// **************************************************************************

class PersonWidget extends StatefulWidget {
  final Person element;

  const PersonWidget(this.element, {Key? key}) : super(key: key);

  @override
  _PersonWidgetState createState() => _PersonWidgetState();
}

class _PersonWidgetState extends State<PersonWidget> {
  final GlobalKey<IntWidgetState> idWidgetKey = GlobalKey<IntWidgetState>();
  final GlobalKey<StringWidgetState> nameWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<StringWidgetState> surnameWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<StringWidgetState> addressWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<DateTimeWidgetState> dateWidgetKey =
      GlobalKey<DateTimeWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person'),
      ),
      body: Column(
        children: [
          IntWidget(
            key: idWidgetKey,
            fieldName: "id",
            fieldDescription: "This is another description lel",
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
            key: surnameWidgetKey,
            fieldName: "surname",
            fieldDescription: "This is the surname",
            editable: true,
            placeholder: "Type the surname",
            value: widget.element.surname,
          ),
          StringWidget(
            key: addressWidgetKey,
            fieldName: "address",
            fieldDescription: "This is the address",
            editable: true,
            placeholder: "this is a diferent placeholder yey",
            value: widget.element.address,
          ),
          DateTimeWidget(
            key: dateWidgetKey,
            fieldName: "date",
            fieldDescription: "hey yo",
            editable: true,
            placeholder: "Type the date",
            value: widget.element.date,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          int? updatedid = idWidgetKey.currentState?.getUpdatedValue();

          String? updatedname = nameWidgetKey.currentState?.getUpdatedValue();

          String? updatedsurname =
              surnameWidgetKey.currentState?.getUpdatedValue();

          String? updatedaddress =
              addressWidgetKey.currentState?.getUpdatedValue();

          DateTime? updateddate = dateWidgetKey.currentState?.getUpdatedValue();

          Person updatedPerson = widget.element.copyWith(
              id: updatedid,
              name: updatedname,
              surname: updatedsurname,
              address: updatedaddress,
              date: updateddate);
          var container = ProviderContainer();
          try {
            await container.read(updatePersonProvider(updatedPerson));
            print('Person updated successfully');
          } catch (error) {
            print('Failed to update Person: $error');
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

class PersonListView extends ConsumerWidget {
  const PersonListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paginationState = ref.watch(personPaginationProvider);
    final personsAsyncValue = ref.watch(getAllPersonProvider(paginationState));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Person List'),
      ),
      body: personsAsyncValue.when(
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text('Error: $error'),
        data: (List<Person> persons) {
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
                            'surname',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 54, 54)),
                            textAlign: TextAlign.center,
                          )),
                        ),
                      ],
                      rows: persons.map((person) {
                        return DataRow(
                          cells: [
                            DataCell(
                                Center(child: Text(person.name.toString()))),
                            DataCell(
                                Center(child: Text(person.surname.toString()))),
                          ],
                          onSelectChanged: (selected) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PersonWidget(person)),
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
                ref.read(personPaginationProvider.notifier).decrementPage(),
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
                ref.read(personPaginationProvider.notifier).incrementPage(),
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

class PersonPaginationNotifier extends StateNotifier<Tuple2<int, int>> {
  PersonPaginationNotifier() : super(const Tuple2<int, int>(0, 10));

  void incrementPage() => state = Tuple2(state.item1 + 10, state.item2);
  void decrementPage() {
    if (state.item1 != 0) {
      state = Tuple2(state.item1 - 10, state.item2);
    }
  }
}

final personPaginationProvider =
    StateNotifierProvider<PersonPaginationNotifier, Tuple2<int, int>>(
  (ref) => PersonPaginationNotifier(),
);

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
    .family<List<Person>, Tuple2<int, int>>((ref, tuple) async {
  final json = await http.get(
      Uri.parse('$baseURL/persons?skip=${tuple.item1}&limit=${tuple.item2}'));
  final jsonData = jsonDecode(json.body) as List;
  return jsonData.map((data) => Person.fromJson(data)).toList();
});
