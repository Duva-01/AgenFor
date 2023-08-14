import 'dart:ui';

import 'package:agenda_informatico/sections/noticias_tecnologia/helper/widgets.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebaseHelper.dart';


class RegisterChatApp extends StatefulWidget {

  RegisterChatApp({Key key}) : super(key: key);

  @override
  _RegisterChatAppState createState() => _RegisterChatAppState();
}

class _RegisterChatAppState extends State<RegisterChatApp> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Service service = Service();

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
      appBar: MyAppBar("Register", "Page"),
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
                Text(
                  "Bienvenido a AgenMessages",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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

                      final almacenarContacto = FirebaseFirestore.instance;

                      service.createUser(
                          context, emailController.text, passwordController.text);

                      almacenarContacto.collection("Contactos").doc().set({
                            "usuario": emailController.text,
                            "nombre": pref.getString("nombre"),
                          });

                      almacenarContacto.collection("Perfiles").doc().set({
                            "usuario": emailController.text,
                            "nombre": pref.getString("nombre"),
                            "edad": pref.getInt('edad'),
                            "estudios": pref.getString('estudios'),
                            "estado": pref.getString('estado'),
                            "esChica": pref.getBool('esChica'),
                      });

                      pref.setString("email", emailController.text);

                    } else {
                      service.errorBox(
                          context, "Los campos no pueden estar vacios");
                    }
                  },
                  child: Text(
                    "Registrar",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
