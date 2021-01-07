import 'package:flutter/cupertino.dart';
import 'package:shopapp/models/cart.dart';

class CartState with ChangeNotifier {
  Map<String, Cart> _cart = {};

  Map<String, Cart> get cart {
    return {..._cart};
  }

  void addToCart(String id, double price, String title) {
    if (_cart.containsKey(id)) {
      _cart.update(
        id,
        (value) => Cart(
          id: value.id,
          price: value.price,
          quantity: value.quantity + 1,
          title: value.title,
        ),
      );
    } else {
      _cart.putIfAbsent(
        id,
        () => Cart(
          id: DateTime.now().toString(),
          price: price,
          quantity: 1,
          title: title,
        ),
      );
    }
    notifyListeners();
  }

  double get totalAmpunt {
    double total = 0;
    _cart.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }
}
