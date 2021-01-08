import 'package:flutter/cupertino.dart';
import 'package:shopapp/models/cart.dart';
import 'package:shopapp/models/order.dart';

class OrderState with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  void addOrder(double total, List<Cart> carts) {
    _orders.insert(
      0,
      Order(
        id: DateTime.now().toString(),
        total: total,
        carts: carts,
        datetime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
