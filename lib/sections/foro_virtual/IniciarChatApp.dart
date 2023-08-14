import 'package:agenda_informatico/sections/foro_virtual/chatSection/ChatPage/ChatPage.dart';
import 'package:agenda_informatico/sections/noticias_tecnologia/helper/widgets.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'chatSection/LoginPage.dart';

import 'package:animate_do/animate_do.dart';

class IniciarChatApp extends StatefulWidget {

  @override
  _IniciarChatAppState createState() => _IniciarChatAppState();
}

class _IniciarChatAppState extends State<IniciarChatApp> {
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      appBar: MyAppBar("Agen", "Messages"),
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
                            
                            width:300,
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
                          child: _boton(
                              title: "Abrir AgenMessages",
                              onPressed: () async {
                                SharedPreferences pref =
                                    await SharedPreferences.getInstance();
                                var email = pref.get("email");
                                if (email == null) {
                                  Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (c, a1, a2) => LoginPage(),
                                      transitionsBuilder: (c, anim, a2, child) =>
                                          FadeTransition(opacity: anim, child: child),
                                      transitionDuration: Duration(milliseconds: 2000),
                                    ),
                                  );
                                } else {
                                  Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (c, a1, a2) => ChatPageScreen(),
                                      transitionsBuilder: (c, anim, a2, child) =>
                                          FadeTransition(opacity: anim, child: child),
                                      transitionDuration: Duration(milliseconds: 2000),
                                    ),
                                  );
                                }
                              }),
                        ),
                      
                      
                      ],)
                  )
                
                
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

