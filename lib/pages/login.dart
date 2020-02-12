import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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