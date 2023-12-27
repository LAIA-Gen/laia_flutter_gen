import 'package:annotations/annotations.dart';
import 'package:example/models/drone.dart';
import 'package:example/models/flightplan.dart';
import 'package:example/models/user.dart';
import 'package:example/models/waypoint.dart';
import 'package:example/models/flightplanroute.dart';
import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_arcgis/flutter_map_arcgis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EnaireMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(41.3851, 2.1734),
        zoom: 14.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
          subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
        ),
        FeatureLayer(
          FeatureLayerOptions(
            "https://servais.enaire.es/insigniad/rest/services/NOTAM/NOTAM_DRONES_APP_nacw0113_V1/MapServer/0",
            "polygon",
            render: (dynamic attributes) {
              return PolygonOptions(
                borderColor: Colors.green.withOpacity(0.5),
                color: Colors.green.withOpacity(0.2),
                borderStrokeWidth: 2,
                isFilled: true,
              );
            },
            onTap: (attributes, LatLng location) {
            },
          ),
        ),
        FeatureLayer(
          FeatureLayerOptions(
            "https://servais.enaire.es/insigniad/rest/services/NSF_APP/Drones_APP_V1/MapServer/1",
            "polygon",
            render: (dynamic attributes) {
              return PolygonOptions(
                borderColor: Colors.red.withOpacity(0.5),
                color: Colors.red.withOpacity(0.1),
                borderStrokeWidth: 2,
                isFilled: true,
              );
            },
            onTap: (attributes, LatLng location) {
            },
          ),
        ),
        FeatureLayer(
          FeatureLayerOptions(
            "https://servais.enaire.es/insigniad/rest/services/NSF_APP/Drones_APP_V1/MapServer/2",
            "polygon",
            render: (dynamic attributes) {
              return PolygonOptions(
                borderColor: Colors.yellow.withOpacity(0.5),
                color: Colors.yellow.withOpacity(0.2),
                borderStrokeWidth: 2,
                isFilled: true,
              );
            },
            onTap: (attributes, LatLng location) {
            },
          ),
        ),
      ],
    );
  }
}