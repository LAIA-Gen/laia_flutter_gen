// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accessright.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AccessRightCWProxy {
  AccessRight fields_create(dynamic fields_create);

  AccessRight fields_edit(dynamic fields_edit);

  AccessRight fields_visible(dynamic fields_visible);

  AccessRight id(String id);

  AccessRight model(String model);

  AccessRight name(String name);

  AccessRight operations(dynamic operations);

  AccessRight role(String role);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccessRight(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccessRight(...).copyWith(id: 12, name: "My name")
  /// ````
  AccessRight call({
    dynamic? fields_create,
    dynamic? fields_edit,
    dynamic? fields_visible,
    String? id,
    String? model,
    String? name,
    dynamic? operations,
    String? role,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAccessRight.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAccessRight.copyWith.fieldName(...)`
class _$AccessRightCWProxyImpl implements _$AccessRightCWProxy {
  final AccessRight _value;

  const _$AccessRightCWProxyImpl(this._value);

  @override
  AccessRight fields_create(dynamic fields_create) =>
      this(fields_create: fields_create);

  @override
  AccessRight fields_edit(dynamic fields_edit) =>
      this(fields_edit: fields_edit);

  @override
  AccessRight fields_visible(dynamic fields_visible) =>
      this(fields_visible: fields_visible);

  @override
  AccessRight id(String id) => this(id: id);

  @override
  AccessRight model(String model) => this(model: model);

  @override
  AccessRight name(String name) => this(name: name);

  @override
  AccessRight operations(dynamic operations) => this(operations: operations);

  @override
  AccessRight role(String role) => this(role: role);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccessRight(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccessRight(...).copyWith(id: 12, name: "My name")
  /// ````
  AccessRight call({
    Object? fields_create = const $CopyWithPlaceholder(),
    Object? fields_edit = const $CopyWithPlaceholder(),
    Object? fields_visible = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? model = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? operations = const $CopyWithPlaceholder(),
    Object? role = const $CopyWithPlaceholder(),
  }) {
    return AccessRight(
      fields_create:
          fields_create == const $CopyWithPlaceholder() || fields_create == null
              ? _value.fields_create
              // ignore: cast_nullable_to_non_nullable
              : fields_create as dynamic,
      fields_edit:
          fields_edit == const $CopyWithPlaceholder() || fields_edit == null
              ? _value.fields_edit
              // ignore: cast_nullable_to_non_nullable
              : fields_edit as dynamic,
      fields_visible: fields_visible == const $CopyWithPlaceholder() ||
              fields_visible == null
          ? _value.fields_visible
          // ignore: cast_nullable_to_non_nullable
          : fields_visible as dynamic,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      model: model == const $CopyWithPlaceholder() || model == null
          ? _value.model
          // ignore: cast_nullable_to_non_nullable
          : model as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      operations:
          operations == const $CopyWithPlaceholder() || operations == null
              ? _value.operations
              // ignore: cast_nullable_to_non_nullable
              : operations as dynamic,
      role: role == const $CopyWithPlaceholder() || role == null
          ? _value.role
          // ignore: cast_nullable_to_non_nullable
          : role as String,
    );
  }
}

extension $AccessRightCopyWith on AccessRight {
  /// Returns a callable class that can be used as follows: `instanceOfAccessRight.copyWith(...)` or like so:`instanceOfAccessRight.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AccessRightCWProxy get copyWith => _$AccessRightCWProxyImpl(this);
}

// **************************************************************************
// ElementWidgetGenerator
// **************************************************************************

class AccessRightWidget extends StatefulWidget {
  final AccessRight? element;
  final bool isEditing;

  const AccessRightWidget({this.element, required this.isEditing, Key? key})
      : super(key: key);

  @override
  _AccessRightWidgetState createState() => _AccessRightWidgetState();
}

class _AccessRightWidgetState extends State<AccessRightWidget> {
  final GlobalKey<StringWidgetState> nameWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<RoleFieldWidgetState> roleWidgetKey =
      GlobalKey<RoleFieldWidgetState>();
  final GlobalKey<StringWidgetState> modelWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<DefaultWidgetState> operationsWidgetKey =
      GlobalKey<DefaultWidgetState>();
  final GlobalKey<DefaultWidgetState> fields_createWidgetKey =
      GlobalKey<DefaultWidgetState>();
  final GlobalKey<DefaultWidgetState> fields_editWidgetKey =
      GlobalKey<DefaultWidgetState>();
  final GlobalKey<DefaultWidgetState> fields_visibleWidgetKey =
      GlobalKey<DefaultWidgetState>();
  final GlobalKey<StringWidgetState> idWidgetKey =
      GlobalKey<StringWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AccessRight'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            StringWidget(
              key: nameWidgetKey,
              fieldName: "name",
              fieldDescription: "This is the name",
              editable: true,
              placeholder: "Type the name",
              value: widget.element?.name,
            ),
            RoleFieldWidget(
              key: roleWidgetKey,
              fieldName: "role",
              fieldDescription: "This is the role",
              editable: true,
              placeholder: "Type the role",
              value: widget.element?.role,
            ),
            StringWidget(
              key: modelWidgetKey,
              fieldName: "model",
              fieldDescription: "This is the model",
              editable: true,
              placeholder: "Type the model",
              value: widget.element?.model,
            ),
            DefaultWidget(
              key: operationsWidgetKey,
              fieldName: "operations",
              fieldDescription: "This is the operations",
              editable: true,
              placeholder: "Type the operations",
              value: widget.element?.operations,
            ),
            DefaultWidget(
              key: fields_createWidgetKey,
              fieldName: "fields_create",
              fieldDescription: "This is the fields_create",
              editable: true,
              placeholder: "Type the fields_create",
              value: widget.element?.fields_create,
            ),
            DefaultWidget(
              key: fields_editWidgetKey,
              fieldName: "fields_edit",
              fieldDescription: "This is the fields_edit",
              editable: true,
              placeholder: "Type the fields_edit",
              value: widget.element?.fields_edit,
            ),
            DefaultWidget(
              key: fields_visibleWidgetKey,
              fieldName: "fields_visible",
              fieldDescription: "This is the fields_visible",
              editable: true,
              placeholder: "Type the fields_visible",
              value: widget.element?.fields_visible,
            ),
            StringWidget(
              key: idWidgetKey,
              fieldName: "id",
              fieldDescription: "This is the id",
              editable: true,
              placeholder: "Type the id",
              value: widget.element?.id,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? updatedname = nameWidgetKey.currentState?.getUpdatedValue();

          String? updatedrole = roleWidgetKey.currentState?.getUpdatedValue();

          String? updatedmodel = modelWidgetKey.currentState?.getUpdatedValue();

          dynamic updatedoperations =
              operationsWidgetKey.currentState?.getUpdatedValue();

          dynamic updatedfields_create =
              fields_createWidgetKey.currentState?.getUpdatedValue();

          dynamic updatedfields_edit =
              fields_editWidgetKey.currentState?.getUpdatedValue();

          dynamic updatedfields_visible =
              fields_visibleWidgetKey.currentState?.getUpdatedValue();

          String? updatedid = idWidgetKey.currentState?.getUpdatedValue();

          AccessRight updatedAccessRight = widget.element ??
              AccessRight(
                name: updatedname ?? '',
                role: updatedrole ?? '',
                model: updatedmodel ?? '',
                operations: updatedoperations ?? '',
                fields_create: updatedfields_create ?? '',
                fields_edit: updatedfields_edit ?? '',
                fields_visible: updatedfields_visible ?? '',
                id: updatedid ?? '',
              );

          updatedAccessRight = updatedAccessRight.copyWith(
              name: updatedname,
              role: updatedrole,
              model: updatedmodel,
              operations: updatedoperations,
              fields_create: updatedfields_create,
              fields_edit: updatedfields_edit,
              fields_visible: updatedfields_visible,
              id: updatedid);
          var container = ProviderContainer();
          try {
            if (widget.isEditing) {
              await container
                  .read(updateAccessRightProvider(Tuple2(updatedAccessRight, context)));
              print('AccessRight updated successfully');
            } else {
              await container
                  .read(createAccessRightProvider(Tuple2(updatedAccessRight, context)));
              print('AccessRight created successfully');
            }
          } catch (error) {
            print('Failed to update AccessRight: $error');
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

class AccessRightFieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final String? value;

  const AccessRightFieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
  }) : super(key: key);

  @override
  AccessRightFieldWidgetState createState() => AccessRightFieldWidgetState();
}

class AccessRightFieldWidgetState extends State<AccessRightFieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late String? initialValue;
  late String currentValue;
  late List<AccessRight> options;

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  Future<void> initializeValues() async {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue ?? '';
    AccessRight accessright =
        await container.read(getAccessRightProvider(widget.value!).future);
    _typeAheadController.text = '${accessright.name} <id: ${accessright.id}>';
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
                          child: TypeAheadField<AccessRight>(
                            controller: _typeAheadController,
                            suggestionsCallback: (String pattern) async {
                              final accessrightPaginationData = await container
                                  .read(getAllAccessRightProvider(container
                                          .read(accessrightPaginationProvider))
                                      .future);
                              final options = accessrightPaginationData.items;
                              return options
                                  .where((accessright) =>
                                      accessright.name
                                          .toLowerCase()
                                          .contains(pattern.toLowerCase()) ||
                                      accessright.id
                                          .toString()
                                          .contains(pattern.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, accessright) {
                              return ListTile(
                                title: Text(
                                    '${accessright.name} <id: ${accessright.id}>'),
                              );
                            },
                            onSelected: (AccessRight value) {
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
                AccessRight accessright = await container
                    .read(getAccessRightProvider(widget.value!).future);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AccessRightWidget(
                        element: accessright, isEditing: true),
                  ),
                );
              } catch (error) {
                print('Failed to fetch accessright: $error');
              }
            },
            child: const Text('View AccessRight'),
          ),
        ),
      ],
    );
  }
}

class AccessRightMultiFieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final List<String>? values;

  const AccessRightMultiFieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.values,
  }) : super(key: key);

  @override
  AccessRightMultiFieldWidgetState createState() =>
      AccessRightMultiFieldWidgetState();
}

class AccessRightMultiFieldWidgetState
    extends State<AccessRightMultiFieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late List<String> initialValues = [];
  late List<String> currentValues = [];
  late List<AccessRight> options = [];

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
      List<AccessRight> accessrightList = await Future.wait(
        (widget.values ?? []).where((value) => value != '').map((value) async {
          return await container.read(getAccessRightProvider(value).future);
        }),
      );
      String concatenatedText = '${accessrightList.map((accessright) {
        return '${accessright.name} <id: ${accessright.id}>';
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
                          child: TypeAheadField<AccessRight>(
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
                                  .read(accessrightPaginationProvider.notifier)
                                  .setFilters({
                                'id': {'\$nin': currentValues}
                              });
                              final accessrightPaginationData = await container
                                  .read(getAllAccessRightProvider(container
                                          .read(accessrightPaginationProvider))
                                      .future);
                              final options = accessrightPaginationData.items;
                              return options
                                  .where((accessright) =>
                                      accessright.name
                                          .toLowerCase()
                                          .contains(inputParts.toLowerCase()) ||
                                      accessright.id
                                          .toString()
                                          .toLowerCase()
                                          .contains(inputParts.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, accessright) {
                              return ListTile(
                                title: Text(
                                    '${accessright.name} <id: ${accessright.id}>'),
                              );
                            },
                            onSelected: (AccessRight value) async {
                              isValueChanged =
                                  !initialValues.contains(value.id);
                              currentValues.add(value.id!);

                              List<AccessRight> accessrightList =
                                  await Future.wait((currentValues)
                                      .where((value) => value != '')
                                      .map((value) async {
                                return await container
                                    .read(getAccessRightProvider(value).future);
                              }));
                              String concatenatedText =
                                  '${accessrightList.map((accessright) {
                                return '${accessright.name} <id: ${accessright.id}>';
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
                    builder: (context) =>
                        AccessRightListView(extraFilters: query),
                  ),
                );
              } catch (error) {
                print('Failed to fetch accessrights: $error');
              }
            },
            child: const Text('View AccessRights'),
          ),
        ),
      ],
    );
  }
}

