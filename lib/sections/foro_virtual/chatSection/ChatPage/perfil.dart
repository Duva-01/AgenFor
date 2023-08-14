import 'dart:async';
import 'dart:ui';

import 'package:agenda_informatico/main.dart';
import 'package:agenda_informatico/sections/noticias_tecnologia/helper/widgets.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyProfileScreen extends StatefulWidget {

  MyProfileScreen({Key key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {

  String nombre, estado, estudios; 
  int edad;
  bool esChica;

  bool _loading;
  Widget carta_perfil;

  void getDatos() async {

    final prefs = await SharedPreferences.getInstance();
    nombre = prefs.getString('nombre');
    edad = prefs.getInt('edad');
    estado = prefs.getString('estado');
    esChica = prefs.getBool('esChica');
    estudios = prefs.getString('estudios');

    carta_perfil = _buildPerfil(nombre, edad, estado, estudios, esChica);

     if(this.mounted){

      setState(() {
        _loading = false;
      });

    }
    
  }

  @override
  void initState() {

    _loading = true;
    super.initState();
    getDatos();
  }
  
  
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Text(
                "Mi",
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w600),
              ),
            ),
            Flexible(
                child: Text(
              "Cuenta",
              style: TextStyle(
                  color: Colors.purple[600], fontWeight: FontWeight.w600),
            ))
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      
      extendBodyBehindAppBar: true,

      body: _loading
            ? Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/purple_background.gif",
                    ),
                    fit: BoxFit.cover),
              ),
              child: Center(
                  child: CircularProgressIndicator(),
                )
            )
            :
            Container(

              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(top: 80),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/purple_background.gif",
                    ),
                    fit: BoxFit.cover),
              ),

                child: 

                  Column(

                    children: [ 
                      FadeInLeft(
                        
                        child: Container(child: carta_perfil,),
                      ),

                    
                    ],
                  ),
                  
            ),
             
    );

    

  }

  Widget _buildPerfil(
      String nombre, int edad, String estado, String estudios, bool esChica) {
    return Column(children: [

        FadeInDownBig(
          child: Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(

              image: DecorationImage(
                  image: esChica ? AssetImage(
                    "assets/images/girl.png",
                  ) :AssetImage(
                    "assets/images/boy_profile.png",
                  ),
                  fit: BoxFit.fitHeight),
            ),
          ),
        ),
        Container(
        margin: EdgeInsets.all(20),
        height: 150,
        width: MediaQuery.of(context).size.width,
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
              offset: Offset(0.0, 5),
              blurRadius: 5.0,
            ),
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
        ),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    Container(

                        child: Text(
                              "${nombre}, ",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                      ),

                    Container(

                        child: Text(
                              "${edad} años",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                      ),

                    SizedBox(height: 20,),
                    Flexible(
                      child: Container(

                          child: Text(
                            "Estudios/Trabajo: ${estudios}",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.purple[100],
                                fontStyle: FontStyle.italic),
                          ),
                        
                      ),
                    ),
                    Flexible(
                      child: Container(
                          child: Text(
                            "Sobre mi: ''${estado}''",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.purple[100],
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        )),

    ],
    );
    
    
    
  }
}
