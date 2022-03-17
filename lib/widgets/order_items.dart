import 'package:flutter/material.dart';
import 'package:state_management/models/order_model.dart' as ord;
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class Orderitem extends StatefulWidget {
  const Orderitem({
    Key? key,
    this.order,
  }) : super(key: key);
  final ord.OrderItem? order;
  @override
  State<Orderitem> createState() => _OrderitemState();
}

class _OrderitemState extends State<Orderitem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ExpansionTile(
            title: Text(
              '\$${widget.order!.amount}',
            ),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.order!.dateTime),
            ),
            children: widget.order!.products!
                .map((e) => Row(
                      children: [
                        Text(e.title),
                        Text('${e.quantity}x \$${e.price}')
                      ],
                    ))
                .toList(),
          ),
          // ListTile(
          //   title: Text('\$${widget.order.amount}'),
          //   subtitle: Text(
          //       DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime)),
          //   trailing: IconButton(
          //     icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
          //     onPressed: () {
          //       setState(() {
          //         _expanded = !_expanded;
          //       });
          //     },
          //   ),
          // ),
          // _expanded
          //     ? Container(
          //         padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),

          //       )
          //     : SizedBox.shrink()
        ],
      ),
    );
  }
}
