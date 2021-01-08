import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/models/Product.dart';
import 'package:shopapp/state/productState.dart';

class AddProductScreens extends StatefulWidget {
  static const routeName = '/add-product-screens';
  @override
  _AddProductScreensState createState() => _AddProductScreensState();
}

class _AddProductScreensState extends State<AddProductScreens> {
  final _form = GlobalKey<FormState>();

  String title = '';
  String description = '';
  String price = '';
  String imageUrl = '';
  bool didchange = true;
  var productId;

  void _submitForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();

    Product newProduct = Product(
      id: DateTime.now().toString(),
      title: title,
      description: description,
      price: double.parse(price),
      imageUrl: imageUrl,
    );
    if (productId == null) {
      Provider.of<ProductState>(context, listen: false).addProduct(newProduct);
      Navigator.of(context).pop();
    } else {
      Provider.of<ProductState>(context, listen: false)
          .editProduct(productId, newProduct);
      Navigator.of(context).pop();
    }
  }

  @override
  void didChangeDependencies() {
    if (didchange) {
      try {
        productId = ModalRoute.of(context).settings.arguments;
        Product product = Provider.of<ProductState>(context, listen: false)
            .singleProduct(productId);
        title = product.title;
        description = product.description;
        price = product.price.toString();
        imageUrl = product.imageUrl;
      } catch (_) {}
    }
    didchange = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  initialValue: title,
                  decoration: InputDecoration(
                    hintText: "Title",
                  ),
                  textInputAction: TextInputAction.next,
                  onSaved: (v) {
                    title = v;
                  },
                  validator: (v) {
                    if (v.isEmpty) {
                      return 'Enter a title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: description,
                  decoration: InputDecoration(
                    hintText: "Description",
                  ),
                  textInputAction: TextInputAction.next,
                  onSaved: (v) {
                    description = v;
                  },
                  validator: (v) {
                    if (v.isEmpty) {
                      return 'Enter Some Text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: price,
                  decoration: InputDecoration(
                    hintText: "Price",
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onSaved: (v) {
                    price = v;
                  },
                  validator: (v) {
                    if (v.isEmpty) {
                      return 'Enter a Price!';
                    }
                    if (double.tryParse(v) == null) {
                      return 'Enter a number !';
                    }
                    if (double.parse(v) <= 0) {
                      return 'Enter number Grater thene 0';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: imageUrl,
                  decoration: InputDecoration(
                    hintText: "Image Url",
                  ),
                  textInputAction: TextInputAction.done,
                  onSaved: (v) {
                    imageUrl = v;
                  },
                  validator: (v) {
                    if (v.isEmpty) {
                      return 'Enter a Image Url';
                    }
                    if ((!v.startsWith('http')) || (!v.startsWith('https'))) {
                      return 'Enter a Valid Url';
                    }
                    return null;
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    _submitForm();
                  },
                  child: Text(
                    productId != null ? 'Edit Product' : 'Add Product',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.green,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
