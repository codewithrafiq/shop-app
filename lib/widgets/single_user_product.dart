import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/models/Product.dart';
import 'package:shopapp/screens/add_product_screens.dart';
import 'package:shopapp/state/productState.dart';

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
              onPressed: () {
                Navigator.of(context).pushNamed(AddProductScreens.routeName,
                    arguments: product.id);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Provider.of<ProductState>(context, listen: false)
                    .delateProduct(product.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
