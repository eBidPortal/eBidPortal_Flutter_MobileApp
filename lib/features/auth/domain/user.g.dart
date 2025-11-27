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
  departmentId: json['department_id'] as String?,
  isActive: json['is_active'] as bool? ?? true,
  canBuy: json['can_buy'] as bool? ?? false,
  canSell: json['can_sell'] as bool? ?? false,
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'mobile': instance.mobile,
      'role': instance.role,
      'department_id': instance.departmentId,
      'is_active': instance.isActive,
      'can_buy': instance.canBuy,
      'can_sell': instance.canSell,
    };
