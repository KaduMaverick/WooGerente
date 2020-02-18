import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:woogerente/store/login.dart';
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: TextStyle(color: Color(0xff9A9A9A),fontFamily: 'Roboto-Medium', fontWeight: FontWeight.w300),
        decoration: InputDecoration(
          border: UnderlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)
            
          ),
          enabledBorder: UnderlineInputBorder(borderSide:  BorderSide(color: Color(0xff99F0BF), width: 3),),
          labelText: null,
          focusedBorder: UnderlineInputBorder(borderSide:  BorderSide(color: Color(0xff99F0BF), width: 3),),
          errorBorder: UnderlineInputBorder(borderSide:  BorderSide(color: Color(0xffFF5A79), width: 3),),
          focusedErrorBorder: UnderlineInputBorder(borderSide:  BorderSide(color: Color(0xffFF5A79), width: 3),),
          errorText: errorText == null ? null : errorText(),
          icon: Icon(Icons.lock, color: Colors.black,)
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final login = Provider.of<Login>(context);

    // return Padding(
    //   padding: const EdgeInsets.all(10.0),
    //   child: SingleChildScrollView(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         Image.asset(
    //           'assets/img/woogerente.png',
    //           height: 200,
    //           width: 200,
    //         ),
    //         SizedBox(height: 50),
    //         Observer(builder: (_) {
    //           return _textField(
    //               errorText: login.validateEndPoint,
    //               labelText: 'Digite o seu website',
    //               onChanged: login.changeEndPoint);
    //         }),
    //         SizedBox(height: 20),
    //         Observer(builder: (_) {
    //           return _textField(
    //               errorText: login.validateUser,
    //               labelText: 'Digite seu usuario woocommerce',
    //               onChanged: login.changeUser);
    //         }),
    //         SizedBox(height: 20),
    //         Observer(builder: (_) {
    //           return _textField(
    //               errorText: login.validateChaveApi,
    //               labelText: 'Digite sua Chave API',
    //               onChanged: login.changeChaveApi);
    //         }),
    //         SizedBox(height: 20),
    //         FlatButton(
    //           color: Colors.blue,
    //           textColor: Colors.white,
    //           disabledColor: Colors.grey,
    //           disabledTextColor: Colors.black,
    //           padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    //           splashColor: Colors.blueAccent,
    //           onPressed:
    //           (){


    //         //     Navigator.push(
    //         //     context,
    //         //   MaterialPageRoute(builder: (context) => DashboardScreen()),
    //         // );
    //           }
    //           ,
    //           child: Text('Entrar'),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    return Stack(
      children: <Widget>[
        Container(
          height: 300,
          child: RotatedBox(
           quarterTurns: 2,
            child: WaveWidget(config: CustomConfig(
              gradients:[
            [Color(0xffA66D9B), Color(0x70A66D9B)],
            [Color(0xff58D4B9), Color(0x8058D4B9)],],
            durations: [19440, 10800],
            heightPercentages: [0.20,  0.25],
            blur: MaskFilter.blur(BlurStyle.solid, 10),
            gradientBegin: Alignment.bottomLeft,
            gradientEnd: Alignment.topRight,
            ), 
            waveAmplitude: 0,
            size: Size(
              double.infinity,
              double.infinity
            ),
            ),
          ),
        ),
        SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/img/woogerente.png',
              height: 200,
              width: 300,
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
      ],
    );
  }
}

//getProducts(login.apiEndPoint, login.user, login.chaveApi);
