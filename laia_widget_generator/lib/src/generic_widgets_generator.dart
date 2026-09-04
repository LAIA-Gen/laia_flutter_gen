// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:laia_annotations/laia_annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:laia_widget_generator/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

class GenericWidgetsGenerator extends GeneratorForAnnotation<GenericWidgetsGenAnnotation> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final buffer = StringBuffer();
    final visitor = ModelVisitor();
    element.visitChildren(visitor);

// **************************************************************************
// General
// **************************************************************************

    buffer.writeln('''
class CustomSnackBar {
  static void show(BuildContext context, String? message) {
    final snackBar = SnackBar(
      content: Text(message ?? ''),
      backgroundColor: Styles.buttonPrimaryColorHover,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class FormValidationScope extends InheritedWidget {
  final bool showErrors;

  const FormValidationScope({
    Key? key,
    required this.showErrors,
    required Widget child,
  }) : super(key: key, child: child);

  static bool of(BuildContext context) {
    final FormValidationScope? result =
        context.dependOnInheritedWidgetOfExactType<FormValidationScope>();
    return result?.showErrors ?? false;
  }

  @override
  bool updateShouldNotify(FormValidationScope oldWidget) {
    return showErrors != oldWidget.showErrors;
  }
}

class KeepAliveWrapper extends StatefulWidget {
  final Widget child;

  const KeepAliveWrapper({Key? key, required this.child}) : super(key: key);

  @override
  _KeepAliveWrapperState createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
''');

    // **************************************************************************
    // Tab Controller
    // **************************************************************************

    buffer.writeln('''
class GenericTabsWidget extends StatelessWidget {
  final List<String> tabLabels;
  final List<Widget> tabViews;

  const GenericTabsWidget({
    Key? key,
    required this.tabLabels,
    required this.tabViews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabLabels.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            tabs: tabLabels.map((label) => Tab(text: label)).toList(),
          ),
          Expanded(
            child: TabBarView(
              children: tabViews,
            ),
          ),
        ],
      ),
    );
  }
}
''');

