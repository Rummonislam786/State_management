// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:state_management/provider/cart_provider.dart';
import 'package:state_management/provider/order_provider.dart';
import 'package:state_management/provider/product_provider.dart';
import 'package:state_management/screens/cart_screen.dart';
import 'package:state_management/screens/orders_screen.dart';

import 'package:path/path.dart';
import 'package:state_management/screens/overview_page.dart';
import 'package:state_management/screens/product_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());

  final database = openDatabase(join(await getDatabasesPath(), 'orderdb.db'));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => Products()),
        ChangeNotifierProvider(create: (_) => Orders()),
        // ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Some App',
        theme: ThemeData(primarySwatch: Colors.purple, fontFamily: 'lato'),
        home: MyHomePage(
          title: 'Flutter app',
        ),
        routes: {
          ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          OrdersScreen.routeName: (context) => OrdersScreen(),
        },
      ),
    );
  }
}
