import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wendys_test/core/use_cases/i_use_case.dart';
import 'package:wendys_test/data/models/category/category_model.dart';
import 'package:wendys_test/domain/use_cases/categories/get_categories_use_case.dart';

import '../../../fixtures/categories/categories_model_list_mock.dart';
import '../../../mocks/mocks.mocks.dart';

void main() {
  late MockIMenuRepository mockMenuRepository;
  late GetCategoriesUseCase useCase;

  setUp(() {
    mockMenuRepository = MockIMenuRepository();
    useCase = GetCategoriesUseCase(repository: mockMenuRepository);
  });

  group('GetCategoriesUseCase', () {
    final errorMessage = 'Error Message';
    test('should return a list of CategoryModel when call is successful',
        () async {
      // Arrange
      when(mockMenuRepository.getCategoriesAndCacheData())
          .thenAnswer((_) async => (mockCategoriesModelList, null));

      // Act
      final result = await useCase(NoParams());

      // Assert
      expect(result.$1, mockCategoriesModelList);
      expect(result.$2, null);
      verify(mockMenuRepository.getCategoriesAndCacheData()).called(1);
    });

    test('should return an empty list and an error message when call fails',
        () async {
      // Arrange
      when(mockMenuRepository.getCategoriesAndCacheData())
          .thenAnswer((_) async => (<CategoryModel>[], errorMessage));

      // Act
      final result = await useCase(NoParams());

      // Assert
      expect(result.$1, <CategoryModel>[]);
      expect(result.$2, errorMessage);
      verify(mockMenuRepository.getCategoriesAndCacheData()).called(1);
    });
  });
}
