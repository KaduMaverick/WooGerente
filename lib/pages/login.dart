import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
//import 'package:woogerente/const/const.dart';
import 'package:woogerente/services/request.dart';
import 'dashboard_screen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void initState() {
    super.initState();
  }

  void getProducts(url, username, key) async {
    Products products = Products(url: url, username: username, password: key);
    var productsData = products.getData();
    print(productsData);
  }

  bool validateAPI(endpoint) {
    RegExp urlPattern = new RegExp("(http:\/\/|https:\/\/)");
    return urlPattern.hasMatch(endpoint);
  }

  final websiteURL = TextEditingController();
  final websiteUSER = TextEditingController();
  final websiteAPIKEY = TextEditingController();

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
                controller: websiteURL,
                onChanged: (value) {
                  print(value);
                },
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Digite o seu site'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: websiteUSER,
                onChanged: (value) {
                  print(value);
                },
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Digite seu usuario woocommerce'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: websiteAPIKEY,
                onChanged: (value) {
                  print(value);
                },
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Chave API'),
              ),
              SizedBox(height: 20),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  String apiUrl = websiteURL.text;
                  String apiUser = websiteUSER.text;
                  String apiKey = websiteAPIKEY.text;
                  if (apiUrl.isEmpty || apiUser.isEmpty || apiKey.isEmpty) {
                    print('verifique os campos');
                  } else if (!validateAPI(apiUrl)) {
                    print('deu ruim');
//                    getProducts(apiUrl, apiUser, apiKey);
                  } else if (apiUser.length != 43) {
                    print('apiUser deu ruim');
                  } else if (apiKey.length != 43) {
                    print('apiKey deu ruim');
                  } else {
                    print('deu bom');
                    getProducts(apiUrl, apiUser, apiKey);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardScreen(),
                      ),
                    );
                  }
                },
                child: Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
