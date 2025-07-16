// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppStateModel {

 AppStatus get status; WalletModel? get connectedWallet; List<NFTModel> get userNFTs; List<PhotoModel> get capturedPhotos; AppSettings get settings; String? get errorMessage; bool get isOnline; bool get hasPermissions;
/// Create a copy of AppStateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppStateModelCopyWith<AppStateModel> get copyWith => _$AppStateModelCopyWithImpl<AppStateModel>(this as AppStateModel, _$identity);

  /// Serializes this AppStateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppStateModel&&(identical(other.status, status) || other.status == status)&&(identical(other.connectedWallet, connectedWallet) || other.connectedWallet == connectedWallet)&&const DeepCollectionEquality().equals(other.userNFTs, userNFTs)&&const DeepCollectionEquality().equals(other.capturedPhotos, capturedPhotos)&&(identical(other.settings, settings) || other.settings == settings)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.hasPermissions, hasPermissions) || other.hasPermissions == hasPermissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,connectedWallet,const DeepCollectionEquality().hash(userNFTs),const DeepCollectionEquality().hash(capturedPhotos),settings,errorMessage,isOnline,hasPermissions);

@override
String toString() {
  return 'AppStateModel(status: $status, connectedWallet: $connectedWallet, userNFTs: $userNFTs, capturedPhotos: $capturedPhotos, settings: $settings, errorMessage: $errorMessage, isOnline: $isOnline, hasPermissions: $hasPermissions)';
}


}

/// @nodoc
abstract mixin class $AppStateModelCopyWith<$Res>  {
  factory $AppStateModelCopyWith(AppStateModel value, $Res Function(AppStateModel) _then) = _$AppStateModelCopyWithImpl;
@useResult
$Res call({
 AppStatus status, WalletModel? connectedWallet, List<NFTModel> userNFTs, List<PhotoModel> capturedPhotos, AppSettings settings, String? errorMessage, bool isOnline, bool hasPermissions
});


$WalletModelCopyWith<$Res>? get connectedWallet;$AppSettingsCopyWith<$Res> get settings;

}
/// @nodoc
class _$AppStateModelCopyWithImpl<$Res>
    implements $AppStateModelCopyWith<$Res> {
  _$AppStateModelCopyWithImpl(this._self, this._then);

  final AppStateModel _self;
  final $Res Function(AppStateModel) _then;

/// Create a copy of AppStateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? connectedWallet = freezed,Object? userNFTs = null,Object? capturedPhotos = null,Object? settings = null,Object? errorMessage = freezed,Object? isOnline = null,Object? hasPermissions = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AppStatus,connectedWallet: freezed == connectedWallet ? _self.connectedWallet : connectedWallet // ignore: cast_nullable_to_non_nullable
as WalletModel?,userNFTs: null == userNFTs ? _self.userNFTs : userNFTs // ignore: cast_nullable_to_non_nullable
as List<NFTModel>,capturedPhotos: null == capturedPhotos ? _self.capturedPhotos : capturedPhotos // ignore: cast_nullable_to_non_nullable
as List<PhotoModel>,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as AppSettings,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,hasPermissions: null == hasPermissions ? _self.hasPermissions : hasPermissions // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of AppStateModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WalletModelCopyWith<$Res>? get connectedWallet {
    if (_self.connectedWallet == null) {
    return null;
  }

  return $WalletModelCopyWith<$Res>(_self.connectedWallet!, (value) {
    return _then(_self.copyWith(connectedWallet: value));
  });
}/// Create a copy of AppStateModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<$Res> get settings {
  
  return $AppSettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppStateModel].
