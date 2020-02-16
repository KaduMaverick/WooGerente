import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'dart:convert';
import 'package:http/http.dart';
//import 'package:woogerente/const/const.dart';
import 'package:woogerente/services/request.dart';
import 'package:woogerente/store/login.dart';
import 'dashboard_screen.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Login login = Login();

  void initState() {
    super.initState();
  }

 
  

  _textField(
      {String labelText,
      TextEditingController controller,
      onChanged,
      String Function() errorText}) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText(),
      ),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    final login = Provider.of<Login>(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/img/woogerente.png',
                height: 200,
                width: 200,
              ),
              SizedBox(height: 50),
              Observer(builder: (_) {
                return _textField(
                    errorText: login.validateEndPoint,
                    labelText: 'Digite o seu website',
                    onChanged: login.changeEndPoint);
              }),
              SizedBox(height: 20),
              Observer(builder: (_) {
                return _textField(
                    errorText: login.validateUser,
                    labelText: 'Digite seu usuario woocommerce',
                    onChanged: login.changeUser);
              }),
              SizedBox(height: 20),
              Observer(builder: (_) {
                return _textField(
                    errorText: login.validateChaveApi,
                    labelText: 'Digite sua Chave API',
                    onChanged: login.changeChaveApi);
              }),
              SizedBox(height: 20),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                splashColor: Colors.blueAccent,
                onPressed:
                (){


              //     Navigator.push(
              //     context,
              //   MaterialPageRoute(builder: (context) => DashboardScreen()),
              // );
                }
                ,
                child: Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//getProducts(login.apiEndPoint, login.user, login.chaveApi);
