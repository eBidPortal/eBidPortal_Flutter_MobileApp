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
    String? departmentId,
    @Default(true) bool isActive,
    @Default(false) bool canBuy,
    @Default(false) bool canSell,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
