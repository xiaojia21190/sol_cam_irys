// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WalletModel {

 String get publicKey; String get name; WalletType get type; WalletStatus get status; double get solBalance; DateTime? get lastUpdated;// Native MWA data - stored for reference but not used directly
 String? get authToken; String? get walletUriBase;
/// Create a copy of WalletModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletModelCopyWith<WalletModel> get copyWith => _$WalletModelCopyWithImpl<WalletModel>(this as WalletModel, _$identity);

  /// Serializes this WalletModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletModel&&(identical(other.publicKey, publicKey) || other.publicKey == publicKey)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.solBalance, solBalance) || other.solBalance == solBalance)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.authToken, authToken) || other.authToken == authToken)&&(identical(other.walletUriBase, walletUriBase) || other.walletUriBase == walletUriBase));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,publicKey,name,type,status,solBalance,lastUpdated,authToken,walletUriBase);

@override
String toString() {
  return 'WalletModel(publicKey: $publicKey, name: $name, type: $type, status: $status, solBalance: $solBalance, lastUpdated: $lastUpdated, authToken: $authToken, walletUriBase: $walletUriBase)';
}


}

/// @nodoc
abstract mixin class $WalletModelCopyWith<$Res>  {
  factory $WalletModelCopyWith(WalletModel value, $Res Function(WalletModel) _then) = _$WalletModelCopyWithImpl;
@useResult
$Res call({
 String publicKey, String name, WalletType type, WalletStatus status, double solBalance, DateTime? lastUpdated, String? authToken, String? walletUriBase
});




}
/// @nodoc
class _$WalletModelCopyWithImpl<$Res>
    implements $WalletModelCopyWith<$Res> {
  _$WalletModelCopyWithImpl(this._self, this._then);

  final WalletModel _self;
  final $Res Function(WalletModel) _then;

/// Create a copy of WalletModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? publicKey = null,Object? name = null,Object? type = null,Object? status = null,Object? solBalance = null,Object? lastUpdated = freezed,Object? authToken = freezed,Object? walletUriBase = freezed,}) {
  return _then(_self.copyWith(
publicKey: null == publicKey ? _self.publicKey : publicKey // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as WalletType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as WalletStatus,solBalance: null == solBalance ? _self.solBalance : solBalance // ignore: cast_nullable_to_non_nullable
as double,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,authToken: freezed == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as String?,walletUriBase: freezed == walletUriBase ? _self.walletUriBase : walletUriBase // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WalletModel].
extension WalletModelPatterns on WalletModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WalletModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WalletModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WalletModel value)  $default,){
final _that = this;
switch (_that) {
case _WalletModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WalletModel value)?  $default,){
final _that = this;
switch (_that) {
case _WalletModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String publicKey,  String name,  WalletType type,  WalletStatus status,  double solBalance,  DateTime? lastUpdated,  String? authToken,  String? walletUriBase)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WalletModel() when $default != null:
return $default(_that.publicKey,_that.name,_that.type,_that.status,_that.solBalance,_that.lastUpdated,_that.authToken,_that.walletUriBase);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String publicKey,  String name,  WalletType type,  WalletStatus status,  double solBalance,  DateTime? lastUpdated,  String? authToken,  String? walletUriBase)  $default,) {final _that = this;
switch (_that) {
case _WalletModel():
return $default(_that.publicKey,_that.name,_that.type,_that.status,_that.solBalance,_that.lastUpdated,_that.authToken,_that.walletUriBase);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String publicKey,  String name,  WalletType type,  WalletStatus status,  double solBalance,  DateTime? lastUpdated,  String? authToken,  String? walletUriBase)?  $default,) {final _that = this;
switch (_that) {
case _WalletModel() when $default != null:
return $default(_that.publicKey,_that.name,_that.type,_that.status,_that.solBalance,_that.lastUpdated,_that.authToken,_that.walletUriBase);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WalletModel implements WalletModel {
  const _WalletModel({required this.publicKey, required this.name, required this.type, required this.status, this.solBalance = 0.0, this.lastUpdated, this.authToken, this.walletUriBase});
  factory _WalletModel.fromJson(Map<String, dynamic> json) => _$WalletModelFromJson(json);

@override final  String publicKey;
@override final  String name;
@override final  WalletType type;
@override final  WalletStatus status;
@override@JsonKey() final  double solBalance;
@override final  DateTime? lastUpdated;
// Native MWA data - stored for reference but not used directly
@override final  String? authToken;
@override final  String? walletUriBase;

/// Create a copy of WalletModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletModelCopyWith<_WalletModel> get copyWith => __$WalletModelCopyWithImpl<_WalletModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WalletModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalletModel&&(identical(other.publicKey, publicKey) || other.publicKey == publicKey)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.solBalance, solBalance) || other.solBalance == solBalance)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.authToken, authToken) || other.authToken == authToken)&&(identical(other.walletUriBase, walletUriBase) || other.walletUriBase == walletUriBase));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,publicKey,name,type,status,solBalance,lastUpdated,authToken,walletUriBase);

@override
String toString() {
  return 'WalletModel(publicKey: $publicKey, name: $name, type: $type, status: $status, solBalance: $solBalance, lastUpdated: $lastUpdated, authToken: $authToken, walletUriBase: $walletUriBase)';
}


}

/// @nodoc
abstract mixin class _$WalletModelCopyWith<$Res> implements $WalletModelCopyWith<$Res> {
  factory _$WalletModelCopyWith(_WalletModel value, $Res Function(_WalletModel) _then) = __$WalletModelCopyWithImpl;
@override @useResult
$Res call({
 String publicKey, String name, WalletType type, WalletStatus status, double solBalance, DateTime? lastUpdated, String? authToken, String? walletUriBase
});




}
/// @nodoc
class __$WalletModelCopyWithImpl<$Res>
    implements _$WalletModelCopyWith<$Res> {
  __$WalletModelCopyWithImpl(this._self, this._then);

  final _WalletModel _self;
  final $Res Function(_WalletModel) _then;

/// Create a copy of WalletModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? publicKey = null,Object? name = null,Object? type = null,Object? status = null,Object? solBalance = null,Object? lastUpdated = freezed,Object? authToken = freezed,Object? walletUriBase = freezed,}) {
  return _then(_WalletModel(
publicKey: null == publicKey ? _self.publicKey : publicKey // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as WalletType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as WalletStatus,solBalance: null == solBalance ? _self.solBalance : solBalance // ignore: cast_nullable_to_non_nullable
as double,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,authToken: freezed == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as String?,walletUriBase: freezed == walletUriBase ? _self.walletUriBase : walletUriBase // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
