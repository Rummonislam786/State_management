import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:state_management/models/cart_model.dart';
import 'package:state_management/provider/cart_provider.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {Key? key,
      required this.id,
      required this.productId,
      required this.price,
      required this.quantity,
      required this.title,
      required this.imageurl})
      : super(key: key);
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<CartProvider>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Image.network(imageurl),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${(price * quantity)}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
