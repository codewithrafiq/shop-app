import 'package:flutter/material.dart';
import 'package:shopapp/models/Product.dart';

class SingleUserProduct extends StatelessWidget {
  final Product product;
  SingleUserProduct(this.product);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.title,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text("\$${product.price}"),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
