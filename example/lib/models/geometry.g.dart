// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geometry.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FeatureCWProxy {
  Feature geometry(dynamic geometry);

  Feature properties(dynamic properties);

  Feature type(String type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Feature(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Feature(...).copyWith(id: 12, name: "My name")
  /// ````
  Feature call({
    dynamic? geometry,
    dynamic? properties,
    String? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFeature.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFeature.copyWith.fieldName(...)`
class _$FeatureCWProxyImpl implements _$FeatureCWProxy {
  final Feature _value;

  const _$FeatureCWProxyImpl(this._value);

  @override
  Feature geometry(dynamic geometry) => this(geometry: geometry);

  @override
  Feature properties(dynamic properties) => this(properties: properties);

  @override
  Feature type(String type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Feature(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Feature(...).copyWith(id: 12, name: "My name")
  /// ````
  Feature call({
    Object? geometry = const $CopyWithPlaceholder(),
    Object? properties = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return Feature(
      geometry: geometry == const $CopyWithPlaceholder() || geometry == null
          ? _value.geometry
          // ignore: cast_nullable_to_non_nullable
          : geometry as dynamic,
      properties:
          properties == const $CopyWithPlaceholder() || properties == null
              ? _value.properties
              // ignore: cast_nullable_to_non_nullable
              : properties as dynamic,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String,
    );
  }
}

extension $FeatureCopyWith on Feature {
  /// Returns a callable class that can be used as follows: `instanceOfFeature.copyWith(...)` or like so:`instanceOfFeature.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FeatureCWProxy get copyWith => _$FeatureCWProxyImpl(this);
}

abstract class _$GeometryLineStringCWProxy {
  GeometryLineString coordinates(List<List<double>> coordinates);

  GeometryLineString type(String type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GeometryLineString(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GeometryLineString(...).copyWith(id: 12, name: "My name")
  /// ````
  GeometryLineString call({
    List<List<double>>? coordinates,
    String? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGeometryLineString.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGeometryLineString.copyWith.fieldName(...)`
class _$GeometryLineStringCWProxyImpl implements _$GeometryLineStringCWProxy {
  final GeometryLineString _value;

  const _$GeometryLineStringCWProxyImpl(this._value);

  @override
  GeometryLineString coordinates(List<List<double>> coordinates) =>
      this(coordinates: coordinates);

  @override
  GeometryLineString type(String type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GeometryLineString(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GeometryLineString(...).copyWith(id: 12, name: "My name")
  /// ````
  GeometryLineString call({
    Object? coordinates = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return GeometryLineString(
      coordinates:
          coordinates == const $CopyWithPlaceholder() || coordinates == null
              ? _value.coordinates
              // ignore: cast_nullable_to_non_nullable
              : coordinates as List<List<double>>,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String,
    );
  }
}

extension $GeometryLineStringCopyWith on GeometryLineString {
  /// Returns a callable class that can be used as follows: `instanceOfGeometryLineString.copyWith(...)` or like so:`instanceOfGeometryLineString.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GeometryLineStringCWProxy get copyWith =>
      _$GeometryLineStringCWProxyImpl(this);
}

abstract class _$LineStringCWProxy {
  LineString geometry(GeometryLineString geometry);

  LineString properties(dynamic properties);

  LineString type(String type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LineString(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LineString(...).copyWith(id: 12, name: "My name")
  /// ````
  LineString call({
    GeometryLineString? geometry,
    dynamic? properties,
    String? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLineString.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLineString.copyWith.fieldName(...)`
class _$LineStringCWProxyImpl implements _$LineStringCWProxy {
  final LineString _value;

  const _$LineStringCWProxyImpl(this._value);

  @override
  LineString geometry(GeometryLineString geometry) => this(geometry: geometry);

  @override
  LineString properties(dynamic properties) => this(properties: properties);

  @override
  LineString type(String type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LineString(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LineString(...).copyWith(id: 12, name: "My name")
  /// ````
  LineString call({
    Object? geometry = const $CopyWithPlaceholder(),
    Object? properties = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return LineString(
      geometry: geometry == const $CopyWithPlaceholder() || geometry == null
          ? _value.geometry
          // ignore: cast_nullable_to_non_nullable
          : geometry as GeometryLineString,
      properties:
          properties == const $CopyWithPlaceholder() || properties == null
              ? _value.properties
              // ignore: cast_nullable_to_non_nullable
              : properties as dynamic,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String,
    );
  }
}

extension $LineStringCopyWith on LineString {
  /// Returns a callable class that can be used as follows: `instanceOfLineString.copyWith(...)` or like so:`instanceOfLineString.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LineStringCWProxy get copyWith => _$LineStringCWProxyImpl(this);
}

abstract class _$GeometryMultiLineStringCWProxy {
  GeometryMultiLineString coordinates(List<List<List<double>>> coordinates);

  GeometryMultiLineString type(String type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GeometryMultiLineString(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GeometryMultiLineString(...).copyWith(id: 12, name: "My name")
  /// ````
  GeometryMultiLineString call({
    List<List<List<double>>>? coordinates,
    String? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGeometryMultiLineString.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGeometryMultiLineString.copyWith.fieldName(...)`
class _$GeometryMultiLineStringCWProxyImpl
    implements _$GeometryMultiLineStringCWProxy {
  final GeometryMultiLineString _value;

  const _$GeometryMultiLineStringCWProxyImpl(this._value);

  @override
  GeometryMultiLineString coordinates(List<List<List<double>>> coordinates) =>
      this(coordinates: coordinates);

  @override
  GeometryMultiLineString type(String type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GeometryMultiLineString(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GeometryMultiLineString(...).copyWith(id: 12, name: "My name")
  /// ````
  GeometryMultiLineString call({
    Object? coordinates = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return GeometryMultiLineString(
      coordinates:
          coordinates == const $CopyWithPlaceholder() || coordinates == null
              ? _value.coordinates
              // ignore: cast_nullable_to_non_nullable
              : coordinates as List<List<List<double>>>,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String,
    );
  }
}

extension $GeometryMultiLineStringCopyWith on GeometryMultiLineString {
  /// Returns a callable class that can be used as follows: `instanceOfGeometryMultiLineString.copyWith(...)` or like so:`instanceOfGeometryMultiLineString.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GeometryMultiLineStringCWProxy get copyWith =>
      _$GeometryMultiLineStringCWProxyImpl(this);
}

abstract class _$MultiLineStringCWProxy {
  MultiLineString geometry(GeometryMultiLineString geometry);

  MultiLineString properties(dynamic properties);

  MultiLineString type(String type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MultiLineString(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MultiLineString(...).copyWith(id: 12, name: "My name")
  /// ````
  MultiLineString call({
    GeometryMultiLineString? geometry,
    dynamic? properties,
    String? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMultiLineString.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMultiLineString.copyWith.fieldName(...)`
class _$MultiLineStringCWProxyImpl implements _$MultiLineStringCWProxy {
  final MultiLineString _value;

  const _$MultiLineStringCWProxyImpl(this._value);

  @override
  MultiLineString geometry(GeometryMultiLineString geometry) =>
      this(geometry: geometry);

  @override
  MultiLineString properties(dynamic properties) =>
      this(properties: properties);

  @override
  MultiLineString type(String type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MultiLineString(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MultiLineString(...).copyWith(id: 12, name: "My name")
  /// ````
  MultiLineString call({
    Object? geometry = const $CopyWithPlaceholder(),
    Object? properties = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return MultiLineString(
      geometry: geometry == const $CopyWithPlaceholder() || geometry == null
          ? _value.geometry
          // ignore: cast_nullable_to_non_nullable
          : geometry as GeometryMultiLineString,
      properties:
          properties == const $CopyWithPlaceholder() || properties == null
              ? _value.properties
              // ignore: cast_nullable_to_non_nullable
              : properties as dynamic,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String,
    );
  }
}

extension $MultiLineStringCopyWith on MultiLineString {
  /// Returns a callable class that can be used as follows: `instanceOfMultiLineString.copyWith(...)` or like so:`instanceOfMultiLineString.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MultiLineStringCWProxy get copyWith => _$MultiLineStringCWProxyImpl(this);
}

abstract class _$GeometryMultiPointCWProxy {
  GeometryMultiPoint coordinates(List<List<double>> coordinates);

  GeometryMultiPoint type(String type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GeometryMultiPoint(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GeometryMultiPoint(...).copyWith(id: 12, name: "My name")
  /// ````
  GeometryMultiPoint call({
    List<List<double>>? coordinates,
    String? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGeometryMultiPoint.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGeometryMultiPoint.copyWith.fieldName(...)`
class _$GeometryMultiPointCWProxyImpl implements _$GeometryMultiPointCWProxy {
  final GeometryMultiPoint _value;

  const _$GeometryMultiPointCWProxyImpl(this._value);

  @override
  GeometryMultiPoint coordinates(List<List<double>> coordinates) =>
      this(coordinates: coordinates);

  @override
  GeometryMultiPoint type(String type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GeometryMultiPoint(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GeometryMultiPoint(...).copyWith(id: 12, name: "My name")
  /// ````
  GeometryMultiPoint call({
    Object? coordinates = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return GeometryMultiPoint(
      coordinates:
          coordinates == const $CopyWithPlaceholder() || coordinates == null
              ? _value.coordinates
              // ignore: cast_nullable_to_non_nullable
              : coordinates as List<List<double>>,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String,
    );
  }
}

extension $GeometryMultiPointCopyWith on GeometryMultiPoint {
  /// Returns a callable class that can be used as follows: `instanceOfGeometryMultiPoint.copyWith(...)` or like so:`instanceOfGeometryMultiPoint.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GeometryMultiPointCWProxy get copyWith =>
      _$GeometryMultiPointCWProxyImpl(this);
}

abstract class _$MultiPointCWProxy {
  MultiPoint geometry(GeometryMultiPoint geometry);

  MultiPoint properties(dynamic properties);

  MultiPoint type(String type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MultiPoint(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MultiPoint(...).copyWith(id: 12, name: "My name")
  /// ````
  MultiPoint call({
    GeometryMultiPoint? geometry,
    dynamic? properties,
    String? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMultiPoint.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMultiPoint.copyWith.fieldName(...)`
class _$MultiPointCWProxyImpl implements _$MultiPointCWProxy {
  final MultiPoint _value;

  const _$MultiPointCWProxyImpl(this._value);

  @override
  MultiPoint geometry(GeometryMultiPoint geometry) => this(geometry: geometry);

  @override
  MultiPoint properties(dynamic properties) => this(properties: properties);

  @override
  MultiPoint type(String type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MultiPoint(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MultiPoint(...).copyWith(id: 12, name: "My name")
  /// ````
  MultiPoint call({
    Object? geometry = const $CopyWithPlaceholder(),
    Object? properties = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return MultiPoint(
      geometry: geometry == const $CopyWithPlaceholder() || geometry == null
          ? _value.geometry
          // ignore: cast_nullable_to_non_nullable
          : geometry as GeometryMultiPoint,
      properties:
          properties == const $CopyWithPlaceholder() || properties == null
              ? _value.properties
              // ignore: cast_nullable_to_non_nullable
              : properties as dynamic,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String,
    );
  }
}

extension $MultiPointCopyWith on MultiPoint {
  /// Returns a callable class that can be used as follows: `instanceOfMultiPoint.copyWith(...)` or like so:`instanceOfMultiPoint.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MultiPointCWProxy get copyWith => _$MultiPointCWProxyImpl(this);
}

abstract class _$GeometryMultiPolygonCWProxy {
  GeometryMultiPolygon coordinates(List<List<List<List<double>>>> coordinates);

  GeometryMultiPolygon type(String type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GeometryMultiPolygon(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GeometryMultiPolygon(...).copyWith(id: 12, name: "My name")
  /// ````
  GeometryMultiPolygon call({
    List<List<List<List<double>>>>? coordinates,
    String? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGeometryMultiPolygon.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGeometryMultiPolygon.copyWith.fieldName(...)`
class _$GeometryMultiPolygonCWProxyImpl
    implements _$GeometryMultiPolygonCWProxy {
  final GeometryMultiPolygon _value;

  const _$GeometryMultiPolygonCWProxyImpl(this._value);

  @override
  GeometryMultiPolygon coordinates(
          List<List<List<List<double>>>> coordinates) =>
      this(coordinates: coordinates);

  @override
  GeometryMultiPolygon type(String type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GeometryMultiPolygon(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GeometryMultiPolygon(...).copyWith(id: 12, name: "My name")
  /// ````
  GeometryMultiPolygon call({
    Object? coordinates = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return GeometryMultiPolygon(
      coordinates:
          coordinates == const $CopyWithPlaceholder() || coordinates == null
              ? _value.coordinates
              // ignore: cast_nullable_to_non_nullable
              : coordinates as List<List<List<List<double>>>>,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String,
    );
  }
}

extension $GeometryMultiPolygonCopyWith on GeometryMultiPolygon {
  /// Returns a callable class that can be used as follows: `instanceOfGeometryMultiPolygon.copyWith(...)` or like so:`instanceOfGeometryMultiPolygon.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GeometryMultiPolygonCWProxy get copyWith =>
      _$GeometryMultiPolygonCWProxyImpl(this);
}

abstract class _$MultiPolygonCWProxy {
  MultiPolygon geometry(GeometryMultiPolygon geometry);

  MultiPolygon properties(dynamic properties);

  MultiPolygon type(String type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MultiPolygon(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MultiPolygon(...).copyWith(id: 12, name: "My name")
  /// ````
  MultiPolygon call({
    GeometryMultiPolygon? geometry,
    dynamic? properties,
    String? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMultiPolygon.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMultiPolygon.copyWith.fieldName(...)`
class _$MultiPolygonCWProxyImpl implements _$MultiPolygonCWProxy {
  final MultiPolygon _value;

  const _$MultiPolygonCWProxyImpl(this._value);

  @override
  MultiPolygon geometry(GeometryMultiPolygon geometry) =>
      this(geometry: geometry);

  @override
  MultiPolygon properties(dynamic properties) => this(properties: properties);

  @override
  MultiPolygon type(String type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MultiPolygon(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MultiPolygon(...).copyWith(id: 12, name: "My name")
  /// ````
  MultiPolygon call({
    Object? geometry = const $CopyWithPlaceholder(),
    Object? properties = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return MultiPolygon(
      geometry: geometry == const $CopyWithPlaceholder() || geometry == null
          ? _value.geometry
          // ignore: cast_nullable_to_non_nullable
          : geometry as GeometryMultiPolygon,
      properties:
          properties == const $CopyWithPlaceholder() || properties == null
              ? _value.properties
              // ignore: cast_nullable_to_non_nullable
              : properties as dynamic,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String,
    );
  }
}

extension $MultiPolygonCopyWith on MultiPolygon {
  /// Returns a callable class that can be used as follows: `instanceOfMultiPolygon.copyWith(...)` or like so:`instanceOfMultiPolygon.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MultiPolygonCWProxy get copyWith => _$MultiPolygonCWProxyImpl(this);
}

abstract class _$GeometryPointCWProxy {
  GeometryPoint coordinates(List<double> coordinates);

  GeometryPoint type(String type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GeometryPoint(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GeometryPoint(...).copyWith(id: 12, name: "My name")
  /// ````
  GeometryPoint call({
    List<double>? coordinates,
    String? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGeometryPoint.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGeometryPoint.copyWith.fieldName(...)`
class _$GeometryPointCWProxyImpl implements _$GeometryPointCWProxy {
  final GeometryPoint _value;

  const _$GeometryPointCWProxyImpl(this._value);

  @override
  GeometryPoint coordinates(List<double> coordinates) =>
      this(coordinates: coordinates);

  @override
  GeometryPoint type(String type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GeometryPoint(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GeometryPoint(...).copyWith(id: 12, name: "My name")
  /// ````
  GeometryPoint call({
    Object? coordinates = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return GeometryPoint(
      coordinates:
          coordinates == const $CopyWithPlaceholder() || coordinates == null
              ? _value.coordinates
              // ignore: cast_nullable_to_non_nullable
              : coordinates as List<double>,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String,
    );
  }
}

extension $GeometryPointCopyWith on GeometryPoint {
  /// Returns a callable class that can be used as follows: `instanceOfGeometryPoint.copyWith(...)` or like so:`instanceOfGeometryPoint.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GeometryPointCWProxy get copyWith => _$GeometryPointCWProxyImpl(this);
}

abstract class _$PointCWProxy {
  Point geometry(GeometryPoint geometry);

  Point properties(dynamic properties);

  Point type(String type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Point(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Point(...).copyWith(id: 12, name: "My name")
  /// ````
  Point call({
    GeometryPoint? geometry,
    dynamic? properties,
    String? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPoint.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPoint.copyWith.fieldName(...)`
class _$PointCWProxyImpl implements _$PointCWProxy {
  final Point _value;

  const _$PointCWProxyImpl(this._value);

  @override
  Point geometry(GeometryPoint geometry) => this(geometry: geometry);

  @override
  Point properties(dynamic properties) => this(properties: properties);

  @override
  Point type(String type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Point(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Point(...).copyWith(id: 12, name: "My name")
  /// ````
  Point call({
    Object? geometry = const $CopyWithPlaceholder(),
    Object? properties = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return Point(
      geometry: geometry == const $CopyWithPlaceholder() || geometry == null
          ? _value.geometry
          // ignore: cast_nullable_to_non_nullable
          : geometry as GeometryPoint,
      properties:
          properties == const $CopyWithPlaceholder() || properties == null
              ? _value.properties
              // ignore: cast_nullable_to_non_nullable
              : properties as dynamic,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String,
    );
  }
}

extension $PointCopyWith on Point {
  /// Returns a callable class that can be used as follows: `instanceOfPoint.copyWith(...)` or like so:`instanceOfPoint.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PointCWProxy get copyWith => _$PointCWProxyImpl(this);
}

abstract class _$GeometryPolygonCWProxy {
  GeometryPolygon coordinates(List<List<List<double>>> coordinates);

  GeometryPolygon type(String type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GeometryPolygon(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GeometryPolygon(...).copyWith(id: 12, name: "My name")
  /// ````
  GeometryPolygon call({
    List<List<List<double>>>? coordinates,
    String? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGeometryPolygon.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGeometryPolygon.copyWith.fieldName(...)`
class _$GeometryPolygonCWProxyImpl implements _$GeometryPolygonCWProxy {
  final GeometryPolygon _value;

  const _$GeometryPolygonCWProxyImpl(this._value);

  @override
  GeometryPolygon coordinates(List<List<List<double>>> coordinates) =>
      this(coordinates: coordinates);

  @override
  GeometryPolygon type(String type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GeometryPolygon(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GeometryPolygon(...).copyWith(id: 12, name: "My name")
  /// ````
  GeometryPolygon call({
    Object? coordinates = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return GeometryPolygon(
      coordinates:
          coordinates == const $CopyWithPlaceholder() || coordinates == null
              ? _value.coordinates
              // ignore: cast_nullable_to_non_nullable
              : coordinates as List<List<List<double>>>,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String,
    );
  }
}

extension $GeometryPolygonCopyWith on GeometryPolygon {
  /// Returns a callable class that can be used as follows: `instanceOfGeometryPolygon.copyWith(...)` or like so:`instanceOfGeometryPolygon.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GeometryPolygonCWProxy get copyWith => _$GeometryPolygonCWProxyImpl(this);
}

abstract class _$PolygonCWProxy {
  Polygon geometry(GeometryPolygon geometry);

  Polygon properties(dynamic properties);

  Polygon type(String type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Polygon(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Polygon(...).copyWith(id: 12, name: "My name")
  /// ````
  Polygon call({
    GeometryPolygon? geometry,
    dynamic? properties,
    String? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPolygon.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPolygon.copyWith.fieldName(...)`
class _$PolygonCWProxyImpl implements _$PolygonCWProxy {
  final Polygon _value;

  const _$PolygonCWProxyImpl(this._value);

  @override
  Polygon geometry(GeometryPolygon geometry) => this(geometry: geometry);

  @override
  Polygon properties(dynamic properties) => this(properties: properties);

  @override
  Polygon type(String type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Polygon(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Polygon(...).copyWith(id: 12, name: "My name")
  /// ````
  Polygon call({
    Object? geometry = const $CopyWithPlaceholder(),
    Object? properties = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return Polygon(
      geometry: geometry == const $CopyWithPlaceholder() || geometry == null
          ? _value.geometry
          // ignore: cast_nullable_to_non_nullable
          : geometry as GeometryPolygon,
      properties:
          properties == const $CopyWithPlaceholder() || properties == null
              ? _value.properties
              // ignore: cast_nullable_to_non_nullable
              : properties as dynamic,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String,
    );
  }
}

extension $PolygonCopyWith on Polygon {
  /// Returns a callable class that can be used as follows: `instanceOfPolygon.copyWith(...)` or like so:`instanceOfPolygon.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PolygonCWProxy get copyWith => _$PolygonCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feature _$FeatureFromJson(Map<String, dynamic> json) => Feature(
      type: json['type'] as String,
      properties: json['properties'],
      geometry: json['geometry'],
    );

Map<String, dynamic> _$FeatureToJson(Feature instance) => <String, dynamic>{
      'type': instance.type,
      'properties': instance.properties,
      'geometry': instance.geometry,
    };

GeometryLineString _$GeometryLineStringFromJson(Map<String, dynamic> json) =>
    GeometryLineString(
      type: json['type'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
    );

Map<String, dynamic> _$GeometryLineStringToJson(GeometryLineString instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

LineString _$LineStringFromJson(Map<String, dynamic> json) => LineString(
      type: json['type'] as String,
      properties: json['properties'],
      geometry:
          GeometryLineString.fromJson(json['geometry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LineStringToJson(LineString instance) =>
    <String, dynamic>{
      'type': instance.type,
      'properties': instance.properties,
      'geometry': instance.geometry,
    };

GeometryMultiLineString _$GeometryMultiLineStringFromJson(
        Map<String, dynamic> json) =>
    GeometryMultiLineString(
      type: json['type'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => (e as List<dynamic>)
                  .map((e) => (e as num).toDouble())
                  .toList())
              .toList())
          .toList(),
    );

Map<String, dynamic> _$GeometryMultiLineStringToJson(
        GeometryMultiLineString instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

MultiLineString _$MultiLineStringFromJson(Map<String, dynamic> json) =>
    MultiLineString(
      type: json['type'] as String,
      properties: json['properties'],
      geometry: GeometryMultiLineString.fromJson(
          json['geometry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MultiLineStringToJson(MultiLineString instance) =>
    <String, dynamic>{
      'type': instance.type,
      'properties': instance.properties,
      'geometry': instance.geometry,
    };

GeometryMultiPoint _$GeometryMultiPointFromJson(Map<String, dynamic> json) =>
    GeometryMultiPoint(
      type: json['type'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
    );

Map<String, dynamic> _$GeometryMultiPointToJson(GeometryMultiPoint instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

MultiPoint _$MultiPointFromJson(Map<String, dynamic> json) => MultiPoint(
      type: json['type'] as String,
      properties: json['properties'],
      geometry:
          GeometryMultiPoint.fromJson(json['geometry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MultiPointToJson(MultiPoint instance) =>
    <String, dynamic>{
      'type': instance.type,
      'properties': instance.properties,
      'geometry': instance.geometry,
    };

GeometryMultiPolygon _$GeometryMultiPolygonFromJson(
        Map<String, dynamic> json) =>
    GeometryMultiPolygon(
      type: json['type'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => (e as List<dynamic>)
                  .map((e) => (e as List<dynamic>)
                      .map((e) => (e as num).toDouble())
                      .toList())
                  .toList())
              .toList())
          .toList(),
    );

Map<String, dynamic> _$GeometryMultiPolygonToJson(
        GeometryMultiPolygon instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

MultiPolygon _$MultiPolygonFromJson(Map<String, dynamic> json) => MultiPolygon(
      type: json['type'] as String,
      properties: json['properties'],
      geometry: GeometryMultiPolygon.fromJson(
          json['geometry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MultiPolygonToJson(MultiPolygon instance) =>
    <String, dynamic>{
      'type': instance.type,
      'properties': instance.properties,
      'geometry': instance.geometry,
    };

GeometryPoint _$GeometryPointFromJson(Map<String, dynamic> json) =>
    GeometryPoint(
      type: json['type'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$GeometryPointToJson(GeometryPoint instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

Point _$PointFromJson(Map<String, dynamic> json) => Point(
      type: json['type'] as String,
      properties: json['properties'],
      geometry:
          GeometryPoint.fromJson(json['geometry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PointToJson(Point instance) => <String, dynamic>{
      'type': instance.type,
      'properties': instance.properties,
      'geometry': instance.geometry,
    };

GeometryPolygon _$GeometryPolygonFromJson(Map<String, dynamic> json) =>
    GeometryPolygon(
      type: json['type'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => (e as List<dynamic>)
                  .map((e) => (e as num).toDouble())
                  .toList())
              .toList())
          .toList(),
    );

Map<String, dynamic> _$GeometryPolygonToJson(GeometryPolygon instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

Polygon _$PolygonFromJson(Map<String, dynamic> json) => Polygon(
      type: json['type'] as String,
      properties: json['properties'],
      geometry:
          GeometryPolygon.fromJson(json['geometry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PolygonToJson(Polygon instance) => <String, dynamic>{
      'type': instance.type,
      'properties': instance.properties,
      'geometry': instance.geometry,
    };
