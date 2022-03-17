import 'package:flutter/cupertino.dart';
import 'package:state_management/models/cart_model.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItems> _items = {};

  Map<String, CartItems> get items => _items;

  int get itemcount => _items.length;

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartitem) {
      total += cartitem.price * cartitem.quantity;
    });
    return total;
  }

  void addItem(
    String? productId,
    double? price,
    String? title,
    String? imageurl,
  ) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId!,
          (existingCartItem) => CartItems(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price,
              imageurl: existingCartItem.imageurl));
    } else {
      _items.putIfAbsent(
        productId!,
        () => CartItems(
            id: DateTime.now().toString(),
            title: title!,
            quantity: 1,
            price: price!,
            imageurl: imageurl!),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
