import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required String id,
    required String name,
    String? description,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'icon_url') String? iconUrl,
    @JsonKey(name: 'parent_id') String? parentId,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @Default([]) List<Category> children,
    @JsonKey(name: 'input_schema') Map<String, dynamic>? inputSchema,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}
