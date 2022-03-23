import 'package:flutter/material.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/products_overview_screen.dart';
import 'package:shop_app/providers/products.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // final ThemeData theme = ThemeData();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(//we use multiprovider to use multiple providers
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        )
      ],
      // now all the child widgets can set up listeners to the instance of this class
      //we wont rebuild the whole material app but only the widgets which are listening to it i.e. here productoverview and product detail
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
                secondary: Colors.white,
                primary: Colors.amber,
              ),
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
        },
      ),
    );
  }
}
