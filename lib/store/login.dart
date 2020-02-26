import 'package:mobx/mobx.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
part 'login.g.dart';

class Login = _LoginBase with _$Login;

abstract class _LoginBase with Store {

  final storage = new FlutterSecureStorage();

  @observable
  String apiEndPoint;
  @action
  changeEndPoint(String value)=> apiEndPoint = value;

  String validateEndPoint (){
    bool validateAPI(endpoint) {
      RegExp urlPattern = new RegExp("(http:\/\/|https:\/\/)");
      return urlPattern.hasMatch(endpoint);
    }
    if(apiEndPoint == null || apiEndPoint.isEmpty ){
      return null;
    }else if (!validateAPI(apiEndPoint)){
      return 'Website invalido';
    }
  }

  bool animationTrigger (){
    bool validateAPI(endpoint) {
      RegExp urlPattern = new RegExp("(http:\/\/|https:\/\/)");
      return urlPattern.hasMatch(endpoint);
    }
    if(apiEndPoint == null || apiEndPoint.isEmpty ){
      return false;
    }else if (!validateAPI(apiEndPoint)){
      return true;
    }
  }

  @observable
  String user;
  @action
  changeUser(String value)=> user = value;

  String validateUser(){
    if (user == null || user.isEmpty){
      return null;
    }else if (user.length != 43){
      return 'Usuario invalido';
    }
  }

  @observable
  String chaveApi;
  @action
  changeChaveApi(String value)=> chaveApi = value;

  String validateChaveApi(){
    if(chaveApi == null || chaveApi.isEmpty){
      return null;
    }else if (chaveApi.length != 43){
      return 'chaveApi invalida';
    }
  }

  Future<bool> readStorageLogin()async{ 
      Map<String, String> allValues = await storage.readAll();
      if(allValues['loginAPI'] == null && allValues['loginUSER'] == null && allValues['loginChaveAPI'] == null){
        return false;
      }else{
        return true;
      }   
  }

  void saveLoginToStorage(){
    storage.write(key: 'loginAPI', value: apiEndPoint);
    storage.write(key: 'loginUSER', value: user);
    storage.write(key: 'loginChaveAPI', value: chaveApi);
  }
  
}