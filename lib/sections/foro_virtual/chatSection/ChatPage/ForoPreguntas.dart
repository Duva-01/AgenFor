import 'dart:async';
import 'dart:ui';

import 'package:agenda_informatico/main.dart';
import 'package:agenda_informatico/sections/noticias_tecnologia/helper/widgets.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../firebaseHelper.dart';

var loginUser = FirebaseAuth.instance.currentUser;
String nombre_usuario;

class ForoPreguntasScreen extends StatefulWidget {

  ForoPreguntasScreen({Key key}) : super(key: key);

  @override
  _ForoPreguntasScreenState createState() => _ForoPreguntasScreenState();
}

class _ForoPreguntasScreenState extends State<ForoPreguntasScreen> {

  Service service = Service();
  final auth = FirebaseAuth.instance;
  final almacenarMensaje = FirebaseFirestore.instance;
  TextEditingController mensaje = TextEditingController();


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
      
      resizeToAvoidBottomInset: false,
      

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/purple_background.gif",
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                height: 400,
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  reverse: true,
                  child: JelloIn(
                    child: MostrarMensajes()
                  ),
                ),
              ),
            ),
            FadeInUp(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.purple, width: 2),
                          bottom: BorderSide(color: Colors.purple, width: 2),
                        ),
                      ),
                      child: TextField(
                        
                        controller: mensaje,
                        decoration: InputDecoration(
                          hintText: "Escribe un mensaje...",
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.purple, width: 2),
                        bottom: BorderSide(color: Colors.purple, width: 2),
                      ),
                    ),
                    child: IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Colors.purple,
                        ),
                        onPressed: () {
                          if (mensaje.text.isNotEmpty) {
                            almacenarMensaje.collection("ForoPreguntas").doc().set({
                              "mensajes": mensaje.text.trim(),
                              "usuario": loginUser.email.toString(),
                              "tiempo": DateTime.now(),
                            });
                            mensaje.clear();
                          }
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    

  }
}

class MostrarMensajes extends StatelessWidget {
  
  var formato = new DateFormat.yMd().add_jm();
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("ForoPreguntas").orderBy("tiempo").snapshots(),
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
          physics: ScrollPhysics(),
          itemBuilder: (context, i){

          
          QueryDocumentSnapshot x = snapshot.data.docs[i];
          return ListTile(

            
            subtitle: Column(
                crossAxisAlignment: loginUser.email == x["usuario"] ? CrossAxisAlignment.end:CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: loginUser.email == x["usuario"] ? Colors.teal.withOpacity(0.2) : Colors.purple.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15),

                        ),
                        
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(x["usuario"], style: TextStyle(fontSize: 10, color: Colors.purple),),
                            SizedBox(height: 2,),
                            Text(x["mensajes"], ),
                            SizedBox(height: 6,),
                            
                            Text(formato.format(x["tiempo"].toDate()), style: TextStyle(fontSize: 10),),

                          ],
                          
                        ),
                      ),

                    ],
                  ),
          );
        });
      }
    );
  }


}