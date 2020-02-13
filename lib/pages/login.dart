import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:woogerente/const/const.dart';
import 'package:woogerente/services/request.dart';
import 'productsScreen.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}


class _LoginState extends State<Login> {

void initState() {
  super.initState();
  getProducts();
  
}

void getProducts() async {
  Products products = Products(url: url, username: username, password: key);
  var productsData = products.getData();
  print(productsData);
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return ProductsScreen(productsData: productsData);
  }));
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
                      child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/img/hiro.png',
                  height: 200,
                  width: 200,
                ),
                SizedBox(height: 50),            
                TextField(
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Digite o seu site'
                  ),
                ),
                SizedBox(height: 20),
                  TextField(
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Chave API'
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}