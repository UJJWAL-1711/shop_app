import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final num price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items;
  //to map every cart item to id of the product

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String productId, num price, String title) {
    if (items.containsKey(productId)) {
      //change quantity
      _items.update(
        productId,
        (existingCartItem) => CartItem(
            //update returns existingcarditem
            id: existingCartItem.id,
            title: title,
            quantity: existingCartItem.quantity + 1,
            price: price),
      );
      notifyListeners();
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          quantity: 1,
          price: price,
        ),
      );
      notifyListeners();
    }
  }
}