// **************************************************************************
// HomeWidgetElementGenerator
// **************************************************************************

class AccessRightHomeWidget extends StatelessWidget {
  const AccessRightHomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AccessRightListView()),
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
              'assets/accessright.png',
              width: 40.0,
              height: 40.0,
              color: Colors.white,
            ),
            const SizedBox(height: 8.0),
            const Text(
              "AccessRight",
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

AccessRight _$AccessRightFromJson(Map<String, dynamic> json) => AccessRight(
      name: json['name'] as String,
      role: json['role'] as String,
      model: json['model'] as String,
      operations: json['operations'],
      fields_create: json['fields_create'],
      fields_edit: json['fields_edit'],
      fields_visible: json['fields_visible'],
      id: json['id'] as String,
    );

Map<String, dynamic> _$AccessRightToJson(AccessRight instance) =>
    <String, dynamic>{
      'name': instance.name,
      'role': instance.role,
      'model': instance.model,
      'operations': instance.operations,
      'fields_create': instance.fields_create,
      'fields_edit': instance.fields_edit,
      'fields_visible': instance.fields_visible,
      'id': instance.id,
    };

// **************************************************************************
// ListWidgetGenerator
// **************************************************************************

class AccessRightListView extends ConsumerStatefulWidget {
  final Map<String, dynamic>? extraFilters;
  final Map<String, dynamic> currentFilters = {};

  AccessRightListView({Key? key, this.extraFilters}) : super(key: key);

  @override
  _AccessRightListViewState createState() => _AccessRightListViewState();
}

class _AccessRightListViewState extends ConsumerState<AccessRightListView> {
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
          .read(accessrightPaginationProvider.notifier)
          .setFilters(widget.extraFilters!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final paginationState = ref.watch(accessrightPaginationProvider);

    final accessrightsAsyncValue =
        ref.watch(getAllAccessRightProvider(paginationState));

    final Map<String, int> columnSortStates =
        ref.watch(accessrightPaginationProvider.notifier).getOrders();

    final Map<String, dynamic> fieldsFilterStates =
        ref.watch(accessrightPaginationProvider.notifier).getFilters();

    void onSort(String columnName) {
      var state = columnSortStates[columnName];
      if (state == 0 || state == null) {
        columnSortStates[columnName] = 1;
      } else if (state == 1) {
        columnSortStates[columnName] = -1;
      } else if (state == -1) {
        columnSortStates.remove(columnName);
      }
      ref
          .read(accessrightPaginationProvider.notifier)
          .setOrders(columnSortStates);
    }

    void onFilter(String fieldName, dynamic filterValue) {
      widget.currentFilters[fieldName] = filterValue;
      ref
          .read(accessrightPaginationProvider.notifier)
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
          title: const Text('AccessRight List'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AccessRightWidget(
                      isEditing: false,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: accessrightsAsyncValue.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
          data: (AccessRightPaginationData data) {
            final accessrights = data.items;
            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomSearchBar(
                    fields: const {
                      'name': 'String',
                      'role': 'String',
                      'model': 'String',
                      'operations': 'dynamic',
                      'fields_create': 'dynamic',
                      'fields_edit': 'dynamic',
                      'fields_visible': 'dynamic',
                      'id': 'String'
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
                                              'name',
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
                                              'role',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 94, 54, 54)),
                                              textAlign: TextAlign.center,
                                            ),
                                            if (columnSortStates['role'] !=
                                                null) ...[
                                              Icon(
                                                columnSortStates['role'] == 1
                                                    ? Icons
                                                        .arrow_drop_up_rounded
                                                    : Icons
                                                        .arrow_drop_down_rounded,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                '${columnSortStates.keys.toList().indexOf('role') + 1}',
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      onSort: (columnIndex, ascending) =>
                                          {onSort('role')},
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'model',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 94, 54, 54)),
                                              textAlign: TextAlign.center,
                                            ),
                                            if (columnSortStates['model'] !=
                                                null) ...[
                                              Icon(
                                                columnSortStates['model'] == 1
                                                    ? Icons
                                                        .arrow_drop_up_rounded
                                                    : Icons
                                                        .arrow_drop_down_rounded,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                '${columnSortStates.keys.toList().indexOf('model') + 1}',
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      onSort: (columnIndex, ascending) =>
                                          {onSort('model')},
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'operations',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 94, 54, 54)),
                                              textAlign: TextAlign.center,
                                            ),
                                            if (columnSortStates[
                                                    'operations'] !=
                                                null) ...[
                                              Icon(
                                                columnSortStates[
                                                            'operations'] ==
                                                        1
                                                    ? Icons
                                                        .arrow_drop_up_rounded
                                                    : Icons
                                                        .arrow_drop_down_rounded,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                '${columnSortStates.keys.toList().indexOf('operations') + 1}',
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      onSort: (columnIndex, ascending) =>
                                          {onSort('operations')},
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'fields_create',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 94, 54, 54)),
                                              textAlign: TextAlign.center,
                                            ),
                                            if (columnSortStates[
                                                    'fields_create'] !=
                                                null) ...[
                                              Icon(
                                                columnSortStates[
                                                            'fields_create'] ==
                                                        1
                                                    ? Icons
                                                        .arrow_drop_up_rounded
                                                    : Icons
                                                        .arrow_drop_down_rounded,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                '${columnSortStates.keys.toList().indexOf('fields_create') + 1}',
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      onSort: (columnIndex, ascending) =>
                                          {onSort('fields_create')},
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'fields_edit',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 94, 54, 54)),
                                              textAlign: TextAlign.center,
                                            ),
                                            if (columnSortStates[
                                                    'fields_edit'] !=
                                                null) ...[
                                              Icon(
                                                columnSortStates[
                                                            'fields_edit'] ==
                                                        1
                                                    ? Icons
                                                        .arrow_drop_up_rounded
                                                    : Icons
                                                        .arrow_drop_down_rounded,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                '${columnSortStates.keys.toList().indexOf('fields_edit') + 1}',
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      onSort: (columnIndex, ascending) =>
                                          {onSort('fields_edit')},
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'fields_visible',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 94, 54, 54)),
                                              textAlign: TextAlign.center,
                                            ),
                                            if (columnSortStates[
                                                    'fields_visible'] !=
                                                null) ...[
                                              Icon(
                                                columnSortStates[
                                                            'fields_visible'] ==
                                                        1
                                                    ? Icons
                                                        .arrow_drop_up_rounded
                                                    : Icons
                                                        .arrow_drop_down_rounded,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                '${columnSortStates.keys.toList().indexOf('fields_visible') + 1}',
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      onSort: (columnIndex, ascending) =>
                                          {onSort('fields_visible')},
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
                                  ],
                                  rows: accessrights.map((accessright) {
                                    return DataRow(
                                      cells: [
                                        DataCell(Center(
                                            child: Text(
                                                accessright.name.toString()))),
                                        DataCell(
                                          Center(
                                            child: FutureBuilder<List<Role>>(
                                              future: fetchRoleList(
                                                  [accessright.role ?? '']),
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
                                        DataCell(Center(
                                            child: Text(
                                                accessright.model.toString()))),
                                        DataCell(Center(
                                            child: Text(accessright.operations
                                                .toString()))),
                                        DataCell(Center(
                                            child: Text(accessright
                                                .fields_create
                                                .toString()))),
                                        DataCell(Center(
                                            child: Text(accessright.fields_edit
                                                .toString()))),
                                        DataCell(Center(
                                            child: Text(accessright
                                                .fields_visible
                                                .toString()))),
                                        DataCell(Center(
                                            child: Text(
                                                accessright.id.toString()))),
                                      ],
                                      onSelectChanged: (selected) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AccessRightWidget(
                                                      element: accessright,
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
      AccessRightPaginationState paginationState, int maxPages) {
    if (pageNumber <= maxPages) {
      ref.read(accessrightPaginationProvider.notifier).setPage(pageNumber);
    }
  }
}

class AccessRightPaginationState {
  final Tuple2<int, int> pagination;
  final Map<String, int> orders;
  final Map<String, dynamic> filters;

  AccessRightPaginationState({
    required this.pagination,
    required this.orders,
    required this.filters,
  });
}

class AccessRightPaginationNotifier
    extends StateNotifier<AccessRightPaginationState> {
  AccessRightPaginationNotifier()
      : super(AccessRightPaginationState(
          pagination: const Tuple2<int, int>(0, 10),
          orders: {},
          filters: {},
        ));

  void setPage(int page) {
    state = AccessRightPaginationState(
      pagination: Tuple2(page * state.pagination.item2 - state.pagination.item2,
          state.pagination.item2),
      orders: state.orders,
      filters: state.filters,
    );
  }

  void setOrders(Map<String, int> newOrders) {
    state = AccessRightPaginationState(
      pagination: Tuple2(state.pagination.item1, state.pagination.item2),
      orders: newOrders,
      filters: state.filters,
    );
  }

  void setFilters(Map<String, dynamic> newFilters) {
    state = AccessRightPaginationState(
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

final accessrightPaginationProvider = StateNotifierProvider<
    AccessRightPaginationNotifier, AccessRightPaginationState>(
  (ref) => AccessRightPaginationNotifier(),
);

// **************************************************************************
// RiverpodCustomGenerator
// **************************************************************************

final getAccessRightProvider = FutureProvider.autoDispose
    .family<AccessRight, String>((ref, accessrightId) async {
  final json = await http.get(Uri.parse('$baseURL/accessright/$accessrightId'));
  final jsonData = jsonDecode(json.body);
  return AccessRight.fromJson(jsonData);
});

final createAccessRightProvider = FutureProvider.autoDispose
    .family<void, Tuple2<AccessRight, BuildContext>>((ref, tuple) async {
  AccessRight accessrightInstance = tuple.item1;
  BuildContext context = tuple.item2;

  final response = await http.post(
    Uri.parse('$baseURL/accessright'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(accessrightInstance.toJson()),
  );
  if (response.statusCode != 201) {
    CustomSnackBar.show(context, jsonDecode(response.body)['detail']);
  }
});

final updateAccessRightProvider = FutureProvider.autoDispose
    .family<void, Tuple2<AccessRight, BuildContext>>((ref, tuple) async {
  AccessRight accessrightInstance = tuple.item1;
  BuildContext context = tuple.item2;

  final response = await http.put(
    Uri.parse('$baseURL/accessright/${accessrightInstance.id}'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(accessrightInstance.toJson()),
  );
  if (response.statusCode != 200) {
    CustomSnackBar.show(context, jsonDecode(response.body)['detail']);
  }
});

final deleteAccessRightProvider =
    FutureProvider.autoDispose.family<void, int>((ref, accessrightId) async {
  final response = await http.delete(
    Uri.parse('$baseURL/accessright/$accessrightId'),
  );
  if (response.statusCode != 204) {
    throw Exception('Failed to delete AccessRight');
  }
});

class AccessRightPaginationData {
  final List<AccessRight> items;
  final int currentPage;
  final int maxPages;

  AccessRightPaginationData({
    required this.items,
    required this.currentPage,
    required this.maxPages,
  });
}

final getAllAccessRightProvider = FutureProvider.autoDispose
    .family<AccessRightPaginationData, AccessRightPaginationState>(
        (ref, state) async {
  final fixedQuery = {
    if (state.orders.isNotEmpty) 'orders': state.orders,
    if (state.filters.isNotEmpty)
      'filters': Map.from(state.filters)
        ..removeWhere((key, value) => value == null || value == ''),
  };

  final json = await http.post(
      Uri.parse(
          '$baseURL/accessrights?skip=${state.pagination.item1}&limit=${state.pagination.item2}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(fixedQuery));
  final jsonData = jsonDecode(json.body);

  return AccessRightPaginationData(
    items: (jsonData['items'] as List)
        .map((data) => AccessRight.fromJson(data))
        .toList(),
    currentPage: jsonData['current_page'],
    maxPages: jsonData['max_pages'],
  );
});
