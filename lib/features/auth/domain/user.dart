import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String email,
    String? mobile,
    required String role,
    @JsonKey(name: 'department_id') String? departmentId,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'can_buy') @Default(false) bool canBuy,
    @JsonKey(name: 'can_sell') @Default(false) bool canSell,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
