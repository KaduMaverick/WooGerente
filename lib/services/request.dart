import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:http/io_client.dart';

class Products {

  Products({this.url, this.username, this.password});

  final String url;
  final String username;
  final String password;

  // Future accessAPI() async {
  //   HttpClient client = new HttpClient()..badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
  //   var ioClient = new IOClient(client);
  //   String basicAuth =
  //       'Basic ' + base64Encode(utf8.encode('$username:$password'));
  //   print(basicAuth);
  //   http.Response response = await ioClient.get(url,
  //       headers: <String, String>{'authorization': basicAuth});
  //    return response.statusCode;
  // }

  Future getData() async {
//    HttpClient client = new HttpClient()..badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
//    var ioClient = new IOClient(client);
    String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
      print('entrei');
    http.Response response = await http.get(url,
      headers: <String, String>{'authorization': basicAuth});
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('entrei');
      String data = response.body;
      var decodedData = jsonDecode(data);
      print(decodedData);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}

//  Future requisicao () async {

//   String username = 'ck_6775e5536ea6249efa58df159ba818e9b46b6bee';
//   String password = 'cs_9e79b67da60337e6f13bdd453560a2a1b6ed4eea';
//   String basicAuth =
//       'Basic ' + base64Encode(utf8.encode('$username:$password'));
//   print(basicAuth);

//   Response r = await get('https://apiwoocommerce.000webhostapp.com/wp-json/wc/v3/products',
//       headers: <String, String>{'authorization': basicAuth});
//   print(r.statusCode);
//   print(r.body);
// }
  
