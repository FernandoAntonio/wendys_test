import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wendys_test/core/use_cases/i_use_case.dart';
import 'package:wendys_test/data/models/category/category_model.dart';
import 'package:wendys_test/domain/use_cases/categories/get_categories_use_case.dart';

part 'categories_cubit.freezed.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUseCase _getCategoriesUseCase;

  CategoriesCubit({
    required GetCategoriesUseCase getCategoriesUseCase,
  })  : _getCategoriesUseCase = getCategoriesUseCase,
        super(CategoriesState.initial());

  Future<void> getCategories() async {
    emit(state.copyWith(isLoading: true));

    final (categories, error) = await _getCategoriesUseCase(NoParams());

    emit(state.copyWith(categories: categories, isLoading: false));
  }
}
