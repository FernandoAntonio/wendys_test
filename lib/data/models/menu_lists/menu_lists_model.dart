import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wendys_test/data/models/category/category_model.dart';

part 'menu_lists_model.freezed.dart';
part 'menu_lists_model.g.dart';

@freezed
class MenuListsModel with _$MenuListsModel {
  const factory MenuListsModel({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'subMenus') required List<CategoryModel> categories,
    required List menuItems,
  }) = _MenuListsModel;

  factory MenuListsModel.fromJson(Map<String, dynamic> json) => _$MenuListsModelFromJson(json);
}
