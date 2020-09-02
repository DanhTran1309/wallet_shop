import 'package:flutter/material.dart';
import 'package:wallet_shop/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallet Shop',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffF1F1F1),
        accentColor: Color(0xff11C211),
        fontFamily: 'Roboto'
      ),
      home: NavScreen(),
    );
  }
}