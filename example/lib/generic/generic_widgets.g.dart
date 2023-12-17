// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_widgets.dart';

// **************************************************************************
// GenericWidgetsGenerator
// **************************************************************************

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
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
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

class MapWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final dynamic value;

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
  bool isValueChanged = false;
  late dynamic initialValue;
  late dynamic currentValue;

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
    bool isPointType =
        widget.value is Map<String, dynamic> && widget.value['type'] == 'Point';
    bool isListType = widget.value is List<Map<String, dynamic>> &&
        widget.value[0]['type'] == 'Point';

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
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
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
                showMapView(context, widget.value['coordinates']);
              },
              child: const Text('Map'),
            ),
          ),
        if (isListType)
          Positioned(
            top: 0,
            right: 0,
            child: ElevatedButton(
              onPressed: () {
                showRouteView(context, widget.value);
              },
              child: const Text('Show Route'),
            ),
          ),
      ],
    );
  }

  void showMapView(BuildContext context, List<dynamic> coordinates) {
    List<double> doubleCoordinates = coordinates.cast<double>();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MapView(doubleCoordinates),
    ));
  }

  void showRouteView(BuildContext context, List<Map<String, dynamic>> points) {
    List<List<double>> routeCoordinates = [];
    for (var point in points) {
      routeCoordinates.add(point['coordinates'].cast<double>());
    }

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => RouteView(routeCoordinates),
    ));
  }
}

class MapView extends StatelessWidget {
  final List<double> coordinates;

  const MapView(this.coordinates, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map View'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(coordinates[1], coordinates[0]),
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
                point: LatLng(coordinates[1], coordinates[0]),
                builder: (context) => const Icon(
                  Icons.location_on_outlined,
                  color: Color.fromARGB(255, 214, 166, 146),
                  size: 35,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class RouteView extends StatelessWidget {
  final List<List<double>> routeCoordinates;

  const RouteView(this.routeCoordinates, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route View'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(routeCoordinates[0][1], routeCoordinates[0][0]),
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
                points: routeCoordinates
                    .map((coord) => LatLng(coord[1], coord[0]))
                    .toList(),
                strokeWidth: 4.0,
                color: const Color.fromARGB(255, 227, 224, 164),
              ),
            ],
          ),
          MarkerLayer(
            markers: routeCoordinates
                .map((coord) => Marker(
                      width: 56,
                      height: 56,
                      point: LatLng(coord[1], coord[0]),
                      builder: (context) => const Icon(
                        Icons.location_on_outlined,
                        color: Color.fromARGB(255, 103, 146, 144),
                        size: 35,
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

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
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9.]')),
                            ],
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
        if (widget.additionalChildren != null) ...widget.additionalChildren!
      ],
    );
  }
}

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
          color: pageNumber == currentPage
              ? const Color.fromARGB(255, 224, 221, 221)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Text('$pageNumber'),
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

Widget boolWidget(String fieldName, bool value) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: value ? Colors.green : Colors.red,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Text(
      value ? 'Active' : 'Inactive',
      style: const TextStyle(color: Colors.white),
    ),
  );
}

Widget stringListWidget(String fieldName, List<String> value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('$fieldName:'),
      for (var item in value) Text('- $item'),
    ],
  );
}

Widget mapWidget(String fieldName, Map<String, dynamic> value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('$fieldName:'),
      for (var entry in value.entries) Text('${entry.key}: ${entry.value}'),
    ],
  );
}