// **************************************************************************
// IntWidget
// **************************************************************************

    buffer.writeln('''
class IntWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool isRequired;
  final bool editable;
  final String placeholder;
  final int? value;

  const IntWidget({
    Key? key,
    required this.fieldName,
    this.isRequired = false,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
  }) : super(key: key);

  @override
  IntWidgetState createState() => IntWidgetState();
}

class IntWidgetState extends State<IntWidget> {
  bool isValueChanged = false;
  late int? initialValue;
  late String currentValue;
  bool showValidationError = false;

  @override
  void initState() {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue.toString();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (FormValidationScope.of(context)) {
      validate();
    }
  }

  int? getUpdatedValue() {
    return isValueChanged ? int.tryParse(currentValue) : initialValue;
  }

  bool validate() {
    if (widget.isRequired) {
      final value = getUpdatedValue();
      if (value == null || currentValue.trim().isEmpty || currentValue == 'null') {
        setState(() {
          showValidationError = true;
        });
        return false;
      }
    }
    setState(() {
      showValidationError = false;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.surface
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\${widget.fieldName}:",
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
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            ],
                            decoration: InputDecoration(
                              filled: true,
                              hintText: widget.placeholder,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: AppColors.muted,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: AppColors.muted,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: AppColors.indigo,
                                  width: 1.2,
                                ),
                              ),
                              fillColor: widget.isRequired ? (showValidationError ? AppColors.indigo.withOpacity(0.12) : AppColors.surface) : AppColors.surface,
                              focusColor: AppColors.surface,
                              hoverColor: AppColors.surface
                            ),
                            initialValue: widget.value?.toString(),
                            onChanged: (newValue) {
                              setState(() {
                                isValueChanged = newValue != initialValue.toString();
                                currentValue = newValue;
                                showValidationError = false;
                              });
                            },
                          ),
                        )
                      : Text(widget.value?.toString() ?? widget.placeholder),
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
      ],
    );
  }
}
        ''');

    // **************************************************************************
    // MapWidget
    // **************************************************************************

    buffer.writeln(
      '''
class MapWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final Feature value;
  final bool uspaceMap;

  const MapWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
    this.uspaceMap = false
  }) : super(key: key);

  @override
  MapWidgetState createState() => MapWidgetState();
}

class MapWidgetState extends State<MapWidget> {
  late List<TextEditingController> textControllers;
  late bool isPointType;
  late bool isLineStringType;
  late bool isPolygonType;
  late bool isMultiPointType;
  late bool isMultiLineStringType;
  late bool isMultiPolygonType;
  bool isValueChanged = false;
  Feature? initialValue;
  Feature? currentValue;
  Geometry? geometry;

  @override
  void initState() {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue;
    geometry = widget.value.geometry;
    isPointType = widget.value.geometry.type == 'Point';
    isLineStringType = widget.value.geometry.type == 'LineString';
    isPolygonType = widget.value.geometry.type == 'Polygon';
    isMultiPointType = widget.value.geometry.type == 'MultiPoint';
    isMultiLineStringType = widget.value.geometry.type == 'MultiLineString';
    isMultiPolygonType = widget.value.geometry.type == 'MultiPolygon';
    updateTextControllers();
  }

  void updateTextControllers() {
    textControllers = List.generate(
      isPointType
        ? 1
        : isLineStringType
          ? (geometry?.coordinates?.length ?? 0)
          : isPolygonType
            ? (geometry?.coordinates?.length ?? 0)
            : isMultiPointType
              ? (geometry?.coordinates?.length ?? 0)
              : isMultiLineStringType
                ? (geometry?.coordinates?.length ?? 0)
                : isMultiPolygonType
                  ? (geometry?.coordinates?.length ?? 0)
                  : 0,
      (index) => TextEditingController(
        text: isPointType ? 
            geometry?.coordinates.toString() :
          isLineStringType ?
            geometry?.coordinates[index].toString() :
          isPolygonType ?
            geometry?.coordinates[index].toString() :
          isMultiPointType ?
            geometry?.coordinates[index].toString() :
          isMultiLineStringType ? 
            geometry?.coordinates[index].toString() :
          isMultiPolygonType ?
            geometry?.coordinates[index].toString() :
            "",
      ),
    );
  }

  Feature? getUpdatedValue() {
    return isValueChanged ? currentValue : initialValue;
  }

  bool validate() {
    return true;
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Styles.secondaryColor
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\${widget.fieldName}:",
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
                          child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxHeight: 300, 
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: DataTable(
                              columns: const [
                                DataColumn(label: Text('Coordinates')),
                                DataColumn(
                                  label: SizedBox(),
                                  numeric: true,
                                ), 
                              ],
                              rows: List<DataRow>.generate(
                                    isPointType
                                      ? 1
                                      : isLineStringType
                                        ? (geometry?.coordinates?.length ?? 0)
                                        : isPolygonType
                                          ? (geometry?.coordinates?.length ?? 0)
                                          : isMultiPointType
                                            ? (geometry?.coordinates?.length ?? 0)
                                            : isMultiLineStringType
                                              ? (geometry?.coordinates?.length ?? 0)
                                              : isMultiPolygonType
                                                ? (geometry?.coordinates?.length ?? 0)
                                                : 0,
                                    (index) => DataRow(
                                      cells: [
                                        DataCell(
                                          TextFormField(
                                            decoration: InputDecoration(
                                              hintText: widget.placeholder,
                                            ),
                                            controller: textControllers[index],
                                            onChanged: (newValue) {
                                              setState(() {
                                                if (isPointType) {
                                                  List<String>
                                                      coordinateStrings =
                                                      newValue
                                                          .replaceAll('[', '')
                                                          .replaceAll(']', '')
                                                          .split(',');
                                                  List<double> coordinates =
                                                      coordinateStrings
                                                          .map((str) =>
                                                              double.parse(str))
                                                          .toList();
                                                  geometry = geometry?.copyWith(coordinates: coordinates);
                                                } else if (isLineStringType || isMultiPointType) {
                                                  List<String> coordinateStrings = newValue
                                                        .replaceAll('[', '') 
                                                        .replaceAll(']', '')
                                                        .split(','); 
                                                  List<double> coordinates = coordinateStrings.map((str) => double.parse(str)).toList();

                                                  geometry?.coordinates[index] =
                                                      coordinates;
                                                } else if (isPolygonType || isMultiLineStringType) {
                                                  List<String> ringStrings = newValue.split(RegExp(r'\\\s*\\\],\\\s*\\\[')); 
                                                  List<List<double>> polygonCoordinates = [];
                                                  for (String ringString in ringStrings) {
                                                      List<String> coordinateStrings = ringString.replaceAll('[', '').replaceAll(']', '').split(',');
                                                      List<double> coordinates = coordinateStrings.map((str) => double.parse(str.trim())).toList();
                                                      polygonCoordinates.add(coordinates);
                                                  }
                                                  geometry?.coordinates[index] = polygonCoordinates;

                                                } else if (isMultiPolygonType) {
                                                  List<String> polygonStrings =
                                                      newValue.split(RegExp(r'\\\s*\\\]\\\s*\\\],\\\s*\\\[\\\s*\\\['));
                                                  List<List<List<double>>> multiPolygonCoordinates = [];
                                                  for (String polygonString in polygonStrings) {
                                                      List<String> ringStrings =
                                                          polygonString.split(RegExp(r'\\\s*\\\],\\\s*\\\['));
                                                      List<List<double>> polygonCoordinates = [];
                                                      for (String ringString in ringStrings) {
                                                          List<String> coordinateStrings =
                                                              ringString.replaceAll('[', '').replaceAll(']', '').split(',');
                                                          List<double> coordinates = coordinateStrings
                                                              .map((str) => double.parse(str.trim()))
                                                              .toList();
                                                          polygonCoordinates.add(coordinates);
                                                      }
                                                      multiPolygonCoordinates.add(polygonCoordinates);
                                                  }
                                                  geometry?.coordinates[index] = multiPolygonCoordinates;
                                                }
                                                currentValue = currentValue?.copyWith(geometry: geometry);
                                                if (currentValue != initialValue) {
                                                  isValueChanged = true;
                                                } else {
                                                  isValueChanged = false;
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                        DataCell(
                                          IconButton(
                                            icon: const Icon(Icons.delete_outline),
                                            onPressed: () {
                                              setState(() {
                                                if (isPointType) {
                                                  geometry = geometry?.copyWith(coordinates: [0.0,0.0]);
                                                  currentValue = currentValue?.copyWith(geometry: geometry);
                                                  updateTextControllers();
                                                 } else {
                                                  geometry?.coordinates
                                                      .removeAt(index);
                                                  currentValue =
                                                      currentValue?.copyWith(
                                                          geometry: geometry);
                                                  updateTextControllers();
                                                }
                                                if (currentValue != initialValue) {
                                                  isValueChanged = true;
                                                } else {
                                                  isValueChanged = false;
                                                }
                                              });
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        )
                      )
                    : Text(widget.value.toString()),
                    if (widget.editable)
                    if (isLineStringType || isPolygonType || isMultiPointType || isMultiLineStringType || isMultiPolygonType)
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            if (isLineStringType || isMultiPointType) {
                              geometry?.coordinates.add(<double>[]);
                              updateTextControllers();
                            } else if (isPolygonType || isMultiLineStringType) {
                              geometry?.coordinates.add(<List<double>>[]);
                              updateTextControllers();
                            } else if (isMultiPolygonType) {
                              geometry?.coordinates.add(<List<List<double>>>[]);
                              updateTextControllers();
                            }
                            if (currentValue != initialValue) {
                              isValueChanged = true;
                            } else {
                              isValueChanged = false;
                            }
                          });
                        },
                      ),
                ],
              ),
              if (geometry != null && currentValue != null)
                if (isPointType)
                  PointView(currentValue?.geometry.coordinates, currentValue?.properties, 200, widget.uspaceMap),
                if (isLineStringType)
                  LineStringView(currentValue?.geometry.coordinates,
                      currentValue?.properties, 200, widget.uspaceMap),
                if (isPolygonType)
                  PolygonView(currentValue?.geometry.coordinates,
                      currentValue?.properties, 200, widget.uspaceMap),
                if (isMultiPointType) 
                  MultiPointView(currentValue?.geometry.coordinates,
                      currentValue?.properties, 200, widget.uspaceMap),
                if (isMultiLineStringType) 
                  MultiLineStringView(currentValue?.geometry.coordinates,
                      currentValue?.properties, 200, widget.uspaceMap),
                if (isMultiPolygonType)
                  MultiPolygonView(currentValue?.geometry.coordinates,
                      currentValue?.properties, 200, widget.uspaceMap),
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
        if (isPointType)
          Positioned(
            top: 0,
            right: 0,
            child: ElevatedButton(
              onPressed: () {
                showPointView(context, widget.value);
              },
              child: const Text('Map'),
            ),
          ),
        if (isLineStringType)
          Positioned(
            top: 0,
            right: 0,
            child: ElevatedButton(
              onPressed: () {
                showLineStringView(context, widget.value);
              },
              child: const Text('Show Route'),
            ),
          ),
        if (isPolygonType)
          Positioned(
            top: 0,
            right: 0,
            child: ElevatedButton(
              onPressed: () {
                showPolygonView(context, widget.value);
              },
              child: const Text('Show Area'),
            ),
          ),
        if (isMultiPointType)
          Positioned(
            top: 0,
            right: 0,
            child: ElevatedButton(
              onPressed: () {
                showMultiPointView(context, widget.value);
              },
              child: const Text('Show Points'),
            ),
          ),
        if (isMultiLineStringType)
          Positioned(
            top: 0,
            right: 0,
            child: ElevatedButton(
              onPressed: () {
                showMultiLineStringView(context, widget.value);
              },
              child: const Text('Show Lines'),
            ),
          ),
        if (isMultiPolygonType)
          Positioned(
            top: 0,
            right: 0,
            child: ElevatedButton(
              onPressed: () {
                showMultiPolygonView(context, widget.value);
              },
              child: const Text('Show Areas'),
            ),
          ),
      ],
    );
  }

 void showPointView(BuildContext context, Feature? point) {
    List<double> doubleCoordinates = point?.geometry.coordinates;
    dynamic properties = point?.properties;
  
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MapScreenView(PointView(doubleCoordinates, properties, MediaQuery.of(context).size.height, widget.uspaceMap)),
    ));
  }

  void showLineStringView(BuildContext context, Feature? points) {
    List<List<double>> routeCoordinates = points?.geometry.coordinates;
    dynamic properties = points?.properties;

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MapScreenView(LineStringView(routeCoordinates, properties, MediaQuery.of(context).size.height, widget.uspaceMap)),
    ));
  }

  void showPolygonView(BuildContext context, Feature? points) {
    List<List<List<double>>> polygonCoordinates = points?.geometry.coordinates;
    dynamic properties = points?.properties;

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MapScreenView(PolygonView(
          polygonCoordinates, properties, MediaQuery.of(context).size.height, widget.uspaceMap)),
    ));
  }

  void showMultiPointView(BuildContext context, Feature? points) {
    List<List<double>> routeCoordinates = points?.geometry.coordinates;
    dynamic properties = points?.properties;

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MapScreenView(MultiPointView(
          routeCoordinates, properties, MediaQuery.of(context).size.height, widget.uspaceMap)),
    ));
  }

  void showMultiLineStringView(BuildContext context, Feature? points) {
    List<List<List<double>>> routeCoordinates = points?.geometry.coordinates;
    dynamic properties = points?.properties;

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MapScreenView(MultiLineStringView(
          routeCoordinates, properties, MediaQuery.of(context).size.height, widget.uspaceMap)),
    ));
  }

  void showMultiPolygonView(BuildContext context, Feature? points) {
    List<List<List<List<double>>>> routeCoordinates = points?.geometry.coordinates;
    dynamic properties = points?.properties;

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MapScreenView(MultiPolygonView(
          routeCoordinates, properties, MediaQuery.of(context).size.height, widget.uspaceMap)),
    ));
  }
}

class MapScreenView extends StatelessWidget {
  final StatelessWidget widget;

  const MapScreenView(this.widget, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: const Text('Map View'),
          ),
          body: widget
        );
  }
}

class EnaireMapLayers {
  static List<FeatureLayer> getLayers() {
    return [
      FeatureLayer(
        FeatureLayerOptions(
          "https://servais.enaire.es/insigniad/rest/services/NOTAM/NOTAM_DRONES_APP_V1_Local/MapServer/0",
          "polygon",
          render: (dynamic attributes) {
            return PolygonOptions(
              borderColor: Colors.green.withOpacity(0.5),
              color: Colors.green.withOpacity(0.2),
              borderStrokeWidth: 2,
              isFilled: true,
            );
          },
          onTap: (attributes, LatLng location) {},
        ),
      ),
      FeatureLayer(
        FeatureLayerOptions(
          "https://servais.enaire.es/insigniad/rest/services/NSF_APP/Drones_APP_V1_Local/MapServer/1",
          "polygon",
          render: (dynamic attributes) {
            return PolygonOptions(
              borderColor: Colors.red.withOpacity(0.5),
              color: Colors.red.withOpacity(0.1),
              borderStrokeWidth: 2,
              isFilled: true,
            );
          },
          onTap: (attributes, LatLng location) {},
        ),
      ),
      FeatureLayer(
        FeatureLayerOptions(
          "https://servais.enaire.es/insigniad/rest/services/NSF_APP/Drones_APP_V1_Local/MapServer/2",
          "polygon",
          render: (dynamic attributes) {
            return PolygonOptions(
              borderColor: Colors.yellow.withOpacity(0.5),
              color: Colors.yellow.withOpacity(0.2),
              borderStrokeWidth: 2,
              isFilled: true,
            );
          },
          onTap: (attributes, LatLng location) {},
        ),
      ),
    ];
  }
}

class PointView extends StatelessWidget {
  final List<double> coordinates;
  final dynamic properties;
  final double height;
  final bool uspaceMap;

  const PointView(this.coordinates, this.properties, this.height, this.uspaceMap, {super.key});

  String formatProperties(dynamic properties) {
    String message = '';
    properties.forEach((key, value) {
      message += '\$key: \$value'''r'''\n'''r'''';
    });
    return message;
  }

  @override
  Widget build(BuildContext context) {
    List<double> adjustedCoordinates = [...coordinates];

    if (coordinates.length < 2) {
      adjustedCoordinates.addAll([0, 0]);
    }

    return Container(
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: FlutterMap(
                options: MapOptions(
                  center: LatLng(adjustedCoordinates[1], adjustedCoordinates[0]),
                  zoom: 10,
                ),
                children: [
                  TileLayer(
                    urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: const ['a', 'b', 'c'],
                  ),
                  if (uspaceMap)
                    ...EnaireMapLayers.getLayers(),
                  MarkerLayer(
                    markers: [
                      Marker(
                          width: 56,
                          height: 56,
                          point: LatLng(adjustedCoordinates[1], adjustedCoordinates[0]),
                          child: Tooltip(
                            message: formatProperties(properties),
                            child: const Icon(
                              Icons.location_on_outlined,
                              color: Color.fromARGB(255, 214, 166, 146),
                              size: 35,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          );
  }
}

class MultiPointView extends StatelessWidget {
  final List<List<double>> routeCoordinates;
  final dynamic properties;
  final double height;
  final bool uspaceMap;

  const MultiPointView(this.routeCoordinates, this.properties, this.height, this.uspaceMap, 
      {super.key});

  String formatProperties(dynamic properties) {
    String message = '';
    properties.forEach((key, value) {
      message += '\$key: \$value\n';
    });
    return message;
  }

  @override
  Widget build(BuildContext context) {
    List<List<double>> adjustedRouteCoordinates =
        routeCoordinates.where((coord) => coord.length >= 2).toList();

    if (adjustedRouteCoordinates.isEmpty) {
      adjustedRouteCoordinates = [
        [0, 0]
      ];
    }

    return Container(
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(adjustedRouteCoordinates[0][1],
                  adjustedRouteCoordinates[0][0]),
              zoom: 10,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: const ['a', 'b', 'c'],
              ),
              if (uspaceMap)
                ...EnaireMapLayers.getLayers(),
              MarkerLayer(
                markers: adjustedRouteCoordinates
                    .map((coord) => Marker(
                        width: 56,
                        height: 56,
                        point: LatLng(coord[1], coord[0]),
                        child: Tooltip(
                          message: formatProperties(properties),
                          child: const Icon(
                            Icons.location_on_outlined,
                            color: Color.fromARGB(255, 214, 166, 146),
                            size: 35,
                          ),
                        )))
                    .toList(),
              ),
            ],
          ),
        ));
  }
}

class LineStringView extends StatelessWidget {
  final List<List<double>> routeCoordinates;
  final dynamic properties;
  final double height;
  final bool uspaceMap;

  const LineStringView(this.routeCoordinates, this.properties, this.height, this.uspaceMap, {super.key});

  String formatProperties(dynamic properties) {
    String message = '';
    properties.forEach((key, value) {
      message += '\$key: \$value'''r'''\n'''r'''';
    });
    return message;
  }

  @override
  Widget build(BuildContext context) {
    List<List<double>> adjustedRouteCoordinates = routeCoordinates
      .where((coord) => coord.length >= 2)
      .toList();

    if (adjustedRouteCoordinates.isEmpty) {
      adjustedRouteCoordinates = [[0, 0]];
    }

    return Container(
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: FlutterMap(
        options: MapOptions(
          center: LatLng(adjustedRouteCoordinates[0][1], adjustedRouteCoordinates[0][0]),
          zoom: 10,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
          ),
          if (uspaceMap)
            ...EnaireMapLayers.getLayers(),
          PolylineLayer(
            polylines: [
              Polyline(
                points: adjustedRouteCoordinates
                    .map((coord) => LatLng(coord[1], coord[0]))
                    .toList(),
                strokeWidth: 4.0,
                color: const Color.fromARGB(255, 227, 224, 164),
              ),
            ],
          ),
          MarkerLayer(
            markers: adjustedRouteCoordinates
                .map((coord) => Marker(
                    width: 56,
                    height: 56,
                    point: LatLng(coord[1], coord[0]),
                    child: Tooltip(
                      message: formatProperties(properties),
                      child: const Icon(
                        Icons.location_on_outlined,
                        color: Color.fromARGB(255, 214, 166, 146),
                        size: 35,
                      ),
                    )))
                .toList(),
          ),
        ],
      ),
    )
    );
  }
}

class MultiLineStringView extends StatelessWidget {
  final List<List<List<double>>> routeCoordinates;
  final dynamic properties;
  final double height;
  final bool uspaceMap;

  const MultiLineStringView(this.routeCoordinates, this.properties, this.height, this.uspaceMap,
      {super.key});

  String formatProperties(dynamic properties) {
    String message = '';
    properties.forEach((key, value) {
      message += '\$key: \$value\n';
    });
    return message;
  }

  @override
  Widget build(BuildContext context) {
    List<List<List<double>>> adjustedRouteCoordinates =
        routeCoordinates.isNotEmpty
            ? routeCoordinates
                .map((sublist) =>
                    sublist.where((coord) => coord.length >= 2).toList())
                .toList()
            : [
                [
                  [0, 0]
                ]
              ];

    LatLng centroid = const LatLng(0, 0);

    if (adjustedRouteCoordinates.isNotEmpty) {
      var firstPolygon = adjustedRouteCoordinates[0];
      if (firstPolygon.isNotEmpty) {
        centroid = _calculateCentroid(firstPolygon);
      }
    }

    return Container(
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(
                centroid.latitude,
                centroid.longitude,
              ),
              zoom: 8,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: const ['a', 'b', 'c'],
              ),
              if (uspaceMap)
                ...EnaireMapLayers.getLayers(),
              PolylineLayer(
                polylines:adjustedRouteCoordinates
                  .map((line) => Polyline(
                    points: line
                            .map((coord) => LatLng(coord[1], coord[0]))
                            .toList(),
                    strokeWidth: 4.0,
                    color: const Color.fromARGB(255, 227, 224, 164),
                  ),
              ).toList(),),
              MarkerLayer(
                markers: adjustedRouteCoordinates
                  .expand((line) => line.map((coord) => Marker(
                        width: 56,
                        height: 56,
                        point: LatLng(coord[1], coord[0]),
                        child: Tooltip(
                          message: formatProperties(properties),
                          child: const Icon(
                            Icons.location_on_outlined,
                            color: Color.fromARGB(255, 214, 166, 146),
                            size: 35,
                          ),
                        ),
                      )))
                  .toList(),
              ),
            ],
          ),
        ));
  }

  LatLng _calculateCentroid(List<List<double>> polygon) {
    double cx = 0, cy = 0;
    int pointsCount = polygon.length;

    for (var point in polygon) {
      cx += point[0];
      cy += point[1];
    }

    cx /= pointsCount;
    cy /= pointsCount;

    return LatLng(cy, cx);
  }
}

class PolygonView extends StatelessWidget {
  final List<List<List<double>>> routeCoordinates;
  final dynamic properties;
  final double height;
  final bool uspaceMap;

  const PolygonView(this.routeCoordinates, this.properties, this.height, this.uspaceMap, 
      {super.key});

  String formatProperties(dynamic properties) {
    String message = '';
    properties.forEach((key, value) {
      message += '\$key: \$value\n';
    });
    return message;
  }

  @override
  Widget build(BuildContext context) {
    List<List<List<double>>> adjustedRouteCoordinates =
        routeCoordinates.isNotEmpty
            ? routeCoordinates
              .map((sublist) =>
                  sublist.where((coord) => coord.length >= 2).toList())
              .toList()
            : [
                [
                  [0, 0]
                ]
              ];

    LatLng centroid = const LatLng(0, 0);

    if (adjustedRouteCoordinates.isNotEmpty) {
      var firstPolygon = adjustedRouteCoordinates[0];
      if (firstPolygon.isNotEmpty) {
        centroid = _calculateCentroid(firstPolygon);
      }
    }

    return Container(
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(
                centroid.latitude,
                centroid.longitude,
              ),
              zoom: 8,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: const ['a', 'b', 'c'],
              ),
              if (uspaceMap)
                ...EnaireMapLayers.getLayers(),
              PolygonLayer(
                polygons: [
                  flutter_map.Polygon(
                    points: adjustedRouteCoordinates
                      .expand((polygon) => polygon.map((coord) => LatLng(coord[1], coord[0])))
                      .toList(),
                    color: Styles.polygonColor,
                    isFilled: true,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
  LatLng _calculateCentroid(List<List<double>> polygon) {
    double cx = 0, cy = 0;
    int pointsCount = polygon.length;

    for (var point in polygon) {
      cx += point[0];
      cy += point[1];
    }

    cx /= pointsCount;
    cy /= pointsCount;

    return LatLng(cy, cx);
  }
}

class MultiPolygonView extends StatelessWidget {
  final List<List<List<List<double>>>> routeCoordinates;
  final dynamic properties;
  final double height;
  final bool uspaceMap;

  const MultiPolygonView(this.routeCoordinates, this.properties, this.height, this.uspaceMap, 
      {super.key});

  String formatProperties(dynamic properties) {
    String message = '';
    properties.forEach((key, value) {
      message += '\$key: \$value\n';
    });
    return message;
  }

  @override
  Widget build(BuildContext context) {
    List<List<List<List<double>>>> adjustedRouteCoordinates =
        routeCoordinates.isNotEmpty
        ? routeCoordinates
            .map((polygonList) => polygonList
                .map((polygon) => polygon
                    .where((coord) => coord.length >= 2)
                    .toList())
                .toList())
            .toList()
        : [
            [
              [
                [0, 0]
              ]
            ]
          ];

    LatLng centroid = const LatLng(0, 0);

    if (adjustedRouteCoordinates.isNotEmpty) {
      var firstPolygon = adjustedRouteCoordinates[0];
      if (firstPolygon.isNotEmpty) {
        centroid = _calculateCentroid(firstPolygon[0]);
      }
    }

    return Container(
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(
                centroid.latitude,
                centroid.longitude,
              ),
              zoom: 8,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: const ['a', 'b', 'c'],
              ),
              if (uspaceMap)
                ...EnaireMapLayers.getLayers(),
              PolygonLayer(
                polygons: adjustedRouteCoordinates
                    .map(
                      (polygon) => flutter_map.Polygon(
                        points: polygon
                            .expand((subPolygon) =>
                              subPolygon.map((coord) => LatLng(coord[1], coord[0])))
                          .toList(),
                        color: Styles.polygonColor,
                        isFilled: true,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ));
  }

  LatLng _calculateCentroid(List<List<double>> polygon) {
    double cx = 0, cy = 0;
    int pointsCount = polygon.length;

    for (var point in polygon) {
      cx += point[0];
      cy += point[1];
    }

    cx /= pointsCount;
    cy /= pointsCount;

    return LatLng(cy, cx);
  }
}
        ''');

