import 'package:flutter/material.dart';

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
    return Card(
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
    );
  }
}
