// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operator.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OperatorCWProxy {
  Operator address(Point? address);

  Operator contactInformation(String? contactInformation);

  Operator drones(List<String>? drones);

  Operator email(String email);

  Operator flightplans(List<String>? flightplans);

  Operator id(String? id);

  Operator identity(String? identity);

  Operator name(String name);

  Operator password(String password);

  Operator roles(List<String>? roles);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Operator(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Operator(...).copyWith(id: 12, name: "My name")
  /// ````
  Operator call({
    Point? address,
    String? contactInformation,
    List<String>? drones,
    String? email,
    List<String>? flightplans,
    String? id,
    String? identity,
    String? name,
    String? password,
    List<String>? roles,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOperator.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOperator.copyWith.fieldName(...)`
class _$OperatorCWProxyImpl implements _$OperatorCWProxy {
  final Operator _value;

  const _$OperatorCWProxyImpl(this._value);

  @override
  Operator address(Point? address) => this(address: address);

  @override
  Operator contactInformation(String? contactInformation) =>
      this(contactInformation: contactInformation);

  @override
  Operator drones(List<String>? drones) => this(drones: drones);

  @override
  Operator email(String email) => this(email: email);

  @override
  Operator flightplans(List<String>? flightplans) =>
      this(flightplans: flightplans);

  @override
  Operator id(String? id) => this(id: id);

  @override
  Operator identity(String? identity) => this(identity: identity);

  @override
  Operator name(String name) => this(name: name);

  @override
  Operator password(String password) => this(password: password);

  @override
  Operator roles(List<String>? roles) => this(roles: roles);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Operator(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Operator(...).copyWith(id: 12, name: "My name")
  /// ````
  Operator call({
    Object? address = const $CopyWithPlaceholder(),
    Object? contactInformation = const $CopyWithPlaceholder(),
    Object? drones = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? flightplans = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? identity = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? roles = const $CopyWithPlaceholder(),
  }) {
    return Operator(
      address: address == const $CopyWithPlaceholder()
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as Point?,
      contactInformation: contactInformation == const $CopyWithPlaceholder()
          ? _value.contactInformation
          // ignore: cast_nullable_to_non_nullable
          : contactInformation as String?,
      drones: drones == const $CopyWithPlaceholder()
          ? _value.drones
          // ignore: cast_nullable_to_non_nullable
          : drones as List<String>?,
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      flightplans: flightplans == const $CopyWithPlaceholder()
          ? _value.flightplans
          // ignore: cast_nullable_to_non_nullable
          : flightplans as List<String>?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      identity: identity == const $CopyWithPlaceholder()
          ? _value.identity
          // ignore: cast_nullable_to_non_nullable
          : identity as String?,
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

extension $OperatorCopyWith on Operator {
  /// Returns a callable class that can be used as follows: `instanceOfOperator.copyWith(...)` or like so:`instanceOfOperator.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OperatorCWProxy get copyWith => _$OperatorCWProxyImpl(this);
}

// **************************************************************************
// ElementWidgetGenerator
// **************************************************************************

class OperatorWidget extends StatefulWidget {
  final Operator? element;
  final bool isEditing;

  const OperatorWidget({this.element, required this.isEditing, Key? key})
      : super(key: key);

  @override
  _OperatorWidgetState createState() => _OperatorWidgetState();
}

class _OperatorWidgetState extends State<OperatorWidget> {
  final GlobalKey<MapWidgetState> addressWidgetKey =
      GlobalKey<MapWidgetState>();
  final GlobalKey<StringWidgetState> contactInformationWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<DroneMultiFieldWidgetState> dronesWidgetKey =
      GlobalKey<DroneMultiFieldWidgetState>();
  final GlobalKey<StringWidgetState> emailWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<FlightPlanMultiFieldWidgetState> flightplansWidgetKey =
      GlobalKey<FlightPlanMultiFieldWidgetState>();
  final GlobalKey<StringWidgetState> idWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<StringWidgetState> identityWidgetKey =
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
        title: const Text('Operator'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OperatorListView()),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            MapWidget(
                key: addressWidgetKey,
                fieldName: "Address",
                fieldDescription: "The address of the Drone Operator",
                editable: true,
                placeholder: "Enter the address of the Drone Operator",
                value: widget.element?.address ??
                    Point(
                        type: "Feature",
                        geometry: GeometryPoint(coordinates: [], type: "Point"),
                        properties: {}),
                uspaceMap: false),
            StringWidget(
              key: contactInformationWidgetKey,
              fieldName: "Contact Information",
              fieldDescription: "Contact Information of the Operator",
              editable: true,
              placeholder: "Provide Contact Information for the Operator",
              value: widget.element?.contactInformation,
            ),
            DroneMultiFieldWidget(
              key: dronesWidgetKey,
              fieldName: "Drones",
              fieldDescription: "These are the Drones of the Operator",
              editable: true,
              placeholder: "List the Drones operated by this Operator",
              values: widget.element?.drones,
            ),
            StringWidget(
              key: emailWidgetKey,
              fieldName: "email",
              fieldDescription: "This is the email",
              editable: true,
              placeholder: "Type the email",
              value: widget.element?.email,
            ),
            FlightPlanMultiFieldWidget(
              key: flightplansWidgetKey,
              fieldName: "FlightPlans",
              fieldDescription: "These are the Flightplans of the Operator",
              editable: true,
              placeholder: "List the Flightplans operated by this Operator",
              values: widget.element?.flightplans,
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
              key: identityWidgetKey,
              fieldName: "Identity",
              fieldDescription: "This is the Identity of the Operator",
              editable: true,
              placeholder: "Enter the Identity of the Operator",
              value: widget.element?.identity,
            ),
            StringWidget(
              key: nameWidgetKey,
              fieldName: "Name",
              fieldDescription: "This is the name of the Drone Operator",
              editable: true,
              placeholder: "Write the Name of the Drone Operator",
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
          dynamic updatedaddress =
              addressWidgetKey.currentState?.getUpdatedValue();

          updatedaddress = Point(
              type: "Feature",
              geometry: GeometryPoint(
                  coordinates: updatedaddress.geometry.coordinates,
                  type: updatedaddress.geometry.type),
              properties: updatedaddress.properties);

          String? updatedcontactInformation =
              contactInformationWidgetKey.currentState?.getUpdatedValue();

          List<String>? updateddrones =
              dronesWidgetKey.currentState?.getUpdatedValue();

          String? updatedemail = emailWidgetKey.currentState?.getUpdatedValue();

          List<String>? updatedflightplans =
              flightplansWidgetKey.currentState?.getUpdatedValue();

          String? updatedid = idWidgetKey.currentState?.getUpdatedValue();

          String? updatedidentity =
              identityWidgetKey.currentState?.getUpdatedValue();

          String? updatedname = nameWidgetKey.currentState?.getUpdatedValue();

          String? updatedpassword =
              passwordWidgetKey.currentState?.getUpdatedValue();

          List<String>? updatedroles =
              rolesWidgetKey.currentState?.getUpdatedValue();

          Operator updatedOperator = widget.element ??
              Operator(
                address: updatedaddress ?? '',
                contactInformation: updatedcontactInformation ?? '',
                drones: updateddrones ?? [''],
                email: updatedemail ?? '',
                flightplans: updatedflightplans ?? [''],
                id: updatedid ?? '',
                identity: updatedidentity ?? '',
                name: updatedname ?? '',
                password: updatedpassword ?? '',
                roles: updatedroles ?? [''],
              );

          updatedOperator = updatedOperator.copyWith(
              address: updatedaddress,
              contactInformation: updatedcontactInformation,
              drones: updateddrones,
              email: updatedemail,
              flightplans: updatedflightplans,
              id: updatedid,
              identity: updatedidentity,
              name: updatedname,
              password: updatedpassword,
              roles: updatedroles);
          var container = ProviderContainer();
          try {
            if (widget.isEditing) {
              await container.read(
                  updateOperatorProvider(Tuple2(updatedOperator, context)));
              print('Operator updated successfully');
              CustomSnackBar.show(context, 'Operator updated successfully');
            } else {
              await container.read(
                  createOperatorProvider(Tuple2(updatedOperator, context)));
              print('Operator created successfully');
              CustomSnackBar.show(context, 'Operator created successfully');
            }
          } catch (error) {
            print('Failed to update Operator: $error');
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

class OperatorFieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final String? value;

  const OperatorFieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
  }) : super(key: key);

  @override
  OperatorFieldWidgetState createState() => OperatorFieldWidgetState();
}

class OperatorFieldWidgetState extends State<OperatorFieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late String? initialValue;
  late String currentValue;
  late List<Operator> options;

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  Future<void> initializeValues() async {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue ?? '';
    Operator operator =
        await container.read(getOperatorProvider(widget.value!).future);
    _typeAheadController.text = '${operator.name} <id: ${operator.id}>';
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
                          child: TypeAheadField<Operator>(
                            controller: _typeAheadController,
                            suggestionsCallback: (String pattern) async {
                              final operatorPaginationData = await container
                                  .read(getAllOperatorProvider(container
                                          .read(operatorPaginationProvider))
                                      .future);
                              final options = operatorPaginationData.items;
                              return options
                                  .where((operator) =>
                                      operator.name!
                                          .toLowerCase()
                                          .contains(pattern.toLowerCase()) ||
                                      operator.id
                                          .toString()
                                          .contains(pattern.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, operator) {
                              return ListTile(
                                title: Text(
                                    '${operator.name} <id: ${operator.id}>'),
                              );
                            },
                            onSelected: (Operator value) {
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
                Operator operator = await container
                    .read(getOperatorProvider(widget.value!).future);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        OperatorWidget(element: operator, isEditing: true),
                  ),
                );
              } catch (error) {
                print('Failed to fetch operator: $error');
              }
            },
            child: const Text('View Operator'),
          ),
        ),
      ],
    );
  }
}

class OperatorMultiFieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final List<String>? values;

  const OperatorMultiFieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.values,
  }) : super(key: key);

  @override
  OperatorMultiFieldWidgetState createState() =>
      OperatorMultiFieldWidgetState();
}

class OperatorMultiFieldWidgetState extends State<OperatorMultiFieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late List<String> initialValues = [];
  late List<String> currentValues = [];
  late List<Operator> options = [];

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
      List<Operator> operatorList = await Future.wait(
        (widget.values ?? []).where((value) => value != '').map((value) async {
          return await container.read(getOperatorProvider(value).future);
        }),
      );
      String concatenatedText = '${operatorList.map((operator) {
        return '${operator.name} <id: ${operator.id}>';
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
                          child: TypeAheadField<Operator>(
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
                                  .read(operatorPaginationProvider.notifier)
                                  .setFilters({
                                'id': {'\$nin': currentValues}
                              });
                              final operatorPaginationData = await container
                                  .read(getAllOperatorProvider(container
                                          .read(operatorPaginationProvider))
                                      .future);
                              final options = operatorPaginationData.items;
                              return options
                                  .where((operator) =>
                                      operator.name!
                                          .toLowerCase()
                                          .contains(inputParts.toLowerCase()) ||
                                      operator.id
                                          .toString()
                                          .toLowerCase()
                                          .contains(inputParts.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, operator) {
                              return ListTile(
                                title: Text(
                                    '${operator.name} <id: ${operator.id}>'),
                              );
                            },
                            onSelected: (Operator value) async {
                              isValueChanged =
                                  !initialValues.contains(value.id);
                              currentValues.add(value.id!);

                              List<Operator> operatorList = await Future.wait(
                                  (currentValues)
                                      .where((value) => value != '')
                                      .map((value) async {
                                return await container
                                    .read(getOperatorProvider(value).future);
                              }));
                              String concatenatedText =
                                  '${operatorList.map((operator) {
                                return '${operator.name} <id: ${operator.id}>';
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
                    builder: (context) => OperatorListView(extraFilters: query),
                  ),
                );
              } catch (error) {
                print('Failed to fetch operators: $error');
              }
            },
            child: const Text('View Operators'),
          ),
        ),
      ],
    );
  }
}

