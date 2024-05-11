// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notam.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NOTAMCWProxy {
  NOTAM area(Polygon area);

  NOTAM description(String? description);

  NOTAM end_date(DateTime end_date);

  NOTAM id(String? id);

  NOTAM issuing_authority(String? issuing_authority);

  NOTAM name(String name);

  NOTAM reference(String? reference);

  NOTAM start_date(DateTime start_date);

  NOTAM status(String? status);

  NOTAM type(String? type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NOTAM(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NOTAM(...).copyWith(id: 12, name: "My name")
  /// ````
  NOTAM call({
    Polygon? area,
    String? description,
    DateTime? end_date,
    String? id,
    String? issuing_authority,
    String? name,
    String? reference,
    DateTime? start_date,
    String? status,
    String? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNOTAM.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNOTAM.copyWith.fieldName(...)`
class _$NOTAMCWProxyImpl implements _$NOTAMCWProxy {
  final NOTAM _value;

  const _$NOTAMCWProxyImpl(this._value);

  @override
  NOTAM area(Polygon area) => this(area: area);

  @override
  NOTAM description(String? description) => this(description: description);

  @override
  NOTAM end_date(DateTime end_date) => this(end_date: end_date);

  @override
  NOTAM id(String? id) => this(id: id);

  @override
  NOTAM issuing_authority(String? issuing_authority) =>
      this(issuing_authority: issuing_authority);

  @override
  NOTAM name(String name) => this(name: name);

  @override
  NOTAM reference(String? reference) => this(reference: reference);

  @override
  NOTAM start_date(DateTime start_date) => this(start_date: start_date);

  @override
  NOTAM status(String? status) => this(status: status);

  @override
  NOTAM type(String? type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NOTAM(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NOTAM(...).copyWith(id: 12, name: "My name")
  /// ````
  NOTAM call({
    Object? area = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? end_date = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? issuing_authority = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? reference = const $CopyWithPlaceholder(),
    Object? start_date = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return NOTAM(
      area: area == const $CopyWithPlaceholder() || area == null
          ? _value.area
          // ignore: cast_nullable_to_non_nullable
          : area as Polygon,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      end_date: end_date == const $CopyWithPlaceholder() || end_date == null
          ? _value.end_date
          // ignore: cast_nullable_to_non_nullable
          : end_date as DateTime,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      issuing_authority: issuing_authority == const $CopyWithPlaceholder()
          ? _value.issuing_authority
          // ignore: cast_nullable_to_non_nullable
          : issuing_authority as String?,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      reference: reference == const $CopyWithPlaceholder()
          ? _value.reference
          // ignore: cast_nullable_to_non_nullable
          : reference as String?,
      start_date:
          start_date == const $CopyWithPlaceholder() || start_date == null
              ? _value.start_date
              // ignore: cast_nullable_to_non_nullable
              : start_date as DateTime,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as String?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String?,
    );
  }
}

extension $NOTAMCopyWith on NOTAM {
  /// Returns a callable class that can be used as follows: `instanceOfNOTAM.copyWith(...)` or like so:`instanceOfNOTAM.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NOTAMCWProxy get copyWith => _$NOTAMCWProxyImpl(this);
}

// **************************************************************************
// ElementWidgetGenerator
// **************************************************************************

class NOTAMWidget extends StatefulWidget {
  final NOTAM? element;
  final bool isEditing;

  const NOTAMWidget({this.element, required this.isEditing, Key? key})
      : super(key: key);

  @override
  _NOTAMWidgetState createState() => _NOTAMWidgetState();
}

class _NOTAMWidgetState extends State<NOTAMWidget> {
  final GlobalKey<StringWidgetState> nameWidgetKey =
      GlobalKey<StringWidgetState>();

  final GlobalKey<StringWidgetState> descriptionWidgetKey =
      GlobalKey<StringWidgetState>();

  final GlobalKey<StringWidgetState> typeWidgetKey =
      GlobalKey<StringWidgetState>();

  final GlobalKey<DateTimeWidgetState> start_dateWidgetKey =
      GlobalKey<DateTimeWidgetState>();

  final GlobalKey<DateTimeWidgetState> end_dateWidgetKey =
      GlobalKey<DateTimeWidgetState>();

  final GlobalKey<StringWidgetState> issuing_authorityWidgetKey =
      GlobalKey<StringWidgetState>();

  final GlobalKey<StringWidgetState> statusWidgetKey =
      GlobalKey<StringWidgetState>();

  final GlobalKey<StringWidgetState> referenceWidgetKey =
      GlobalKey<StringWidgetState>();

  final GlobalKey<MapWidgetState> areaWidgetKey = GlobalKey<MapWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NOTAM'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => NOTAMListView()),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 50,
                  child: StringWidget(
                    key: nameWidgetKey,
                    fieldName: "Name",
                    fieldDescription: "This is the NOTAM Name",
                    editable: true,
                    placeholder: "Write the NOTAM Name",
                    value: widget.element?.name,
                  ),
                ),
                Expanded(
                  flex: 50,
                  child: StringWidget(
                    key: descriptionWidgetKey,
                    fieldName: "Description",
                    fieldDescription: "This is the NOTAM Description",
                    editable: true,
                    placeholder: "Write the NOTAM Description",
                    value: widget.element?.description,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 30,
                  child: StringWidget(
                    key: typeWidgetKey,
                    fieldName: "Type",
                    fieldDescription: "Type of the NOTAM",
                    editable: true,
                    placeholder: "Specify the NOTAM Type",
                    value: widget.element?.type,
                  ),
                ),
                Expanded(
                  flex: 30,
                  child: DateTimeWidget(
                    key: start_dateWidgetKey,
                    fieldName: "Start Date",
                    fieldDescription: "Start Date of the NOTAM",
                    editable: true,
                    placeholder: "Select the Start Date",
                    value: widget.element?.start_date,
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: DateTimeWidget(
                    key: end_dateWidgetKey,
                    fieldName: "End Date",
                    fieldDescription: "End Date of the NOTAM",
                    editable: true,
                    placeholder: "Select the End Date",
                    value: widget.element?.end_date,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 100,
                  child: StringWidget(
                    key: issuing_authorityWidgetKey,
                    fieldName: "Issuing Authority",
                    fieldDescription: "Authority issuing the NOTAM",
                    editable: true,
                    placeholder: "Specify the Issuing Authority",
                    value: widget.element?.issuing_authority,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 100,
                  child: StringWidget(
                    key: statusWidgetKey,
                    fieldName: "Status",
                    fieldDescription: "Status of the NOTAM",
                    editable: true,
                    placeholder: "Specify the NOTAM Status",
                    value: widget.element?.status,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 50,
                  child: StringWidget(
                    key: referenceWidgetKey,
                    fieldName: "Reference",
                    fieldDescription: "Reference information for the NOTAM",
                    editable: true,
                    placeholder: "Provide a Reference",
                    value: widget.element?.reference,
                  ),
                ),
                Expanded(
                  flex: 50,
                  child: MapWidget(
                      key: areaWidgetKey,
                      fieldName: "Area",
                      fieldDescription: "Geographical Area of the NOTAM",
                      editable: true,
                      placeholder: "Define the Area for the NOTAM",
                      value: widget.element?.area ??
                          Polygon(
                              type: "Feature",
                              geometry: GeometryPolygon(
                                  coordinates: [], type: "Polygon"),
                              properties: {}),
                      uspaceMap: false),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          dynamic updatedarea = areaWidgetKey.currentState?.getUpdatedValue();

          updatedarea = Polygon(
              type: "Feature",
              geometry: GeometryPolygon(
                  coordinates: updatedarea.geometry.coordinates,
                  type: updatedarea.geometry.type),
              properties: updatedarea.properties);

          String? updateddescription =
              descriptionWidgetKey.currentState?.getUpdatedValue();

          DateTime? updatedend_date =
              end_dateWidgetKey.currentState?.getUpdatedValue();

          String? updatedissuing_authority =
              issuing_authorityWidgetKey.currentState?.getUpdatedValue();

          String? updatedname = nameWidgetKey.currentState?.getUpdatedValue();

          String? updatedreference =
              referenceWidgetKey.currentState?.getUpdatedValue();

          DateTime? updatedstart_date =
              start_dateWidgetKey.currentState?.getUpdatedValue();

          String? updatedstatus =
              statusWidgetKey.currentState?.getUpdatedValue();

          String? updatedtype = typeWidgetKey.currentState?.getUpdatedValue();

          NOTAM updatedNOTAM = widget.element ??
              NOTAM(
                area: updatedarea ?? '',
                description: updateddescription ?? '',
                end_date: updatedend_date ?? DateTime.now(),
                issuing_authority: updatedissuing_authority ?? '',
                name: updatedname ?? '',
                reference: updatedreference ?? '',
                start_date: updatedstart_date ?? DateTime.now(),
                status: updatedstatus ?? '',
                type: updatedtype ?? '',
              );

          updatedNOTAM = updatedNOTAM.copyWith(
              area: updatedarea,
              description: updateddescription,
              end_date: updatedend_date,
              issuing_authority: updatedissuing_authority,
              name: updatedname,
              reference: updatedreference,
              start_date: updatedstart_date,
              status: updatedstatus,
              type: updatedtype);
          var container = ProviderContainer();
          try {
            if (widget.isEditing) {
              await container
                  .read(updateNOTAMProvider(Tuple2(updatedNOTAM, context)));
              print('NOTAM updated successfully');
              CustomSnackBar.show(context, 'NOTAM updated successfully');
            } else {
              await container
                  .read(createNOTAMProvider(Tuple2(updatedNOTAM, context)));
              print('NOTAM created successfully');
              CustomSnackBar.show(context, 'NOTAM created successfully');
            }
          } catch (error) {
            print('Failed to update NOTAM: $error');
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

class NOTAMFieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final String? value;

  const NOTAMFieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
  }) : super(key: key);

  @override
  NOTAMFieldWidgetState createState() => NOTAMFieldWidgetState();
}

class NOTAMFieldWidgetState extends State<NOTAMFieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late String? initialValue;
  late String currentValue;
  late List<NOTAM> options;

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  Future<void> initializeValues() async {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue ?? '';
    NOTAM notam = await container.read(getNOTAMProvider(widget.value!).future);
    _typeAheadController.text = '${notam.name} <id: ${notam.id}>';
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
                          child: TypeAheadField<NOTAM>(
                            controller: _typeAheadController,
                            suggestionsCallback: (String pattern) async {
                              final notamPaginationData = await container.read(
                                  getAllNOTAMProvider(container
                                          .read(notamPaginationProvider))
                                      .future);
                              final options = notamPaginationData.items;
                              return options
                                  .where((notam) =>
                                      notam.name!
                                          .toLowerCase()
                                          .contains(pattern.toLowerCase()) ||
                                      notam.id
                                          .toString()
                                          .contains(pattern.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, notam) {
                              return ListTile(
                                title: Text('${notam.name} <id: ${notam.id}>'),
                              );
                            },
                            onSelected: (NOTAM value) {
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
                NOTAM notam = await container
                    .read(getNOTAMProvider(widget.value!).future);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NOTAMWidget(element: notam, isEditing: true),
                  ),
                );
              } catch (error) {
                print('Failed to fetch notam: $error');
              }
            },
            child: const Text('View NOTAM'),
          ),
        ),
      ],
    );
  }
}

class NOTAMMultiFieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final List<String>? values;

  const NOTAMMultiFieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.values,
  }) : super(key: key);

  @override
  NOTAMMultiFieldWidgetState createState() => NOTAMMultiFieldWidgetState();
}

