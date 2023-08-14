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
import 'ChatPage.dart';
import 'PerfilExterno.dart';

var loginUser = FirebaseAuth.instance.currentUser;

String nombre_usuario;
String email_externo_clase;
bool existe;

class PrivateChat extends StatefulWidget {

  final String nombre_usuario_externo, email_externo;
  PrivateChat({@required this.nombre_usuario_externo, @required this.email_externo});
  
  @override
  _PrivateChatState createState() => _PrivateChatState();
}

class _PrivateChatState extends State<PrivateChat> {

  Service service = Service();
  final auth = FirebaseAuth.instance;
  final almacenarMensaje = FirebaseFirestore.instance;
  TextEditingController mensaje = TextEditingController();
  bool done = false;

  getCurrentUser() async {

    final user = auth.currentUser;
    if(user != null){
      loginUser = user;
    }

    email_externo_clase = widget.email_externo;
    
    QuerySnapshot<Map<String, dynamic>> _query = await FirebaseFirestore.instance.collection('Mensajes_${widget.email_externo}_${loginUser.email.toString()}').get();

    if (_query.docs.isNotEmpty) {
      
      existe = true;
    } else {
      
      existe = false;
    }

    done = true;
    setState((){});
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => getCurrentUser());
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      resizeToAvoidBottomInset: false,
      appBar: AppBar(

        leading: TextButton(
              
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => ChatPageScreen(
                    ),
                    transitionsBuilder: (c, anim, a2, child) =>
                        FadeTransition(opacity: anim, child: child),
                    transitionDuration: Duration(milliseconds: 200),
                  )
                );
              },
              child: Icon(Icons.arrow_back, color: Colors.white,),
            ),
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.purple,
        
        title: Center(
          child: Text(widget.nombre_usuario_externo, style: TextStyle(color: Colors.white),),
        ),

        actions: [

          TextButton(
              
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => PerfilExternoScreen(email_externo: widget.email_externo),
                    transitionsBuilder: (c, anim, a2, child) =>
                        FadeTransition(opacity: anim, child: child),
                    transitionDuration: Duration(milliseconds: 200),
                  )
                );
              },
              child: Icon(Icons.person, color: Colors.white,),
            ),
          
        ],
      ),

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
                child: done ? SingleChildScrollView(
                  physics: ScrollPhysics(),
                  reverse: true,
                  child: JelloIn(
                    child: existe ? MostrarMensajes_existe() : MostrarMensajes_no_existe(),
                     
                  ),
                )
                : Center(
                  child: CircularProgressIndicator(),
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
                        ),
                      ),
                      child: TextField(
                        
                        controller: mensaje,
                        decoration: InputDecoration(
                          hintText: "Escribe un mensaje...",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.purple, width: 2),
                      ),
                    ),
                    child: IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Colors.purple,
                        ),
                        onPressed: () {
                         

                          if (mensaje.text.isNotEmpty) {

                            if(existe){
                              almacenarMensaje.collection("Mensajes_${widget.email_externo}_${loginUser.email.toString()}").doc().set({
                              "mensajes": mensaje.text.trim(),
                              "usuario": loginUser.email.toString(),
                              "tiempo": DateTime.now(),
                            });
                            }
                            else {
                              almacenarMensaje.collection("Mensajes_${loginUser.email.toString()}_${widget.email_externo}").doc().set({
                              "mensajes": mensaje.text.trim(),
                              "usuario": loginUser.email.toString(),
                              "tiempo": DateTime.now(),
                            });

                            }
                            
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

class MostrarMensajes_existe extends StatelessWidget {
  
  var formato = new DateFormat.yMd().add_jm();
  @override
  Widget build(BuildContext context){

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("Mensajes_${email_externo_clase}_${loginUser.email.toString()}").orderBy("tiempo").snapshots(),
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

class MostrarMensajes_no_existe extends StatelessWidget {
  
  var formato = new DateFormat.yMd().add_jm();
  @override
  Widget build(BuildContext context){

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("Mensajes_${loginUser.email.toString()}_${email_externo_clase}").orderBy("tiempo").snapshots(),
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