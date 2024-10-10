import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_item_model.freezed.dart';
part 'menu_item_model.g.dart';

@freezed
class MenuItemModel with _$MenuItemModel {
  const MenuItemModel._();

  const factory MenuItemModel({
    required int menuItemId,
    required String name,
    required String displayName,
    required String description,
    @Default('Not available') String calorieRange,
    @Default('Not available') String priceRange,
  }) = _MenuItemModel;

  factory MenuItemModel.empty() {
    return MenuItemModel(
      menuItemId: 0,
      name: '',
      displayName: '',
      description: '',
      calorieRange: '',
      priceRange: '',
    );
  }

  factory MenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemModelFromJson(json);
}