// **************************************************************************
// DefaultWidget
// **************************************************************************


    buffer.writeln('''
class DefaultWidget extends StatefulWidget {
  final Key? key;
  final String fieldName;
  final String fieldDescription;
  final bool isRequired;
  final bool editable;
  final String placeholder;
  final dynamic value;

  DefaultWidget({
    this.key,
    required this.fieldName,
    this.isRequired = false,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
  });

  @override
  DefaultWidgetState createState() => DefaultWidgetState();
}

class DefaultWidgetState extends State<DefaultWidget> {
  bool isValueChanged = false;
  late dynamic initialValue;
  late String currentValue;
  bool showValidationError = false;

  @override
  void initState() {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue.toString();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (FormValidationScope.of(context)) {
      validate();
    }
  }

  dynamic getUpdatedValue() {
    return isValueChanged ? currentValue : initialValue;
  }

  bool validate() {
    if (widget.isRequired) {
      final value = getUpdatedValue();
      if (value == null || currentValue.trim().isEmpty || currentValue == 'null') {
        setState(() {
          showValidationError = true;
        });
        return false;
      }
    }
    setState(() {
      showValidationError = false;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.surface
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\${widget.fieldName}:",
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
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          hintText: widget.placeholder,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: AppColors.muted,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: AppColors.muted,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: AppColors.indigo,
                              width: 1.2,
                            ),
                          ),
                          fillColor: widget.isRequired? (showValidationError ? AppColors.indigo.withOpacity(0.12) : AppColors.surface) : AppColors.surface,
                          focusColor: AppColors.surface,
                          hoverColor: AppColors.surface
                        ),
                        initialValue: widget.value?.toString(),
                        onChanged: (newValue) {
                          setState(() {
                            isValueChanged =
                                newValue != initialValue.toString();
                            currentValue = newValue;
                            showValidationError = false;
                          });
                        },
                      ),
                    )
                  : Text(widget.value?.toString() ?? widget.placeholder),
            ],
          ),
        ],
      ),
    );
  }
}
        ''');

// **************************************************************************
// DoubleWidget
// **************************************************************************

    buffer.writeln('''
class DoubleWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool isRequired;
  final bool editable;
  final String placeholder;
  final double? value;

  const DoubleWidget({
    Key? key,
    required this.fieldName,
    this.isRequired = false,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
  }) : super(key: key);

  @override
  DoubleWidgetState createState() => DoubleWidgetState();
}

class DoubleWidgetState extends State<DoubleWidget> {
  bool isValueChanged = false;
  late double? initialValue;
  late String currentValue;
  bool showValidationError = false;

  @override
  void initState() {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue?.toString() ?? '';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (FormValidationScope.of(context)) {
      validate();
    }
  }

  double? getUpdatedValue() {
    return isValueChanged ? double.tryParse(currentValue) : initialValue;
  }

  bool validate() {
    if (widget.isRequired) {
      final value = getUpdatedValue();
      if (value == null || currentValue.trim().isEmpty || currentValue == 'null') {
        setState(() {
          showValidationError = true;
        });
        return false;
      }
    }
    setState(() {
      showValidationError = false;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.surface
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\${widget.fieldName}:",
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
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                            ],
                            decoration: InputDecoration(
                              filled: true,
                              hintText: widget.placeholder,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: AppColors.muted,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: AppColors.muted,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: AppColors.indigo,
                                  width: 1.2,
                                ),
                              ),
                              fillColor: widget.isRequired? (showValidationError ? AppColors.indigo.withOpacity(0.12) : AppColors.surface) : AppColors.surface,
                              focusColor: AppColors.surface,
                              hoverColor: AppColors.surface
                            ),
                            initialValue: widget.value?.toString(),
                            onChanged: (newValue) {
                              setState(() {
                                isValueChanged = newValue != initialValue.toString();
                                currentValue = newValue;
                                showValidationError = false;
                              });
                            },
                          ),
                        )
                      : Text(widget.value?.toString() ?? widget.placeholder),
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
      ],
    );
  }
}
        ''');

