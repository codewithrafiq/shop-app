import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/screens/add_product_screens.dart';
import 'package:shopapp/state/productState.dart';
import 'package:shopapp/widgets/appDrower.dart';
import 'package:shopapp/widgets/single_user_product.dart';

class UserProductScreens extends StatelessWidget {
  static const routeName = '/user-product-screens';
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductState>(context);
    return Scaffold(
      drawer: AppDrower(),
      appBar: AppBar(
        title: Text("User"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddProductScreens.routeName);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productData.product.length,
        itemBuilder: (ctx, i) {
          var productObj = productData.product[i];
          return SingleUserProduct(productObj);
        },
      ),
    );
  }
}
