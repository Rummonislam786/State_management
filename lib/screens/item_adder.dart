import 'package:flutter/material.dart';

class itemAdd extends StatelessWidget {
  itemAdd({Key? key}) : super(key: key);
  static const routeName = '/orders';

  TextEditingController idController = TextEditingController();
  TextEditingController productAddController = TextEditingController();
  TextEditingController pricingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adding product')),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Product Name",
              suffixIcon: Icon(Icons.abc),
            ),
            controller: idController,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Product Name",
              suffixIcon: Icon(Icons.abc),
            ),
            controller: productAddController,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Product pricing",
              suffixIcon: Icon(Icons.attach_money),
            ),
            controller: pricingController,
          ),
        ],
      ),
    );
  }
}
