import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/screens/home_screens.dart';
import 'package:shopapp/state/productState.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductState(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreens.routeName: (ctx) => HomeScreens(),
        },
      ),
    );
  }
}