class NOTAMMultiFieldWidgetState extends State<NOTAMMultiFieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late List<String> initialValues = [];
  late List<String> currentValues = [];
  late List<NOTAM> options = [];

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
      List<NOTAM> notamList = await Future.wait(
        (widget.values ?? []).where((value) => value != '').map((value) async {
          return await container.read(getNOTAMProvider(value).future);
        }),
      );
      String concatenatedText = '${notamList.map((notam) {
        return '${notam.name} <id: ${notam.id}>';
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
                          child: TypeAheadField<NOTAM>(
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
                                  .read(notamPaginationProvider.notifier)
                                  .setFilters({
                                'id': {'\$nin': currentValues}
                              });
                              final notamPaginationData = await container.read(
                                  getAllNOTAMProvider(container
                                          .read(notamPaginationProvider))
                                      .future);
                              final options = notamPaginationData.items;
                              return options
                                  .where((notam) =>
                                      notam.name!
                                          .toLowerCase()
                                          .contains(inputParts.toLowerCase()) ||
                                      notam.id
                                          .toString()
                                          .toLowerCase()
                                          .contains(inputParts.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, notam) {
                              return ListTile(
                                title: Text('${notam.name} <id: ${notam.id}>'),
                              );
                            },
                            onSelected: (NOTAM value) async {
                              isValueChanged =
                                  !initialValues.contains(value.id);
                              currentValues.add(value.id!);

                              List<NOTAM> notamList = await Future.wait(
                                  (currentValues)
                                      .where((value) => value != '')
                                      .map((value) async {
                                return await container
                                    .read(getNOTAMProvider(value).future);
                              }));
                              String concatenatedText =
                                  '${notamList.map((notam) {
                                return '${notam.name} <id: ${notam.id}>';
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
                    builder: (context) => NOTAMListView(extraFilters: query),
                  ),
                );
              } catch (error) {
                print('Failed to fetch notams: $error');
              }
            },
            child: const Text('View NOTAMs'),
          ),
        ),
      ],
    );
  }
}

