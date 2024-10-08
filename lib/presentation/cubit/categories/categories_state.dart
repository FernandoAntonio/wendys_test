part of 'categories_cubit.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const CategoriesState._();

  const factory CategoriesState({
    required bool isLoading,
    required List<CategoryModel> categories,
  }) = _CategoriesState;

  factory CategoriesState.initial() {
    return CategoriesState(
      isLoading: false,
      categories: [],
    );
  }
}