extension AppStateModelPatterns on AppStateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppStateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppStateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppStateModel value)  $default,){
final _that = this;
switch (_that) {
case _AppStateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppStateModel value)?  $default,){
final _that = this;
switch (_that) {
case _AppStateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppStatus status,  WalletModel? connectedWallet,  List<NFTModel> userNFTs,  List<PhotoModel> capturedPhotos,  AppSettings settings,  String? errorMessage,  bool isOnline,  bool hasPermissions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppStateModel() when $default != null:
return $default(_that.status,_that.connectedWallet,_that.userNFTs,_that.capturedPhotos,_that.settings,_that.errorMessage,_that.isOnline,_that.hasPermissions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppStatus status,  WalletModel? connectedWallet,  List<NFTModel> userNFTs,  List<PhotoModel> capturedPhotos,  AppSettings settings,  String? errorMessage,  bool isOnline,  bool hasPermissions)  $default,) {final _that = this;
switch (_that) {
case _AppStateModel():
return $default(_that.status,_that.connectedWallet,_that.userNFTs,_that.capturedPhotos,_that.settings,_that.errorMessage,_that.isOnline,_that.hasPermissions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppStatus status,  WalletModel? connectedWallet,  List<NFTModel> userNFTs,  List<PhotoModel> capturedPhotos,  AppSettings settings,  String? errorMessage,  bool isOnline,  bool hasPermissions)?  $default,) {final _that = this;
switch (_that) {
case _AppStateModel() when $default != null:
return $default(_that.status,_that.connectedWallet,_that.userNFTs,_that.capturedPhotos,_that.settings,_that.errorMessage,_that.isOnline,_that.hasPermissions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppStateModel implements AppStateModel {
  const _AppStateModel({this.status = AppStatus.initializing, this.connectedWallet, final  List<NFTModel> userNFTs = const [], final  List<PhotoModel> capturedPhotos = const [], this.settings = const AppSettings(), this.errorMessage, this.isOnline = false, this.hasPermissions = false}): _userNFTs = userNFTs,_capturedPhotos = capturedPhotos;
  factory _AppStateModel.fromJson(Map<String, dynamic> json) => _$AppStateModelFromJson(json);

@override@JsonKey() final  AppStatus status;
@override final  WalletModel? connectedWallet;
 final  List<NFTModel> _userNFTs;
@override@JsonKey() List<NFTModel> get userNFTs {
  if (_userNFTs is EqualUnmodifiableListView) return _userNFTs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userNFTs);
}

 final  List<PhotoModel> _capturedPhotos;
@override@JsonKey() List<PhotoModel> get capturedPhotos {
  if (_capturedPhotos is EqualUnmodifiableListView) return _capturedPhotos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_capturedPhotos);
}

@override@JsonKey() final  AppSettings settings;
@override final  String? errorMessage;
@override@JsonKey() final  bool isOnline;
@override@JsonKey() final  bool hasPermissions;

/// Create a copy of AppStateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppStateModelCopyWith<_AppStateModel> get copyWith => __$AppStateModelCopyWithImpl<_AppStateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppStateModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppStateModel&&(identical(other.status, status) || other.status == status)&&(identical(other.connectedWallet, connectedWallet) || other.connectedWallet == connectedWallet)&&const DeepCollectionEquality().equals(other._userNFTs, _userNFTs)&&const DeepCollectionEquality().equals(other._capturedPhotos, _capturedPhotos)&&(identical(other.settings, settings) || other.settings == settings)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.hasPermissions, hasPermissions) || other.hasPermissions == hasPermissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,connectedWallet,const DeepCollectionEquality().hash(_userNFTs),const DeepCollectionEquality().hash(_capturedPhotos),settings,errorMessage,isOnline,hasPermissions);

@override
String toString() {
  return 'AppStateModel(status: $status, connectedWallet: $connectedWallet, userNFTs: $userNFTs, capturedPhotos: $capturedPhotos, settings: $settings, errorMessage: $errorMessage, isOnline: $isOnline, hasPermissions: $hasPermissions)';
}


}

/// @nodoc
abstract mixin class _$AppStateModelCopyWith<$Res> implements $AppStateModelCopyWith<$Res> {
  factory _$AppStateModelCopyWith(_AppStateModel value, $Res Function(_AppStateModel) _then) = __$AppStateModelCopyWithImpl;
@override @useResult
$Res call({
 AppStatus status, WalletModel? connectedWallet, List<NFTModel> userNFTs, List<PhotoModel> capturedPhotos, AppSettings settings, String? errorMessage, bool isOnline, bool hasPermissions
});


@override $WalletModelCopyWith<$Res>? get connectedWallet;@override $AppSettingsCopyWith<$Res> get settings;

}
/// @nodoc
class __$AppStateModelCopyWithImpl<$Res>
    implements _$AppStateModelCopyWith<$Res> {
  __$AppStateModelCopyWithImpl(this._self, this._then);

  final _AppStateModel _self;
  final $Res Function(_AppStateModel) _then;

/// Create a copy of AppStateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? connectedWallet = freezed,Object? userNFTs = null,Object? capturedPhotos = null,Object? settings = null,Object? errorMessage = freezed,Object? isOnline = null,Object? hasPermissions = null,}) {
  return _then(_AppStateModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AppStatus,connectedWallet: freezed == connectedWallet ? _self.connectedWallet : connectedWallet // ignore: cast_nullable_to_non_nullable
as WalletModel?,userNFTs: null == userNFTs ? _self._userNFTs : userNFTs // ignore: cast_nullable_to_non_nullable
as List<NFTModel>,capturedPhotos: null == capturedPhotos ? _self._capturedPhotos : capturedPhotos // ignore: cast_nullable_to_non_nullable
as List<PhotoModel>,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as AppSettings,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,hasPermissions: null == hasPermissions ? _self.hasPermissions : hasPermissions // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of AppStateModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WalletModelCopyWith<$Res>? get connectedWallet {
    if (_self.connectedWallet == null) {
    return null;
  }

  return $WalletModelCopyWith<$Res>(_self.connectedWallet!, (value) {
    return _then(_self.copyWith(connectedWallet: value));
  });
}/// Create a copy of AppStateModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<$Res> get settings {
  
  return $AppSettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}


/// @nodoc
mixin _$AppSettings {

 bool get enableGeolocation; bool get enableWatermark; FilterType get defaultFilter; ImageQuality get imageQuality; NetworkType get network; bool get autoUpload; bool get enableNotifications; bool get enableAnalytics; String get language; ThemeMode get themeMode;
/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<AppSettings> get copyWith => _$AppSettingsCopyWithImpl<AppSettings>(this as AppSettings, _$identity);

  /// Serializes this AppSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettings&&(identical(other.enableGeolocation, enableGeolocation) || other.enableGeolocation == enableGeolocation)&&(identical(other.enableWatermark, enableWatermark) || other.enableWatermark == enableWatermark)&&(identical(other.defaultFilter, defaultFilter) || other.defaultFilter == defaultFilter)&&(identical(other.imageQuality, imageQuality) || other.imageQuality == imageQuality)&&(identical(other.network, network) || other.network == network)&&(identical(other.autoUpload, autoUpload) || other.autoUpload == autoUpload)&&(identical(other.enableNotifications, enableNotifications) || other.enableNotifications == enableNotifications)&&(identical(other.enableAnalytics, enableAnalytics) || other.enableAnalytics == enableAnalytics)&&(identical(other.language, language) || other.language == language)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enableGeolocation,enableWatermark,defaultFilter,imageQuality,network,autoUpload,enableNotifications,enableAnalytics,language,themeMode);

@override
String toString() {
  return 'AppSettings(enableGeolocation: $enableGeolocation, enableWatermark: $enableWatermark, defaultFilter: $defaultFilter, imageQuality: $imageQuality, network: $network, autoUpload: $autoUpload, enableNotifications: $enableNotifications, enableAnalytics: $enableAnalytics, language: $language, themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class $AppSettingsCopyWith<$Res>  {
  factory $AppSettingsCopyWith(AppSettings value, $Res Function(AppSettings) _then) = _$AppSettingsCopyWithImpl;
@useResult
$Res call({
 bool enableGeolocation, bool enableWatermark, FilterType defaultFilter, ImageQuality imageQuality, NetworkType network, bool autoUpload, bool enableNotifications, bool enableAnalytics, String language, ThemeMode themeMode
});




}
/// @nodoc
class _$AppSettingsCopyWithImpl<$Res>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._self, this._then);

  final AppSettings _self;
  final $Res Function(AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enableGeolocation = null,Object? enableWatermark = null,Object? defaultFilter = null,Object? imageQuality = null,Object? network = null,Object? autoUpload = null,Object? enableNotifications = null,Object? enableAnalytics = null,Object? language = null,Object? themeMode = null,}) {
  return _then(_self.copyWith(
enableGeolocation: null == enableGeolocation ? _self.enableGeolocation : enableGeolocation // ignore: cast_nullable_to_non_nullable
as bool,enableWatermark: null == enableWatermark ? _self.enableWatermark : enableWatermark // ignore: cast_nullable_to_non_nullable
as bool,defaultFilter: null == defaultFilter ? _self.defaultFilter : defaultFilter // ignore: cast_nullable_to_non_nullable
as FilterType,imageQuality: null == imageQuality ? _self.imageQuality : imageQuality // ignore: cast_nullable_to_non_nullable
as ImageQuality,network: null == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
as NetworkType,autoUpload: null == autoUpload ? _self.autoUpload : autoUpload // ignore: cast_nullable_to_non_nullable
as bool,enableNotifications: null == enableNotifications ? _self.enableNotifications : enableNotifications // ignore: cast_nullable_to_non_nullable
as bool,enableAnalytics: null == enableAnalytics ? _self.enableAnalytics : enableAnalytics // ignore: cast_nullable_to_non_nullable
as bool,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,
  ));
}

}


/// Adds pattern-matching-related methods to [AppSettings].
extension AppSettingsPatterns on AppSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSettings value)  $default,){
final _that = this;
switch (_that) {
case _AppSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSettings value)?  $default,){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enableGeolocation,  bool enableWatermark,  FilterType defaultFilter,  ImageQuality imageQuality,  NetworkType network,  bool autoUpload,  bool enableNotifications,  bool enableAnalytics,  String language,  ThemeMode themeMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.enableGeolocation,_that.enableWatermark,_that.defaultFilter,_that.imageQuality,_that.network,_that.autoUpload,_that.enableNotifications,_that.enableAnalytics,_that.language,_that.themeMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enableGeolocation,  bool enableWatermark,  FilterType defaultFilter,  ImageQuality imageQuality,  NetworkType network,  bool autoUpload,  bool enableNotifications,  bool enableAnalytics,  String language,  ThemeMode themeMode)  $default,) {final _that = this;
switch (_that) {
case _AppSettings():
return $default(_that.enableGeolocation,_that.enableWatermark,_that.defaultFilter,_that.imageQuality,_that.network,_that.autoUpload,_that.enableNotifications,_that.enableAnalytics,_that.language,_that.themeMode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enableGeolocation,  bool enableWatermark,  FilterType defaultFilter,  ImageQuality imageQuality,  NetworkType network,  bool autoUpload,  bool enableNotifications,  bool enableAnalytics,  String language,  ThemeMode themeMode)?  $default,) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.enableGeolocation,_that.enableWatermark,_that.defaultFilter,_that.imageQuality,_that.network,_that.autoUpload,_that.enableNotifications,_that.enableAnalytics,_that.language,_that.themeMode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppSettings implements AppSettings {
  const _AppSettings({this.enableGeolocation = true, this.enableWatermark = true, this.defaultFilter = FilterType.none, this.imageQuality = ImageQuality.high, this.network = NetworkType.testnet, this.autoUpload = true, this.enableNotifications = true, this.enableAnalytics = false, this.language = 'en', this.themeMode = ThemeMode.system});
  factory _AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);

@override@JsonKey() final  bool enableGeolocation;
@override@JsonKey() final  bool enableWatermark;
@override@JsonKey() final  FilterType defaultFilter;
@override@JsonKey() final  ImageQuality imageQuality;
@override@JsonKey() final  NetworkType network;
@override@JsonKey() final  bool autoUpload;
@override@JsonKey() final  bool enableNotifications;
@override@JsonKey() final  bool enableAnalytics;
@override@JsonKey() final  String language;
@override@JsonKey() final  ThemeMode themeMode;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingsCopyWith<_AppSettings> get copyWith => __$AppSettingsCopyWithImpl<_AppSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettings&&(identical(other.enableGeolocation, enableGeolocation) || other.enableGeolocation == enableGeolocation)&&(identical(other.enableWatermark, enableWatermark) || other.enableWatermark == enableWatermark)&&(identical(other.defaultFilter, defaultFilter) || other.defaultFilter == defaultFilter)&&(identical(other.imageQuality, imageQuality) || other.imageQuality == imageQuality)&&(identical(other.network, network) || other.network == network)&&(identical(other.autoUpload, autoUpload) || other.autoUpload == autoUpload)&&(identical(other.enableNotifications, enableNotifications) || other.enableNotifications == enableNotifications)&&(identical(other.enableAnalytics, enableAnalytics) || other.enableAnalytics == enableAnalytics)&&(identical(other.language, language) || other.language == language)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enableGeolocation,enableWatermark,defaultFilter,imageQuality,network,autoUpload,enableNotifications,enableAnalytics,language,themeMode);

