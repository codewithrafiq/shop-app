import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/screens/cart_screens.dart';
import 'package:shopapp/state/cartState.dart';

class SingleCartItem extends StatelessWidget {
  final String id;
  final String title;
  final int quantity;
  final double price;

  const SingleCartItem({
    Key key,
    this.id,
    this.title,
    this.quantity,
    this.price,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.startToEnd,
      background: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 45,
        ),
        alignment: Alignment.centerLeft,
      ),
      onDismissed: (dir) {
        Provider.of<CartState>(context, listen: false).removeCard(id);
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text("Price: \$$price"),
              Text("Quantity : $quantity X"),
            ],
          ),
        ),
      ),
    );
  }
}
