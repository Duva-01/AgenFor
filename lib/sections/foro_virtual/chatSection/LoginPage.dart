import 'dart:ui';

import 'package:agenda_informatico/main.dart';
import 'package:agenda_informatico/sections/foro_virtual/chatSection/RegisterChatApp.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebaseHelper.dart';


class LoginPage extends StatefulWidget {

  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Service service = Service();

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          appBar: AppBar(

    iconTheme: IconThemeData(
          color: Colors.purple,
        ),

    title: Row(

      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
        Flexible(
          child: Text(
            "Login",
            style:
            TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
          ),
        ),
        Flexible(
          child: Text(
            "Page",
            style: TextStyle(color: Colors.purple[600], fontWeight: FontWeight.w600),
          )
        )
      ],
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    actions: [

      TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => HomeScreen(),
                  transitionsBuilder: (c, anim, a2, child) =>
                      FadeTransition(opacity: anim, child: child),
                  transitionDuration: Duration(milliseconds: 2000),
                ),
              );
            },
            child: Icon(Icons.arrow_back, color: Colors.purple,),
          ),
    ],
  ),

        body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/purple_background.gif",
              ),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: FadeInDown(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Inicia sesion en AgenMessages",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: "Correo electronico",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                        hintText: "Contraseña",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      service.loginUser(
                          context, emailController.text, passwordController.text);
                      pref.setString("email", emailController.text);
                    } else {
                      service.errorBox(
                          context, "Los campos no pueden estar vacios");
                    }
                  },
                  child: Text(
                    "Iniciar Sesion",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterChatApp()));
                  },
                  child: Text(
                    "No tengo cuenta",
                    style: TextStyle(
                      color: Colors.purple[200],
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
