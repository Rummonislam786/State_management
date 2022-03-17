import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/models/product_model.dart';
import 'package:state_management/provider/cart_provider.dart';
import 'package:state_management/screens/product_details.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(
      context,
    );
    final cart = Provider.of<CartProvider>(
      context,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailsScreen.routeName,
                arguments: product.id);
          },
          child: Image.network(
            product.imageUrl!,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black,
          leading: Consumer<Product>(
            builder: (context, ref, child) => IconButton(
              onPressed: () {
                product.toggleFavoriteStatus();
              },
              color: Colors.amber,
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              cart.addItem(
                  product.id, product.price, product.title, product.imageUrl);
            },
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
