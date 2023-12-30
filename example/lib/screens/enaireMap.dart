import 'package:example/screens/rabbitMQ.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_arcgis/flutter_map_arcgis.dart';
import 'package:flutter/material.dart';

class EnaireMap extends ConsumerWidget {

  const EnaireMap({super.key});
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amqpProviderValue = ref.watch(amqpProvider);

    return FlutterMap(
      options: const MapOptions(
        center: LatLng(41.3851, 2.1734),
        zoom: 10.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
          subdomains: const ['mt0', 'mt1', 'mt2', 'mt3'],
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
        MarkerLayer(
          markers: [
            Marker(
              width: 40.0,
              height: 40.0,
              point: LatLng(amqpProviderValue.latitude, amqpProviderValue.longitude),
              child: const Icon(
                Icons.my_location,
                color: Color.fromARGB(255, 161, 38, 69),
                size: 35,
              ),
            ),
          ],
        ),
      ],
    );
  }
}