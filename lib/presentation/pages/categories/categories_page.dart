import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wendys_test/dependency_injection.dart';
import 'package:wendys_test/presentation/cubit/categories/categories_cubit.dart';
import 'package:wendys_test/presentation/pages/widgets/menu_item_widget.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late CategoriesCubit _cubit;

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
        appBar: AppBar(
          title: Text('Categories Page'),
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
                    ),
                    itemBuilder: (context, index) {
                      final category = state.categories.elementAt(index);
                      return MenuItemWidget(displayName: category.displayName);
                    },
                  );
          },
        ),
      ),
    );
  }
}
