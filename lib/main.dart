import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:woogerente/pages/dashboard_screen.dart';
import 'package:woogerente/pages/login_screen.dart';
import 'package:woogerente/services/request.dart';
import 'package:woogerente/store/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Login login = Login();
    return MultiProvider(
      providers: [
        Provider<Products>(create: (_) => Products(),),
        Provider<Login>(create: (_) => Login(),),
      ],
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WOOCOMMERCE GERENTE',
        home: Scaffold(
          backgroundColor: Colors.white,
          body: login.readStorageLogin() == false ? DashboardScreen() : LoginScreen(),
        )
      ),
    );
  }
}