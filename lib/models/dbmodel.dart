import 'package:state_management/models/product_model.dart';
import 'package:state_management/widgets/cart_item.dart';
import 'dart:convert';
class Orderdata {
  final String dbId;
  final double dbamount;
  final List<CartItem> dbproduct;
  final DateTime dbdatetime;
  
  Orderdata(
      {required this.dbId,
      required this.dbamount,
      required this.dbdatetime,
      required this.dbproduct});

  Map<String, dynamic> toMap() {
    return {
      'id': dbId,
      'amount': dbamount,
      'datetime': dbdatetime.toString(),
      'product': dbproduct,
    };
  }
}
