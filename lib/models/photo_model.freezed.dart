// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PhotoModel {

 String get id; String get filePath; DateTime get capturedAt; PhotoMetadata get metadata; List<PhotoFilter> get appliedFilters; PhotoStatus get status; String? get compressedPath; String? get watermarkedPath; int? get fileSizeBytes; String? get mimeType;
/// Create a copy of PhotoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotoModelCopyWith<PhotoModel> get copyWith => _$PhotoModelCopyWithImpl<PhotoModel>(this as PhotoModel, _$identity);

  /// Serializes this PhotoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhotoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.capturedAt, capturedAt) || other.capturedAt == capturedAt)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other.appliedFilters, appliedFilters)&&(identical(other.status, status) || other.status == status)&&(identical(other.compressedPath, compressedPath) || other.compressedPath == compressedPath)&&(identical(other.watermarkedPath, watermarkedPath) || other.watermarkedPath == watermarkedPath)&&(identical(other.fileSizeBytes, fileSizeBytes) || other.fileSizeBytes == fileSizeBytes)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,filePath,capturedAt,metadata,const DeepCollectionEquality().hash(appliedFilters),status,compressedPath,watermarkedPath,fileSizeBytes,mimeType);

@override
String toString() {
  return 'PhotoModel(id: $id, filePath: $filePath, capturedAt: $capturedAt, metadata: $metadata, appliedFilters: $appliedFilters, status: $status, compressedPath: $compressedPath, watermarkedPath: $watermarkedPath, fileSizeBytes: $fileSizeBytes, mimeType: $mimeType)';
}


}

