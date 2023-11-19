import 'package:flutter/material.dart';

Widget buildIntWidget(String fieldName, int value) {
  return Text("$fieldName: $value");
}

Widget buildDoubleWidget(String fieldName, double value) {
  return Text("$fieldName: $value");
}

Widget buildStringWidget(String fieldName, String value) {
  return Text("$fieldName: $value");
}

Widget buildBoolWidget(String fieldName, bool value) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: value ? Colors.green : Colors.red,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Text(
      value ? "Active" : "Inactive",
      style: const TextStyle(color: Colors.white),
    ),
  );
}

Widget buildListWidget(String fieldName, List<String> value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("$fieldName:"),
      for (var item in value) Text("- $item"),
    ],
  );
}

Widget buildMapWidget(String fieldName, Map<String, dynamic> value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("$fieldName:"),
      for (var entry in value.entries) Text("${entry.key}: ${entry.value}"),
    ],
  );
}