import 'package:flutter/material.dart';
import 'package:wendys_test/data/models/menu_item/menu_item_model.dart';

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
