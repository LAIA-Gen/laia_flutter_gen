import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'geometry.g.dart';

@JsonSerializable()
@CopyWith()
class Feature {
  final String type;
  final dynamic properties;
  final dynamic geometry;

  Feature({
    required this.type,
    this.properties,
    required this.geometry
  });

  factory Feature.fromJson(Map<String, dynamic> json) => _$FeatureFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureToJson(this);
}

@JsonSerializable()
@CopyWith()
class GeometryLineString {
  final String type;
  final List<List<double>> coordinates;

  GeometryLineString({
    required this.type,
    required this.coordinates,
  });

  factory GeometryLineString.fromJson(Map<String, dynamic> json) => _$GeometryLineStringFromJson(json);

  Map<String, dynamic> toJson() => _$GeometryLineStringToJson(this);
}

@JsonSerializable()
@CopyWith()
class LineString extends Feature {

  LineString({
    required String type,
    dynamic properties,
    required GeometryLineString geometry,
  }) : 
    super(type: type, properties: properties, geometry: geometry);

  factory LineString.fromJson(Map<String, dynamic> json) => _$LineStringFromJson(json);

  Map<String, dynamic> toJson() => _$LineStringToJson(this);
}

@JsonSerializable()
@CopyWith()
class GeometryMultiLineString {
  final String type;
  final List<List<List<double>>> coordinates;

  GeometryMultiLineString({
    required this.type,
    required this.coordinates,
  });

  factory GeometryMultiLineString.fromJson(Map<String, dynamic> json) => _$GeometryMultiLineStringFromJson(json);

  Map<String, dynamic> toJson() => _$GeometryMultiLineStringToJson(this);
}

@JsonSerializable()
@CopyWith()
class MultiLineString extends Feature {

  MultiLineString({
    required String type,
    dynamic properties,
    required GeometryMultiLineString geometry,
  }) : 
    super(type: type, properties: properties, geometry: geometry);

  factory MultiLineString.fromJson(Map<String, dynamic> json) => _$MultiLineStringFromJson(json);

  Map<String, dynamic> toJson() => _$MultiLineStringToJson(this);
}

@JsonSerializable()
@CopyWith()
class GeometryMultiPoint {
  final String type;
  final List<List<double>> coordinates;

  GeometryMultiPoint({
    required this.type,
    required this.coordinates,
  });

  factory GeometryMultiPoint.fromJson(Map<String, dynamic> json) => _$GeometryMultiPointFromJson(json);

  Map<String, dynamic> toJson() => _$GeometryMultiPointToJson(this);
}

@JsonSerializable()
@CopyWith()
class MultiPoint extends Feature {

  MultiPoint({
    required String type,
    dynamic properties,
    required GeometryMultiPoint geometry,
  }) : 
    super(type: type, properties: properties, geometry: geometry);

  factory MultiPoint.fromJson(Map<String, dynamic> json) => _$MultiPointFromJson(json);

  Map<String, dynamic> toJson() => _$MultiPointToJson(this);
}

@JsonSerializable()
@CopyWith()
class GeometryMultiPolygon {
  final String type;
  final List<List<List<List<double>>>> coordinates;

  GeometryMultiPolygon({
    required this.type,
    required this.coordinates,
  });

  factory GeometryMultiPolygon.fromJson(Map<String, dynamic> json) => _$GeometryMultiPolygonFromJson(json);

  Map<String, dynamic> toJson() => _$GeometryMultiPolygonToJson(this);
}

@JsonSerializable()
@CopyWith()
class MultiPolygon extends Feature {

  MultiPolygon({
    required String type,
    dynamic properties,
    required GeometryMultiPolygon geometry,
  }) : 
    super(type: type, properties: properties, geometry: geometry);

  factory MultiPolygon.fromJson(Map<String, dynamic> json) => _$MultiPolygonFromJson(json);

  Map<String, dynamic> toJson() => _$MultiPolygonToJson(this);
}

@JsonSerializable()
@CopyWith()
class GeometryPoint {
  final String type;
  final List<double> coordinates;

  GeometryPoint({
    required this.type,
    required this.coordinates,
  });

  factory GeometryPoint.fromJson(Map<String, dynamic> json) => _$GeometryPointFromJson(json);

  Map<String, dynamic> toJson() => _$GeometryPointToJson(this);
}

@JsonSerializable()
@CopyWith()
class Point extends Feature {

  Point({
    required String type,
    dynamic properties,
    required GeometryPoint geometry,
  }) : 
    super(type: type, properties: properties, geometry: geometry);

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);

  Map<String, dynamic> toJson() => _$PointToJson(this);
}

@JsonSerializable()
@CopyWith()
class GeometryPolygon {
  final String type;
  final List<List<List<double>>> coordinates;

  GeometryPolygon({
    required this.type,
    required this.coordinates,
  });

  factory GeometryPolygon.fromJson(Map<String, dynamic> json) => _$GeometryPolygonFromJson(json);

  Map<String, dynamic> toJson() => _$GeometryPolygonToJson(this);
}


@JsonSerializable()
@CopyWith()
class Polygon extends Feature {

  Polygon({
    required String type,
    dynamic properties,
    required GeometryPolygon geometry,
  }) : 
    super(type: type, properties: properties, geometry: geometry);

  factory Polygon.fromJson(Map<String, dynamic> json) => _$PolygonFromJson(json);

  Map<String, dynamic> toJson() => _$PolygonToJson(this);
}