// **************************************************************************
// HomeWidgetElementGenerator
// **************************************************************************

class NOTAMHomeWidget extends StatelessWidget {
  const NOTAMHomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NOTAMListView()),
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
              'assets/notam.png',
              width: 40.0,
              height: 40.0,
              color: Colors.white,
            ),
            const SizedBox(height: 8.0),
            const Text(
              "NOTAM",
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

NOTAM _$NOTAMFromJson(Map<String, dynamic> json) => NOTAM(
      area: Polygon.fromJson(json['area'] as Map<String, dynamic>),
      description: json['description'] as String?,
      end_date: DateTime.parse(json['end_date'] as String),
      id: json['id'] as String?,
      issuing_authority: json['issuing_authority'] as String?,
      name: json['name'] as String,
      reference: json['reference'] as String?,
      start_date: DateTime.parse(json['start_date'] as String),
      status: json['status'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$NOTAMToJson(NOTAM instance) => <String, dynamic>{
      'area': instance.area,
      'description': instance.description,
      'end_date': instance.end_date.toIso8601String(),
      'id': instance.id,
      'issuing_authority': instance.issuing_authority,
      'name': instance.name,
      'reference': instance.reference,
      'start_date': instance.start_date.toIso8601String(),
      'status': instance.status,
      'type': instance.type,
    };

// **************************************************************************
// ListWidgetGenerator
// **************************************************************************

class NOTAMListView extends ConsumerStatefulWidget {
  final Map<String, dynamic>? extraFilters;
  final Map<String, dynamic> currentFilters = {};
  late bool _initialized = false;
  late List<bool> selectedStates;

  NOTAMListView({Key? key, this.extraFilters}) : super(key: key);

  @override
  _NOTAMListViewState createState() => _NOTAMListViewState();
}

class _NOTAMListViewState extends ConsumerState<NOTAMListView> {
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
          .read(notamPaginationProvider.notifier)
          .setFilters(widget.extraFilters!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final paginationState = ref.watch(notamPaginationProvider);

    final notamsAsyncValue = ref.watch(getAllNOTAMProvider(paginationState));

    final Map<String, int> columnSortStates =
        ref.watch(notamPaginationProvider.notifier).getOrders();

    final Map<String, dynamic> fieldsFilterStates =
        ref.watch(notamPaginationProvider.notifier).getFilters();

    void onSort(String columnName) {
      var state = columnSortStates[columnName];
      if (state == 0 || state == null) {
        columnSortStates[columnName] = 1;
      } else if (state == 1) {
        columnSortStates[columnName] = -1;
      } else if (state == -1) {
        columnSortStates.remove(columnName);
      }
      ref.read(notamPaginationProvider.notifier).setOrders(columnSortStates);
    }

    void onFilter(String fieldName, dynamic filterValue) {
      widget.currentFilters[fieldName] = filterValue;
      ref
          .read(notamPaginationProvider.notifier)
          .setFilters(widget.currentFilters);
    }

    void onFilterRemove(String fieldName, dynamic filterValue) {
      if (widget.currentFilters.containsKey(fieldName)) {
        widget.currentFilters.remove(fieldName);
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('NOTAM List'),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NOTAMWidget(
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
                child: const Text('Create NOTAM'),
              ),
            ),
          ],
        ),
        body: notamsAsyncValue.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
          data: (NOTAMPaginationData data) {
            final notams = data.items;

            if (!widget._initialized) {
              widget.selectedStates =
                  List.generate(notams.length, (index) => false);
              widget._initialized = true;
            }

            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomSearchBar(
                    fields: const {
                      'area': 'Polygon',
                      'description': 'String?',
                      'end_date': 'DateTime',
                      'id': 'String?',
                      'issuing_authority': 'String?',
                      'name': 'String',
                      'reference': 'String?',
                      'start_date': 'DateTime',
                      'status': 'String?',
                      'type': 'String?'
                    },
                    filters: fieldsFilterStates,
                    onFilterChanged: onFilter,
                    onFilterRemove: onFilterRemove,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    IconButton(
                      icon: const Icon(Icons.refresh, color: Colors.grey),
                      onPressed: () {
                        ref.read(notamPaginationProvider.notifier).setPage(1);
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

                                List<NOTAM> selectedNOTAMs = selectedIndices
                                    .map((index) => notams[index])
                                    .toList();
                                _onDeleteElement(
                                    selectedNOTAMs, ref, paginationState);
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
                                                'Type',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates['type'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates['type'] == 1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('type') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('type')},
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Start Date',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates[
                                                      'start_date'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates[
                                                              'start_date'] ==
                                                          1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('start_date') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('start_date')},
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'End Date',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates[
                                                      'end_date'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates[
                                                              'end_date'] ==
                                                          1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('end_date') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('end_date')},
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Issuing Authority',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates[
                                                      'issuing_authority'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates[
                                                              'issuing_authority'] ==
                                                          1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('issuing_authority') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('issuing_authority')},
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Status',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates['status'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates['status'] ==
                                                          1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('status') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('status')},
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Reference',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates[
                                                      'reference'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates[
                                                              'reference'] ==
                                                          1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('reference') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('reference')},
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Area',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 94, 54, 54)),
                                                textAlign: TextAlign.center,
                                              ),
                                              if (columnSortStates['area'] !=
                                                  null) ...[
                                                Icon(
                                                  columnSortStates['area'] == 1
                                                      ? Icons
                                                          .arrow_drop_up_rounded
                                                      : Icons
                                                          .arrow_drop_down_rounded,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                  '${columnSortStates.keys.toList().indexOf('area') + 1}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        onSort: (columnIndex, ascending) =>
                                            {onSort('area')},
                                      ),
                                    ],
                                    rows: List<DataRow>.generate(notams.length,
                                        (index) {
                                      var notam = notams[index];

                                      return DataRow(
                                        selected: widget.selectedStates[index],
                                        cells: [
                                          DataCell(
                                            Center(
                                                child: Text(
                                                    notam.name.toString())),
                                            onTap: () =>
                                                {_navigateElement(notam)},
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text(notam.description
                                                    .toString())),
                                            onTap: () =>
                                                {_navigateElement(notam)},
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text(
                                                    notam.type.toString())),
                                            onTap: () =>
                                                {_navigateElement(notam)},
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text(notam.start_date
                                                    .toString())),
                                            onTap: () =>
                                                {_navigateElement(notam)},
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text(
                                                    notam.end_date.toString())),
                                            onTap: () =>
                                                {_navigateElement(notam)},
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text(notam
                                                    .issuing_authority
                                                    .toString())),
                                            onTap: () =>
                                                {_navigateElement(notam)},
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text(
                                                    notam.status.toString())),
                                            onTap: () =>
                                                {_navigateElement(notam)},
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text(notam.reference
                                                    .toString())),
                                            onTap: () =>
                                                {_navigateElement(notam)},
                                          ),
                                          DataCell(
                                            Center(
                                                child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        MapScreenView(
                                                            PolygonView(
                                                                notam
                                                                    .area!
                                                                    .geometry
                                                                    .coordinates,
                                                                notam.area!
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
                                                "Polygon",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            )),
                                            onTap: () =>
                                                {_navigateElement(notam)},
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
      NOTAMPaginationState paginationState, int maxPages) {
    if (pageNumber <= maxPages) {
      ref.read(notamPaginationProvider.notifier).setPage(pageNumber);
    }
  }

  void _navigateElement(NOTAM notam) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => NOTAMWidget(element: notam, isEditing: true)),
    );
  }

  void _onDeleteElement(
      List<NOTAM> notams, WidgetRef ref, NOTAMPaginationState paginationState) {
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
                _deleteRecords(notams, ref, paginationState);
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

  Future<void> _deleteRecords(List<NOTAM> notams, WidgetRef ref,
      NOTAMPaginationState paginationState) async {
    for (var notam in notams) {
      await ref.read(deleteNOTAMProvider(notam.id!).future);
    }
    setState(() {
      widget._initialized = false;
    });
    ref.read(notamPaginationProvider.notifier).setPage(1);
  }
}

