import 'package:state_management/models/cart_model.dart';

class OrderItem {
  final String id;
  final double? amount;
  final List<CartItems>? products;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    this.amount,
    this.products,
    required this.dateTime,
  });
}
