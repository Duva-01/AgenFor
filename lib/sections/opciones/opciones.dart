import 'package:agenda_informatico/sections/opciones/intro.dart';
import 'package:agenda_informatico/sections/noticias_tecnologia/helper/widgets.dart';
import 'package:agenda_informatico/sections/opciones/privacy_policy.dart';
import 'package:agenda_informatico/sections/opciones/recomendacion.dart';
import 'package:animate_do/animate_do.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';

class OptionsScreen extends StatefulWidget {
  @override
  _OptionsScreenState createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {

  final InAppReview inAppReview = InAppReview.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar("Mis", "Opciones"),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/purple_background.gif",
                ),
                fit: BoxFit.cover),
          ),

              child: Container(

                width: MediaQuery.of(context).size.width,

                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    FadeInDown(
                      child: _boton(
                          icono: Icon(Icons.star, color: Colors.white,),
                        title: "¡Valorar Aplicacion!",
                        onPressed: () async{
                           
                            if (await inAppReview.isAvailable()) {
                                inAppReview.requestReview();
                            }
                          }
                      ),
                    ),

                    FadeInRight(
                      child: _boton(
                          icono: Icon(Icons.videocam, color: Colors.white,),
                        title: "¡Ver Introduccion!",
                        onPressed: () async{
                           
                            Navigator.pushReplacement(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (c, a1, a2) => IntroScreen(),
                                        transitionsBuilder: (c, anim, a2, child) =>
                                            FadeTransition(opacity: anim, child: child),
                                        transitionDuration: Duration(milliseconds: 300),
                                      ),
                                    );
                          }
                      ),
                    ),
                    FadeInLeft(
                      child: _boton(
                          icono: Icon(Icons.gamepad, color: Colors.white,),
                        title: "Diario de un Grumete",
                        onPressed: () async{
                           
                            Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (c, a1, a2) => GrumeteScreen(),
                                        transitionsBuilder: (c, anim, a2, child) =>
                                            FadeTransition(opacity: anim, child: child),
                                        transitionDuration: Duration(milliseconds: 300),
                                      ),
                                    );
                          }
                      ),
                    ),
                    FadeInUp(
                      child: _boton(
                          icono: Icon(Icons.info, color: Colors.white,),
                        title: "Politica de Privacidad",
                        onPressed: () async{
                           
                            Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (c, a1, a2) => PrivacyPolicyScreen(),
                                        transitionsBuilder: (c, anim, a2, child) =>
                                            FadeTransition(opacity: anim, child: child),
                                        transitionDuration: Duration(milliseconds: 300),
                                      ),
                                    );
                          }
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  _boton({String title, VoidCallback onPressed, Icon icono}){

    return BouncingWidget(
      duration: Duration(milliseconds: 100),
      scaleFactor: 1.5,
      onPressed: onPressed,
          child: Container(
            width: 350,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.purple[900],
              Colors.purple[400],
            ],
          ),
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
        
        child: Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            icono,
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            icono
          ],
        ),
        
      ),
    );
  }
}
