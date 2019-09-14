import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projeto_swellit/screens/new_order_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      title: 'Projeto Swellit',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(42, 33, 119, 1),
          accentColor: Color.fromRGBO(97, 221, 220, 1),
          hintColor: Color.fromRGBO(96, 63, 229, 1),
          backgroundColor: Colors.grey[200]),
      supportedLocales: [const Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false,
      home: NewOrderScreen(),
    );
  }
}
