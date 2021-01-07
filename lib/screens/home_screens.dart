import 'package:flutter/material.dart';
import 'package:shopapp/widgets/all_products.dart';

class HomeScreens extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: AllProducts(),
    );
  }
}
