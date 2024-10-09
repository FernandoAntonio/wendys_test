import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wendys_test/data/models/category/category_model.dart';
import 'package:wendys_test/dependency_injection.dart';
import 'package:wendys_test/presentation/cubit/menu_items/menu_items_cubit.dart';
import 'package:wendys_test/presentation/pages/widgets/menu_item_widget.dart';

class MenuItemsPage extends StatefulWidget {
  final CategoryModel selectedCategory;

  const MenuItemsPage({
    super.key,
    required this.selectedCategory,
  });

  @override
  State<MenuItemsPage> createState() => _MenuItemsPageState();
}

class _MenuItemsPageState extends State<MenuItemsPage> {
  late MenuItemsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<MenuItemsCubit>();
    _cubit.getMenuItemsById(widget.selectedCategory.menuItems);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _cubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.selectedCategory.displayName),
        ),
        body: BlocBuilder<MenuItemsCubit, MenuItemsState>(
          builder: (context, state) {
            return state.isLoading
                ? Center(child: CircularProgressIndicator())
                : GridView.builder(
                    itemCount: state.menuItems.length,
                    padding: const EdgeInsets.all(20.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 40.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) {
                      final category = state.menuItems.elementAt(index);
                      return MenuItemWidget(displayName: category.displayName);
                    },
                  );
          },
        ),
      ),
    );
  }
}
