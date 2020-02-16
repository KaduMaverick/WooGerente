import 'package:flutter/material.dart';
import 'package:woogerente/services/request.dart';
import 'package:provider/provider.dart';
import 'package:woogerente/store/login.dart';

class DashboardScreen extends StatefulWidget {

  DashboardScreen();  

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  
  Future getProducts(code, url, username, key) async {
    var productsData = code.getData();
    print(productsData);
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final login = Provider.of<Login>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text('Dashboard Screen'),
      ),
      body: FutureBuilder<dynamic>(
                  future: getProducts(products,login.apiEndPoint, login.user, login.chaveApi),
                  builder: (context, snapshot) {
                     print('entrei');
                     print('login: ' + login.apiEndPoint);
                     print('user: ' + login.user);
                     print('chave: ' + login.chaveApi);
                    switch (snapshot.connectionState) {
                  case ConnectionState.none:
                      print('none');
                    return Center() ;
                  case ConnectionState.waiting:
                    print('waiting');
                    return Center() ;
                    case ConnectionState.done:
                    print('done');
                    return Center() ;
                  default:
                     print('default');
                    return Center() ;
                      }
                    }
                  )
    );
  }
}
