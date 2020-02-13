import 'package:flutter/material.dart';
import 'package:woogerente/pages/login.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'const/const.dart';
import 'pages/productsScreen.dart';
import 'services/request.dart';



void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

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



//  void initState() {
//     super.initState();
//     getLocationData();
//   }

//   void getLocationData() async {
//     Location location = Location();
//     await location.getCurrentLocation();
//     latitude = location.latitude;
//     longitude = location.longitude;

//     NetworkHelper networkHelper = NetworkHelper(
//         'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey');

//     var weatherData = await networkHelper.getData();

//     Navigator.push(context, MaterialPageRoute(builder: (context) {
//       return LocationScreen(locationWeather: weatherData);
//     }));
//   }

