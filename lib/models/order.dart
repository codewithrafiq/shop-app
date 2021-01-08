import 'package:flutter/cupertino.dart';
import 'package:shopapp/models/cart.dart';

class Order {
  final String id;
  final double total;
  final List<Cart> carts;
  final DateTime datetime;

  Order({
    @required this.id,
    @required this.total,
    @required this.carts,
    @required this.datetime,
  });
}
