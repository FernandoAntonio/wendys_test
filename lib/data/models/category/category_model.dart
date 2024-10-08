import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  CategoryModel._();

  const factory CategoryModel({
    required String name,
    required String displayName,
    required int subMenuId,
    required List<int> menuItems,
  }) = _CategoryModel;

  factory CategoryModel.empty() {
    return CategoryModel(
      menuItems: [],
      displayName: '',
      name: '',
      subMenuId: 0,
    );
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
}
