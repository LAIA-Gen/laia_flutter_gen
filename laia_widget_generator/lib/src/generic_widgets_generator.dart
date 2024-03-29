// ignore_for_file: implementation_imports, depend_on_referenced_packages

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
// IntWidget
// **************************************************************************

    buffer.writeln('''
class IntWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final int? value;

  const IntWidget({
    Key? key,
    required this.fieldName,
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

  @override
  void initState() {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue.toString();
  }

  int? getUpdatedValue() {
    return isValueChanged ? int.tryParse(currentValue) : initialValue;
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
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            ],
                            decoration: InputDecoration(
                              hintText: widget.placeholder,
                            ),
                            initialValue: widget.value?.toString(),
                            onChanged: (newValue) {
                              setState(() {
                                isValueChanged = newValue != initialValue.toString();
                                currentValue = newValue;
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

    buffer.writeln('''
class MapWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final Feature value;

  const MapWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
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

  dynamic getUpdatedValue() {
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
                                                } else if (isLineStringType) {
                                                  List<String> coordinateStrings = newValue
                                                        .replaceAll('[', '') 
                                                        .replaceAll(']', '')
                                                        .split(','); 
                                                  List<double> coordinates = coordinateStrings.map((str) => double.parse(str)).toList();

                                                  geometry?.coordinates[index] =
                                                      coordinates;
                                                } else if (isPolygonType) {

                                                } else if (isMultiPointType) {

                                                } else if (isMultiLineStringType) {

                                                } else if (isMultiPolygonType) {

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
                                                } else if (isLineStringType) {
                                                  geometry?.coordinates
                                                    .removeAt(index);
                                                  currentValue = currentValue?.copyWith(geometry: geometry);
                                                  updateTextControllers();
                                                } else if (isPolygonType) {

                                                } else if (isMultiPointType) {

                                                } else if (isMultiLineStringType) {

                                                } else if (isMultiPolygonType) {
                                                  
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
                    if (isLineStringType)
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            if (isLineStringType) {
                              geometry?.coordinates.add(<double>[]);
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
                  PointView(currentValue?.geometry.coordinates, currentValue?.properties, 200),
                if (isLineStringType)
                  LineStringView(currentValue?.geometry.coordinates, currentValue?.properties, 200),
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
      ],
    );
  }

 void showPointView(BuildContext context, Feature? point) {
    List<double> doubleCoordinates = point?.geometry.coordinates;
    dynamic properties = point?.properties;
  
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MapScreenView(PointView(doubleCoordinates, properties, MediaQuery.of(context).size.height)),
    ));
  }

  void showLineStringView(BuildContext context, Feature? points) {
    List<List<double>> routeCoordinates = points?.geometry.coordinates;
    dynamic properties = points?.properties;

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MapScreenView(LineStringView(routeCoordinates, properties, MediaQuery.of(context).size.height)),
    ));
  }

  void showPolygonView(BuildContext context, Feature? points) {
    List<List<List<double>>> polygonCoordinates = points?.geometry.coordinates;
    dynamic properties = points?.properties;

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MapScreenView(PolygonView(
          polygonCoordinates, properties, MediaQuery.of(context).size.height)),
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

class PointView extends StatelessWidget {
  final List<double> coordinates;
  final dynamic properties;
  final double height;

  const PointView(this.coordinates, this.properties, this.height, {super.key});

  String formatProperties(Map<String, dynamic> properties) {
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

class LineStringView extends StatelessWidget {
  final List<List<double>> routeCoordinates;
  final dynamic properties;
  final double height;

  const LineStringView(this.routeCoordinates, this.properties, this.height, {super.key});

  String formatProperties(Map<String, dynamic> properties) {
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

class PolygonView extends StatelessWidget {
  final List<List<List<double>>> routeCoordinates;
  final dynamic properties;
  final double height;

  const PolygonView(this.routeCoordinates, this.properties, this.height,
      {super.key});

  String formatProperties(Map<String, dynamic> properties) {
    String message = '';
    properties.forEach((key, value) {
      message += '\$key: \$value\n';
    });
    return message;
  }

  @override
  Widget build(BuildContext context) {
    List<List<List<double>>> adjustedRouteCoordinates =
        routeCoordinates.isNotEmpty ? routeCoordinates : [[[0, 0]]];

    var centroid = _calculateCentroid(adjustedRouteCoordinates[0]);

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
              zoom: 10,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: const ['a', 'b', 'c'],
              ),
              PolygonLayer(
                polygons: [
                  flutter_map.Polygon(
                    points: adjustedRouteCoordinates
                      .expand((polygon) => polygon.map((coord) => LatLng(coord[0], coord[1])))
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
        ''');

// **************************************************************************
// DefaultWidget
// **************************************************************************


    buffer.writeln('''
class DefaultWidget extends StatefulWidget {
  final Key? key;
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final dynamic value;

  DefaultWidget({
    this.key,
    required this.fieldName,
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

  @override
  void initState() {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue.toString();
  }

  dynamic getUpdatedValue() {
    return isValueChanged ? currentValue : initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: widget.placeholder,
                        ),
                        initialValue: widget.value?.toString(),
                        onChanged: (newValue) {
                          setState(() {
                            isValueChanged =
                                newValue != initialValue.toString();
                            currentValue = newValue;
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
  final bool editable;
  final String placeholder;
  final double? value;

  const DoubleWidget({
    Key? key,
    required this.fieldName,
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

  @override
  void initState() {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue?.toString() ?? '';
  }

  double? getUpdatedValue() {
    return isValueChanged ? double.tryParse(currentValue) : initialValue;
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
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                            ],
                            decoration: InputDecoration(
                              hintText: widget.placeholder,
                            ),
                            initialValue: widget.value?.toString(),
                            onChanged: (newValue) {
                              setState(() {
                                isValueChanged = newValue != initialValue.toString();
                                currentValue = newValue;
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
  final bool editable;
  final String placeholder;
  final String? value;
  final List<Widget>? additionalChildren;

  const StringWidget({
    Key? key,
    required this.fieldName,
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
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: widget.placeholder,
                            ),
                            initialValue: widget.value,
                            onChanged: (newValue) {
                              setState(() {
                                isValueChanged = newValue != initialValue;
                                currentValue = newValue;
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
// DateTimeWidget
// **************************************************************************

    buffer.writeln('''
class DateTimeWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final DateTime? value;

  const DateTimeWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
  }) : super(key: key);

  @override
  DateTimeWidgetState createState() => DateTimeWidgetState();
}

class DateTimeWidgetState extends State<DateTimeWidget> {
  bool isValueChanged = false;
  late DateTime? initialValue;
  late DateTime? currentValue;

  @override
  void initState() {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue;
  }

  void _updateValue(DateTime newValue) {
    setState(() {
      isValueChanged = true;
      currentValue = newValue;
    });
  }

  DateTime? getUpdatedValue() {
    return isValueChanged ? currentValue : initialValue;
  }

  Future<void> _selectDateTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialValue ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
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
                          child: GestureDetector(
                            onTap: () => _selectDateTime(context),
                            child: Text(
                              currentValue?.toString() ?? widget.placeholder,
                            ),
                          ),
                        )
                      : Text(currentValue?.toString() ?? widget.placeholder),
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

  const CustomSearchBar({
    Key? key,
    required this.fields,
    required this.filters,
    required this.onFilterChanged,
    required this.onFilterRemove,
  }) : super(key: key);

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
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
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: const Border(
          bottom: BorderSide(color: Color.fromARGB(255, 233, 233, 233), width: 1.0),
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Column(
        children: [
          for (var i = 0; i < searchRows.length; i++)
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: _buildSearchRow(searchRows[i], i),
            ),
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
    List<String> availableFields = _getAvailableFields(searchRow);

    return Row(
      children: [
        const SizedBox(width: 2),
        SizedBox(
          height: 35,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color.fromARGB(255, 218, 218, 218),
                width: 1.0,
              ),
            ),
            child: DropdownButton<String>(
              value: searchRow.selectedField ?? availableFields.first,
              dropdownColor: Colors.white,
              items: availableFields.map((String field) {
                return DropdownMenuItem<String>(
                  value: field,
                  child: SizedBox(
                    child: Center(
                      child: Text(field),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? newSelectedField) {
                widget.onFilterRemove(
                    searchRow.selectedField!, searchRow.filterValue ?? '');
                setState(() {
                  searchRow.selectedField = newSelectedField;
                });

                if (newSelectedField != null) {
                  _filterChanged(index);
                }
              },
              icon: const Icon(Icons.arrow_drop_down),
              underline: const SizedBox(),
            ),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: SizedBox(
            height: 35,
            child: TextFormField(
              controller: searchRow.textEditingController,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: 'Enter search value',
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 218, 218, 218),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 218, 218, 218),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 218, 218, 218),
                    width: 1.0,
                  ),
                ),
              ),
              onEditingComplete: () {
                if (searchRow.selectedField != null) {
                  _filterChanged(index);
                }
              },
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.delete_outline),
          onPressed: () {
            _removeRow(index);
            widget.onFilterRemove(
                searchRow.selectedField!, searchRow.filterValue ?? '');
          },
        ),
      ],
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
      case 'String':
        filter = {r'\$regex': searchRow.textEditingController.text, r'\$options': 'i'};
        break;
      case 'int':
        filter = int.tryParse(searchRow.textEditingController.text);
        break;
      case 'double':
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
        case 'String':
          if (value is Map<String, dynamic> &&
              value.containsKey(r'\$regex') &&
              value.containsKey(r'\$options')) {
            dynamic regexValue = value[r'\$regex'];
            valueReturned = regexValue?.toString() ?? '';
          }
          break;
        case 'int':
          if (value == null) {
            valueReturned = '';
          }
          break;
        case 'double':
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
  final bool value;

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
  bool? _updatedValue;

  @override
  void initState() {
    super.initState();
    _updatedValue = widget.value;
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
            color: Colors.blueGrey, // Customize as needed
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
                          value: _updatedValue ?? false,
                          onChanged: (newValue) {
                            setState(() {
                              _updatedValue = newValue;
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

    return buffer.toString();
  }
}