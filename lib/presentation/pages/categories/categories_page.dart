import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wendys_test/data/models/category/category_model.dart';
import 'package:wendys_test/dependency_injection.dart';
import 'package:wendys_test/presentation/cubit/categories/categories_cubit.dart';
import 'package:wendys_test/presentation/pages/menu_items/menu_items_page.dart';
import 'package:wendys_test/presentation/pages/widgets/cart_widget.dart';
import 'package:wendys_test/presentation/pages/widgets/menu_item_widget.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late CategoriesCubit _cubit;

  void _onMenuItemPressed(
      BuildContext context, CategoryModel selectedCategory) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MenuItemsPage(selectedCategory: selectedCategory),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _cubit = getIt<CategoriesCubit>();
    _cubit.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _cubit,
      child: Scaffold(
        key: Key('categories_page'),
        appBar: AppBar(
          title: Text('Categories Page'),
          actions: [
            CartWidget(),
          ],
        ),
        body: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            return state.isLoading
                ? Center(child: CircularProgressIndicator())
                : GridView.builder(
                    itemCount: state.categories.length,
                    padding: const EdgeInsets.all(20.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 40.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      final category = state.categories.elementAt(index);
                      return MenuItemWidget(
                        displayName: category.displayName,
                        onPressed: () => _onMenuItemPressed(context, category),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