// **************************************************************************
// StringWidget
// **************************************************************************

    buffer.writeln('''
class StringWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool isRequired;
  final bool editable;
  final String placeholder;
  final String? value;
  final List<Widget>? additionalChildren;

  const StringWidget({
    Key? key,
    required this.fieldName,
    this.isRequired = false,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
    this.additionalChildren,
  }) : super(key: key);

  @override
  StringWidgetState createState() => StringWidgetState();
}

class StringWidgetState extends State<StringWidget> {
  bool isValueChanged = false;
  late String? initialValue;
  late String currentValue;
  bool showValidationError = false;

  @override
  void initState() {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue ?? '';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (FormValidationScope.of(context)) {
      validate();
    }
  }

  String? getUpdatedValue() {
    return isValueChanged ? currentValue : initialValue;
  }

  bool validate() {
    if (widget.isRequired) {
      final value = getUpdatedValue();
      if (value == null || currentValue.trim().isEmpty || currentValue == 'null') {
        setState(() {
          showValidationError = true;
        });
        return false;
      }
    }
    setState(() {
      showValidationError = false;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.surface
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\${widget.fieldName}:",
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
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              hintText: widget.placeholder,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: AppColors.muted,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color:  AppColors.muted,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: AppColors.indigo,
                                  width: 1.2,
                                ),
                              ),
                              fillColor: widget.isRequired? (showValidationError ? AppColors.indigo.withOpacity(0.12) : AppColors.surface) : AppColors.surface,
                              focusColor: AppColors.surface,
                              hoverColor: AppColors.surface
                            ),
                            initialValue: widget.value,
                            onChanged: (newValue) {
                              setState(() {
                                isValueChanged = newValue != initialValue;
                                currentValue = newValue;
                                showValidationError = false;
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
        if (widget.additionalChildren != null)
          ...widget.additionalChildren!
      ],
    );
  }
}
        ''');

// **************************************************************************
// TextAreaWidget
// **************************************************************************

    buffer.writeln('''
class TextAreaWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool isRequired;
  final bool editable;
  final String placeholder;
  final String? value;
  final List<Widget>? additionalChildren;

  const TextAreaWidget({
    Key? key,
    required this.fieldName,
    this.isRequired = false,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
    this.additionalChildren,
  }) : super(key: key);

  @override
  TextAreaWidgetState createState() => TextAreaWidgetState();
}

class TextAreaWidgetState extends State<TextAreaWidget> {
  bool isValueChanged = false;
  late String? initialValue;
  late String currentValue;
  bool showValidationError = false;

  @override
  void initState() {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue ?? '';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (FormValidationScope.of(context)) {
      validate();
    }
  }

  String? getUpdatedValue() {
    return isValueChanged ? currentValue : initialValue;
  }

  bool validate() {
    if (widget.isRequired) {
      final value = getUpdatedValue();
      if (value == null || currentValue.trim().isEmpty || currentValue == 'null') {
        setState(() {
          showValidationError = true;
        });
        return false;
      }
    }
    setState(() {
      showValidationError = false;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.surface
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\${widget.fieldName}:",
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
                          child: TextFormField(
                            minLines: 3,
                            maxLines: 5,
                            decoration: InputDecoration(
                              filled: true,
                              hintText: widget.placeholder,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: AppColors.muted,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color:  AppColors.muted,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: AppColors.indigo,
                                  width: 1.2,
                                ),
                              ),
                              fillColor: widget.isRequired? (showValidationError ? AppColors.indigo.withOpacity(0.12) : AppColors.surface) : AppColors.surface,
                              focusColor: AppColors.surface,
                              hoverColor: AppColors.surface
                            ),
                            initialValue: widget.value,
                            onChanged: (newValue) {
                              setState(() {
                                isValueChanged = newValue != initialValue;
                                currentValue = newValue;
                                showValidationError = false;
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
        if (widget.additionalChildren != null)
          ...widget.additionalChildren!
      ],
    );
  }
}
        ''');

// **************************************************************************
// RichTextWidget
// **************************************************************************
    buffer.writeln('''
class RichTextWidget extends StatefulWidget{
  final String fieldName;
  final String fieldDescription;
  final bool isRequired;
  final bool editable;
  final String placeholder;
  final String? value;

  const RichTextWidget({
    Key? key,
    required this.fieldName,
    this.isRequired = false,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
  }) : super(key: key);

  @override
  RichTextWidgetState createState() => RichTextWidgetState();
}
class RichTextWidgetState extends State<RichTextWidget> {
  final QuillController _controller = QuillController.basic(
    config: const QuillControllerConfig(
      clipboardConfig: QuillClipboardConfig(
        enableExternalRichPaste: true,
      ),
    ),
  );
  late final FocusNode _focusNode;
  bool isValueChanged = false;
  late String? initialValue;
  late String? currentValue;
  bool showValidationError = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    initialValue = widget.value;
    currentValue = initialValue;
    _controller.readOnly = !widget.editable;

    if (widget.value != null && widget.value!.isNotEmpty) {
      try {
        _controller.document = Document.fromJson(jsonDecode(widget.value!));
      } catch (e) {
        _controller.document = Document()..insert(0, widget.value!);
      }
    }

    _controller.addListener(_onTextChanged);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (FormValidationScope.of(context)) {
      validate();
    }
  }

  @override
  void didUpdateWidget(covariant RichTextWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.editable != widget.editable) {
      _controller.readOnly = !widget.editable;
    }
  }

  void _onTextChanged() {
    final newJson = jsonEncode(_controller.document.toDelta().toJson());
    if (newJson != initialValue) {
      setState(() {
        isValueChanged = true;
        currentValue = newJson;
        showValidationError = false;
      });
    } else if (isValueChanged) {
      setState(() {
        isValueChanged = false;
        currentValue = initialValue;
        showValidationError = false;
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  String? getUpdatedValue() {
    return isValueChanged ? currentValue : initialValue;
  }

  bool validate() {
    if (widget.isRequired) {
      final value = _controller.document.toPlainText().trim();
      if (value.isEmpty) {
        setState(() {
          showValidationError = true;
        });
        return false;
      }
    }
    setState(() {
      showValidationError = false;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.surface,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\${widget.fieldName}:",
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
              widget.editable
                  ? Column(
                      children: [
                        QuillSimpleToolbar(
                          controller: _controller,
                          config: const QuillSimpleToolbarConfig(
                            showDividers: false,
                            showCodeBlock: false,
                            showListCheck: false,
                            showIndent: false,
                            showListBullets: false,
                            showListNumbers: false,
                            showLink: false,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.muted),
                            borderRadius: BorderRadius.circular(14),
                            color: widget.isRequired ? (showValidationError ? AppColors.indigo.withOpacity(0.12) : null) : null,
                          ),
                          padding: const EdgeInsets.all(12),
                          child: QuillEditor.basic(
                            controller: _controller,
                            focusNode: _focusNode,
                            config: QuillEditorConfig(
                              placeholder: widget.placeholder,
                              autoFocus: false,
                              expands: true,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.muted.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: QuillEditor.basic(
                        controller: _controller,
                        focusNode: _focusNode,
                        config: const QuillEditorConfig(
                          showCursor: false,
                        ),
                      ),
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
      ],
    );
  }
}
        ''');


// **************************************************************************
// DateTimeWidget
// **************************************************************************

    buffer.writeln('''
class DateTimeWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool isRequired;
  final bool editable;
  final String placeholder;
  final DateTime? value;
  final bool showTime;

  const DateTimeWidget({
    Key? key,
    required this.fieldName,
    this.isRequired = false,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
    this.showTime = true,
  }) : super(key: key);

  @override
  DateTimeWidgetState createState() => DateTimeWidgetState();
}

class DateTimeWidgetState extends State<DateTimeWidget> {
  bool isValueChanged = false;
  late DateTime? initialValue;
  late DateTime? currentValue;
  bool showValidationError = false;

  @override
  void initState() {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (FormValidationScope.of(context)) {
      validate();
    }
  }

  void _updateValue(DateTime newValue) {
    setState(() {
      isValueChanged = true;
      currentValue = newValue;
      showValidationError = false;
    });
  }

  DateTime? getUpdatedValue() {
    return isValueChanged ? currentValue : initialValue;
  }

  bool validate() {
    if (widget.isRequired) {
      final value = getUpdatedValue();
      if (value == null) {
        setState(() {
          showValidationError = true;
        });
        return false;
      }
    }
    setState(() {
      showValidationError = false;
    });
    return true;
  }

  Future<void> _selectDateTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialValue ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      if (widget.showTime) {
        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(initialValue ?? DateTime.now()),
        );

        if (pickedTime != null) {
          DateTime pickedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );

          if (pickedDateTime != initialValue) {
            _updateValue(pickedDateTime);
          }
        }
      } else {
        DateTime pickedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
        );

        if (pickedDateTime != initialValue) {
          _updateValue(pickedDateTime);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: widget.isRequired ? (showValidationError ? AppColors.indigo.withOpacity(0.12) : AppColors.surface) : AppColors.surface
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\${widget.fieldName}:",
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
                          child: GestureDetector(
                            onTap: () => _selectDateTime(context),
                            child: Text(
                              currentValue == null
                                  ? widget.placeholder
                                  : (widget.showTime
                                      ? currentValue!.toString()
                                      : "\${currentValue!.year}-\${currentValue!.month.toString().padLeft(2, '0')}-\${currentValue!.day.toString().padLeft(2, '0')}"),
                            ),
                          ),
                        )
                      : Text(currentValue == null
                          ? widget.placeholder
                          : (widget.showTime
                              ? currentValue!.toString()
                              : "\${currentValue!.year}-\${currentValue!.month.toString().padLeft(2, '0')}-\${currentValue!.day.toString().padLeft(2, '0')}")),
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
      ],
    );
  }
}
''');

// **************************************************************************
// CustomPagination
// **************************************************************************

    buffer.writeln('''
class CustomPagination extends StatelessWidget {
  final int currentPage;
  final int maxPages;
  final Function(int) onPageSelected;

  const CustomPagination({
    Key? key,
    required this.currentPage,
    required this.maxPages,
    required this.onPageSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 233, 233, 233)),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildNavigationButton(Icons.arrow_left, () {
            if (currentPage > 1) onPageSelected(currentPage - 1);
          }),
          _buildPageButton(1),
          if (currentPage > 3) ...[
            const Text('...'),
          ],
          for (int i = currentPage - 1; i <= currentPage + 1; i++) ...[
            if (i > 1 && i < maxPages) _buildPageButton(i),
          ],
          if (currentPage < maxPages - 2) ...[
            const Text('...'),
          ],
          if (1 != maxPages) ...[
            _buildPageButton(maxPages),
          ],
          _buildNavigationButton(Icons.arrow_right, () {
            if (currentPage < maxPages) onPageSelected(currentPage + 1);
          }),
        ],
      ),
    );
  }

  Widget _buildPageButton(int pageNumber) {
    return InkWell(
      onTap: () => onPageSelected(pageNumber),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: pageNumber == currentPage ? const Color.fromARGB(255, 224, 221, 221) : Colors.transparent,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Text('\$pageNumber'),
      ),
    );
  }

  Widget _buildNavigationButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Icon(icon),
      ),
    );
  }
}
''');

