import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wendys_test/data/models/menu_item/menu_item_model.dart';
import 'package:wendys_test/presentation/cubit/cart/cart_cubit.dart';
import 'package:wendys_test/presentation/pages/widgets/cart_widget.dart';

class SelectedMenuItemPage extends StatelessWidget {
  final MenuItemModel selectedMenuItem;

  const SelectedMenuItemPage({
    super.key,
    required this.selectedMenuItem,
  });

  void _onFABPressed(BuildContext context) {
    while (Navigator.canPop(context)) {
      Navigator.of(context).pop();
    }
    BlocProvider.of<CartCubit>(context).addToCart(selectedMenuItem);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${selectedMenuItem.displayName} added to the cart'),
        padding: EdgeInsets.all(16.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onFABPressed(context),
        backgroundColor: Colors.red,
        shape: CircleBorder(),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: Text(selectedMenuItem.displayName),
        actions: [
          CartWidget(),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 36.0, 16.0, 16.0),
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 20.0),
              children: <TextSpan>[
                TextSpan(
                  text: 'Name: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: '${selectedMenuItem.displayName}\n\n'),
                TextSpan(
                  text: 'Description: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: '${selectedMenuItem.description}\n\n'),
                TextSpan(
                  text: 'Calories: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: '${selectedMenuItem.calorieRange}\n\n'),
                TextSpan(
                  text: 'Price: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: selectedMenuItem.priceRange),
              ],
            ),
          )),
    );
  }
}
