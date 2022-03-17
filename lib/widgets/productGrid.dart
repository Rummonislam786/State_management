import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/models/product_model.dart';
import 'package:state_management/provider/product_provider.dart';
import 'package:state_management/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({Key? key, required this.showFavs}) : super(key: key);
  final bool showFavs;

  @override
  Widget build(BuildContext context) {
    final productsdata = Provider.of<Products>(context);
    final List<Product> products;
    if (showFavs) {
      products = productsdata.favoriteItems;
    } else {
      products = productsdata.items;
    }
    return GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 30),
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
              value: products[index],
              child: ProductItem(),
            ));
  }
}