// **************************************************************************
// CustomSearchBar
// **************************************************************************

    buffer.writeln('''
class CustomSearchBar extends StatefulWidget {
  final Map<String, String> fields;
  final Map<String, dynamic> filters;
  final Function(String, dynamic) onFilterChanged;
  final Function(String, dynamic) onFilterRemove;

  final bool showAddButton;

  const CustomSearchBar({
    Key? key,
    required this.fields,
    required this.filters,
    required this.onFilterChanged,
    required this.onFilterRemove,
    this.showAddButton = true,
  }) : super(key: key);

  @override
  CustomSearchBarState createState() => CustomSearchBarState();
}

class CustomSearchBarState extends State<CustomSearchBar> {
  List<SearchRow> searchRows = [];

  @override
  void initState() {
    super.initState();
    _updateSearchRows();
  }

  @override
  void didUpdateWidget(covariant CustomSearchBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.filters != oldWidget.filters) {
      _updateSearchRows();
    }
  }

  void _updateSearchRows() {
    Future.delayed(Duration.zero, () {
      setState(() {
        searchRows = widget.filters.entries
            .map((entry) => SearchRow(selectedField: entry.key, filterValue: _getValue(entry.key, entry.value)))
            .toList();
      });
    });
  }

  void addFilterRow() {
    if (!_canAddRow()) return;

    setState(() {
      final newRow = SearchRow();
      final available = _getAvailableFields(newRow);
      if (available.isNotEmpty) {
        newRow.selectedField = available.first;
        widget.onFilterChanged(newRow.selectedField ?? '', '');
      }
      searchRows.add(newRow);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: Column(
        children: [
          for (var i = 0; i < searchRows.length; i++)
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: _buildSearchRow(searchRows[i], i),
            ),
          if (widget.showAddButton)
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 3, bottom: 8, left: 8),
                child: ElevatedButton(
                  onPressed: _canAddRow() ? _addRow : null,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Styles.buttonPrimaryColor),
                    elevation: MaterialStateProperty.resolveWith<double>((states) {
                      if (states.contains(MaterialState.hovered) ||
                          states.contains(MaterialState.pressed)) {
                        return 0;
                      }
                      return 0;
                    }),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.hovered)) {
                        return Styles.buttonPrimaryColorHover;
                      }
                      return Colors.transparent;
                    }),
                  ),
                  child: const Text('Add Filter'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchRow(SearchRow searchRow, int index) {
    final availableFields = _getAvailableFields(searchRow);
    final selected = searchRow.selectedField ?? (availableFields.isNotEmpty ? availableFields.first : null);

    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.muted, width: 1),
      ),
      child: Row(
        children: [
          const SizedBox(width: 14),
          const Icon(Icons.search, color: AppColors.muted),
          const SizedBox(width: 12),

          Expanded(
            child: TextFormField(
              controller: searchRow.textEditingController,
              decoration: const InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                fillColor: AppColors.surface,
                focusColor: AppColors.surface,
                hoverColor: AppColors.surface,
                isDense: true,
              ),
              onFieldSubmitted: (_) => _filterChanged(index),
              onEditingComplete: () => _filterChanged(index),
            ),
          ),

          Container(
            width: 1,
            height: 30,
            color: AppColors.muted,
          ),

          SizedBox(
            width: 160,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: selected,
                  icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.muted),
                  items: availableFields.map((field) {
                    return DropdownMenuItem<String>(
                      value: field,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              field,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: AppColors.muted,
                                fontWeight: FontWeight.w500,
                              )
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (newSelectedField) {
                    if (newSelectedField == null) return;

                    if (searchRow.selectedField != null) {
                      widget.onFilterRemove(searchRow.selectedField!, searchRow.filterValue ?? '');
                    }

                    setState(() {
                      searchRow.selectedField = newSelectedField;
                    });

                    _filterChanged(index);
                  },
                ),
              ),
            ),
          ),

          Container(
            width: 1,
            height: 30,
            color: AppColors.muted,
          ),

          IconButton(
            tooltip: 'Remove filter',
            icon: const Icon(Icons.delete_outline, color: AppColors.muted),
            onPressed: () {
              final field = searchRow.selectedField;
              final val = searchRow.filterValue ?? '';

              _removeRow(index);

              if (field != null) {
                widget.onFilterRemove(field, val);
              }
            },
          ),

          const SizedBox(width: 6),
        ],
      ),
    );
  }


  List<String> _getAvailableFields(SearchRow currentRow) {
    Set<String?> selectedFields = searchRows
        .where((row) => row != currentRow && row.selectedField != null)
        .map((row) => row.selectedField)
        .toSet();

    List<String> availableFields =
        widget.fields.keys.where((field) => !selectedFields.contains(field)).toList();

    return availableFields;
  }

  bool _canAddRow() {
    List<String> availableFields = _getAvailableFields(SearchRow());
    return availableFields.isNotEmpty;
  }

  void _addRow() {
    setState(() {
      SearchRow newRow = SearchRow();
      List<String> availableFields = _getAvailableFields(newRow);
      if (availableFields.isNotEmpty) {
        newRow.selectedField = availableFields.first;
        widget.onFilterChanged(
                      newRow.selectedField ?? '', '');
      }
      searchRows.add(newRow);
    });
  }

  void _removeRow(int index) {
    setState(() {
      searchRows.removeAt(index);
    });
  }
  
  void _filterChanged(int index) {
    SearchRow searchRow = searchRows[index];

    if (widget.fields.containsKey(searchRow.selectedField)) {
    String? type = widget.fields[searchRow.selectedField];

    dynamic filter = searchRow.textEditingController.text;

    switch (type) {
      case 'String' || 'String?':
        filter = {r'\$regex': searchRow.textEditingController.text, r'\$options': 'i'};
        break;
      case 'int' || 'int?':
        filter = int.tryParse(searchRow.textEditingController.text);
        break;
      case 'double' || 'double?':
        filter = double.tryParse(searchRow.textEditingController.text);
        break;
    }

    widget.onFilterChanged(searchRow.selectedField!, filter);
    } else {
      print('Selected field not found: \${searchRow.selectedField}');
    }
  }

  String _getValue(String field, dynamic value) {
    
    if (widget.fields.containsKey(field)) {
      String? type = widget.fields[field];

      String valueReturned = value.toString();

      switch (type) {
        case 'String' || 'String?':
          if (value is Map<String, dynamic> &&
              value.containsKey(r'\$regex') &&
              value.containsKey(r'\$options')) {
            dynamic regexValue = value[r'\$regex'];
            valueReturned = regexValue?.toString() ?? '';
          }
          break;
        case 'int' || 'int?':
          if (value == null) {
            valueReturned = '';
          }
          break;
        case 'double' || 'double?':
          if (value == null) {
            valueReturned = '';
          }
          break;
      }

      return valueReturned;
    }
    return value.toString();
  }
}


class SearchRow {
  String? selectedField;
  dynamic filterValue;
  final TextEditingController textEditingController = TextEditingController();

  SearchRow({this.selectedField, this.filterValue}) {
    textEditingController.text = filterValue.toString();
  }
}
''');

// **************************************************************************
// BoolWidget (TODO)
// **************************************************************************

    buffer.writeln("""
class BoolWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final bool? value;

  const BoolWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.value,
  }) : super(key: key);

  @override
  BoolWidgetState createState() => BoolWidgetState();
}

class BoolWidgetState extends State<BoolWidget> {
  bool isValueChanged = false;
  late bool? initialValue;
  late bool currentValue;

  @override
  void initState() {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue ?? false;
  }

  bool? getUpdatedValue() {
    return isValueChanged ? currentValue : initialValue;
  }

  bool validate() {
    return true;
  }
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.surface
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\${widget.fieldName}:",
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
                      ? Checkbox(
                          value: currentValue,
                          onChanged: (newValue) {
                            setState(() {
                              isValueChanged = newValue != initialValue;
                              currentValue = newValue ?? false;
                            });
                          },
                        )
                      : Text(widget.value.toString()),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
""");

// **************************************************************************
// ModelsSelectableWidget
// **************************************************************************

    String filePath = '${Directory.current.path}/lib/home.txt';
    File file = File(filePath);

    String existingContent = file.existsSync() ? file.readAsStringSync() : '';
    final classNames = <String>[""];
    final lines = existingContent.split('\n');

    for (final line in lines) {
      final className = line.replaceAll('HomeWidget', '');
      if (className.isNotEmpty) {
        classNames.add(className);
      }
    }

    final models = classNames.isNotEmpty ? "[${classNames.map((className) => "\"${className.toLowerCase()}\"").join(", ")}]" : "[]";

    buffer.writeln("""
class ModelsSelectableWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool isRequired;
  final bool editable;
  final String placeholder;
  final String? value;
  final List<Widget>? additionalChildren;

  const ModelsSelectableWidget({
    Key? key,
    required this.fieldName,
    this.isRequired = false,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
    this.additionalChildren,
  }) : super(key: key);

  @override
  ModelsSelectableWidgetState createState() => ModelsSelectableWidgetState();
}

class ModelsSelectableWidgetState extends State<ModelsSelectableWidget> {
  List<String> options = $models;
  bool isValueChanged = false;
  late String? initialValue;
  late String currentValue;

  @override
  void initState() {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue ?? '';
  }

  String? getUpdatedValue() {
    return isValueChanged ? currentValue : initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Styles.secondaryColor
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\${widget.fieldName}:",
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
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              filled: true,
                              hintText: widget.placeholder,
                            ),
                            dropdownColor: Colors.white,
                            value: currentValue,
                            items: options.map((String option) {
                              return DropdownMenuItem<String>(
                                value: option,
                                child: Text(option),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                 isValueChanged = newValue != initialValue;
                                currentValue = newValue!;
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
        if (widget.additionalChildren != null)
          ...widget.additionalChildren!,
      ],
    );
  }
}
""");

