import 'package:flutter/material.dart';
import 'package:woogerente/pages/login.dart';


void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WOOCOMMERCE GERENTE',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Login(),
      )
    );
}
}