class OperatorLoginWidget extends StatefulWidget {
  final Operator? element;

  const OperatorLoginWidget({this.element, Key? key}) : super(key: key);

  @override
  _OperatorLoginWidgetState createState() => _OperatorLoginWidgetState();
}

class _OperatorLoginWidgetState extends State<OperatorLoginWidget> {
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
                          .read(loginOperatorProvider(loginData).future);
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
                        builder: (context) => OperatorRegisterWidget()),
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

class OperatorRegisterWidget extends StatefulWidget {
  final Operator? element;

  const OperatorRegisterWidget({this.element, Key? key}) : super(key: key);

  @override
  _OperatorRegisterWidgetState createState() => _OperatorRegisterWidgetState();
}

class _OperatorRegisterWidgetState extends State<OperatorRegisterWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
                    var registerData = Operator(
                      email: _emailController.text,
                      password: _passwordController.text,
                      name: _nameController.text,
                    );
                    try {
                      AuthResult registerResult = await container
                          .read(registerOperatorProvider(registerData).future);
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
                        builder: (context) => OperatorLoginWidget()),
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

class OperatorHomeWidget extends StatelessWidget {
  const OperatorHomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OperatorListView()),
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
              'assets/operator.png',
              width: 40.0,
              height: 40.0,
              color: Colors.white,
            ),
            const SizedBox(height: 8.0),
            const Text(
              "Operator",
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

Operator _$OperatorFromJson(Map<String, dynamic> json) => Operator(
      address: json['address'] == null
          ? null
          : Point.fromJson(json['address'] as Map<String, dynamic>),
      contactInformation: json['contactInformation'] as String?,
      drones:
          (json['drones'] as List<dynamic>?)?.map((e) => e as String).toList(),
      email: json['email'] as String,
      flightplans: (json['flightplans'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      id: json['id'] as String?,
      identity: json['identity'] as String?,
      name: json['name'] as String,
      password: json['password'] as String,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$OperatorToJson(Operator instance) => <String, dynamic>{
      'address': instance.address,
      'contactInformation': instance.contactInformation,
      'drones': instance.drones,
      'email': instance.email,
      'flightplans': instance.flightplans,
      'id': instance.id,
      'identity': instance.identity,
      'name': instance.name,
      'password': instance.password,
      'roles': instance.roles,
    };

// **************************************************************************
// ListWidgetGenerator
// **************************************************************************

class OperatorListView extends ConsumerStatefulWidget {
  final Map<String, dynamic>? extraFilters;
  final Map<String, dynamic> currentFilters = {};
  late bool _initialized = false;
  late List<bool> selectedStates;

  OperatorListView({Key? key, this.extraFilters}) : super(key: key);

  @override
  _OperatorListViewState createState() => _OperatorListViewState();
}

class _OperatorListViewState extends ConsumerState<OperatorListView> {
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
          .read(operatorPaginationProvider.notifier)
          .setFilters(widget.extraFilters!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final paginationState = ref.watch(operatorPaginationProvider);

    final operatorsAsyncValue =
        ref.watch(getAllOperatorProvider(paginationState));

    final Map<String, int> columnSortStates =
        ref.watch(operatorPaginationProvider.notifier).getOrders();

    final Map<String, dynamic> fieldsFilterStates =
        ref.watch(operatorPaginationProvider.notifier).getFilters();

    void onSort(String columnName) {
      var state = columnSortStates[columnName];
      if (state == 0 || state == null) {
        columnSortStates[columnName] = 1;
      } else if (state == 1) {
        columnSortStates[columnName] = -1;
      } else if (state == -1) {
        columnSortStates.remove(columnName);
      }
      ref.read(operatorPaginationProvider.notifier).setOrders(columnSortStates);
    }

    void onFilter(String fieldName, dynamic filterValue) {
      widget.currentFilters[fieldName] = filterValue;
      ref
          .read(operatorPaginationProvider.notifier)
          .setFilters(widget.currentFilters);
    }

    void onFilterRemove(String fieldName, dynamic filterValue) {
      if (widget.currentFilters.containsKey(fieldName)) {
        widget.currentFilters.remove(fieldName);
      }
    }

    Future<List<Drone>> fetchDroneList(List<String>? ids) async {
      if (ids == null || ids.isEmpty) {
        return [];
      }
      final nonEmptyIds = ids.where((id) => id.isNotEmpty).toList();
      List<Drone> droneList = await Future.wait(
        nonEmptyIds.map((id) async {
          return await ref.read(getDroneProvider(id).future);
        }),
      );
      return droneList;
    }

    Future<List<FlightPlan>> fetchFlightPlanList(List<String>? ids) async {
      if (ids == null || ids.isEmpty) {
        return [];
      }
      final nonEmptyIds = ids.where((id) => id.isNotEmpty).toList();
      List<FlightPlan> flightplanList = await Future.wait(
        nonEmptyIds.map((id) async {
          return await ref.read(getFlightPlanProvider(id).future);
        }),
      );
      return flightplanList;
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
          title: const Text('Operator List'),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OperatorWidget(
                        isEditing: false,
                      ),
                    ),
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Styles.buttonPrimaryColor),
                  elevation:
                      MaterialStateProperty.resolveWith<double>((states) {
                    if (states.contains(MaterialState.hovered) ||
                        states.contains(MaterialState.pressed)) {
                      return 0;
                    }
                    return 0;
                  }),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  overlayColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.hovered)) {
                      return Styles.buttonPrimaryColorHover;
                    }
                    return Colors.transparent;
                  }),
                ),
                child: const Text('Create Operator'),
              ),
            ),
          ],
        ),
        body: operatorsAsyncValue.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
          data: (OperatorPaginationData data) {
            final operators = data.items;

            if (!widget._initialized) {
              widget.selectedStates =
                  List.generate(operators.length, (index) => false);
              widget._initialized = true;
            }

            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomSearchBar(
                    fields: const {
                      'address': 'Point?',
                      'contactInformation': 'String?',
                      'drones': 'List<String>?',
                      'email': 'String',
                      'flightplans': 'List<String>?',
                      'id': 'String?',
                      'identity': 'String?',
                      'name': 'String',
                      'password': 'String',
                      'roles': 'List<String>?'
                    },
                    filters: fieldsFilterStates,
                    onFilterChanged: onFilter,
                    onFilterRemove: onFilterRemove,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    IconButton(
                      icon: const Icon(Icons.refresh, color: Colors.grey),
                      onPressed: () {
                        ref
                            .read(operatorPaginationProvider.notifier)
                            .setPage(1);
                      },
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(right: 10, left: 10, bottom: 5),
                      child: ElevatedButton(
                        onPressed: widget.selectedStates.contains(true)
                            ? () {
                                List<int> selectedIndices = List.generate(
                                  widget.selectedStates.length,
                                  (index) =>
                                      widget.selectedStates[index] ? index : -1,
                                ).where((index) => index != -1).toList();

                                List<Operator> selectedOperators =
                                    selectedIndices
                                        .map((index) => operators[index])
                                        .toList();
                                _onDeleteElement(
                                    selectedOperators, ref, paginationState);
                              }
                            : null,
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              widget.selectedStates.contains(true)
                                  ? const Color.fromARGB(255, 224, 210, 210)
                                  : const Color.fromARGB(255, 202, 202, 202)),
                          elevation: MaterialStateProperty.resolveWith<double>(
                              (states) {
                            if (states.contains(MaterialState.hovered) ||
                                states.contains(MaterialState.pressed)) {
                              return 0;
                            }
                            return 0;
                          }),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                            if (states.contains(MaterialState.hovered)) {
                              return const Color.fromARGB(255, 194, 165, 165);
                            }
                            return Colors.transparent;
                          }),
                        ),
                        child: const Text('Delete'),
                      ),
                    ),
                  ]),
                  Expanded(
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width > 1500
                                          ? MediaQuery.of(context).size.width
                                          : 1500,
                                  child: DataTable(
                                    columns: [
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
                                                'Address',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates['address'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates['address'] ==
                                                          1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('address') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('address')},
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Identity',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates[
                                                      'identity'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates[
                                                              'identity'] ==
                                                          1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('identity') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('identity')},
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Contact Information',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates[
                                                      'contactInformation'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates[
                                                              'contactInformation'] ==
                                                          1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('contactInformation') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('contactInformation')},
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Drones',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates['drones'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates['drones'] ==
                                                          1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('drones') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('drones')},
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'FlightPlans',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates[
                                                      'flightplans'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates[
                                                              'flightplans'] ==
                                                          1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('flightplans') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('flightplans')},
                                      ),
                                    ],
                                    rows: List<DataRow>.generate(
                                        operators.length, (index) {
                                      var operator = operators[index];

                                      return DataRow(
                                        selected: widget.selectedStates[index],
                                        cells: [
                                          DataCell(
                                            Center(
                                                child: Text(
                                                    operator.name.toString())),
                                            onTap: () =>
                                                {_navigateElement(operator)},
                                          ),
                                          DataCell(
                                            Center(
                                                child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        MapScreenView(PointView(
                                                            operator
                                                                .address!
                                                                .geometry
                                                                .coordinates,
                                                            operator.address!
                                                                .properties,
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height,
                                                            false)),
                                                  ),
                                                );
                                              },
                                              style: ButtonStyle(
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                ),
                                                padding: MaterialStateProperty
                                                    .all<EdgeInsetsGeometry>(
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 1,
                                                      vertical: 1),
                                                ),
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .all<Color>(Styles
                                                            .buttonPrimaryColor),
                                                elevation: MaterialStateProperty
                                                    .resolveWith<double>(
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
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.white),
                                                overlayColor:
                                                    MaterialStateProperty
                                                        .resolveWith<Color>(
                                                            (states) {
                                                  if (states.contains(
                                                      MaterialState.hovered)) {
                                                    return Styles
                                                        .buttonPrimaryColorHover;
                                                  }
                                                  return Colors.transparent;
                                                }),
                                              ),
                                              child: const Text(
                                                "Point?",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            )),
                                            onTap: () =>
                                                {_navigateElement(operator)},
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text(operator.identity
                                                    .toString())),
                                            onTap: () =>
                                                {_navigateElement(operator)},
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text(operator
                                                    .contactInformation
                                                    .toString())),
                                            onTap: () =>
                                                {_navigateElement(operator)},
                                          ),
                                          DataCell(
                                            Center(
                                              child: FutureBuilder<List<Drone>>(
                                                future: fetchDroneList(
                                                    operator.drones),
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
                                                          .map((drone) {
                                                        return ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        DroneWidget(
                                                                  element:
                                                                      drone,
                                                                  isEditing:
                                                                      true,
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
                                                                    .all<Color>(
                                                                        Styles
                                                                            .buttonPrimaryColor),
                                                            elevation: MaterialStateProperty
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
                                                            drone.name!,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        );
                                                      }).toList(),
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                            onTap: () =>
                                                {_navigateElement(operator)},
                                          ),
                                          DataCell(
                                            Center(
                                              child: FutureBuilder<
                                                  List<FlightPlan>>(
                                                future: fetchFlightPlanList(
                                                    operator.flightplans),
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
                                                          .map((flightplan) {
                                                        return ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        FlightPlanWidget(
                                                                  element:
                                                                      flightplan,
                                                                  isEditing:
                                                                      true,
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
                                                                    .all<Color>(
                                                                        Styles
                                                                            .buttonPrimaryColor),
                                                            elevation: MaterialStateProperty
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
                                                            flightplan.name!,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        );
                                                      }).toList(),
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                            onTap: () =>
                                                {_navigateElement(operator)},
                                          ),
                                        ],
                                        onSelectChanged: (selected) {
                                          setState(() {
                                            widget.selectedStates[index] =
                                                selected!;
                                          });
                                        },
                                      );
                                    }).toList(),
                                  ),
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
      OperatorPaginationState paginationState, int maxPages) {
    if (pageNumber <= maxPages) {
      ref.read(operatorPaginationProvider.notifier).setPage(pageNumber);
    }
  }

  void _navigateElement(Operator operator) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              OperatorWidget(element: operator, isEditing: true)),
    );
  }

  void _onDeleteElement(List<Operator> operators, WidgetRef ref,
      OperatorPaginationState paginationState) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete these records?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _deleteRecords(operators, ref, paginationState);
                Navigator.of(context).pop();
                setState(() {});
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteRecords(List<Operator> operators, WidgetRef ref,
      OperatorPaginationState paginationState) async {
    for (var operator in operators) {
      await ref.read(deleteOperatorProvider(operator.id!).future);
    }
    setState(() {
      widget._initialized = false;
    });
    ref.read(operatorPaginationProvider.notifier).setPage(1);
  }
}

