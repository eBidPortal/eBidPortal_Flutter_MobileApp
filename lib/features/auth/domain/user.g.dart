// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  mobile: json['mobile'] as String?,
  role: json['role'] as String,
  departmentId: json['departmentId'] as String?,
  isActive: json['isActive'] as bool? ?? true,
  canBuy: json['canBuy'] as bool? ?? false,
  canSell: json['canSell'] as bool? ?? false,
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'mobile': instance.mobile,
      'role': instance.role,
      'departmentId': instance.departmentId,
      'isActive': instance.isActive,
      'canBuy': instance.canBuy,
      'canSell': instance.canSell,
    };
