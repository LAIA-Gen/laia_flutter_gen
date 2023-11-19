// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_widgets.dart';

// **************************************************************************
// GenericWidgetsGenerator
// **************************************************************************

Widget intWidget(String fieldName, String fieldDescription, bool editable, String placeholder, int? value) {
  bool isValueChanged = false; // Track whether the value has been changed

  return Stack(
    children: [
      Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey, width: 1.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$fieldName:",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 8.0),
            Text(
              fieldDescription,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            editable
                ? Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: placeholder,
                      ),
                      initialValue: value?.toString(),
                      keyboardType: TextInputType.number,
                      onChanged: (newValue) {
                        isValueChanged = true;
                      },
                    ),
                  )
                : Text(value?.toString() ?? placeholder),
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
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange,
            ),
          ),
        ),
    ]
  );
}

Widget defaultWidget(String fieldName, DateTime value) {
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
