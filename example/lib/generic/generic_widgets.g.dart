// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_widgets.dart';

// **************************************************************************
// GenericWidgetsGenerator
// **************************************************************************

Widget intWidget(String fieldName, int? value) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey, width: 1.0),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$fieldName:",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8.0),
        Text(value.toString()),
      ],
    ),
  );
}

Widget doubleWidget(String fieldName, double? value) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey, width: 1.0),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$fieldName:",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8.0),
        Text(value.toString()),
      ],
    ),
  );
}

Widget stringWidget(String fieldName, String? value) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey, width: 1.0),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$fieldName:",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8.0),
        Text(value!),
      ],
    ),
  );
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
