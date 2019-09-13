import 'package:flutter/material.dart';
import 'package:projeto_swellit/screens/order_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(42, 33, 119, 1),
        accentColor: Color.fromRGBO(97, 221, 220, 1),
        hintColor: Color.fromRGBO(96, 63, 229, 1),
        backgroundColor: Colors.grey[200]
      ),
      debugShowCheckedModeBanner: false,
      home: OrderScreen(),

    );
  }
}
