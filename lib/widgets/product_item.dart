//here we return a gridtile which is further customised

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // const ProductItem({Key? key}) : super(key: key);
  // final String id;
  // final String title;
  // final String imageUrl;
//here if i want to also show pass the price to the details
//wiget i cant as i dont have it
//so we can pass it in the product item widget in the product overview screen
//and accept another field in the constructor here
//but in this approach here we pass price but don not use it in this particular widget but in the
// kind of passed down only
// so instead we pass it down using named routes
  // ProductItem({required this.id, required this.title, required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    Product currentItem = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: currentItem.id,
            );
          },
          child: Image.network(
            currentItem.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: Consumer<Product>(
            builder: (context, currentItem, child) => IconButton(
              onPressed: () => currentItem.toggleFavoriteStatus(),
              icon: Icon(
                currentItem.isFavourite
                    ? Icons.favorite
                    : Icons.favorite_border,
                //instead of using a different color in color operator using ternaty operator we use
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          title: Text(
            currentItem.title,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          trailing: IconButton(
            onPressed: () {
              cart.addItem(
                  currentItem.id, currentItem.price, currentItem.title);
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
