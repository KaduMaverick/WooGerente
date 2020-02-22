import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:woogerente/store/login.dart';

//  * teste
// ? isso realmente enecessario
// ! opa,isso nao deveria estar aqui
// TODO: that it has a state


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
      String Function() errorText,
      iconAnimation}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: MediaQuery.of(context).size.width ,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: TextField(
                    controller: controller,
                    onChanged: onChanged,
                    style: TextStyle(color: Color(0xff9A9A9A),fontFamily: 'Roboto-Medium', fontWeight: FontWeight.w300),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 2),
                      filled: true,
                      fillColor: Colors.transparent,
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)
                      ),
                      enabledBorder: UnderlineInputBorder(borderSide:  BorderSide(color: Color(0xff99F0BF), width: 2),),
                      labelText: 'Site',
                      focusedBorder: UnderlineInputBorder(borderSide:  BorderSide(color: Color(0xff99F0BF), width: 2),),
                      errorBorder: UnderlineInputBorder(borderSide:  BorderSide(color: Color(0xffFF5A79), width: 2),),
                      focusedErrorBorder: UnderlineInputBorder(borderSide:  BorderSide(color: Color(0xffFF5A79), width: 3),),
                      errorText: errorText == null ? null : errorText(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 18,
            child: Container(
              height: 35,
              width: 35,
              child: FlareActor(
              "assets/cadeado-icon.flr", animation: iconAnimation,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final login = Provider.of<Login>(context);

    return Stack(
      children: <Widget>[
        Container(
          height: 200,
          child: RotatedBox(
           quarterTurns: 2,
            child: WaveWidget(
              config: CustomConfig(
              gradients:[
                        [Color(0xffA66D9B), Color(0x70A66D9B)],
                        [Color(0xff58D4B9), Color(0x8058D4B9)],],
            durations: [19440, 10800],
            heightPercentages: [0.16,  0.25],
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
                  iconAnimation: login.animationTrigger() ? "lock" : "unlock",
                  onChanged: login.changeEndPoint);
            }),
            SizedBox(height: 10),
            Observer(builder: (_) {
              return _textField(
                  errorText: login.validateUser,
                  labelText: 'Digite seu usuario woocommerce',
                  onChanged: login.changeUser);
            }),
            SizedBox(height: 10),
            Observer(builder: (_) {
              return _textField(
                  errorText: login.validateChaveApi,
                  labelText: 'Digite sua Chave API',
                  onChanged: login.changeChaveApi);
            }),
            SizedBox(height: 10),
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

class CustomTextField extends StatefulWidget {
  CustomTextField({this.labelText, this.controller,this.onChanged, this.errorText});

  final String labelText;
  final TextEditingController controller;
  final Function onChanged;
  final Function errorText;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Icon(Icons.plus_one, color: Colors.black,size: 40),
        Container(
            width: MediaQuery.of(context).size.width ,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FractionallySizedBox(
                widthFactor: 0.8,
                  child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged,
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
          errorText: widget.errorText == null ? null : widget.errorText(),
        ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

//getProducts(login.apiEndPoint, login.user, login.chaveApi);