class OperatorPaginationState {
  final Tuple2<int, int> pagination;
  final Map<String, int> orders;
  final Map<String, dynamic> filters;

  OperatorPaginationState({
    required this.pagination,
    required this.orders,
    required this.filters,
  });
}

class OperatorPaginationNotifier
    extends StateNotifier<OperatorPaginationState> {
  OperatorPaginationNotifier()
      : super(OperatorPaginationState(
          pagination: const Tuple2<int, int>(0, 10),
          orders: {},
          filters: {},
        ));

  void setPage(int page) {
    state = OperatorPaginationState(
      pagination: Tuple2(page * state.pagination.item2 - state.pagination.item2,
          state.pagination.item2),
      orders: state.orders,
      filters: state.filters,
    );
  }

  void setOrders(Map<String, int> newOrders) {
    state = OperatorPaginationState(
      pagination: Tuple2(state.pagination.item1, state.pagination.item2),
      orders: newOrders,
      filters: state.filters,
    );
  }

  void setFilters(Map<String, dynamic> newFilters) {
    state = OperatorPaginationState(
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

final operatorPaginationProvider =
    StateNotifierProvider<OperatorPaginationNotifier, OperatorPaginationState>(
  (ref) => OperatorPaginationNotifier(),
);

// **************************************************************************
// RiverpodCustomGenerator
// **************************************************************************

final getOperatorProvider = FutureProvider.autoDispose
    .family<Operator, String>((ref, operatorId) async {
  final json = await http.get(Uri.parse('$baseURL/operator/$operatorId'));
  final jsonData = jsonDecode(json.body);
  return Operator.fromJson(jsonData);
});

final createOperatorProvider = FutureProvider.autoDispose
    .family<void, Tuple2<Operator, BuildContext>>((ref, tuple) async {
  Operator operatorInstance = tuple.item1;
  BuildContext context = tuple.item2;

  final response = await http.post(
    Uri.parse('$baseURL/operator'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(operatorInstance.toJson()),
  );
  if (response.statusCode != 200) {
    CustomSnackBar.show(context, jsonDecode(response.body)['detail']);
  }
});

final updateOperatorProvider = FutureProvider.autoDispose
    .family<void, Tuple2<Operator, BuildContext>>((ref, tuple) async {
  Operator operatorInstance = tuple.item1;
  BuildContext context = tuple.item2;

  final response = await http.put(
    Uri.parse('$baseURL/operator/${operatorInstance.id}'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(operatorInstance.toJson()),
  );
  if (response.statusCode != 200) {
    CustomSnackBar.show(context, jsonDecode(response.body)['detail']);
  }
});

final deleteOperatorProvider =
    FutureProvider.autoDispose.family<void, String>((ref, operatorId) async {
  final response = await http.delete(
    Uri.parse('$baseURL/operator/$operatorId'),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to delete Operator');
  }
});

class OperatorPaginationData {
  final List<Operator> items;
  final int currentPage;
  final int maxPages;

  OperatorPaginationData({
    required this.items,
    required this.currentPage,
    required this.maxPages,
  });
}

final getAllOperatorProvider = FutureProvider.autoDispose
    .family<OperatorPaginationData, OperatorPaginationState>(
        (ref, state) async {
  final fixedQuery = {
    if (state.orders.isNotEmpty) 'orders': state.orders,
    if (state.filters.isNotEmpty)
      'filters': Map.from(state.filters)
        ..removeWhere((key, value) => value == null || value == ''),
  };

  final json = await http.post(
      Uri.parse(
          '$baseURL/operators?skip=${state.pagination.item1}&limit=${state.pagination.item2}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(fixedQuery));
  final jsonData = jsonDecode(json.body);

  return OperatorPaginationData(
    items: (jsonData['items'] as List)
        .map((data) => Operator.fromJson(data))
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
  final Operator? operator;

  AuthResult(this.success, {this.errorMessage, this.operator});
}

final loginOperatorProvider =
    FutureProvider.autoDispose.family<AuthResult, Auth>((ref, auth) async {
  final response = await http.post(
    Uri.parse('$baseURL/auth/login/operator/'),
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

  return AuthResult(true, operator: Operator.fromJson(responseData['user']));
});

final registerOperatorProvider = FutureProvider.autoDispose
    .family<AuthResult, Operator>((ref, operator) async {
  final response = await http.post(
    Uri.parse('$baseURL/auth/register/operator/'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(operator.toJson()),
  );
  if (response.statusCode != 200) {
    return AuthResult(false, errorMessage: jsonDecode(response.body)['detail']);
  }

  final responseData = jsonDecode(response.body);
  final token = responseData['token'];

  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);

  return AuthResult(true, operator: Operator.fromJson(responseData['user']));
});

final verifyTokenOperatorProvider =
    FutureProvider.autoDispose<bool>((ref) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      return false;
    }

    final response = await http.get(
      Uri.parse('$baseURL/auth/verify/operator/$token'),
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
