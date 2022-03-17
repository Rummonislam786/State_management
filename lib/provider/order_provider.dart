import 'package:flutter/cupertino.dart';
import 'package:state_management/models/cart_model.dart';
import 'package:state_management/models/order_model.dart';

import '../models/order_model.dart';

class Orders with ChangeNotifier {
  final List<OrderItem> _orders = [];

  List<OrderItem> get orders => _orders;

  void addOrder(List<CartItems> cartProducts, double total) {
    _orders.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            amount: total,
            products: cartProducts,
            dateTime: DateTime.now()));
  }
}
