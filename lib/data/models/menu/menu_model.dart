import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wendys_test/data/models/menu_lists/menu_lists_model.dart';

part 'menu_model.freezed.dart';
part 'menu_model.g.dart';

@freezed
class MenuModel with _$MenuModel {
  MenuModel._();

  const factory MenuModel({
    required MenuListsModel menuLists,
  }) = _MenuModel;

  factory MenuModel.empty() {
    return MenuModel(
      menuLists: MenuListsModel.empty(),
    );
  }

  factory MenuModel.fromJson(Map<String, dynamic> json) => _$MenuModelFromJson(json);
}
