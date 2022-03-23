//list of all products in our app
//here we are using gridview builder which takes in
//a grid delegate which controls layout i.e. the
//no. of elemenst in each row or column and spacing betwen them
//the item builder has the otehr function or widget to build each gid element
//a custom widget named product Item is created
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/badge.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/products_grid.dart';

enum FilterOptions {
  Favourites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    // final productsContainer = Provider.of<Products>(context, listen: false);
// we will not us eprovider but will make use of stateful widget as this is local state
    return Scaffold(
      appBar: AppBar(
        title: Text('All Products'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions seletedValue) {
              setState(() {
                if (seletedValue == FilterOptions.Favourites) {
                  // productsContainer.showFavorites();
                  _showOnlyFavorites = true;
                } else {
                  // productsContainer.showAll();
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('favs'),
                value: FilterOptions.Favourites,
              ),
              PopupMenuItem(
                child: Text('ShowAll'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch! ,
              value: cart.itemCount.toString(),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: const IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: null,
            ),
          )
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
      // body: ProductsGrid(loadedProducts: loadedProducts), it should not get
      //loaded products like this but with our provider
    );
  }
}
