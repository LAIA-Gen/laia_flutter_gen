// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// ElementWidgetGenerator
// **************************************************************************

class PetWidget extends StatelessWidget {
  final Pet element;
  const PetWidget(this.element, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        intWidget("id", element.id),
        stringWidget("name", element.name),
        stringWidget("animalType", element.animalType),
        doubleWidget("weight", element.weight),
        intWidget("ownerId", element.ownerId),
      ],
    );
  }
}

// **************************************************************************
// HomeWidgetElementGenerator
// **************************************************************************

class PetHomeWidget extends StatelessWidget {
  const PetHomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      color: Colors.blue, // You can choose any color you like
      child: const Center(
        child: Text(
          "Pet",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pet _$PetFromJson(Map<String, dynamic> json) => Pet(
      id: json['id'] as int,
      name: json['name'] as String,
      animalType: json['animalType'] as String,
      weight: (json['weight'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      ownerId: json['ownerId'] as int?,
    );

Map<String, dynamic> _$PetToJson(Pet instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'animalType': instance.animalType,
      'weight': instance.weight,
      'date': instance.date.toIso8601String(),
      'ownerId': instance.ownerId,
    };
