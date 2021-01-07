import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/state/productState.dart';
import 'package:shopapp/widgets/singleProduct.dart';

class AllProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductState>(context, listen: false).product;
    return GridView.builder(
      padding: const EdgeInsets.all(7),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: product.length,
      itemBuilder: (ctx, i) => SingleProduct(
        id: product[i].id,
        title: product[i].title,
        price: product[i].price,
        imageUrl: product[i].imageUrl,
      ),
    );
  }
}