// **************************************************************************
// ModelsSelectableWidget
// **************************************************************************

    buffer.writeln("""
class JsonWidget extends StatefulWidget {
  final Key? key;
  final String fieldName;
  final String fieldDescription;
  final bool isRequired;
  final bool editable;
  final String placeholder;
  final dynamic value;

  JsonWidget({
    this.key,
    required this.fieldName,
    this.isRequired = false,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
  });

  @override
  JsonWidgetState createState() => JsonWidgetState();
}

class JsonWidgetState extends State<JsonWidget> {
  bool isValueChanged = false;
  late dynamic initialValue;
  late String initialText;
  late String currentValue;

  @override
  void initState() {
    super.initState();
    initialValue = widget.value;
    initialText = _encode(widget.value);
    currentValue = initialText;
  }

  String _encode(dynamic value) {
    if (value == null) {
      return '{}';
    }
    try {
      return const JsonEncoder.withIndent('  ').convert(value);
    } catch (_) {
      return value.toString();
    }
  }

  dynamic getUpdatedValue() {
    if (!isValueChanged) {
      return initialValue;
    }
    return json.decode(currentValue);
  }

  bool validate() {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColors.surface
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\${widget.fieldName}:",
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
                      child: TextFormField(
                        minLines: 4,
                        maxLines: 10,
                        decoration: InputDecoration(
                          filled: true,
                          hintText: widget.placeholder,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: AppColors.muted,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: AppColors.muted,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: AppColors.indigo,
                              width: 1.2,
                            ),
                          ),
                          fillColor: widget.isRequired ? ((currentValue.trim().isEmpty || currentValue == '{}' || currentValue == 'null') ? AppColors.indigo.withOpacity(0.12) : AppColors.surface) : AppColors.surface,
                          focusColor: AppColors.surface,
                          hoverColor: AppColors.surface
                        ),
                        initialValue: initialText,
                        onChanged: (newValue) {
                          setState(() {
                            isValueChanged = newValue != initialText;
                            currentValue = newValue;
                          });
                        },
                      ),
                    )
                  : Expanded(
                      child: Text(
                        initialText,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
	}
	""");

// **************************************************************************
// EmbeddedObjectWidget
// **************************************************************************

    buffer.writeln("""
class EmbeddedObjectWidget<T> extends StatefulWidget {
  final Key? key;
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final T? value;
  final Widget child;
  final T? Function() getValue;

  EmbeddedObjectWidget({
    this.key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
    required this.child,
    required this.getValue,
  });

  @override
  EmbeddedObjectWidgetState<T> createState() => EmbeddedObjectWidgetState<T>();
}

class EmbeddedObjectWidgetState<T> extends State<EmbeddedObjectWidget<T>> {
  T? getUpdatedValue() {
    return widget.getValue();
  }

  bool validate() {
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColors.surface
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\${widget.fieldName}:",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  widget.fieldDescription,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          widget.child,
        ],
      ),
    );
  }
}
""");

// **************************************************************************
// EnumDropdownWidget
// **************************************************************************

    buffer.writeln("""
class EnumDropdownWidget<T extends Enum> extends StatefulWidget {
  final Key? key;
  final String fieldName;
  final String fieldDescription;
  final bool isRequired;
  final bool editable;
  final String placeholder;
  final T? value;
  final List<T> options;
  final String Function(T value)? labelBuilder;

  EnumDropdownWidget({
    this.key,
    required this.fieldName,
    this.isRequired = false,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
    required this.options,
    this.labelBuilder,
  });

  @override
  EnumDropdownWidgetState<T> createState() => EnumDropdownWidgetState<T>();
}

class EnumDropdownWidgetState<T extends Enum> extends State<EnumDropdownWidget<T>> {
  bool isValueChanged = false;
  T? initialValue;
  T? currentValue;
  bool showValidationError = false;

  @override
  void initState() {
    super.initState();
    initialValue = widget.value;
    currentValue = widget.value;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (FormValidationScope.of(context)) {
      validate();
    }
  }

  T? getUpdatedValue() {
    return isValueChanged ? currentValue : initialValue;
  }

  String _label(T value) {
    return widget.labelBuilder?.call(value) ?? value.name;
  }

  bool validate() {
    if (widget.isRequired) {
      final value = getUpdatedValue();
      if (value == null) {
        setState(() {
          showValidationError = true;
        });
        return false;
      }
    }
    setState(() {
      showValidationError = false;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.surface,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\${widget.fieldName}:",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  widget.fieldDescription,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          widget.editable
              ? DropdownButtonFormField<T>(
                  value: currentValue,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: widget.placeholder,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: AppColors.muted),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: AppColors.muted),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: AppColors.indigo, width: 1.2),
                    ),
                    fillColor: widget.isRequired ? (showValidationError ? AppColors.indigo.withOpacity(0.12) : AppColors.surface) : AppColors.surface,
                    focusColor: AppColors.surface,
                    hoverColor: AppColors.surface
                  ),
                  items: widget.options
                      .map((option) => DropdownMenuItem<T>(
                            value: option,
                            child: Text(_label(option)),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      currentValue = value;
                      isValueChanged = value != initialValue;
                      showValidationError = false;
                    });
                  },
                )
              : Text(currentValue == null ? widget.placeholder : _label(currentValue as T)),
        ],
      ),
    );
  }
}
""");

// **************************************************************************
// EnumMultiDropdownWidget
// **************************************************************************

    buffer.writeln("""
class EnumMultiDropdownWidget<T extends Enum> extends StatefulWidget {
  final Key? key;
  final String fieldName;
  final String fieldDescription;
  final bool isRequired;
  final bool editable;
  final String placeholder;
  final List<T>? value;
  final List<T> options;
  final String Function(T value)? labelBuilder;

  EnumMultiDropdownWidget({
    this.key,
    required this.fieldName,
    this.isRequired = false,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    this.value,
    required this.options,
    this.labelBuilder,
  });

  @override
  EnumMultiDropdownWidgetState<T> createState() => EnumMultiDropdownWidgetState<T>();
}

class EnumMultiDropdownWidgetState<T extends Enum> extends State<EnumMultiDropdownWidget<T>> {
  bool isValueChanged = false;
  late List<T> initialValue;
  late List<T> currentValue;
  bool showValidationError = false;

  @override
  void initState() {
    super.initState();
    initialValue = List<T>.from(widget.value ?? []);
    currentValue = List<T>.from(widget.value ?? []);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (FormValidationScope.of(context)) {
      validate();
    }
  }

  List<T> getUpdatedValue() {
    return isValueChanged ? currentValue : initialValue;
  }

  String _label(T value) {
    return widget.labelBuilder?.call(value) ?? value.name;
  }

  void _toggleOption(T option) {
    setState(() {
      if (currentValue.contains(option)) {
        currentValue = currentValue.where((v) => v != option).toList();
      } else {
        currentValue = [...currentValue, option];
      }
      isValueChanged = !_listEquals(currentValue, initialValue);
      showValidationError = false;
    });
  }

  bool _listEquals(List<T> a, List<T> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  String get _displayText {
    if (currentValue.isEmpty) return widget.placeholder;
    return currentValue.map(_label).join(', ');
  }

  bool validate() {
    if (widget.isRequired) {
      final value = getUpdatedValue();
      if (value == null || value.isEmpty) {
        setState(() {
          showValidationError = true;
        });
        return false;
      }
    }
    setState(() {
      showValidationError = false;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.surface,
      ),
      child: LayoutBuilder(
        builder: (context, boxConstraints) {
          final width = boxConstraints.maxWidth;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\${widget.fieldName}:",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      widget.fieldDescription,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              widget.editable
                  ? PopupMenuButton<T>(
                      position: PopupMenuPosition.over,
                      constraints: BoxConstraints(
                        minWidth: width,
                        maxWidth: width,
                      ),
                      color: AppColors.surface,
                      itemBuilder: (context) => widget.options
                          .map((option) => PopupMenuItem<T>(
                                value: option,
                                enabled: false,
                                padding: EdgeInsets.zero,
                                child: StatefulBuilder(
                                  builder: (ctx, setMenuState) {
                                    final selected = currentValue.contains(option);
                                    return CheckboxListTile(
                                      activeColor: AppColors.indigo,
                                      value: selected,
                                      title: Text(
                                        _label(option),
                                        style: const TextStyle(
                                          color: AppColors.indigo,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      controlAffinity: ListTileControlAffinity.leading,
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                                      onChanged: (_) {
                                        setMenuState(() {});
                                        _toggleOption(option);
                                      },
                                    );
                                  },
                                ),
                              ))
                          .toList(),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          filled: true,
                          hintText: widget.placeholder,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(color: AppColors.muted),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(color: AppColors.muted),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(color: AppColors.indigo, width: 1.2),
                          ),
                          fillColor: widget.isRequired ? (showValidationError ? AppColors.indigo.withOpacity(0.12) : AppColors.surface) : AppColors.surface,
                          focusColor: AppColors.surface,
                          hoverColor: AppColors.surface,
                          // Se fuerza el icono de flecha hacia abajo para clonar el Dropdown
                          suffixIcon: const Icon(Icons.arrow_drop_down, color: Colors.grey), 
                        ),
                        child: Text(
                          _displayText,
                          style: currentValue.isEmpty
                              ? const TextStyle(color: Colors.grey)
                              : null,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  : Text(currentValue.isEmpty ? widget.placeholder : _displayText),
            ],
          );
        },
      ),
    );
  }
}
""");

// **************************************************************************
// StringListWidget (TODO)
// **************************************************************************

    buffer.writeln("Widget stringListWidget(String fieldName, List<String> value) {");
    buffer.writeln("return Column(");
    buffer.writeln("  crossAxisAlignment: CrossAxisAlignment.start,");
    buffer.writeln("  children: [");
    buffer.writeln("    Text('\$fieldName:'),");
    buffer.writeln("    for (var item in value) Text('- \$item'),");
    buffer.writeln("  ],");
    buffer.writeln(");");
    buffer.writeln("}");

// **************************************************************************
// GetHeaders
// **************************************************************************

    buffer.writeln("""
Future<Map<String, String>> getHeaders() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token') ?? '';

  return {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer \$token',
  };
}
""");

// **************************************************************************
// Home Cards Grid
// **************************************************************************

    buffer.writeln('''
class AppCardItem {
  final String title;
  final Widget icon; 
  final VoidCallback onTap;

  const AppCardItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}

class AppCardsGrid extends StatelessWidget {
  final List<AppCardItem> items;

  const AppCardsGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final width = c.maxWidth;

        final maxTileWidth = width >= 800 ? 220.0 : 160.0;

        final aspectRatio = width >= 800 ? 1.2 : 0.9;

        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: maxTileWidth, 
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
            childAspectRatio: aspectRatio,
          ),
          itemBuilder: (context, index) => _AppCard(item: items[index]),
        );
      },
    );
  }
}


class _AppCard extends StatelessWidget {
  final AppCardItem item;

  const _AppCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final tileW = constraints.maxWidth;

        final box = (tileW * 0.42).clamp(66.0, 120.0);
        final iconSize = (box * 0.52).clamp(28.0, 46.0);

        return InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: item.onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: box,
                  height: box,
                  decoration: BoxDecoration(
                    color: AppColors.bg,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: IconTheme(
                      data: IconThemeData(color: cs.primary, size: iconSize),
                      child: item.icon,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  item.title,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.muted,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
''');

