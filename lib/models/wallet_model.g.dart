// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WalletModel _$WalletModelFromJson(Map<String, dynamic> json) => _WalletModel(
  publicKey: json['publicKey'] as String,
  name: json['name'] as String,
  type: $enumDecode(_$WalletTypeEnumMap, json['type']),
  status: $enumDecode(_$WalletStatusEnumMap, json['status']),
  solBalance: (json['solBalance'] as num?)?.toDouble() ?? 0.0,
  lastUpdated: json['lastUpdated'] == null
      ? null
      : DateTime.parse(json['lastUpdated'] as String),
  authToken: json['authToken'] as String?,
  walletUriBase: json['walletUriBase'] as String?,
);

Map<String, dynamic> _$WalletModelToJson(_WalletModel instance) =>
    <String, dynamic>{
      'publicKey': instance.publicKey,
      'name': instance.name,
      'type': _$WalletTypeEnumMap[instance.type]!,
      'status': _$WalletStatusEnumMap[instance.status]!,
      'solBalance': instance.solBalance,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
      'authToken': instance.authToken,
      'walletUriBase': instance.walletUriBase,
    };

const _$WalletTypeEnumMap = {
  WalletType.phantom: 'phantom',
  WalletType.solflare: 'solflare',
  WalletType.backpack: 'backpack',
  WalletType.glow: 'glow',
  WalletType.imported: 'imported',
  WalletType.generated: 'generated',
};

const _$WalletStatusEnumMap = {
  WalletStatus.disconnected: 'disconnected',
  WalletStatus.connecting: 'connecting',
  WalletStatus.connected: 'connected',
  WalletStatus.error: 'error',
};