/// @nodoc
abstract mixin class $PhotoModelCopyWith<$Res>  {
  factory $PhotoModelCopyWith(PhotoModel value, $Res Function(PhotoModel) _then) = _$PhotoModelCopyWithImpl;
@useResult
$Res call({
 String id, String filePath, DateTime capturedAt, PhotoMetadata metadata, List<PhotoFilter> appliedFilters, PhotoStatus status, String? compressedPath, String? watermarkedPath, int? fileSizeBytes, String? mimeType
});


$PhotoMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class _$PhotoModelCopyWithImpl<$Res>
    implements $PhotoModelCopyWith<$Res> {
  _$PhotoModelCopyWithImpl(this._self, this._then);

  final PhotoModel _self;
  final $Res Function(PhotoModel) _then;

/// Create a copy of PhotoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? filePath = null,Object? capturedAt = null,Object? metadata = null,Object? appliedFilters = null,Object? status = null,Object? compressedPath = freezed,Object? watermarkedPath = freezed,Object? fileSizeBytes = freezed,Object? mimeType = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,capturedAt: null == capturedAt ? _self.capturedAt : capturedAt // ignore: cast_nullable_to_non_nullable
as DateTime,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as PhotoMetadata,appliedFilters: null == appliedFilters ? _self.appliedFilters : appliedFilters // ignore: cast_nullable_to_non_nullable
as List<PhotoFilter>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PhotoStatus,compressedPath: freezed == compressedPath ? _self.compressedPath : compressedPath // ignore: cast_nullable_to_non_nullable
as String?,watermarkedPath: freezed == watermarkedPath ? _self.watermarkedPath : watermarkedPath // ignore: cast_nullable_to_non_nullable
as String?,fileSizeBytes: freezed == fileSizeBytes ? _self.fileSizeBytes : fileSizeBytes // ignore: cast_nullable_to_non_nullable
as int?,mimeType: freezed == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PhotoModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhotoMetadataCopyWith<$Res> get metadata {
  
  return $PhotoMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [PhotoModel].
extension PhotoModelPatterns on PhotoModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhotoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhotoModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhotoModel value)  $default,){
final _that = this;
switch (_that) {
case _PhotoModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhotoModel value)?  $default,){
final _that = this;
switch (_that) {
case _PhotoModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String filePath,  DateTime capturedAt,  PhotoMetadata metadata,  List<PhotoFilter> appliedFilters,  PhotoStatus status,  String? compressedPath,  String? watermarkedPath,  int? fileSizeBytes,  String? mimeType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhotoModel() when $default != null:
return $default(_that.id,_that.filePath,_that.capturedAt,_that.metadata,_that.appliedFilters,_that.status,_that.compressedPath,_that.watermarkedPath,_that.fileSizeBytes,_that.mimeType);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String filePath,  DateTime capturedAt,  PhotoMetadata metadata,  List<PhotoFilter> appliedFilters,  PhotoStatus status,  String? compressedPath,  String? watermarkedPath,  int? fileSizeBytes,  String? mimeType)  $default,) {final _that = this;
switch (_that) {
case _PhotoModel():
return $default(_that.id,_that.filePath,_that.capturedAt,_that.metadata,_that.appliedFilters,_that.status,_that.compressedPath,_that.watermarkedPath,_that.fileSizeBytes,_that.mimeType);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String filePath,  DateTime capturedAt,  PhotoMetadata metadata,  List<PhotoFilter> appliedFilters,  PhotoStatus status,  String? compressedPath,  String? watermarkedPath,  int? fileSizeBytes,  String? mimeType)?  $default,) {final _that = this;
switch (_that) {
case _PhotoModel() when $default != null:
return $default(_that.id,_that.filePath,_that.capturedAt,_that.metadata,_that.appliedFilters,_that.status,_that.compressedPath,_that.watermarkedPath,_that.fileSizeBytes,_that.mimeType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhotoModel implements PhotoModel {
  const _PhotoModel({required this.id, required this.filePath, required this.capturedAt, required this.metadata, final  List<PhotoFilter> appliedFilters = const [], this.status = PhotoStatus.captured, this.compressedPath, this.watermarkedPath, this.fileSizeBytes, this.mimeType}): _appliedFilters = appliedFilters;
  factory _PhotoModel.fromJson(Map<String, dynamic> json) => _$PhotoModelFromJson(json);

@override final  String id;
@override final  String filePath;
@override final  DateTime capturedAt;
@override final  PhotoMetadata metadata;
 final  List<PhotoFilter> _appliedFilters;
@override@JsonKey() List<PhotoFilter> get appliedFilters {
  if (_appliedFilters is EqualUnmodifiableListView) return _appliedFilters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_appliedFilters);
}

@override@JsonKey() final  PhotoStatus status;
@override final  String? compressedPath;
@override final  String? watermarkedPath;
@override final  int? fileSizeBytes;
@override final  String? mimeType;

/// Create a copy of PhotoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotoModelCopyWith<_PhotoModel> get copyWith => __$PhotoModelCopyWithImpl<_PhotoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhotoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.capturedAt, capturedAt) || other.capturedAt == capturedAt)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other._appliedFilters, _appliedFilters)&&(identical(other.status, status) || other.status == status)&&(identical(other.compressedPath, compressedPath) || other.compressedPath == compressedPath)&&(identical(other.watermarkedPath, watermarkedPath) || other.watermarkedPath == watermarkedPath)&&(identical(other.fileSizeBytes, fileSizeBytes) || other.fileSizeBytes == fileSizeBytes)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,filePath,capturedAt,metadata,const DeepCollectionEquality().hash(_appliedFilters),status,compressedPath,watermarkedPath,fileSizeBytes,mimeType);

@override
String toString() {
  return 'PhotoModel(id: $id, filePath: $filePath, capturedAt: $capturedAt, metadata: $metadata, appliedFilters: $appliedFilters, status: $status, compressedPath: $compressedPath, watermarkedPath: $watermarkedPath, fileSizeBytes: $fileSizeBytes, mimeType: $mimeType)';
}


}

/// @nodoc
abstract mixin class _$PhotoModelCopyWith<$Res> implements $PhotoModelCopyWith<$Res> {
  factory _$PhotoModelCopyWith(_PhotoModel value, $Res Function(_PhotoModel) _then) = __$PhotoModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String filePath, DateTime capturedAt, PhotoMetadata metadata, List<PhotoFilter> appliedFilters, PhotoStatus status, String? compressedPath, String? watermarkedPath, int? fileSizeBytes, String? mimeType
});


@override $PhotoMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class __$PhotoModelCopyWithImpl<$Res>
    implements _$PhotoModelCopyWith<$Res> {
  __$PhotoModelCopyWithImpl(this._self, this._then);

  final _PhotoModel _self;
  final $Res Function(_PhotoModel) _then;

/// Create a copy of PhotoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? filePath = null,Object? capturedAt = null,Object? metadata = null,Object? appliedFilters = null,Object? status = null,Object? compressedPath = freezed,Object? watermarkedPath = freezed,Object? fileSizeBytes = freezed,Object? mimeType = freezed,}) {
  return _then(_PhotoModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,capturedAt: null == capturedAt ? _self.capturedAt : capturedAt // ignore: cast_nullable_to_non_nullable
as DateTime,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as PhotoMetadata,appliedFilters: null == appliedFilters ? _self._appliedFilters : appliedFilters // ignore: cast_nullable_to_non_nullable
as List<PhotoFilter>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PhotoStatus,compressedPath: freezed == compressedPath ? _self.compressedPath : compressedPath // ignore: cast_nullable_to_non_nullable
as String?,watermarkedPath: freezed == watermarkedPath ? _self.watermarkedPath : watermarkedPath // ignore: cast_nullable_to_non_nullable
as String?,fileSizeBytes: freezed == fileSizeBytes ? _self.fileSizeBytes : fileSizeBytes // ignore: cast_nullable_to_non_nullable
as int?,mimeType: freezed == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PhotoModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhotoMetadataCopyWith<$Res> get metadata {
  
  return $PhotoMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// @nodoc
mixin _$PhotoMetadata {

 int get width; int get height; double? get latitude; double? get longitude; String? get locationName; String? get deviceModel; String? get cameraLens; double? get exposureTime; double? get fNumber; int? get iso; double? get focalLength; Map<String, dynamic> get exifData;
/// Create a copy of PhotoMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotoMetadataCopyWith<PhotoMetadata> get copyWith => _$PhotoMetadataCopyWithImpl<PhotoMetadata>(this as PhotoMetadata, _$identity);

  /// Serializes this PhotoMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhotoMetadata&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.deviceModel, deviceModel) || other.deviceModel == deviceModel)&&(identical(other.cameraLens, cameraLens) || other.cameraLens == cameraLens)&&(identical(other.exposureTime, exposureTime) || other.exposureTime == exposureTime)&&(identical(other.fNumber, fNumber) || other.fNumber == fNumber)&&(identical(other.iso, iso) || other.iso == iso)&&(identical(other.focalLength, focalLength) || other.focalLength == focalLength)&&const DeepCollectionEquality().equals(other.exifData, exifData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,width,height,latitude,longitude,locationName,deviceModel,cameraLens,exposureTime,fNumber,iso,focalLength,const DeepCollectionEquality().hash(exifData));

@override
String toString() {
  return 'PhotoMetadata(width: $width, height: $height, latitude: $latitude, longitude: $longitude, locationName: $locationName, deviceModel: $deviceModel, cameraLens: $cameraLens, exposureTime: $exposureTime, fNumber: $fNumber, iso: $iso, focalLength: $focalLength, exifData: $exifData)';
}


}

/// @nodoc
abstract mixin class $PhotoMetadataCopyWith<$Res>  {
  factory $PhotoMetadataCopyWith(PhotoMetadata value, $Res Function(PhotoMetadata) _then) = _$PhotoMetadataCopyWithImpl;
@useResult
$Res call({
 int width, int height, double? latitude, double? longitude, String? locationName, String? deviceModel, String? cameraLens, double? exposureTime, double? fNumber, int? iso, double? focalLength, Map<String, dynamic> exifData
});




}
/// @nodoc
class _$PhotoMetadataCopyWithImpl<$Res>
    implements $PhotoMetadataCopyWith<$Res> {
  _$PhotoMetadataCopyWithImpl(this._self, this._then);

  final PhotoMetadata _self;
  final $Res Function(PhotoMetadata) _then;

/// Create a copy of PhotoMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? width = null,Object? height = null,Object? latitude = freezed,Object? longitude = freezed,Object? locationName = freezed,Object? deviceModel = freezed,Object? cameraLens = freezed,Object? exposureTime = freezed,Object? fNumber = freezed,Object? iso = freezed,Object? focalLength = freezed,Object? exifData = null,}) {
  return _then(_self.copyWith(
width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,locationName: freezed == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String?,deviceModel: freezed == deviceModel ? _self.deviceModel : deviceModel // ignore: cast_nullable_to_non_nullable
as String?,cameraLens: freezed == cameraLens ? _self.cameraLens : cameraLens // ignore: cast_nullable_to_non_nullable
as String?,exposureTime: freezed == exposureTime ? _self.exposureTime : exposureTime // ignore: cast_nullable_to_non_nullable
as double?,fNumber: freezed == fNumber ? _self.fNumber : fNumber // ignore: cast_nullable_to_non_nullable
as double?,iso: freezed == iso ? _self.iso : iso // ignore: cast_nullable_to_non_nullable
as int?,focalLength: freezed == focalLength ? _self.focalLength : focalLength // ignore: cast_nullable_to_non_nullable
as double?,exifData: null == exifData ? _self.exifData : exifData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [PhotoMetadata].
extension PhotoMetadataPatterns on PhotoMetadata {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhotoMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhotoMetadata() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhotoMetadata value)  $default,){
final _that = this;
switch (_that) {
case _PhotoMetadata():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhotoMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _PhotoMetadata() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int width,  int height,  double? latitude,  double? longitude,  String? locationName,  String? deviceModel,  String? cameraLens,  double? exposureTime,  double? fNumber,  int? iso,  double? focalLength,  Map<String, dynamic> exifData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhotoMetadata() when $default != null:
return $default(_that.width,_that.height,_that.latitude,_that.longitude,_that.locationName,_that.deviceModel,_that.cameraLens,_that.exposureTime,_that.fNumber,_that.iso,_that.focalLength,_that.exifData);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int width,  int height,  double? latitude,  double? longitude,  String? locationName,  String? deviceModel,  String? cameraLens,  double? exposureTime,  double? fNumber,  int? iso,  double? focalLength,  Map<String, dynamic> exifData)  $default,) {final _that = this;
switch (_that) {
case _PhotoMetadata():
return $default(_that.width,_that.height,_that.latitude,_that.longitude,_that.locationName,_that.deviceModel,_that.cameraLens,_that.exposureTime,_that.fNumber,_that.iso,_that.focalLength,_that.exifData);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int width,  int height,  double? latitude,  double? longitude,  String? locationName,  String? deviceModel,  String? cameraLens,  double? exposureTime,  double? fNumber,  int? iso,  double? focalLength,  Map<String, dynamic> exifData)?  $default,) {final _that = this;
switch (_that) {
case _PhotoMetadata() when $default != null:
return $default(_that.width,_that.height,_that.latitude,_that.longitude,_that.locationName,_that.deviceModel,_that.cameraLens,_that.exposureTime,_that.fNumber,_that.iso,_that.focalLength,_that.exifData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhotoMetadata implements PhotoMetadata {
  const _PhotoMetadata({required this.width, required this.height, this.latitude, this.longitude, this.locationName, this.deviceModel, this.cameraLens, this.exposureTime, this.fNumber, this.iso, this.focalLength, final  Map<String, dynamic> exifData = const {}}): _exifData = exifData;
  factory _PhotoMetadata.fromJson(Map<String, dynamic> json) => _$PhotoMetadataFromJson(json);

@override final  int width;
@override final  int height;
@override final  double? latitude;
@override final  double? longitude;
@override final  String? locationName;
@override final  String? deviceModel;
@override final  String? cameraLens;
@override final  double? exposureTime;
@override final  double? fNumber;
@override final  int? iso;
@override final  double? focalLength;
 final  Map<String, dynamic> _exifData;
@override@JsonKey() Map<String, dynamic> get exifData {
  if (_exifData is EqualUnmodifiableMapView) return _exifData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_exifData);
}


/// Create a copy of PhotoMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotoMetadataCopyWith<_PhotoMetadata> get copyWith => __$PhotoMetadataCopyWithImpl<_PhotoMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhotoMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotoMetadata&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.deviceModel, deviceModel) || other.deviceModel == deviceModel)&&(identical(other.cameraLens, cameraLens) || other.cameraLens == cameraLens)&&(identical(other.exposureTime, exposureTime) || other.exposureTime == exposureTime)&&(identical(other.fNumber, fNumber) || other.fNumber == fNumber)&&(identical(other.iso, iso) || other.iso == iso)&&(identical(other.focalLength, focalLength) || other.focalLength == focalLength)&&const DeepCollectionEquality().equals(other._exifData, _exifData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,width,height,latitude,longitude,locationName,deviceModel,cameraLens,exposureTime,fNumber,iso,focalLength,const DeepCollectionEquality().hash(_exifData));

@override
String toString() {
  return 'PhotoMetadata(width: $width, height: $height, latitude: $latitude, longitude: $longitude, locationName: $locationName, deviceModel: $deviceModel, cameraLens: $cameraLens, exposureTime: $exposureTime, fNumber: $fNumber, iso: $iso, focalLength: $focalLength, exifData: $exifData)';
}


}

/// @nodoc
abstract mixin class _$PhotoMetadataCopyWith<$Res> implements $PhotoMetadataCopyWith<$Res> {
  factory _$PhotoMetadataCopyWith(_PhotoMetadata value, $Res Function(_PhotoMetadata) _then) = __$PhotoMetadataCopyWithImpl;
@override @useResult
$Res call({
 int width, int height, double? latitude, double? longitude, String? locationName, String? deviceModel, String? cameraLens, double? exposureTime, double? fNumber, int? iso, double? focalLength, Map<String, dynamic> exifData
});




}
/// @nodoc
class __$PhotoMetadataCopyWithImpl<$Res>
    implements _$PhotoMetadataCopyWith<$Res> {
  __$PhotoMetadataCopyWithImpl(this._self, this._then);

  final _PhotoMetadata _self;
  final $Res Function(_PhotoMetadata) _then;

/// Create a copy of PhotoMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? width = null,Object? height = null,Object? latitude = freezed,Object? longitude = freezed,Object? locationName = freezed,Object? deviceModel = freezed,Object? cameraLens = freezed,Object? exposureTime = freezed,Object? fNumber = freezed,Object? iso = freezed,Object? focalLength = freezed,Object? exifData = null,}) {
  return _then(_PhotoMetadata(
width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,locationName: freezed == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String?,deviceModel: freezed == deviceModel ? _self.deviceModel : deviceModel // ignore: cast_nullable_to_non_nullable
as String?,cameraLens: freezed == cameraLens ? _self.cameraLens : cameraLens // ignore: cast_nullable_to_non_nullable
as String?,exposureTime: freezed == exposureTime ? _self.exposureTime : exposureTime // ignore: cast_nullable_to_non_nullable
as double?,fNumber: freezed == fNumber ? _self.fNumber : fNumber // ignore: cast_nullable_to_non_nullable
as double?,iso: freezed == iso ? _self.iso : iso // ignore: cast_nullable_to_non_nullable
as int?,focalLength: freezed == focalLength ? _self.focalLength : focalLength // ignore: cast_nullable_to_non_nullable
as double?,exifData: null == exifData ? _self._exifData : exifData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}


/// @nodoc
mixin _$PhotoFilter {

 String get name; FilterType get type; double get intensity; Map<String, dynamic> get parameters;
/// Create a copy of PhotoFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotoFilterCopyWith<PhotoFilter> get copyWith => _$PhotoFilterCopyWithImpl<PhotoFilter>(this as PhotoFilter, _$identity);

  /// Serializes this PhotoFilter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhotoFilter&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.intensity, intensity) || other.intensity == intensity)&&const DeepCollectionEquality().equals(other.parameters, parameters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type,intensity,const DeepCollectionEquality().hash(parameters));

@override
String toString() {
  return 'PhotoFilter(name: $name, type: $type, intensity: $intensity, parameters: $parameters)';
}


}

/// @nodoc
abstract mixin class $PhotoFilterCopyWith<$Res>  {
  factory $PhotoFilterCopyWith(PhotoFilter value, $Res Function(PhotoFilter) _then) = _$PhotoFilterCopyWithImpl;
@useResult
$Res call({
 String name, FilterType type, double intensity, Map<String, dynamic> parameters
});




}
/// @nodoc
class _$PhotoFilterCopyWithImpl<$Res>
    implements $PhotoFilterCopyWith<$Res> {
  _$PhotoFilterCopyWithImpl(this._self, this._then);

  final PhotoFilter _self;
  final $Res Function(PhotoFilter) _then;

/// Create a copy of PhotoFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? type = null,Object? intensity = null,Object? parameters = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FilterType,intensity: null == intensity ? _self.intensity : intensity // ignore: cast_nullable_to_non_nullable
as double,parameters: null == parameters ? _self.parameters : parameters // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [PhotoFilter].
extension PhotoFilterPatterns on PhotoFilter {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhotoFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhotoFilter() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhotoFilter value)  $default,){
final _that = this;
switch (_that) {
case _PhotoFilter():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhotoFilter value)?  $default,){
final _that = this;
switch (_that) {
case _PhotoFilter() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  FilterType type,  double intensity,  Map<String, dynamic> parameters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhotoFilter() when $default != null:
return $default(_that.name,_that.type,_that.intensity,_that.parameters);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  FilterType type,  double intensity,  Map<String, dynamic> parameters)  $default,) {final _that = this;
switch (_that) {
case _PhotoFilter():
return $default(_that.name,_that.type,_that.intensity,_that.parameters);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  FilterType type,  double intensity,  Map<String, dynamic> parameters)?  $default,) {final _that = this;
switch (_that) {
case _PhotoFilter() when $default != null:
return $default(_that.name,_that.type,_that.intensity,_that.parameters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhotoFilter implements PhotoFilter {
  const _PhotoFilter({required this.name, required this.type, this.intensity = 1.0, final  Map<String, dynamic> parameters = const {}}): _parameters = parameters;
  factory _PhotoFilter.fromJson(Map<String, dynamic> json) => _$PhotoFilterFromJson(json);

@override final  String name;
@override final  FilterType type;
@override@JsonKey() final  double intensity;
 final  Map<String, dynamic> _parameters;
@override@JsonKey() Map<String, dynamic> get parameters {
  if (_parameters is EqualUnmodifiableMapView) return _parameters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_parameters);
}


/// Create a copy of PhotoFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotoFilterCopyWith<_PhotoFilter> get copyWith => __$PhotoFilterCopyWithImpl<_PhotoFilter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhotoFilterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotoFilter&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.intensity, intensity) || other.intensity == intensity)&&const DeepCollectionEquality().equals(other._parameters, _parameters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type,intensity,const DeepCollectionEquality().hash(_parameters));

@override
String toString() {
  return 'PhotoFilter(name: $name, type: $type, intensity: $intensity, parameters: $parameters)';
}


}

/// @nodoc
abstract mixin class _$PhotoFilterCopyWith<$Res> implements $PhotoFilterCopyWith<$Res> {
  factory _$PhotoFilterCopyWith(_PhotoFilter value, $Res Function(_PhotoFilter) _then) = __$PhotoFilterCopyWithImpl;
@override @useResult
$Res call({
 String name, FilterType type, double intensity, Map<String, dynamic> parameters
});




}
/// @nodoc
class __$PhotoFilterCopyWithImpl<$Res>
    implements _$PhotoFilterCopyWith<$Res> {
  __$PhotoFilterCopyWithImpl(this._self, this._then);

  final _PhotoFilter _self;
  final $Res Function(_PhotoFilter) _then;

/// Create a copy of PhotoFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? type = null,Object? intensity = null,Object? parameters = null,}) {
  return _then(_PhotoFilter(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FilterType,intensity: null == intensity ? _self.intensity : intensity // ignore: cast_nullable_to_non_nullable
as double,parameters: null == parameters ? _self._parameters : parameters // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