// **************************************************************************
// Profile Menu Button
// **************************************************************************

    buffer.writeln('''
class ProfileMenuButton extends StatelessWidget {
  final String? avatarUrl;
  final VoidCallback onViewProfile;
  final VoidCallback onSettings;
  final VoidCallback onLogout;

  const ProfileMenuButton({
    super.key,
    this.avatarUrl,
    required this.onViewProfile,
    required this.onSettings,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return MenuAnchor(
      alignmentOffset: const Offset(-70, 0),
      style: MenuStyle(
        backgroundColor: const WidgetStatePropertyAll(AppColors.bg),
        elevation: const WidgetStatePropertyAll(0),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        padding: const WidgetStatePropertyAll(EdgeInsets.all(0)),
      ),
      builder: (context, controller, _) {
        final open = controller.isOpen;

        return InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () => open ? controller.close() : controller.open(),
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: AppColors.outline,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _Avatar(avatarUrl: avatarUrl),
                const SizedBox(width: 20),
                Icon(
                  open ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: cs.primary,
                ),
              ],
            ),
          ),
        );
      },
      menuChildren: [
        _MenuItem(
          icon: Icons.person_outline,
          text: 'View Profile',
          onTap: () {
            Navigator.of(context).pop();
            onViewProfile();
          },
        ),
        const _MenuDivider(),
        _MenuItem(
          icon: Icons.settings_outlined,
          text: 'Settings',
          onTap: () {
            Navigator.of(context).pop();
            onSettings();
          },
        ),
        const _MenuDivider(),
        _MenuItem(
          text: 'Log out',
          trailing: const Icon(Icons.logout, size: 18, color: AppColors.muted),
          onTap: () {
            onLogout();
          },
        ),
      ],
    );
  }
}

class _Avatar extends StatelessWidget {
  final String? avatarUrl;
  const _Avatar({this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 14,
      backgroundColor: AppColors.lavender,
      foregroundImage: (avatarUrl != null && avatarUrl!.isNotEmpty)
          ? NetworkImage(avatarUrl!)
          : null,
      child: (avatarUrl == null || avatarUrl!.isEmpty)
          ? const Icon(Icons.person, size: 16, color: Colors.white)
          : null,
    );
  }
}

class _MenuDivider extends StatelessWidget {
  const _MenuDivider();

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: AppColors.bg, // suave
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData? icon;
  final String text;
  final Widget? trailing;
  final VoidCallback onTap;

  const _MenuItem({
    this.icon,
    required this.text,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            if (icon != null) Icon(icon, size: 18, color: AppColors.muted),
            if (icon != null) const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.muted,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: 8),
              IconTheme(
                data: IconThemeData(color: cs.primary),
                child: trailing!,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
''');

