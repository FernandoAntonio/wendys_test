import 'package:wendys_test/data/models/menu_item/menu_item_model.dart';

final mockMenuItemsModelString =
    '[{"menuItemId":30000,"name":"Dave\'s Single®","displayName":"Dave\'s Single®","description":"A quarter-pound* of fresh beef, American cheese, crisp lettuce, tomato, pickle, ketchup, mayo, and onion on a toasted bun — just the way Dave intended.","calorieRange":"590 Cal","priceRange":"\$3.59"},{"menuItemId":30001,"name":"Dave\'s Double®","displayName":"Dave\'s Double®","description":"A half-pound* of fresh beef, American cheese, crisp lettuce, tomato, pickle, ketchup, mayo, and onion on a toasted bun. More meat means more to love.","calorieRange":"860 Cal","priceRange":"\$4.69"},{"menuItemId":30002,"name":"Dave\'s Triple®","displayName":"Dave\'s Triple®","description":"Three quarters of a pound* of fresh, never frozen beef, American cheese, crisp lettuce, tomato, pickle, ketchup, mayo, and onion on a toasted bun. Use both hands!","calorieRange":"1,160 Cal","priceRange":"\$5.59"},{"menuItemId":30003,"name":"Baconator®","displayName":"Baconator®","description":"A half-pound* of fresh beef, American cheese, 6 pieces of crispy Applewood smoked bacon, ketchup, and mayo. Carnivores rejoice!","calorieRange":"960 Cal","priceRange":"\$5.89"},{"menuItemId":30004,"name":"Son of Baconator®","displayName":"Son of Baconator®","description":"Two patties of fresh, never frozen beef, American cheese, plenty of Applewood smoked bacon, ketchup, and mayo. Like Baconator®, like Son.","calorieRange":"630 Cal","priceRange":"\$3.99"},{"menuItemId":30036,"name":"Chili","displayName":"Chili","description":"Perfectly seasoned and positively irresistible. Red’s kind of our thing, you know.","calorieRange":"240/340 Cal","priceRange":"\$1.79/\$2.49"},{"menuItemId":30039,"name":"Baconator Fries","displayName":"Baconator Fries","description":"Our natural-cut, skin-on, sea-salted fries topped with warm, creamy cheese sauce, shredded cheddar, and crispy Applewood smoked bacon. The only fries worthy of the Baconator name.","calorieRange":"460 Cal","priceRange":"\$2.29"},{"menuItemId":30050,"name":"Milk","displayName":"Milk","description":"The cold, creamy, mustache-creating classic.","calorieRange":"90 Cal","priceRange":"\$1.29"},{"menuItemId":30051,"name":"Chocolate Milk","displayName":"Chocolate Milk","description":"Every kid’s favorite—every adult-who-was-ever-a-kid’s favorite, too.","calorieRange":"140 Cal","priceRange":"\$1.29"},{"menuItemId":30053,"name":"Chocolate Frosty®","displayName":"Classic Chocolate Frosty®","description":"The Chocolate Frosty® was born out of Dave’s desire for a signature dessert to go with his vision of the perfect meal. Thick enough to use a spoon, smooth enough to use a straw, and perfect when enjoyed on the end of a fry.","calorieRange":"190-500 Cal","priceRange":"\$0.89-\$1.99"},{"menuItemId":30054,"name":"Vanilla Frosty®","displayName":"Vanilla Frosty®","description":"The vanilla version of our signature frozen dessert. Cool and creamy don’t do it justice. This is the smooth, thick, sweet dessert masterpiece that goes with everything on our menu.","calorieRange":"190-510 Cal","priceRange":"\$0.89-\$1.99"}]';

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
  MenuItemModel(
    menuItemId: 30036,
    displayName: 'Chili',
    name: 'Chili',
    description:
        'Perfectly seasoned and positively irresistible. Red’s kind of our thing, you know.',
    priceRange: '\$1.79/\$2.49',
    calorieRange: '240/340 Cal',
  ),
  MenuItemModel(
    menuItemId: 30039,
    displayName: 'Baconator Fries',
    name: 'Baconator Fries',
    description:
        'Our natural-cut, skin-on, sea-salted fries topped with warm, creamy cheese sauce, shredded cheddar, and crispy Applewood smoked bacon. The only fries worthy of the Baconator name.',
    priceRange: '\$2.29',
    calorieRange: '460 Cal',
  ),
  MenuItemModel(
    menuItemId: 30050,
    displayName: 'Milk',
    name: 'Milk',
    description: 'The cold, creamy, mustache-creating classic.',
    priceRange: '\$1.29',
    calorieRange: '90 Cal',
  ),
  MenuItemModel(
    menuItemId: 30051,
    displayName: 'Chocolate Milk',
    name: 'Chocolate Milk',
    description:
        'Every kid’s favorite—every adult-who-was-ever-a-kid’s favorite, too.',
    priceRange: '\$1.29',
    calorieRange: '140 Cal',
  ),
  MenuItemModel(
    menuItemId: 30053,
    displayName: 'Classic Chocolate Frosty®',
    name: 'Chocolate Frosty®',
    description:
        'The Chocolate Frosty® was born out of Dave’s desire for a signature dessert to go with his vision of the perfect meal. Thick enough to use a spoon, smooth enough to use a straw, and perfect when enjoyed on the end of a fry.',
    priceRange: '\$0.89-\$1.99',
    calorieRange: '190-500 Cal',
  ),
  MenuItemModel(
    menuItemId: 30054,
    displayName: 'Vanilla Frosty®',
    name: 'Vanilla Frosty®',
    description:
        'The vanilla version of our signature frozen dessert. Cool and creamy don’t do it justice. This is the smooth, thick, sweet dessert masterpiece that goes with everything on our menu.',
    priceRange: '\$0.89-\$1.99',
    calorieRange: '190-510 Cal',
  ),
];
