//2 ways to go to new screen
//use navigator push and material page route on the fly and the widget
//or push a named route

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  // const ProductDetailScreen({ Key? key }) : super(key: key);
  // final String title;
  // final num price;
  // ProductDetailScreen(this.title,this.price);
  //so we extract the above values using named routing arguments

  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProducts = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    //this is a listener on the products cass which rebuilds this widget upon changing of the product class
    //but currently we are not listening but uing only once to get our id
    //also instead of passing all argumens we only use the id and
    //then get all  the products accordingly

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProducts.title),
      ),
    );
  }
}
