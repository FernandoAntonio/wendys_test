import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wendys_test/data/models/category/category_model.dart';

part 'menu_lists_model.freezed.dart';
part 'menu_lists_model.g.dart';

@freezed
class MenuListsModel with _$MenuListsModel {
  MenuListsModel._();

  const factory MenuListsModel({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'subMenus') required List<CategoryModel> categories,
    required List menuItems,
  }) = _MenuListsModel;

  factory MenuListsModel.empty() {
    return MenuListsModel(
      categories: [],
      menuItems: [],
    );
  }

  factory MenuListsModel.fromJson(Map<String, dynamic> json) => _$MenuListsModelFromJson(json);
}