@override
String toString() {
  return 'AppSettings(enableGeolocation: $enableGeolocation, enableWatermark: $enableWatermark, defaultFilter: $defaultFilter, imageQuality: $imageQuality, network: $network, autoUpload: $autoUpload, enableNotifications: $enableNotifications, enableAnalytics: $enableAnalytics, language: $language, themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsCopyWith<$Res> implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(_AppSettings value, $Res Function(_AppSettings) _then) = __$AppSettingsCopyWithImpl;
@override @useResult
$Res call({
 bool enableGeolocation, bool enableWatermark, FilterType defaultFilter, ImageQuality imageQuality, NetworkType network, bool autoUpload, bool enableNotifications, bool enableAnalytics, String language, ThemeMode themeMode
});




}
/// @nodoc
class __$AppSettingsCopyWithImpl<$Res>
    implements _$AppSettingsCopyWith<$Res> {
  __$AppSettingsCopyWithImpl(this._self, this._then);

  final _AppSettings _self;
  final $Res Function(_AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enableGeolocation = null,Object? enableWatermark = null,Object? defaultFilter = null,Object? imageQuality = null,Object? network = null,Object? autoUpload = null,Object? enableNotifications = null,Object? enableAnalytics = null,Object? language = null,Object? themeMode = null,}) {
  return _then(_AppSettings(
enableGeolocation: null == enableGeolocation ? _self.enableGeolocation : enableGeolocation // ignore: cast_nullable_to_non_nullable
as bool,enableWatermark: null == enableWatermark ? _self.enableWatermark : enableWatermark // ignore: cast_nullable_to_non_nullable
as bool,defaultFilter: null == defaultFilter ? _self.defaultFilter : defaultFilter // ignore: cast_nullable_to_non_nullable
as FilterType,imageQuality: null == imageQuality ? _self.imageQuality : imageQuality // ignore: cast_nullable_to_non_nullable
as ImageQuality,network: null == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
as NetworkType,autoUpload: null == autoUpload ? _self.autoUpload : autoUpload // ignore: cast_nullable_to_non_nullable
as bool,enableNotifications: null == enableNotifications ? _self.enableNotifications : enableNotifications // ignore: cast_nullable_to_non_nullable
as bool,enableAnalytics: null == enableAnalytics ? _self.enableAnalytics : enableAnalytics // ignore: cast_nullable_to_non_nullable
as bool,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,
  ));
}


}


