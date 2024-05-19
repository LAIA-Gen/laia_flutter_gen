import 'package:example/config/styles.dart';
import 'package:example/models/geometry.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_arcgis/flutter_map_arcgis.dart';
import 'package:flutter_map/src/layer/polygon_layer/polygon_layer.dart' as flutter_map;
import 'package:latlong2/latlong.dart';
import 'package:example/models/flightplan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:example/config/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tuple/tuple.dart';
import 'package:example/generic/generic_widgets.dart';

class flightplanApprovedWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final String? elementId;
  final bool? value;
  final List<Widget>? additionalChildren;

  flightplanApprovedWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.elementId,
    required this.value,
    this.additionalChildren,
  }) : super(key: key);

  @override
  flightplanApprovedWidgetState createState() => flightplanApprovedWidgetState();
}

class flightplanApprovedWidgetState extends State<flightplanApprovedWidget> {
  var container = ProviderContainer();
  List<FlightPlan>? collisions = null;
  FlightPlan? flightplan = null;
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

  final GlobalKey<MapWidgetState> routeWidgetKey = GlobalKey<MapWidgetState>();

  @override
  Widget build(BuildContext context) {
    Color getColor(int severity) {
      if (severity <= 0) return Colors.green;
      if (severity >= 10) return Colors.red;
      return const Color.fromARGB(255, 255, 170, 59);
    }

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
            children: [
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
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () async {
              dynamic flightplanCollisions = await container.read(getflightplanCollisionsProvider(Tuple2("66466641f64b778d7b97f914", context)).future);
              setState(() {
                collisions = flightplanCollisions["collisions"];
                flightplan = flightplanCollisions["flightplan"];
                print(flightplan);
                print(collisions);
              });
            },
            child: Text(
              "Check Collisions",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          const SizedBox(height: 8.0),
          if (collisions != null)
          Container(
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(
                    collisions?[0].route?.geometry.coordinates[0][1],
                    collisions?[0].route?.geometry.coordinates[0][0],
                  ),
                  zoom: 8,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: const ['a', 'b', 'c'],
                  ),
                  PolylineLayer(
                    polylines: [
                      ...collisions
                        ?.map(
                          (collision) => Polyline(
                            points: (collision.route!.geometry.coordinates as List<List<double>>)
                              .where((coord) => coord.length >= 2)
                              .map((coord) => LatLng(coord[1], coord[0]))
                              .toList(),
                            strokeWidth: 4.0,
                            color: const Color.fromARGB(255, 227, 164, 164),
                          ),
                        )
                        .toList() as List<Polyline>,
                      Polyline(
                        points: (flightplan?.route!.geometry.coordinates as List<List<double>>)
                          .where((coord) => coord.length >= 2)
                          .map((coord) => LatLng(coord[1], coord[0]))
                          .toList(),
                        strokeWidth: 4.0,
                        color: const Color.fromARGB(255, 164, 191, 227),
                      ),
                    ]
                  ),
                  MarkerLayer(
                    markers: [
                      ...collisions
                        ?.expand((collision) => (collision.route!.geometry.coordinates as List<List<double>>)
                              .map((coord) => Marker(
                              width: 56,
                              height: 56,
                              point: LatLng(coord[1], coord[0]),
                              child: Tooltip(
                                message: "Conflicting Flight Plan: " + collision.name.toString(),
                                child: const Icon(
                                  Icons.location_searching_rounded,
                                  color: Color.fromARGB(255, 180, 93, 93),
                                  size: 35,
                                ),
                              ),
                            )))
                        .toList() as List<Marker>,
                      ...(flightplan?.route!.geometry.coordinates as List<List<double>>)
                        .map((coord) => Marker(
                        width: 56,
                        height: 56,
                        point: LatLng(coord[1], coord[0]),
                        child: Tooltip(
                          message: "Flight Plan: " + flightplan!.name.toString(),
                          child: const Icon(
                            Icons.location_searching_rounded,
                            color: Color.fromARGB(255, 75, 116, 170),
                            size: 35,
                          ),
                        ),
                      )).toList(),
                    ]
                  ),
                ],
              ),
            ))
        ],
      ),
    );
  }
}

final getflightplanCollisionsProvider =
    FutureProvider.autoDispose.family<dynamic, Tuple2<String, BuildContext>>((ref, tuple) async {
  String flightplanId = tuple.item1;
  BuildContext context = tuple.item2;
  final response = await http.get(Uri.parse('$baseURL/flightplan_approval_check/$flightplanId'));
  if (response.statusCode != 200) {
    CustomSnackBar.show(context, jsonDecode(response.body)['detail']);
    return <FlightPlan>[];
  } else {
    CustomSnackBar.show(context, jsonDecode(response.body)['message']);
    return {
      "collisions": (jsonDecode(response.body)['collisions'] as List)
        .map((data) => FlightPlan.fromJson(data))
        .toList(),
      "flightplan": FlightPlan.fromJson(jsonDecode(response.body)['flightplan'])
    };
  }
});
