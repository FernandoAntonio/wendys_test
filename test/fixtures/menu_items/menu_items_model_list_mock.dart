import 'package:wendys_test/data/models/menu_item/menu_item_model.dart';

final mockMenuItemsModelString =
    '[{"menuItemId":30000,"name":"Dave\'s Single®","displayName":"Dave\'s Single®","description":"A quarter-pound* of fresh beef, American cheese, crisp lettuce, tomato, pickle, ketchup, mayo, and onion on a toasted bun — just the way Dave intended.","calorieRange":"590 Cal","priceRange":"\$3.59"},{"menuItemId":30001,"name":"Dave\'s Double®","displayName":"Dave\'s Double®","description":"A half-pound* of fresh beef, American cheese, crisp lettuce, tomato, pickle, ketchup, mayo, and onion on a toasted bun. More meat means more to love.","calorieRange":"860 Cal","priceRange":"\$4.69"},{"menuItemId":30002,"name":"Dave\'s Triple®","displayName":"Dave\'s Triple®","description":"Three quarters of a pound* of fresh, never frozen beef, American cheese, crisp lettuce, tomato, pickle, ketchup, mayo, and onion on a toasted bun. Use both hands!","calorieRange":"1,160 Cal","priceRange":"\$5.59"},{"menuItemId":30003,"name":"Baconator®","displayName":"Baconator®","description":"A half-pound* of fresh beef, American cheese, 6 pieces of crispy Applewood smoked bacon, ketchup, and mayo. Carnivores rejoice!","calorieRange":"960 Cal","priceRange":"\$5.89"},{"menuItemId":30004,"name":"Son of Baconator®","displayName":"Son of Baconator®","description":"Two patties of fresh, never frozen beef, American cheese, plenty of Applewood smoked bacon, ketchup, and mayo. Like Baconator®, like Son.","calorieRange":"630 Cal","priceRange":"\$3.99"}]';

final mockMenuItemsModelList = [
  MenuItemModel(
    menuItemId: 30000,
    displayName: 'Dave\'s Single®',
    name: 'Dave\'s Single®',
    description:
        'A quarter-pound* of fresh beef, American cheese, crisp lettuce, tomato, pickle, ketchup, mayo, and onion on a toasted bun — just the way Dave intended.',
    priceRange: '\$3.59',
    calorieRange: '590 Cal',
  ),
  MenuItemModel(
    menuItemId: 30001,
    displayName: 'Dave\'s Double®',
    name: 'Dave\'s Double®',
    description:
        'A half-pound* of fresh beef, American cheese, crisp lettuce, tomato, pickle, ketchup, mayo, and onion on a toasted bun. More meat means more to love.',
    priceRange: '\$4.69',
    calorieRange: '860 Cal',
  ),
  MenuItemModel(
    menuItemId: 30002,
    displayName: 'Dave\'s Triple®',
    name: 'Dave\'s Triple®',
    description:
        'Three quarters of a pound* of fresh, never frozen beef, American cheese, crisp lettuce, tomato, pickle, ketchup, mayo, and onion on a toasted bun. Use both hands!',
    priceRange: '\$5.59',
    calorieRange: '1,160 Cal',
  ),
  MenuItemModel(
    menuItemId: 30003,
    displayName: 'Baconator®',
    name: 'Baconator®',
    description:
        'A half-pound* of fresh beef, American cheese, 6 pieces of crispy Applewood smoked bacon, ketchup, and mayo. Carnivores rejoice!',
    priceRange: '\$5.89',
    calorieRange: '960 Cal',
  ),
  MenuItemModel(
    menuItemId: 30004,
    displayName: 'Son of Baconator®',
    name: 'Son of Baconator®',
    description:
        'Two patties of fresh, never frozen beef, American cheese, plenty of Applewood smoked bacon, ketchup, and mayo. Like Baconator®, like Son.',
    priceRange: '\$3.99',
    calorieRange: '630 Cal',
  ),
];
