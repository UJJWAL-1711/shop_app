//model of a product in our app a kind of layout
import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final num price;
  final String imageUrl;
  bool isFavourite;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      this.isFavourite = false, //default
      //initialization of  var is given in side of the
      //constructor not the var declaration
      required this.imageUrl,
      required this.price});

  void toggleFavoriteStatus() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}

//by mentioning menthods here we are separating the logic of our ap and the ui of our app