/// @nodoc
mixin _$UploadProgress {

 String get id; String get fileName; UploadStage get stage; double get progress; String? get errorMessage; DateTime? get startTime; DateTime? get endTime;
/// Create a copy of UploadProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadProgressCopyWith<UploadProgress> get copyWith => _$UploadProgressCopyWithImpl<UploadProgress>(this as UploadProgress, _$identity);

  /// Serializes this UploadProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadProgress&&(identical(other.id, id) || other.id == id)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fileName,stage,progress,errorMessage,startTime,endTime);

@override
String toString() {
  return 'UploadProgress(id: $id, fileName: $fileName, stage: $stage, progress: $progress, errorMessage: $errorMessage, startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class $UploadProgressCopyWith<$Res>  {
  factory $UploadProgressCopyWith(UploadProgress value, $Res Function(UploadProgress) _then) = _$UploadProgressCopyWithImpl;
@useResult
$Res call({
 String id, String fileName, UploadStage stage, double progress, String? errorMessage, DateTime? startTime, DateTime? endTime
});




}
/// @nodoc
class _$UploadProgressCopyWithImpl<$Res>
    implements $UploadProgressCopyWith<$Res> {
  _$UploadProgressCopyWithImpl(this._self, this._then);

  final UploadProgress _self;
  final $Res Function(UploadProgress) _then;

/// Create a copy of UploadProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fileName = null,Object? stage = null,Object? progress = null,Object? errorMessage = freezed,Object? startTime = freezed,Object? endTime = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as UploadStage,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [UploadProgress].
extension UploadProgressPatterns on UploadProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UploadProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UploadProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UploadProgress value)  $default,){
final _that = this;
switch (_that) {
case _UploadProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UploadProgress value)?  $default,){
final _that = this;
switch (_that) {
case _UploadProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String fileName,  UploadStage stage,  double progress,  String? errorMessage,  DateTime? startTime,  DateTime? endTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UploadProgress() when $default != null:
return $default(_that.id,_that.fileName,_that.stage,_that.progress,_that.errorMessage,_that.startTime,_that.endTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String fileName,  UploadStage stage,  double progress,  String? errorMessage,  DateTime? startTime,  DateTime? endTime)  $default,) {final _that = this;
switch (_that) {
case _UploadProgress():
return $default(_that.id,_that.fileName,_that.stage,_that.progress,_that.errorMessage,_that.startTime,_that.endTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String fileName,  UploadStage stage,  double progress,  String? errorMessage,  DateTime? startTime,  DateTime? endTime)?  $default,) {final _that = this;
switch (_that) {
case _UploadProgress() when $default != null:
return $default(_that.id,_that.fileName,_that.stage,_that.progress,_that.errorMessage,_that.startTime,_that.endTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UploadProgress implements UploadProgress {
  const _UploadProgress({required this.id, required this.fileName, required this.stage, this.progress = 0.0, this.errorMessage, this.startTime, this.endTime});
  factory _UploadProgress.fromJson(Map<String, dynamic> json) => _$UploadProgressFromJson(json);

@override final  String id;
@override final  String fileName;
@override final  UploadStage stage;
@override@JsonKey() final  double progress;
@override final  String? errorMessage;
@override final  DateTime? startTime;
@override final  DateTime? endTime;

/// Create a copy of UploadProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadProgressCopyWith<_UploadProgress> get copyWith => __$UploadProgressCopyWithImpl<_UploadProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UploadProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadProgress&&(identical(other.id, id) || other.id == id)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fileName,stage,progress,errorMessage,startTime,endTime);

@override
String toString() {
  return 'UploadProgress(id: $id, fileName: $fileName, stage: $stage, progress: $progress, errorMessage: $errorMessage, startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class _$UploadProgressCopyWith<$Res> implements $UploadProgressCopyWith<$Res> {
  factory _$UploadProgressCopyWith(_UploadProgress value, $Res Function(_UploadProgress) _then) = __$UploadProgressCopyWithImpl;
@override @useResult
$Res call({
 String id, String fileName, UploadStage stage, double progress, String? errorMessage, DateTime? startTime, DateTime? endTime
});




}
/// @nodoc
class __$UploadProgressCopyWithImpl<$Res>
    implements _$UploadProgressCopyWith<$Res> {
  __$UploadProgressCopyWithImpl(this._self, this._then);

  final _UploadProgress _self;
  final $Res Function(_UploadProgress) _then;

/// Create a copy of UploadProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fileName = null,Object? stage = null,Object? progress = null,Object? errorMessage = freezed,Object? startTime = freezed,Object? endTime = freezed,}) {
  return _then(_UploadProgress(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as UploadStage,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
