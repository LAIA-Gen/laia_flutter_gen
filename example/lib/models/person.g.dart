// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PersonCWProxy {
  Person description(String description);

  Person email(String email);

  Person id(String? id);

  Person name(String name);

  Person password(String password);

  Person roles(List<String>? roles);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Person(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Person(...).copyWith(id: 12, name: "My name")
  /// ````
  Person call({
    String? description,
    String? email,
    String? id,
    String? name,
    String? password,
    List<String>? roles,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPerson.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPerson.copyWith.fieldName(...)`
class _$PersonCWProxyImpl implements _$PersonCWProxy {
  final Person _value;

  const _$PersonCWProxyImpl(this._value);

  @override
  Person description(String description) => this(description: description);

  @override
  Person email(String email) => this(email: email);

  @override
  Person id(String? id) => this(id: id);

  @override
  Person name(String name) => this(name: name);

  @override
  Person password(String password) => this(password: password);

  @override
  Person roles(List<String>? roles) => this(roles: roles);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Person(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Person(...).copyWith(id: 12, name: "My name")
  /// ````
  Person call({
    Object? description = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? roles = const $CopyWithPlaceholder(),
  }) {
    return Person(
      description:
          description == const $CopyWithPlaceholder() || description == null
              ? _value.description
              // ignore: cast_nullable_to_non_nullable
              : description as String,
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      password: password == const $CopyWithPlaceholder() || password == null
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
      roles: roles == const $CopyWithPlaceholder()
          ? _value.roles
          // ignore: cast_nullable_to_non_nullable
          : roles as List<String>?,
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
  final Person? element;
  final bool isEditing;

  const PersonWidget({this.element, required this.isEditing, Key? key})
      : super(key: key);

  @override
  _PersonWidgetState createState() => _PersonWidgetState();
}

class _PersonWidgetState extends State<PersonWidget> {
  final GlobalKey<StringWidgetState> descriptionWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<StringWidgetState> emailWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<StringWidgetState> idWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<StringWidgetState> nameWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<StringWidgetState> passwordWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<RoleMultiFieldWidgetState> rolesWidgetKey =
      GlobalKey<RoleMultiFieldWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            StringWidget(
              key: descriptionWidgetKey,
              fieldName: "Description",
              fieldDescription: "This is the Description",
              editable: true,
              placeholder: "Write the Description",
              value: widget.element?.description,
            ),
            StringWidget(
              key: emailWidgetKey,
              fieldName: "email",
              fieldDescription: "This is the email",
              editable: true,
              placeholder: "Type the email",
              value: widget.element?.email,
            ),
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
              fieldName: "Name",
              fieldDescription: "This is the Name",
              editable: true,
              placeholder: "Write the Name",
              value: widget.element?.name,
            ),
            StringWidget(
              key: passwordWidgetKey,
              fieldName: "password",
              fieldDescription: "This is the password",
              editable: true,
              placeholder: "Type the password",
              value: widget.element?.password,
            ),
            RoleMultiFieldWidget(
              key: rolesWidgetKey,
              fieldName: "roles",
              fieldDescription: "This is the roles",
              editable: true,
              placeholder: "Type the roles",
              values: widget.element?.roles,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? updateddescription =
              descriptionWidgetKey.currentState?.getUpdatedValue();

          String? updatedemail = emailWidgetKey.currentState?.getUpdatedValue();

          String? updatedid = idWidgetKey.currentState?.getUpdatedValue();

          String? updatedname = nameWidgetKey.currentState?.getUpdatedValue();

          String? updatedpassword =
              passwordWidgetKey.currentState?.getUpdatedValue();

          List<String>? updatedroles =
              rolesWidgetKey.currentState?.getUpdatedValue();

          Person updatedPerson = widget.element ??
              Person(
                description: updateddescription ?? '',
                email: updatedemail ?? '',
                id: updatedid ?? '',
                name: updatedname ?? '',
                password: updatedpassword ?? '',
                roles: updatedroles ?? [''],
              );

          updatedPerson = updatedPerson.copyWith(
              description: updateddescription,
              email: updatedemail,
              id: updatedid,
              name: updatedname,
              password: updatedpassword,
              roles: updatedroles);
          var container = ProviderContainer();
          try {
            if (widget.isEditing) {
              await container.read(updatePersonProvider(updatedPerson));
              print('Person updated successfully');
            } else {
              await container.read(createPersonProvider(updatedPerson));
              print('Person created successfully');
            }
          } catch (error) {
            print('Failed to update Person: $error');
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

class PersonFieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final String? value;

  const PersonFieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
  }) : super(key: key);

  @override
  PersonFieldWidgetState createState() => PersonFieldWidgetState();
}

class PersonFieldWidgetState extends State<PersonFieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late String? initialValue;
  late String currentValue;
  late List<Person> options;

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  Future<void> initializeValues() async {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue ?? '';
    Person person =
        await container.read(getPersonProvider(widget.value!).future);
    _typeAheadController.text = '${person.name} <id: ${person.id}>';
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
                          child: TypeAheadField<Person>(
                            controller: _typeAheadController,
                            suggestionsCallback: (String pattern) async {
                              final personPaginationData = await container.read(
                                  getAllPersonProvider(container
                                          .read(personPaginationProvider))
                                      .future);
                              final options = personPaginationData.items;
                              return options
                                  .where((person) =>
                                      person.name
                                          .toLowerCase()
                                          .contains(pattern.toLowerCase()) ||
                                      person.id
                                          .toString()
                                          .contains(pattern.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, person) {
                              return ListTile(
                                title:
                                    Text('${person.name} <id: ${person.id}>'),
                              );
                            },
                            onSelected: (Person value) {
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
                Person person = await container
                    .read(getPersonProvider(widget.value!).future);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PersonWidget(element: person, isEditing: true),
                  ),
                );
              } catch (error) {
                print('Failed to fetch person: $error');
              }
            },
            child: const Text('View Person'),
          ),
        ),
      ],
    );
  }
}

class PersonMultiFieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final List<String>? values;

  const PersonMultiFieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.values,
  }) : super(key: key);

  @override
  PersonMultiFieldWidgetState createState() => PersonMultiFieldWidgetState();
}

class PersonMultiFieldWidgetState extends State<PersonMultiFieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late List<String> initialValues = [];
  late List<String> currentValues = [];
  late List<Person> options = [];

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
      List<Person> personList = await Future.wait(
        (widget.values ?? []).where((value) => value != '').map((value) async {
          return await container.read(getPersonProvider(value).future);
        }),
      );
      String concatenatedText = '${personList.map((person) {
        return '${person.name} <id: ${person.id}>';
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
                          child: TypeAheadField<Person>(
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
                                  .read(personPaginationProvider.notifier)
                                  .setFilters({
                                'id': {'\$nin': currentValues}
                              });
                              final personPaginationData = await container.read(
                                  getAllPersonProvider(container
                                          .read(personPaginationProvider))
                                      .future);
                              final options = personPaginationData.items;
                              return options
                                  .where((person) =>
                                      person.name
                                          .toLowerCase()
                                          .contains(inputParts.toLowerCase()) ||
                                      person.id
                                          .toString()
                                          .toLowerCase()
                                          .contains(inputParts.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, person) {
                              return ListTile(
                                title:
                                    Text('${person.name} <id: ${person.id}>'),
                              );
                            },
                            onSelected: (Person value) async {
                              isValueChanged =
                                  !initialValues.contains(value.id);
                              currentValues.add(value.id!);

                              List<Person> personList = await Future.wait(
                                  (currentValues)
                                      .where((value) => value != '')
                                      .map((value) async {
                                return await container
                                    .read(getPersonProvider(value).future);
                              }));
                              String concatenatedText =
                                  '${personList.map((person) {
                                return '${person.name} <id: ${person.id}>';
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
                    builder: (context) => PersonListView(extraFilters: query),
                  ),
                );
              } catch (error) {
                print('Failed to fetch persons: $error');
              }
            },
            child: const Text('View Persons'),
          ),
        ),
      ],
    );
  }
}

class PersonLoginWidget extends StatefulWidget {
  final Person? element;

  const PersonLoginWidget({this.element, Key? key}) : super(key: key);

  @override
  _PersonLoginWidgetState createState() => _PersonLoginWidgetState();
}

class _PersonLoginWidgetState extends State<PersonLoginWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              _buildTextField(
                controller: _emailController,
                labelText: 'Email',
              ),
              _buildTextField(
                controller: _passwordController,
                labelText: 'Password',
                isPassword: true,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    var container = ProviderContainer();
                    var loginData = Auth(
                        email: _emailController.text,
                        password: _passwordController.text);
                    try {
                      AuthResult loginResult = await container
                          .read(loginPersonProvider(loginData).future);
                      if (loginResult.success) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      } else {
                        CustomSnackBar.show(context, loginResult.errorMessage);
                      }
                    } catch (error) {
                      print(error);
                    }
                  },
                  child: const Text('Login'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => PersonRegisterWidget()),
                  );
                },
                child: const Text("I don't have an account: Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool isPassword = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Styles.secondaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          obscureText: isPassword && !_isPasswordVisible,
          decoration: InputDecoration(
            labelText: labelText,
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}

class PersonRegisterWidget extends StatefulWidget {
  final Person? element;

  const PersonRegisterWidget({this.element, Key? key}) : super(key: key);

  @override
  _PersonRegisterWidgetState createState() => _PersonRegisterWidgetState();
}

class _PersonRegisterWidgetState extends State<PersonRegisterWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              _buildTextField(
                controller: _emailController,
                labelText: 'Email',
              ),
              _buildTextField(
                controller: _passwordController,
                labelText: 'Password',
                isPassword: true,
              ),
              _buildTextField(
                controller: _confirmPasswordController,
                labelText: 'Confirm password',
                isPassword: true,
              ),
              _buildTextField(
                controller: _descriptionController,
                labelText: 'description',
              ),
              _buildTextField(
                controller: _nameController,
                labelText: 'name',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_passwordController.text !=
                        _confirmPasswordController.text) {
                      CustomSnackBar.show(context, "Passwords do not match");
                      return;
                    }
                    var container = ProviderContainer();
                    var registerData = Person(
                      email: _emailController.text,
                      password: _passwordController.text,
                      description: _descriptionController.text,
                      name: _nameController.text,
                    );
                    try {
                      AuthResult registerResult = await container
                          .read(registerPersonProvider(registerData).future);
                      if (registerResult.success) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      } else {
                        CustomSnackBar.show(
                            context, registerResult.errorMessage);
                      }
                    } catch (error) {
                      print(error);
                    }
                  },
                  child: Text('Register'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => PersonLoginWidget()),
                  );
                },
                child: Text("I already have an account: LogIn"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool isPassword = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Styles.secondaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          obscureText: isPassword && !_isPasswordVisible,
          decoration: InputDecoration(
            labelText: labelText,
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  )
                : null,
          ),
        ),
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
        decoration: BoxDecoration(
          color: Styles.dashboardBlock,
          borderRadius: BorderRadius.circular(20.0),
        ),
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
      description: json['description'] as String,
      email: json['email'] as String,
      id: json['id'] as String?,
      name: json['name'] as String,
      password: json['password'] as String,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'description': instance.description,
      'email': instance.email,
      'id': instance.id,
      'name': instance.name,
      'password': instance.password,
      'roles': instance.roles,
    };

// **************************************************************************
// ListWidgetGenerator
// **************************************************************************

class PersonListView extends ConsumerStatefulWidget {
  final Map<String, dynamic>? extraFilters;
  final Map<String, dynamic> currentFilters = {};

  PersonListView({Key? key, this.extraFilters}) : super(key: key);

  @override
  _PersonListViewState createState() => _PersonListViewState();
}

class _PersonListViewState extends ConsumerState<PersonListView> {
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
          .read(personPaginationProvider.notifier)
          .setFilters(widget.extraFilters!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final paginationState = ref.watch(personPaginationProvider);

    final personsAsyncValue = ref.watch(getAllPersonProvider(paginationState));

    final Map<String, int> columnSortStates =
        ref.watch(personPaginationProvider.notifier).getOrders();

    final Map<String, dynamic> fieldsFilterStates =
        ref.watch(personPaginationProvider.notifier).getFilters();

    void onSort(String columnName) {
      var state = columnSortStates[columnName];
      if (state == 0 || state == null) {
        columnSortStates[columnName] = 1;
      } else if (state == 1) {
        columnSortStates[columnName] = -1;
      } else if (state == -1) {
        columnSortStates.remove(columnName);
      }
      ref.read(personPaginationProvider.notifier).setOrders(columnSortStates);
    }

    void onFilter(String fieldName, dynamic filterValue) {
      widget.currentFilters[fieldName] = filterValue;
      ref
          .read(personPaginationProvider.notifier)
          .setFilters(widget.currentFilters);
    }

    void onFilterRemove(String fieldName, dynamic filterValue) {
      if (widget.currentFilters.containsKey(fieldName)) {
        widget.currentFilters.remove(fieldName);
      }
    }

    Future<List<Role>> fetchRoleList(List<String>? ids) async {
      if (ids == null || ids.isEmpty) {
        return [];
      }
      final nonEmptyIds = ids.where((id) => id.isNotEmpty).toList();
      List<Role> roleList = await Future.wait(
        nonEmptyIds.map((id) async {
          return await ref.read(getRoleProvider(id).future);
        }),
      );
      return roleList;
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Person List'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PersonWidget(
                      isEditing: false,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: personsAsyncValue.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
          data: (PersonPaginationData data) {
            final persons = data.items;
            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomSearchBar(
                    fields: const {
                      'description': 'String',
                      'email': 'String',
                      'id': 'String?',
                      'name': 'String',
                      'password': 'String',
                      'roles': 'List<String>?'
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
                                              'Description',
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
                                              'email',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 94, 54, 54)),
                                              textAlign: TextAlign.center,
                                            ),
                                            if (columnSortStates['email'] !=
                                                null) ...[
                                              Icon(
                                                columnSortStates['email'] == 1
                                                    ? Icons
                                                        .arrow_drop_up_rounded
                                                    : Icons
                                                        .arrow_drop_down_rounded,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                '${columnSortStates.keys.toList().indexOf('email') + 1}',
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      onSort: (columnIndex, ascending) =>
                                          {onSort('email')},
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
                                              'Name',
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
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'password',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 94, 54, 54)),
                                              textAlign: TextAlign.center,
                                            ),
                                            if (columnSortStates['password'] !=
                                                null) ...[
                                              Icon(
                                                columnSortStates[
                                                            'password'] ==
                                                        1
                                                    ? Icons
                                                        .arrow_drop_up_rounded
                                                    : Icons
                                                        .arrow_drop_down_rounded,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                '${columnSortStates.keys.toList().indexOf('password') + 1}',
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      onSort: (columnIndex, ascending) =>
                                          {onSort('password')},
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'roles',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 94, 54, 54)),
                                              textAlign: TextAlign.center,
                                            ),
                                            if (columnSortStates['roles'] !=
                                                null) ...[
                                              Icon(
                                                columnSortStates['roles'] == 1
                                                    ? Icons
                                                        .arrow_drop_up_rounded
                                                    : Icons
                                                        .arrow_drop_down_rounded,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                '${columnSortStates.keys.toList().indexOf('roles') + 1}',
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      onSort: (columnIndex, ascending) =>
                                          {onSort('roles')},
                                    ),
                                  ],
                                  rows: persons.map((person) {
                                    return DataRow(
                                      cells: [
                                        DataCell(Center(
                                            child: Text(person.description
                                                .toString()))),
                                        DataCell(Center(
                                            child:
                                                Text(person.email.toString()))),
                                        DataCell(Center(
                                            child: Text(person.id.toString()))),
                                        DataCell(Center(
                                            child:
                                                Text(person.name.toString()))),
                                        DataCell(Center(
                                            child: Text(
                                                person.password.toString()))),
                                        DataCell(
                                          Center(
                                            child: FutureBuilder<List<Role>>(
                                              future:
                                                  fetchRoleList(person.roles),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState ==
                                                        ConnectionState
                                                            .waiting ||
                                                    snapshot.data == null) {
                                                  return const CircularProgressIndicator();
                                                } else {
                                                  return Wrap(
                                                    spacing: 4,
                                                    children: snapshot.data!
                                                        .map((role) {
                                                      return ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      RoleWidget(
                                                                element: role,
                                                                isEditing: true,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        style: ButtonStyle(
                                                          shape: MaterialStateProperty
                                                              .all<
                                                                  RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                            ),
                                                          ),
                                                          padding:
                                                              MaterialStateProperty
                                                                  .all<
                                                                      EdgeInsetsGeometry>(
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        1,
                                                                    vertical:
                                                                        1),
                                                          ),
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all<Color>(Styles
                                                                      .buttonPrimaryColor),
                                                          elevation:
                                                              MaterialStateProperty
                                                                  .resolveWith<
                                                                          double>(
                                                                      (states) {
                                                            if (states.contains(
                                                                    MaterialState
                                                                        .hovered) ||
                                                                states.contains(
                                                                    MaterialState
                                                                        .pressed)) {
                                                              return 0;
                                                            }
                                                            return 0;
                                                          }),
                                                          foregroundColor:
                                                              MaterialStateProperty
                                                                  .all<Color>(
                                                                      Colors
                                                                          .white),
                                                          overlayColor:
                                                              MaterialStateProperty
                                                                  .resolveWith<
                                                                          Color>(
                                                                      (states) {
                                                            if (states.contains(
                                                                MaterialState
                                                                    .hovered)) {
                                                              return Styles
                                                                  .buttonPrimaryColorHover;
                                                            }
                                                            return Colors
                                                                .transparent;
                                                          }),
                                                        ),
                                                        child: Text(
                                                          role.name,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      );
                                                    }).toList(),
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                      onSelectChanged: (selected) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PersonWidget(
                                                      element: person,
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
      PersonPaginationState paginationState, int maxPages) {
    if (pageNumber <= maxPages) {
      ref.read(personPaginationProvider.notifier).setPage(pageNumber);
    }
  }
}

class PersonPaginationState {
  final Tuple2<int, int> pagination;
  final Map<String, int> orders;
  final Map<String, dynamic> filters;

  PersonPaginationState({
    required this.pagination,
    required this.orders,
    required this.filters,
  });
}

class PersonPaginationNotifier extends StateNotifier<PersonPaginationState> {
  PersonPaginationNotifier()
      : super(PersonPaginationState(
          pagination: const Tuple2<int, int>(0, 10),
          orders: {},
          filters: {},
        ));

  void setPage(int page) {
    state = PersonPaginationState(
      pagination: Tuple2(page * state.pagination.item2 - state.pagination.item2,
          state.pagination.item2),
      orders: state.orders,
      filters: state.filters,
    );
  }

  void setOrders(Map<String, int> newOrders) {
    state = PersonPaginationState(
      pagination: Tuple2(state.pagination.item1, state.pagination.item2),
      orders: newOrders,
      filters: state.filters,
    );
  }

  void setFilters(Map<String, dynamic> newFilters) {
    state = PersonPaginationState(
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

final personPaginationProvider =
    StateNotifierProvider<PersonPaginationNotifier, PersonPaginationState>(
  (ref) => PersonPaginationNotifier(),
);

// **************************************************************************
// RiverpodCustomGenerator
// **************************************************************************

final getPersonProvider =
    FutureProvider.autoDispose.family<Person, String>((ref, personId) async {
  final json = await http.get(Uri.parse('$baseURL/person/$personId'));
  final jsonData = jsonDecode(json.body);
  return Person.fromJson(jsonData);
});

final createPersonProvider = FutureProvider.autoDispose
    .family<void, Person>((ref, personInstance) async {
  final response = await http.post(
    Uri.parse('$baseURL/person'),
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
    Uri.parse('$baseURL/person/${personInstance.id}'),
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
    Uri.parse('$baseURL/person/$personId'),
  );
  if (response.statusCode != 204) {
    throw Exception('Failed to delete Person');
  }
});

class PersonPaginationData {
  final List<Person> items;
  final int currentPage;
  final int maxPages;

  PersonPaginationData({
    required this.items,
    required this.currentPage,
    required this.maxPages,
  });
}

final getAllPersonProvider = FutureProvider.autoDispose
    .family<PersonPaginationData, PersonPaginationState>((ref, state) async {
  final fixedQuery = {
    if (state.orders.isNotEmpty) 'orders': state.orders,
    if (state.filters.isNotEmpty)
      'filters': Map.from(state.filters)
        ..removeWhere((key, value) => value == null || value == ''),
  };

  final json = await http.post(
      Uri.parse(
          '$baseURL/persons?skip=${state.pagination.item1}&limit=${state.pagination.item2}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(fixedQuery));
  final jsonData = jsonDecode(json.body);

  return PersonPaginationData(
    items: (jsonData['items'] as List)
        .map((data) => Person.fromJson(data))
        .toList(),
    currentPage: jsonData['current_page'],
    maxPages: jsonData['max_pages'],
  );
});

class Auth {
  final String email;
  final String password;

  Auth({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class AuthResult {
  final bool success;
  final String? errorMessage;
  final Person? person;

  AuthResult(this.success, {this.errorMessage, this.person});
}

final loginPersonProvider =
    FutureProvider.autoDispose.family<AuthResult, Auth>((ref, auth) async {
  final response = await http.post(
    Uri.parse('$baseURL/auth/login/person/'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(auth.toJson()),
  );
  if (response.statusCode != 200) {
    return AuthResult(false, errorMessage: 'Incorrect email or password.');
  }

  final responseData = jsonDecode(response.body);
  final token = responseData['token'];

  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);

  return AuthResult(true, person: Person.fromJson(responseData['user']));
});

final registerPersonProvider =
    FutureProvider.autoDispose.family<AuthResult, Person>((ref, person) async {
  final response = await http.post(
    Uri.parse('$baseURL/auth/register/person/'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(person.toJson()),
  );
  if (response.statusCode != 200) {
    return AuthResult(false, errorMessage: jsonDecode(response.body)['detail']);
  }

  final responseData = jsonDecode(response.body);
  final token = responseData['token'];

  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);

  return AuthResult(true, person: Person.fromJson(responseData['user']));
});

final verifyTokenPersonProvider = FutureProvider.autoDispose<bool>((ref) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      return false;
    }

    final response = await http.get(
      Uri.parse('$baseURL/auth/verify/person/$token'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
});
