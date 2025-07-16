// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nft_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NFTModel {

 String get id; String get name; String get description; String get imageUrl; String get metadataUrl; String get mintAddress; String get ownerAddress; DateTime get createdAt; NFTMetadata get metadata; NFTStatus get status; String? get transactionSignature; String? get arweaveId;
/// Create a copy of NFTModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NFTModelCopyWith<NFTModel> get copyWith => _$NFTModelCopyWithImpl<NFTModel>(this as NFTModel, _$identity);

  /// Serializes this NFTModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NFTModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.metadataUrl, metadataUrl) || other.metadataUrl == metadataUrl)&&(identical(other.mintAddress, mintAddress) || other.mintAddress == mintAddress)&&(identical(other.ownerAddress, ownerAddress) || other.ownerAddress == ownerAddress)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.status, status) || other.status == status)&&(identical(other.transactionSignature, transactionSignature) || other.transactionSignature == transactionSignature)&&(identical(other.arweaveId, arweaveId) || other.arweaveId == arweaveId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,imageUrl,metadataUrl,mintAddress,ownerAddress,createdAt,metadata,status,transactionSignature,arweaveId);

@override
String toString() {
  return 'NFTModel(id: $id, name: $name, description: $description, imageUrl: $imageUrl, metadataUrl: $metadataUrl, mintAddress: $mintAddress, ownerAddress: $ownerAddress, createdAt: $createdAt, metadata: $metadata, status: $status, transactionSignature: $transactionSignature, arweaveId: $arweaveId)';
}


}

/// @nodoc
abstract mixin class $NFTModelCopyWith<$Res>  {
  factory $NFTModelCopyWith(NFTModel value, $Res Function(NFTModel) _then) = _$NFTModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, String imageUrl, String metadataUrl, String mintAddress, String ownerAddress, DateTime createdAt, NFTMetadata metadata, NFTStatus status, String? transactionSignature, String? arweaveId
});


$NFTMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class _$NFTModelCopyWithImpl<$Res>
    implements $NFTModelCopyWith<$Res> {
  _$NFTModelCopyWithImpl(this._self, this._then);

  final NFTModel _self;
  final $Res Function(NFTModel) _then;

/// Create a copy of NFTModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? imageUrl = null,Object? metadataUrl = null,Object? mintAddress = null,Object? ownerAddress = null,Object? createdAt = null,Object? metadata = null,Object? status = null,Object? transactionSignature = freezed,Object? arweaveId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,metadataUrl: null == metadataUrl ? _self.metadataUrl : metadataUrl // ignore: cast_nullable_to_non_nullable
as String,mintAddress: null == mintAddress ? _self.mintAddress : mintAddress // ignore: cast_nullable_to_non_nullable
as String,ownerAddress: null == ownerAddress ? _self.ownerAddress : ownerAddress // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as NFTMetadata,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NFTStatus,transactionSignature: freezed == transactionSignature ? _self.transactionSignature : transactionSignature // ignore: cast_nullable_to_non_nullable
as String?,arweaveId: freezed == arweaveId ? _self.arweaveId : arweaveId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of NFTModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NFTMetadataCopyWith<$Res> get metadata {
  
  return $NFTMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [NFTModel].
extension NFTModelPatterns on NFTModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NFTModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NFTModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NFTModel value)  $default,){
final _that = this;
switch (_that) {
case _NFTModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NFTModel value)?  $default,){
final _that = this;
switch (_that) {
case _NFTModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String imageUrl,  String metadataUrl,  String mintAddress,  String ownerAddress,  DateTime createdAt,  NFTMetadata metadata,  NFTStatus status,  String? transactionSignature,  String? arweaveId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NFTModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.imageUrl,_that.metadataUrl,_that.mintAddress,_that.ownerAddress,_that.createdAt,_that.metadata,_that.status,_that.transactionSignature,_that.arweaveId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String imageUrl,  String metadataUrl,  String mintAddress,  String ownerAddress,  DateTime createdAt,  NFTMetadata metadata,  NFTStatus status,  String? transactionSignature,  String? arweaveId)  $default,) {final _that = this;
switch (_that) {
case _NFTModel():
return $default(_that.id,_that.name,_that.description,_that.imageUrl,_that.metadataUrl,_that.mintAddress,_that.ownerAddress,_that.createdAt,_that.metadata,_that.status,_that.transactionSignature,_that.arweaveId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  String imageUrl,  String metadataUrl,  String mintAddress,  String ownerAddress,  DateTime createdAt,  NFTMetadata metadata,  NFTStatus status,  String? transactionSignature,  String? arweaveId)?  $default,) {final _that = this;
switch (_that) {
case _NFTModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.imageUrl,_that.metadataUrl,_that.mintAddress,_that.ownerAddress,_that.createdAt,_that.metadata,_that.status,_that.transactionSignature,_that.arweaveId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NFTModel implements NFTModel {
  const _NFTModel({required this.id, required this.name, required this.description, required this.imageUrl, required this.metadataUrl, required this.mintAddress, required this.ownerAddress, required this.createdAt, required this.metadata, this.status = NFTStatus.pending, this.transactionSignature, this.arweaveId});
  factory _NFTModel.fromJson(Map<String, dynamic> json) => _$NFTModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override final  String imageUrl;
@override final  String metadataUrl;
@override final  String mintAddress;
@override final  String ownerAddress;
@override final  DateTime createdAt;
@override final  NFTMetadata metadata;
@override@JsonKey() final  NFTStatus status;
@override final  String? transactionSignature;
@override final  String? arweaveId;

/// Create a copy of NFTModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NFTModelCopyWith<_NFTModel> get copyWith => __$NFTModelCopyWithImpl<_NFTModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NFTModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NFTModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.metadataUrl, metadataUrl) || other.metadataUrl == metadataUrl)&&(identical(other.mintAddress, mintAddress) || other.mintAddress == mintAddress)&&(identical(other.ownerAddress, ownerAddress) || other.ownerAddress == ownerAddress)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.status, status) || other.status == status)&&(identical(other.transactionSignature, transactionSignature) || other.transactionSignature == transactionSignature)&&(identical(other.arweaveId, arweaveId) || other.arweaveId == arweaveId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,imageUrl,metadataUrl,mintAddress,ownerAddress,createdAt,metadata,status,transactionSignature,arweaveId);

@override
String toString() {
  return 'NFTModel(id: $id, name: $name, description: $description, imageUrl: $imageUrl, metadataUrl: $metadataUrl, mintAddress: $mintAddress, ownerAddress: $ownerAddress, createdAt: $createdAt, metadata: $metadata, status: $status, transactionSignature: $transactionSignature, arweaveId: $arweaveId)';
}


}

/// @nodoc
abstract mixin class _$NFTModelCopyWith<$Res> implements $NFTModelCopyWith<$Res> {
  factory _$NFTModelCopyWith(_NFTModel value, $Res Function(_NFTModel) _then) = __$NFTModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, String imageUrl, String metadataUrl, String mintAddress, String ownerAddress, DateTime createdAt, NFTMetadata metadata, NFTStatus status, String? transactionSignature, String? arweaveId
});


@override $NFTMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class __$NFTModelCopyWithImpl<$Res>
    implements _$NFTModelCopyWith<$Res> {
  __$NFTModelCopyWithImpl(this._self, this._then);

  final _NFTModel _self;
  final $Res Function(_NFTModel) _then;

/// Create a copy of NFTModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? imageUrl = null,Object? metadataUrl = null,Object? mintAddress = null,Object? ownerAddress = null,Object? createdAt = null,Object? metadata = null,Object? status = null,Object? transactionSignature = freezed,Object? arweaveId = freezed,}) {
  return _then(_NFTModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,metadataUrl: null == metadataUrl ? _self.metadataUrl : metadataUrl // ignore: cast_nullable_to_non_nullable
as String,mintAddress: null == mintAddress ? _self.mintAddress : mintAddress // ignore: cast_nullable_to_non_nullable
as String,ownerAddress: null == ownerAddress ? _self.ownerAddress : ownerAddress // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as NFTMetadata,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NFTStatus,transactionSignature: freezed == transactionSignature ? _self.transactionSignature : transactionSignature // ignore: cast_nullable_to_non_nullable
as String?,arweaveId: freezed == arweaveId ? _self.arweaveId : arweaveId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of NFTModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NFTMetadataCopyWith<$Res> get metadata {
  
  return $NFTMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// @nodoc
mixin _$NFTMetadata {

 String get name; String get description; String get image; List<NFTAttribute> get attributes; String? get externalUrl; String? get animationUrl; String get type; Map<String, dynamic> get properties;
/// Create a copy of NFTMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NFTMetadataCopyWith<NFTMetadata> get copyWith => _$NFTMetadataCopyWithImpl<NFTMetadata>(this as NFTMetadata, _$identity);

  /// Serializes this NFTMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NFTMetadata&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other.attributes, attributes)&&(identical(other.externalUrl, externalUrl) || other.externalUrl == externalUrl)&&(identical(other.animationUrl, animationUrl) || other.animationUrl == animationUrl)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.properties, properties));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,image,const DeepCollectionEquality().hash(attributes),externalUrl,animationUrl,type,const DeepCollectionEquality().hash(properties));

@override
String toString() {
  return 'NFTMetadata(name: $name, description: $description, image: $image, attributes: $attributes, externalUrl: $externalUrl, animationUrl: $animationUrl, type: $type, properties: $properties)';
}


}

/// @nodoc
abstract mixin class $NFTMetadataCopyWith<$Res>  {
  factory $NFTMetadataCopyWith(NFTMetadata value, $Res Function(NFTMetadata) _then) = _$NFTMetadataCopyWithImpl;
@useResult
$Res call({
 String name, String description, String image, List<NFTAttribute> attributes, String? externalUrl, String? animationUrl, String type, Map<String, dynamic> properties
});




}
/// @nodoc
class _$NFTMetadataCopyWithImpl<$Res>
    implements $NFTMetadataCopyWith<$Res> {
  _$NFTMetadataCopyWithImpl(this._self, this._then);

  final NFTMetadata _self;
  final $Res Function(NFTMetadata) _then;

/// Create a copy of NFTMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,Object? image = null,Object? attributes = null,Object? externalUrl = freezed,Object? animationUrl = freezed,Object? type = null,Object? properties = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<NFTAttribute>,externalUrl: freezed == externalUrl ? _self.externalUrl : externalUrl // ignore: cast_nullable_to_non_nullable
as String?,animationUrl: freezed == animationUrl ? _self.animationUrl : animationUrl // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,properties: null == properties ? _self.properties : properties // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [NFTMetadata].
extension NFTMetadataPatterns on NFTMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NFTMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NFTMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NFTMetadata value)  $default,){
final _that = this;
switch (_that) {
case _NFTMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NFTMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _NFTMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String description,  String image,  List<NFTAttribute> attributes,  String? externalUrl,  String? animationUrl,  String type,  Map<String, dynamic> properties)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NFTMetadata() when $default != null:
return $default(_that.name,_that.description,_that.image,_that.attributes,_that.externalUrl,_that.animationUrl,_that.type,_that.properties);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String description,  String image,  List<NFTAttribute> attributes,  String? externalUrl,  String? animationUrl,  String type,  Map<String, dynamic> properties)  $default,) {final _that = this;
switch (_that) {
case _NFTMetadata():
return $default(_that.name,_that.description,_that.image,_that.attributes,_that.externalUrl,_that.animationUrl,_that.type,_that.properties);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String description,  String image,  List<NFTAttribute> attributes,  String? externalUrl,  String? animationUrl,  String type,  Map<String, dynamic> properties)?  $default,) {final _that = this;
switch (_that) {
case _NFTMetadata() when $default != null:
return $default(_that.name,_that.description,_that.image,_that.attributes,_that.externalUrl,_that.animationUrl,_that.type,_that.properties);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NFTMetadata implements NFTMetadata {
  const _NFTMetadata({required this.name, required this.description, required this.image, final  List<NFTAttribute> attributes = const [], this.externalUrl, this.animationUrl, this.type = 'image', final  Map<String, dynamic> properties = const {}}): _attributes = attributes,_properties = properties;
  factory _NFTMetadata.fromJson(Map<String, dynamic> json) => _$NFTMetadataFromJson(json);

@override final  String name;
@override final  String description;
@override final  String image;
 final  List<NFTAttribute> _attributes;
@override@JsonKey() List<NFTAttribute> get attributes {
  if (_attributes is EqualUnmodifiableListView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attributes);
}

@override final  String? externalUrl;
@override final  String? animationUrl;
@override@JsonKey() final  String type;
 final  Map<String, dynamic> _properties;
@override@JsonKey() Map<String, dynamic> get properties {
  if (_properties is EqualUnmodifiableMapView) return _properties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_properties);
}


/// Create a copy of NFTMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NFTMetadataCopyWith<_NFTMetadata> get copyWith => __$NFTMetadataCopyWithImpl<_NFTMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NFTMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NFTMetadata&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other._attributes, _attributes)&&(identical(other.externalUrl, externalUrl) || other.externalUrl == externalUrl)&&(identical(other.animationUrl, animationUrl) || other.animationUrl == animationUrl)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._properties, _properties));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,image,const DeepCollectionEquality().hash(_attributes),externalUrl,animationUrl,type,const DeepCollectionEquality().hash(_properties));

@override
String toString() {
  return 'NFTMetadata(name: $name, description: $description, image: $image, attributes: $attributes, externalUrl: $externalUrl, animationUrl: $animationUrl, type: $type, properties: $properties)';
}


}

/// @nodoc
abstract mixin class _$NFTMetadataCopyWith<$Res> implements $NFTMetadataCopyWith<$Res> {
  factory _$NFTMetadataCopyWith(_NFTMetadata value, $Res Function(_NFTMetadata) _then) = __$NFTMetadataCopyWithImpl;
@override @useResult
$Res call({
 String name, String description, String image, List<NFTAttribute> attributes, String? externalUrl, String? animationUrl, String type, Map<String, dynamic> properties
});




}
/// @nodoc
class __$NFTMetadataCopyWithImpl<$Res>
    implements _$NFTMetadataCopyWith<$Res> {
  __$NFTMetadataCopyWithImpl(this._self, this._then);

  final _NFTMetadata _self;
  final $Res Function(_NFTMetadata) _then;

/// Create a copy of NFTMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,Object? image = null,Object? attributes = null,Object? externalUrl = freezed,Object? animationUrl = freezed,Object? type = null,Object? properties = null,}) {
  return _then(_NFTMetadata(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,attributes: null == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<NFTAttribute>,externalUrl: freezed == externalUrl ? _self.externalUrl : externalUrl // ignore: cast_nullable_to_non_nullable
as String?,animationUrl: freezed == animationUrl ? _self.animationUrl : animationUrl // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,properties: null == properties ? _self._properties : properties // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}


/// @nodoc
mixin _$NFTAttribute {

 String get traitType; String get value; String? get displayType;
/// Create a copy of NFTAttribute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NFTAttributeCopyWith<NFTAttribute> get copyWith => _$NFTAttributeCopyWithImpl<NFTAttribute>(this as NFTAttribute, _$identity);

  /// Serializes this NFTAttribute to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NFTAttribute&&(identical(other.traitType, traitType) || other.traitType == traitType)&&(identical(other.value, value) || other.value == value)&&(identical(other.displayType, displayType) || other.displayType == displayType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,traitType,value,displayType);

@override
String toString() {
  return 'NFTAttribute(traitType: $traitType, value: $value, displayType: $displayType)';
}


}

/// @nodoc
abstract mixin class $NFTAttributeCopyWith<$Res>  {
  factory $NFTAttributeCopyWith(NFTAttribute value, $Res Function(NFTAttribute) _then) = _$NFTAttributeCopyWithImpl;
@useResult
$Res call({
 String traitType, String value, String? displayType
});




}
/// @nodoc
class _$NFTAttributeCopyWithImpl<$Res>
    implements $NFTAttributeCopyWith<$Res> {
  _$NFTAttributeCopyWithImpl(this._self, this._then);

  final NFTAttribute _self;
  final $Res Function(NFTAttribute) _then;

/// Create a copy of NFTAttribute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? traitType = null,Object? value = null,Object? displayType = freezed,}) {
  return _then(_self.copyWith(
traitType: null == traitType ? _self.traitType : traitType // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,displayType: freezed == displayType ? _self.displayType : displayType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NFTAttribute].
extension NFTAttributePatterns on NFTAttribute {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NFTAttribute value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NFTAttribute() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NFTAttribute value)  $default,){
final _that = this;
switch (_that) {
case _NFTAttribute():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NFTAttribute value)?  $default,){
final _that = this;
switch (_that) {
case _NFTAttribute() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String traitType,  String value,  String? displayType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NFTAttribute() when $default != null:
return $default(_that.traitType,_that.value,_that.displayType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String traitType,  String value,  String? displayType)  $default,) {final _that = this;
switch (_that) {
case _NFTAttribute():
return $default(_that.traitType,_that.value,_that.displayType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String traitType,  String value,  String? displayType)?  $default,) {final _that = this;
switch (_that) {
case _NFTAttribute() when $default != null:
return $default(_that.traitType,_that.value,_that.displayType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NFTAttribute implements NFTAttribute {
  const _NFTAttribute({required this.traitType, required this.value, this.displayType});
  factory _NFTAttribute.fromJson(Map<String, dynamic> json) => _$NFTAttributeFromJson(json);

@override final  String traitType;
@override final  String value;
@override final  String? displayType;

/// Create a copy of NFTAttribute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NFTAttributeCopyWith<_NFTAttribute> get copyWith => __$NFTAttributeCopyWithImpl<_NFTAttribute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NFTAttributeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NFTAttribute&&(identical(other.traitType, traitType) || other.traitType == traitType)&&(identical(other.value, value) || other.value == value)&&(identical(other.displayType, displayType) || other.displayType == displayType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,traitType,value,displayType);

@override
String toString() {
  return 'NFTAttribute(traitType: $traitType, value: $value, displayType: $displayType)';
}


}

/// @nodoc
abstract mixin class _$NFTAttributeCopyWith<$Res> implements $NFTAttributeCopyWith<$Res> {
  factory _$NFTAttributeCopyWith(_NFTAttribute value, $Res Function(_NFTAttribute) _then) = __$NFTAttributeCopyWithImpl;
@override @useResult
$Res call({
 String traitType, String value, String? displayType
});




}
/// @nodoc
class __$NFTAttributeCopyWithImpl<$Res>
    implements _$NFTAttributeCopyWith<$Res> {
  __$NFTAttributeCopyWithImpl(this._self, this._then);

  final _NFTAttribute _self;
  final $Res Function(_NFTAttribute) _then;

/// Create a copy of NFTAttribute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? traitType = null,Object? value = null,Object? displayType = freezed,}) {
  return _then(_NFTAttribute(
traitType: null == traitType ? _self.traitType : traitType // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,displayType: freezed == displayType ? _self.displayType : displayType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