// **************************************************************************
// Tasks Widget
// **************************************************************************

    buffer.writeln('''
enum TaskStatus { todo, inProgress, done }
enum TaskPriority { high, mid, low, done }
enum TasksViewMode { list, board }

class TaskItem {
  final String title;
  final DateTime dueDate;
  final String tag;
  final TaskPriority priority;
  final bool checked;

  const TaskItem({
    required this.title,
    required this.dueDate,
    required this.tag,
    required this.priority,
    this.checked = false,
  });
}

class TaskSection {
  final TaskStatus status;
  final List<TaskItem> items;

  const TaskSection({required this.status, required this.items});
}

class TasksWidget extends StatefulWidget {
  final List<TaskSection> sections;
  final List<BoardTask> boardTasks; 

  const TasksWidget({super.key, required this.sections, required this.boardTasks});

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  final _searchController = TextEditingController();

  bool _todoOpen = true;
  bool _progressOpen = true;
  bool _doneOpen = true;

  TasksViewMode _mode = TasksViewMode.list;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 900;

    final query = _searchController.text.trim().toLowerCase();
    List<TaskSection> filtered = widget.sections
        .map((s) => TaskSection(
              status: s.status,
              items: s.items.where((t) {
                if (query.isEmpty) return true;
                return t.title.toLowerCase().contains(query) ||
                    t.tag.toLowerCase().contains(query);
              }).toList(),
            ))
        .toList();
    
    final filteredBoard = widget.boardTasks.where((t) {
      if (query.isEmpty) return true;
      return t.title.toLowerCase().contains(query) ||
          t.tag.toLowerCase().contains(query);
    }).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Tasks',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.indigo,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 18),
          _TopBar(
            controller: _searchController,
            onChanged: (_) => setState(() {}),
            onLeftChanged: () => setState(() => _mode = TasksViewMode.list),
            onRightChanged: () => setState(() => _mode = TasksViewMode.board),
            mode: _mode,
          ),
          const SizedBox(height: 18),
          if (_mode == TasksViewMode.board)
            TasksBoardView(tasks: filteredBoard)
          else ...[
            _Section(
              title: 'To Do',
              count: _count(filtered, TaskStatus.todo),
              isOpen: _todoOpen,
              onToggle: () => setState(() => _todoOpen = !_todoOpen),
              children: _buildRows(
                context,
                section: _get(filtered, TaskStatus.todo),
                isWide: isWide,
                showHeader: true,
              ),
            ),
            const SizedBox(height: 18),

            _Section(
              title: 'In progress',
              count: _count(filtered, TaskStatus.inProgress),
              isOpen: _progressOpen,
              onToggle: () => setState(() => _progressOpen = !_progressOpen),
              children: _buildRows(
                context,
                section: _get(filtered, TaskStatus.inProgress),
                isWide: isWide,
                showHeader: true,
              ),
            ),
            const SizedBox(height: 18),

            _Section(
              title: 'Done',
              count: _count(filtered, TaskStatus.done),
              isOpen: _doneOpen,
              onToggle: () => setState(() => _doneOpen = !_doneOpen),
              children: _buildRows(
                context,
                section: _get(filtered, TaskStatus.done),
                isWide: isWide,
                showHeader: true,
                doneStyle: true,
              ),
            ),
          ],
        ],
      ),
    );
  }

  TaskSection _get(List<TaskSection> sections, TaskStatus status) =>
      sections.firstWhere((s) => s.status == status,
          orElse: () => TaskSection(status: status, items: const []));

  int _count(List<TaskSection> sections, TaskStatus status) =>
      _get(sections, status).items.length;

  Widget _buildRows(
    BuildContext context, {
    required TaskSection section,
    required bool isWide,
    required bool showHeader,
    bool doneStyle = false,
  }) {
    if (section.items.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          'No tasks',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.muted,
              ),
        ),
      );
    }

    return Column(
      children: [
        if (showHeader)
          _HeaderRow(isWide: isWide, doneStyle: doneStyle),
        const SizedBox(height: 6),
        ...section.items.map(
          (t) => _TaskRow(
            task: t,
            isWide: isWide,
            doneStyle: doneStyle,
            onToggle: () {
              // aquí puedes manejar el check real
            },
          ),
        ),
      ],
    );
  }
}

class _TopBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onLeftChanged;
  final VoidCallback onRightChanged;
  final TasksViewMode mode;

  const _TopBar({required this.controller, required this.onChanged, required this.onLeftChanged, required this.onRightChanged, this.mode = TasksViewMode.list});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 900;

    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: 'Search task, tags, or other',
              prefixIcon: const Icon(Icons.search),
            ),
          ),
        ),
        if (isWide) ...[
          const SizedBox(width: 16),
          _SegmentButton(
            leftText: 'List',
            rightText: 'Board',
            onLeft: onLeftChanged,
            onRight: onRightChanged,
            mode: mode,
          ),
          const SizedBox(width: 10),
          _IconPill(
            icon: Icons.swap_vert,
            onTap: () {},
          ),
          const SizedBox(width: 10),
          _TextIconPill(
            icon: Icons.tune,
            text: 'Filter',
            onTap: () {},
          ),
          const SizedBox(width: 10),
          _PrimarySquareButton(
            icon: Icons.add,
            onTap: () {},
          ),
        ] else ...[
          const SizedBox(width: 12),
          _PrimarySquareButton(
            icon: Icons.add,
            onTap: () {},
          ),
        ],
      ],
    );
  }
}

class _SegmentButton extends StatelessWidget {
  final String leftText;
  final String rightText;
  final VoidCallback onLeft;
  final VoidCallback onRight;
  final TasksViewMode mode;

  const _SegmentButton({
    required this.leftText,
    required this.rightText,
    required this.onLeft,
    required this.onRight,
    this.mode = TasksViewMode.list,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _SegItem(text: leftText, selected: mode == TasksViewMode.list, onTap: onLeft),
          _SegItem(text: rightText, selected: mode == TasksViewMode.board, onTap: onRight),
        ],
      ),
    );
  }
}

class _SegItem extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const _SegItem({
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        width: 72,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.lavender : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.indigo,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}

class _IconPill extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _IconPill({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.bg,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: AppColors.indigo),
      ),
    );
  }
}

class _TextIconPill extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const _TextIconPill({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: AppColors.bg,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.indigo, size: 18),
            const SizedBox(width: 8),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.indigo,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PrimarySquareButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _PrimarySquareButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: cs.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final int count;
  final bool isOpen;
  final VoidCallback onToggle;
  final Widget children;

  const _Section({
    required this.title,
    required this.count,
    required this.isOpen,
    required this.onToggle,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onToggle,
          child: Row(
            children: [
              Icon(
                isOpen ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
                color: AppColors.indigo,
              ),
              const SizedBox(width: 6),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.indigo,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(width: 10),
              Text(
                '(\$count)',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.muted,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(height: 1, color: AppColors.outline),
        if (isOpen) ...[
          const SizedBox(height: 12),
          children,
        ],
      ],
    );
  }
}

class _HeaderRow extends StatelessWidget {
  final bool isWide;
  final bool doneStyle;

  const _HeaderRow({required this.isWide, required this.doneStyle});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppColors.muted,
          fontWeight: FontWeight.w500,
        );

    if (!isWide) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        children: [
          Expanded(flex: 6, child: Text('Task', style: style)),
          Expanded(flex: 1, child: Container()),
          Expanded(flex: 1, child: Text('Due date', style: style, textAlign: TextAlign.center)),
          Expanded(flex: 1, child: Container()),
          Expanded(flex: 2, child: Text('Task Tag', style: style, textAlign: TextAlign.center)),
          Expanded(flex: 1, child: Container()),
          Expanded(flex: 2, child: Text('Priority', style: style, textAlign: TextAlign.center)),
        ],
      ),
    );
  }
}

class _TaskRow extends StatelessWidget {
  final TaskItem task;
  final bool isWide;
  final bool doneStyle;
  final VoidCallback onToggle;

  const _TaskRow({
    required this.task,
    required this.isWide,
    required this.doneStyle,
    required this.onToggle,
  });

  String _fmt(DateTime d) {
    const months = [
      'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'
    ];
    return '\${d.day.toString().padLeft(2, '0')} \${months[d.month - 1]}';
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: doneStyle ? AppColors.muted : AppColors.indigo,
          fontWeight: FontWeight.w500,
          decoration: doneStyle ? TextDecoration.lineThrough : null,
        );

    final row = Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: isWide
          ? Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Row(
                    children: [
                      _CheckBoxLike(
                        checked: task.checked || doneStyle,
                        done: doneStyle,
                        onTap: onToggle,
                      ),
                      const SizedBox(width: 12),
                      Expanded(child: Text(task.title, style: titleStyle)),
                    ],
                  ),
                ),
                Expanded(flex: 1, child: Container()),
                Expanded(
                  flex: 1,
                  child: _DueDateChip(dateText: _fmt(task.dueDate), done: doneStyle),
                ),
                Expanded(flex: 1, child: Container()),
                Expanded(
                  flex: 2,
                  child: _TagChip(text: task.tag, done: doneStyle),
                ),
                Expanded(flex: 1, child: Container()),
                Expanded(
                  flex: 2,
                  child: _PriorityChip(priority: doneStyle ? TaskPriority.done : task.priority),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _CheckBoxLike(
                      checked: task.checked || doneStyle,
                      done: doneStyle,
                      onTap: onToggle,
                    ),
                    const SizedBox(width: 12),
                    Expanded(child: Text(task.title, style: titleStyle)),
                  ],
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _DueDateChip(dateText: _fmt(task.dueDate), done: doneStyle),
                    _TagChip(text: task.tag, done: doneStyle),
                    _PriorityChip(priority: doneStyle ? TaskPriority.done : task.priority),
                  ],
                ),
              ],
            ),
    );

    return row;
  }
}

class _CheckBoxLike extends StatelessWidget {
  final bool checked;
  final bool done;
  final VoidCallback onTap;

  const _CheckBoxLike({
    required this.checked,
    required this.done,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(6),
      onTap: onTap,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: checked ? AppColors.successBg : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: checked ? Colors.transparent : AppColors.outline,
          ),
        ),
        child: checked
            ? const Icon(Icons.check, size: 16, color: AppColors.success)
            : null,
      ),
    );
  }
}

class _DueDateChip extends StatelessWidget {
  final String dateText;
  final bool done;

  const _DueDateChip({required this.dateText, required this.done});

  @override
  Widget build(BuildContext context) {
    return _Pill(
      icon: Icons.calendar_month_outlined,
      text: dateText,
      muted: done,
      dueDate: true,
    );
  }
}

class _TagChip extends StatelessWidget {
  final String text;
  final bool done;

  const _TagChip({required this.text, required this.done});

  @override
  Widget build(BuildContext context) {
    return _Pill(
      text: text,
      muted: done,
    );
  }
}

class _PriorityChip extends StatelessWidget {
  final TaskPriority priority;

  const _PriorityChip({required this.priority});

  @override
  Widget build(BuildContext context) {
    switch (priority) {
      case TaskPriority.high:
        return const _Pill(
          icon: Icons.flag_outlined,
          text: 'High',
          bg: AppColors.errorBg,
          fg: AppColors.error,
        );
      case TaskPriority.mid:
        return const _Pill(
          icon: Icons.flag_outlined,
          text: 'Mid',
          bg: AppColors.warningBg,
          fg: AppColors.warning,
        );
      case TaskPriority.low:
        return const _Pill(
          icon: Icons.flag_outlined,
          text: 'Low',
          bg: AppColors.successBg,
          fg: AppColors.success,
        );
      case TaskPriority.done:
        return const _Pill(
          icon: Icons.flag_outlined,
          text: 'Done',
          bg: AppColors.successBg,
          fg: AppColors.success,
        );
    }
  }
}

class _Pill extends StatelessWidget {
  final IconData? icon;
  final String text;
  final Color? bg;
  final Color? fg;
  final bool muted;
  final bool dueDate;

  const _Pill({
    required this.text,
    this.icon,
    this.bg,
    this.fg,
    this.muted = false,
    this.dueDate = false,
  });

  @override
  Widget build(BuildContext context) {
    var background = muted ? AppColors.bg : (bg ?? AppColors.bg);
    background = dueDate ? AppColors.surface : background;
    final foreground = muted ? AppColors.muted : (fg ?? AppColors.indigo);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 18, color: foreground),
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: foreground,
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

enum BoardStatus { todo, inProgress, done }

class BoardTask {
  final String title;
  final BoardStatus status;
  final int progress; // 0..100
  final DateTime dueDate;
  final String tag; // "Work"
  final TaskPriority priority;
  final int comments;
  final bool checked;

  const BoardTask({
    required this.title,
    required this.status,
    required this.progress,
    required this.dueDate,
    required this.tag,
    required this.priority,
    required this.comments,
    this.checked = false,
  });
}

class TasksBoardView extends StatelessWidget {
  final List<BoardTask> tasks;

  const TasksBoardView({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 1000;

    final todo = tasks.where((t) => t.status == BoardStatus.todo).toList();
    final prog = tasks.where((t) => t.status == BoardStatus.inProgress).toList();
    final done = tasks.where((t) => t.status == BoardStatus.done).toList();

    // En móvil: scroll horizontal de columnas
    return isWide
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _BoardColumn(title: 'To Do', count: todo.length, tasks: todo)),
              const SizedBox(width: 18),
              Expanded(child: _BoardColumn(title: 'In progress', count: prog.length, tasks: prog)),
              const SizedBox(width: 18),
              Expanded(child: _BoardColumn(title: 'Done', count: done.length, tasks: done)),
            ],
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 340, child: _BoardColumn(title: 'To Do', count: todo.length, tasks: todo)),
                const SizedBox(width: 16),
                SizedBox(width: 340, child: _BoardColumn(title: 'In progress', count: prog.length, tasks: prog)),
                const SizedBox(width: 16),
                SizedBox(width: 340, child: _BoardColumn(title: 'Done', count: done.length, tasks: done)),
              ],
            ),
          );
  }
}

class _BoardColumn extends StatefulWidget {
  final String title;
  final int count;
  final List<BoardTask> tasks;

  const _BoardColumn({
    required this.title,
    required this.count,
    required this.tasks,
  });

  @override
  State<_BoardColumn> createState() => _BoardColumnState();
}

class _BoardColumnState extends State<_BoardColumn> {
  bool _open = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header columna
        InkWell(
          onTap: () => setState(() => _open = !_open),
          child: Row(
            children: [
              Icon(
                _open ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
                color: AppColors.indigo,
              ),
              const SizedBox(width: 6),
              Text(
                widget.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.indigo,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(width: 10),
              Text(
                '(\${widget.count})',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.muted,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(height: 1, color: AppColors.outline),
        const SizedBox(height: 14),

        if (_open)
          ...widget.tasks.map((t) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: _TaskCard(task: t),
              )),
      ],
    );
  }
}

class _TaskCard extends StatelessWidget {
  final BoardTask task;

  const _TaskCard({required this.task});

  Color _cardBg() {
    switch (task.status) {
      case BoardStatus.todo:
        return AppColors.bg; // suave lila/gris
      case BoardStatus.inProgress:
        return AppColors.warningBg.withOpacity(0.35); // beige suave
      case BoardStatus.done:
        return AppColors.successBg.withOpacity(0.35); // verde suave
    }
  }

  Color _progressColor() {
    switch (task.status) {
      case BoardStatus.todo:
        return AppColors.indigo;
      case BoardStatus.inProgress:
        return AppColors.warning;
      case BoardStatus.done:
        return AppColors.success;
    }
  }

  String _fmt(DateTime d) {
    const months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    return '\${d.day.toString().padLeft(2, '0')} \${months[d.month - 1]}';
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final titleColor = task.status == BoardStatus.done ? AppColors.muted : AppColors.indigo;
    final iconColor = task.status == BoardStatus.done ? AppColors.muted : AppColors.indigo;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _cardBg(),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // Top row: checkbox + title + kebab
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CheckBoxLike(
                checked: task.checked || task.status == BoardStatus.done,
                done: task.status == BoardStatus.done,
                onTap: () {},
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  task.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: titleColor,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.more_vert, color: AppColors.muted),
            ],
          ),
          const SizedBox(height: 18),

          // Progress label
          Row(
            children: [
              Text(
                'Progress',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.muted,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const Spacer(),
              Text(
                '\${task.progress} %',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.indigo,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: (task.progress.clamp(0, 100)) / 100.0,
              minHeight: 4,
              backgroundColor: AppColors.outline,
              valueColor: AlwaysStoppedAnimation<Color>(_progressColor()),
            ),
          ),
          const SizedBox(height: 18),

          // Tag + Priority chips
          Row(
            children: [
              _SoftChip(
                text: task.tag,
                fg: AppColors.indigo,
                bg: AppColors.surface,
              ),
              const SizedBox(width: 12),
              _PriorityChip(priority: task.priority),
            ],
          ),
          const SizedBox(height: 18),

          // Bottom row: date + comments
          Row(
            children: [
              Icon(Icons.calendar_month_outlined, size: 18, color: iconColor),
              const SizedBox(width: 8),
              Text(
                _fmt(task.dueDate),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: iconColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const Spacer(),
              Icon(Icons.chat_bubble_outline, size: 18, color: AppColors.muted),
              const SizedBox(width: 6),
              Text(
                '(\${task.comments})',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.muted,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SoftChip extends StatelessWidget {
  final String text;
  final Color fg;
  final Color bg;

  const _SoftChip({required this.text, required this.fg, required this.bg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: fg,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}

IconData iconForModel(String modelName) {
  final name = modelName.toLowerCase();

  if (name.contains('user') || name.contains('role')) {
    return Icons.person_outline;
  }
  if (name.contains('product') || name.contains('item')) {
    return Icons.inventory_2_outlined;
  }
  if (name.contains('order') || name.contains('invoice')) {
    return Icons.payments_outlined;
  }
  if (name.contains('log') || name.contains('event')) {
    return Icons.description_outlined;
  }
  if (name.contains('config') || name.contains('setting')) {
    return Icons.settings_outlined;
  }

  return Icons.storage_outlined;
}

class PillButton extends StatelessWidget {
  final IconData? icon;
  final IconData? trailing;
  final String text;
  final VoidCallback? onTap;
  final bool filled;
  final bool enabled;
  final Color? bg;
  final Color? fg;

  const PillButton({
    this.icon,
    this.trailing,
    required this.text,
    this.onTap,
    this.filled = false,
    this.enabled = true,
    this.bg,
    this.fg,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final background = bg ?? (filled ? AppColors.bg : AppColors.bg);
    final foreground = fg ?? (filled ? AppColors.indigo : AppColors.indigo);

    return Opacity(
      opacity: enabled ? 1 : 0.55,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: enabled ? onTap : null,
        child: Container(
          height: 35,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 15, color: foreground),
                const SizedBox(width: 10),
              ],
              Text(
                text,
                style: Theme.of(context).textTheme.labelSmall
              ),
              if (trailing != null) ...[
                const SizedBox(width: 50),
                Icon(trailing, size: 15, color: foreground),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const SaveButton({
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Opacity(
      opacity: 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          height: 35,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.bg,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.save, size: 20, color: AppColors.indigo),
              const SizedBox(width: 10),
              Text(text, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.indigo,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
''');

    return buffer.toString();
  }
}
