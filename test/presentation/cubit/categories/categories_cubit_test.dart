import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wendys_test/core/use_cases/i_use_case.dart';
import 'package:wendys_test/domain/use_cases/categories/get_categories_use_case.dart';
import 'package:wendys_test/presentation/cubit/categories/categories_cubit.dart';

import '../../../fixtures/categories/categories_model_list_mock.dart';
import '../../../mocks/mocks.mocks.dart';

void main() {
  group('CategoriesCubit', () {
    late GetCategoriesUseCase useCase;
    late CategoriesCubit categoriesCubit;

    setUp(() {
      useCase = MockGetCategoriesUseCase();
      categoriesCubit = CategoriesCubit(getCategoriesUseCase: useCase);
    });

    tearDown(() {
      categoriesCubit.close();
    });

    test('initial state is CategoriesCubit.initial()', () {
      expect(categoriesCubit.state, equals(CategoriesState.initial()));
    });

    blocTest<CategoriesCubit, CategoriesState>(
      'emits state with new item list when getCategories is called',
      build: () => categoriesCubit,
      act: (cubit) {
        when(useCase(NoParams()))
            .thenAnswer((_) async => (mockCategoriesModelList, null));
        return cubit.getCategories();
      },
      expect: () => [
        CategoriesState(isLoading: true, categories: []),
        CategoriesState(isLoading: false, categories: mockCategoriesModelList),
      ],
    );
  });
}
