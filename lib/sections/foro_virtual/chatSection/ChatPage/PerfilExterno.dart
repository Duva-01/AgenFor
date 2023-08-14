import 'dart:async';
import 'dart:ui';

import 'package:agenda_informatico/sections/noticias_tecnologia/helper/widgets.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String email_externo_clase;

class PerfilExternoScreen extends StatefulWidget {

  String email_externo;
  PerfilExternoScreen({@required this.email_externo});

  @override
  _PerfilExternoScreenState createState() => _PerfilExternoScreenState();
}

class _PerfilExternoScreenState extends State<PerfilExternoScreen> {

  void getDatos() async {

    email_externo_clase = widget.email_externo;
    setState((){});
  }

  @override
  void initState() {

    getDatos();
    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(

      appBar: MyAppBar("Perfil", ""),
      extendBodyBehindAppBar: true,

      body: Container(

              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/purple_background.gif",
                    ),
                    fit: BoxFit.cover),
              ),

                child: 

                  SingleChildScrollView(

                    child:  FadeInLeft(
                      child: Container(child: MostrarPuntajes()),
                    ),
                  
                  ),
                  
            ),     
    );
  }

}

Widget _buildPerfil(
      String nombre, int edad, String estado, String estudios, bool esChica) {
    return Column(children: [

        FadeInDownBig(
          child: Container(
            height: 300,
            width: 300,
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
        width: 400,
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
        child:
                new Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  "${nombre}, ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                child: Text(
                  "${edad} años",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  "Estudios/Trabajo: ${estudios}",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.purple[100],
                      fontStyle: FontStyle.italic),
                ),
         
              Text(
                      "Sobre mi: ''${estado}''",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.purple[100],
                          fontStyle: FontStyle.italic),
                    ),
              
            ],
          ),
        ),
              ),

    ],
    );
    
    
    
  }
class MostrarPuntajes extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("Perfiles").snapshots(),
      builder: (context, snapshot){

        if(!snapshot.hasData){
          return Center(

            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          primary: true,
          reverse: true,
          itemBuilder: (context, i){

          
          QueryDocumentSnapshot x = snapshot.data.docs[i];

          return (x["usuario"] == email_externo_clase) ? _buildPerfil(x["nombre"], x["edad"], x["estado"], x["estudios"], x["esChica"])
            : SizedBox(width: 0, height: 0,);
        });
      }
    );
  }


}