class NOTAMPaginationState {
  final Tuple2<int, int> pagination;
  final Map<String, int> orders;
  final Map<String, dynamic> filters;

  NOTAMPaginationState({
    required this.pagination,
    required this.orders,
    required this.filters,
  });
}

class NOTAMPaginationNotifier extends StateNotifier<NOTAMPaginationState> {
  NOTAMPaginationNotifier()
      : super(NOTAMPaginationState(
          pagination: const Tuple2<int, int>(0, 10),
          orders: {},
          filters: {},
        ));

  void setPage(int page) {
    state = NOTAMPaginationState(
      pagination: Tuple2(page * state.pagination.item2 - state.pagination.item2,
          state.pagination.item2),
      orders: state.orders,
      filters: state.filters,
    );
  }

  void setOrders(Map<String, int> newOrders) {
    state = NOTAMPaginationState(
      pagination: Tuple2(state.pagination.item1, state.pagination.item2),
      orders: newOrders,
      filters: state.filters,
    );
  }

  void setFilters(Map<String, dynamic> newFilters) {
    state = NOTAMPaginationState(
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

final notamPaginationProvider =
    StateNotifierProvider<NOTAMPaginationNotifier, NOTAMPaginationState>(
  (ref) => NOTAMPaginationNotifier(),
);

// **************************************************************************
// RiverpodCustomGenerator
// **************************************************************************

final getNOTAMProvider =
    FutureProvider.autoDispose.family<NOTAM, String>((ref, notamId) async {
  final json = await http.get(Uri.parse('$baseURL/notam/$notamId'));
  final jsonData = jsonDecode(json.body);
  return NOTAM.fromJson(jsonData);
});

final createNOTAMProvider = FutureProvider.autoDispose
    .family<void, Tuple2<NOTAM, BuildContext>>((ref, tuple) async {
  NOTAM notamInstance = tuple.item1;
  BuildContext context = tuple.item2;

  final response = await http.post(
    Uri.parse('$baseURL/notam'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(notamInstance.toJson()),
  );
  if (response.statusCode != 200) {
    CustomSnackBar.show(context, jsonDecode(response.body)['detail']);
  }
});

final updateNOTAMProvider = FutureProvider.autoDispose
    .family<void, Tuple2<NOTAM, BuildContext>>((ref, tuple) async {
  NOTAM notamInstance = tuple.item1;
  BuildContext context = tuple.item2;

  final response = await http.put(
    Uri.parse('$baseURL/notam/${notamInstance.id}'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(notamInstance.toJson()),
  );
  if (response.statusCode != 200) {
    CustomSnackBar.show(context, jsonDecode(response.body)['detail']);
  }
});

final deleteNOTAMProvider =
    FutureProvider.autoDispose.family<void, String>((ref, notamId) async {
  final response = await http.delete(
    Uri.parse('$baseURL/notam/$notamId'),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to delete NOTAM');
  }
});

class NOTAMPaginationData {
  final List<NOTAM> items;
  final int currentPage;
  final int maxPages;

  NOTAMPaginationData({
    required this.items,
    required this.currentPage,
    required this.maxPages,
  });
}

final getAllNOTAMProvider = FutureProvider.autoDispose
    .family<NOTAMPaginationData, NOTAMPaginationState>((ref, state) async {
  final fixedQuery = {
    if (state.orders.isNotEmpty) 'orders': state.orders,
    if (state.filters.isNotEmpty)
      'filters': Map.from(state.filters)
        ..removeWhere((key, value) => value == null || value == ''),
  };

  final json = await http.post(
      Uri.parse(
          '$baseURL/notams?skip=${state.pagination.item1}&limit=${state.pagination.item2}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(fixedQuery));
  final jsonData = jsonDecode(json.body);

  return NOTAMPaginationData(
    items: (jsonData['items'] as List)
        .map((data) => NOTAM.fromJson(data))
        .toList(),
    currentPage: jsonData['current_page'],
    maxPages: jsonData['max_pages'],
  );
});
