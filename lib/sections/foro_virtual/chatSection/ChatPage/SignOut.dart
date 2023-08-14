import 'package:agenda_informatico/sections/foro_virtual/chatSection/ChatPage/ForoGeneral.dart';
import 'package:animate_do/animate_do.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../firebaseHelper.dart';

Service service = Service();
final auth = FirebaseAuth.instance;
final almacenarMensaje = FirebaseFirestore.instance;
TextEditingController mensaje = TextEditingController();


class SignOutPage extends StatefulWidget {
  @override
  _SignOutPageState createState() => _SignOutPageState();
}

class _SignOutPageState extends State<SignOutPage> {
  
  getCurrentUser() async {

    final user = auth.currentUser;
    if(user != null){
      loginUser = user;
    }

  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      extendBodyBehindAppBar: true,

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/purple_background.gif",
              ),
              fit: BoxFit.cover),
        ),
        child: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            JelloIn(
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/chat_loading.gif",
                      ),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            BounceInDown(
              child: Container(
                height: 50,
                child: _boton(
                    title: "Confirmar cierre de sesion",
                    onPressed: () async {
                      service.signOut(context);
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.remove("email");
                    }),
              ),
            ),
          ],
        )),
      ),
    );
    
  }

  _boton({String title, VoidCallback onPressed}){

    return BouncingWidget(
      duration: Duration(milliseconds: 100),
      scaleFactor: 1.5,
      onPressed: onPressed,
          child: Container(
        decoration: BoxDecoration(
          color: Colors.purple,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 0.2,
              blurRadius: 5.0,
            ),
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
         
        ),
        padding: EdgeInsets.all(10),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        
      ),
    );
  }
}



