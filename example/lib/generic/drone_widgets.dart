import 'package:example/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:example/config/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tuple/tuple.dart';
import 'package:example/generic/generic_widgets.dart';

class droneAlertsWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final Map<String, dynamic>? value;
  final List<Widget>? additionalChildren;
  late bool _initialized = false;
  late int severity;
  late String alertMessage;
  late String droneId;

  droneAlertsWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
    this.additionalChildren,
  }) : super(key: key);

  @override
  droneAlertsWidgetState createState() => droneAlertsWidgetState();
}

class droneAlertsWidgetState extends State<droneAlertsWidget> {
  var container = ProviderContainer();

  @override
  void initState() {
    super.initState();
    if (!widget._initialized) {
      widget.severity = widget.value!['severity'];
      widget.alertMessage = widget.value!['alert_message'];
      widget.droneId = widget.value!['drone_id'];
      widget._initialized = true;
    }
  }

  Map<String, dynamic>? getUpdatedValue() {
    return widget.value;
  }

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
              Container(
                width: 200,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                    colors: [
                      getColor(widget.severity),
                      getColor(widget.severity),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                '${widget.severity}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: getColor(widget.severity),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            widget.alertMessage,
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () async {
              dynamic data = await container.read(getDroneAlertsProvider(Tuple2(widget.droneId, context)).future);
              setState(() {
                widget.severity = data['severity'];
                widget.alertMessage = data['alert_message'];
                
              });
            },
            child: Text(
              "Check Alerts",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}

final getDroneAlertsProvider =
    FutureProvider.autoDispose.family<Map<String, dynamic>, Tuple2<String, BuildContext>>((ref, tuple) async {
  String droneId = tuple.item1;
  BuildContext context = tuple.item2;
  final response = await http.get(Uri.parse('$baseURL/drone_tracking_alert_from_drone/$droneId'));
  if (response.statusCode != 200) {
    CustomSnackBar.show(context, jsonDecode(response.body)['detail']);
    return {};
  } else {
    CustomSnackBar.show(context, jsonDecode(response.body)['message']);
    return {
      'alert_message': jsonDecode(response.body)['alert_message'],
      'severity': jsonDecode(response.body)['severity']
    };
  }
});
