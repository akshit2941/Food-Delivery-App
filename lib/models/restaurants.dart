import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/models/cart_item.dart';
import 'package:foodapp/models/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  // List of food menu
  final List<Food> _menu = [
    // Burgers
    Food(
      name: "Classic Cheeseburger",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "lib/images/burgers/Burger1.jpg",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Veggie Delight",
      description:
          "A wholesome veggie patty with fresh lettuce, tomato, cucumber, and our special sauce.",
      imagePath: "lib/images/burgers/Burger2.jpg",
      price: 0.89,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Grilled mushrooms", price: 1.49),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Spicy Chicken Burger",
      description:
          "Crispy chicken fillet with spicy mayo, lettuce, and jalapenos for a fiery kick.",
      imagePath: "lib/images/burgers/Burger5.jpg",
      price: 1.29,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Extra jalapenos", price: 0.79),
        Addon(name: "Bacon", price: 1.99),
      ],
    ),
    Food(
      name: "BBQ Bacon Burger",
      description:
          "Beef patty topped with crispy bacon, cheddar, BBQ sauce, and onion rings.",
      imagePath: "lib/images/burgers/Burger3.jpg",
      price: 1.49,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Extra bacon", price: 1.99),
        Addon(name: "Grilled onions", price: 0.99),
      ],
    ),
    Food(
      name: "Mushroom Swiss Burger",
      description:
          "Juicy beef patty with melted Swiss cheese and sautéed mushrooms.",
      imagePath: "lib/images/burgers/Burger4.jpg",
      price: 1.39,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Grilled mushrooms", price: 1.49),
        Addon(name: "Bacon", price: 1.99),
      ],
    ),

    // Desserts
    Food(
      name: "Chocolate Lava Cake",
      description:
          "Warm chocolate cake with a gooey molten center, served with vanilla ice cream.",
      imagePath: "lib/images/desserts/desserts1.jpg",
      price: 2.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra ice cream", price: 1.49),
        Addon(name: "Whipped cream", price: 0.99),
        Addon(name: "Strawberries", price: 1.99),
      ],
    ),
    Food(
      name: "Cheesecake",
      description:
          "Creamy cheesecake with a graham cracker crust and a hint of lemon.",
      imagePath: "lib/images/desserts/desserts2.jpg",
      price: 2.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Berry compote", price: 1.29),
        Addon(name: "Whipped cream", price: 0.99),
        Addon(name: "Caramel sauce", price: 1.49),
      ],
    ),
    Food(
      name: "Apple Pie",
      description:
          "Classic apple pie with a flaky crust, served with a scoop of vanilla ice cream.",
      imagePath: "lib/images/desserts/desserts3.jpg",
      price: 1.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra ice cream", price: 1.49),
        Addon(name: "Caramel sauce", price: 1.49),
        Addon(name: "Whipped cream", price: 0.99),
      ],
    ),
    Food(
      name: "Brownie Sundae",
      description:
          "Rich chocolate brownie topped with vanilla ice cream, chocolate sauce, and nuts.",
      imagePath: "lib/images/desserts/desserts4.jpg",
      price: 2.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra ice cream", price: 1.49),
        Addon(name: "Whipped cream", price: 0.99),
        Addon(name: "Sprinkles", price: 0.79),
      ],
    ),
    Food(
      name: "Tiramisu",
      description:
          "Classic Italian dessert with layers of coffee-soaked ladyfingers and mascarpone cheese.",
      imagePath: "lib/images/desserts/desserts5.jpg",
      price: 3.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra mascarpone", price: 1.99),
        Addon(name: "Cocoa powder", price: 0.49),
        Addon(name: "Coffee syrup", price: 0.99),
      ],
    ),

    // Drinks
    Food(
      name: "Cola",
      description: "Refreshing cola served cold.",
      imagePath: "lib/images/drinks/drinks1.jpg",
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Lemon slice", price: 0.29),
        Addon(name: "Ice", price: 0.19),
        Addon(name: "Cherry", price: 0.39),
      ],
    ),
    Food(
      name: "Lemonade",
      description: "Freshly squeezed lemonade with a hint of mint.",
      imagePath: "lib/images/drinks/drinks2.jpg",
      price: 1.29,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra mint", price: 0.49),
        Addon(name: "Ice", price: 0.19),
        Addon(name: "Lemon slice", price: 0.29),
      ],
    ),
    Food(
      name: "Iced Coffee",
      description: "Cold brew coffee served over ice with a dash of milk.",
      imagePath: "lib/images/drinks/drinks3.jpg",
      price: 1.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra shot", price: 0.99),
        Addon(name: "Vanilla syrup", price: 0.49),
        Addon(name: "Whipped cream", price: 0.99),
      ],
    ),
    Food(
      name: "Smoothie",
      description: "A blend of fresh fruits and yogurt for a healthy treat.",
      imagePath: "lib/images/drinks/drinks4.jpg",
      price: 2.49,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Protein powder", price: 0.99),
        Addon(name: "Chia seeds", price: 0.79),
        Addon(name: "Honey", price: 0.49),
      ],
    ),
    Food(
      name: "Green Tea",
      description: "Refreshing green tea served hot or iced.",
      imagePath: "lib/images/drinks/drinks5.jpg",
      price: 1.49,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Lemon slice", price: 0.29),
        Addon(name: "Honey", price: 0.49),
        Addon(name: "Mint", price: 0.49),
      ],
    ),

    // Salads
    Food(
      name: "Caesar Salad",
      description:
          "Crisp romaine lettuce, croutons, and parmesan cheese with Caesar dressing.",
      imagePath: "lib/images/salads/salads1.jpg",
      price: 3.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled chicken", price: 2.49),
        Addon(name: "Bacon bits", price: 1.49),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Greek Salad",
      description:
          "Tomatoes, cucumbers, onions, olives, and feta cheese with olive oil dressing.",
      imagePath: "lib/images/salads/salads2.jpg",
      price: 3.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra feta", price: 1.49),
        Addon(name: "Grilled chicken", price: 2.49),
        Addon(name: "Pita bread", price: 1.29),
      ],
    ),
    Food(
      name: "Garden Salad",
      description:
          "Mixed greens, cherry tomatoes, cucumbers, and carrots with balsamic vinaigrette.",
      imagePath: "lib/images/salads/salads3.jpg",
      price: 2.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled chicken", price: 2.49),
        Addon(name: "Croutons", price: 0.99),
        Addon(name: "Cheese", price: 1.29),
      ],
    ),
    Food(
      name: "Quinoa Salad",
      description:
          "Quinoa with roasted vegetables, chickpeas, and a lemon-tahini dressing.",
      imagePath: "lib/images/salads/salads4.jpg",
      price: 4.29,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled chicken", price: 2.49),
        Addon(name: "Avocado", price: 2.99),
        Addon(name: "Feta cheese", price: 1.49),
      ],
    ),
    Food(
      name: "Fruit Salad",
      description: "A mix of seasonal fruits with a honey-lime dressing.",
      imagePath: "lib/images/salads/salads5.jpg",
      price: 3.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Greek yogurt", price: 1.49),
        Addon(name: "Chia seeds", price: 0.79),
        Addon(name: "Honey drizzle", price: 0.49),
      ],
    ),

    // Sides
    Food(
      name: "French Fries",
      description: "Crispy golden fries served with ketchup.",
      imagePath: "lib/images/sides/sides1.jpg",
      price: 1.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese sauce", price: 0.99),
        Addon(name: "Bacon bits", price: 1.49),
        Addon(name: "Chili", price: 1.99),
      ],
    ),
    Food(
      name: "Onion Rings",
      description: "Crispy fried onion rings with a side of ranch dip.",
      imagePath: "lib/images/sides/sides2.jpg",
      price: 1.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra ranch", price: 0.49),
        Addon(name: "BBQ sauce", price: 0.49),
        Addon(name: "Cheese sauce", price: 0.99),
      ],
    ),
    Food(
      name: "Mozzarella Sticks",
      description: "Fried mozzarella sticks served with marinara sauce.",
      imagePath: "lib/images/sides/sides3.jpg",
      price: 2.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra marinara", price: 0.49),
        Addon(name: "Ranch dip", price: 0.49),
        Addon(name: "Buffalo sauce", price: 0.49),
      ],
    ),
    Food(
      name: "Coleslaw",
      description: "Creamy coleslaw with shredded cabbage and carrots.",
      imagePath: "lib/images/sides/sides4.jpg",
      price: 1.29,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra dressing", price: 0.49),
        Addon(name: "Pineapple chunks", price: 0.79),
        Addon(name: "Raisins", price: 0.69),
      ],
    ),
    Food(
      name: "Mashed Potatoes",
      description: "Creamy mashed potatoes with a side of gravy.",
      imagePath: "lib/images/sides/sides5.jpg",
      price: 1.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra gravy", price: 0.79),
        Addon(name: "Cheese", price: 0.99),
        Addon(name: "Bacon bits", price: 1.49),
      ],
    ),
  ];

  //user cart
  final List<CartItem> _cart = [];

  //delivery address
  String _deliveryAddress = '123, Sector-X1, Gurgaon';

  //getters
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;
  //operations

  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //see if there is a cart item already with the same food and addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if food item are same
      bool isSameFood = item.food == food;

      //check if addons are same
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    //item exists
    if (cartItem != null) {
      cartItem.quantity++;
    }
    //otherwise new item
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //get total cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //total items of cart
  int getTotalCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //update address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }
  //helpers

  //genreate receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here is your receipt");
    receipt.writeln();

    //date
    String formattedDate =
        DateFormat('yy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------------------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${cartItem.food.price}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt
            .writeln("    Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("--------");
    receipt.writeln();
    receipt.writeln('Total Items: ${getTotalCount()}');
    receipt.writeln('Total Price: ${_formatPrice(getTotalPrice())}');

    return receipt.toString();
  }

  //format double values into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  //format list of addons into string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(" ");
  }

  //
}
